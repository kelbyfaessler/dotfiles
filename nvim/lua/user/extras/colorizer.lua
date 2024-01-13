local M = {
  "NvChad/nvim-colorizer.lua",
  event = "VeryLazy",
}

function M.config()
  require("colorizer").setup({
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "css",
      "html",
      "astro",
      "lua",
      -- added by me on top of nvim-basic-ide / launch.nvim
      "svelte",
    },
    user_default_options = {
      names = false,
      rgb_fn = true,
      tailwind = "both",
    },
    buftypes = {},
  })
end

return M
