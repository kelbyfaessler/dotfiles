local M = {
    "jose-elias-alvarez/null-ls.nvim",
  }
  
  function M.config()
    local null_ls = require "null-ls"

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        -- my customizations not in nvim-basic-ide/launch.nvim:
        null_ls.builtins.formatting.black.with({
            extra_args = { "--fast" },
            -- this is added so it respects local pyproject.toml settings in project (not in nvim-basic-ide/launch.nvim)
            cwd = function(params)
                return vim.fn.fnamemodify(params.bufname, ":h")
            end,
        }),
        -- null_ls.builtins.formatting.isort.with({
        --     -- this is added so it respects local pyproject.toml settings in project (not in nvim-basic-ide/launch.nvim)
        --     cwd = function(params)
        --         return vim.fn.fnamemodify(params.bufname, ":h")
        --     end,
        -- }),
      },
      -- --------------------------------------------------------------------
      -- to support formatting on save (https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save) e.g. with black
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
    -- --------------------------------------------------------------------
    }
  end
  
  return M