local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- to support formatting on save (https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save)
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = false,
  sources = {
    -- To see supported formatters, visit
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
    formatting.black.with { extra_args = { "--fast" } },
    -- formatting.yapf,
    formatting.stylua,
    -- diagnostics.pylint,
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
          vim.lsp.buf.format()
        end,
      })
    end
  end,
}

-- NOTE: haven't tried this yet
-- To filter the format calls so only null-ls receives the format request and not other available
-- formatters e.g. language servers
-- local callback = function()
--     vim.lsp.buf.format({
--         bufnr = bufnr,
--         filter = function(client)
--             return client.name == "null-ls"
--         end
--     })
-- end,
