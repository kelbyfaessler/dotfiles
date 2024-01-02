local M = {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    commit = "60b4a7167c79c7d04d1ff48b55f2235bf58158a7",
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
            lazy = true,
        },
    },
}

function M.config()
    local null_ls = require("null-ls")
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics
    -- to support formatting on save (https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save)
    -- e.g. with black
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- https://github.com/prettier-solidity/prettier-plugin-solidity
    null_ls.setup({
        debug = false,
        sources = {
            formatting.prettier.with({
                extra_filetypes = { "svelte", "toml" },
                -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
            }),
            formatting.black.with({
                extra_args = { "--fast" },
                -- this is added so it respects local pyproject.toml settings in project (not in nvim-basic-ide/launch.nvim)
                cwd = function(params)
                    return vim.fn.fnamemodify(params.bufname, ":h")
                end,
            }),
            -- formatting.isort.with({
            --     -- this is added so it respects local pyproject.toml settings in project (not in nvim-basic-ide/launch.nvim)
            --     cwd = function(params)
            --         return vim.fn.fnamemodify(params.bufname, ":h")
            --     end,
            -- }),
            formatting.stylua,
            formatting.google_java_format,
            -- diagnostics.flake8,
        },
        -- you can reuse a shared lspconfig on_attach callback here
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                        -- vim.lsp.buf.formatting_sync()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end,
    })
end

-- NOTE: haven't tried this yet and its from older version of config
-- To filter the format calls so only null-ls receives the format request and not other available
-- local callback = function()
--     vim.lsp.buf.format({
--         bufnr = bufnr,
--         filter = function(client)
--             return client.name == "null-ls"
--         end
--     })
-- end,

return M
