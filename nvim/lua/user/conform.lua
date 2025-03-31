local M = {
  "git@github.com:stevearc/conform.nvim.git",
  event = "InsertEnter",
  commit = "db8a4a9edb217067b1d7a2e0362c74bfe9cc944d",
}

M.config = function()
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      -- conform will run multiple formatters sequentially
      python = { "ruff_organize_imports", "ruff_format" },
      -- you can customize some of the format options for the filetype (:help conform.format)
      -- rust = { "rustfmt", lsp_format = "fallback" },
      -- conform will run the first available formatter
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  })
end

return M

