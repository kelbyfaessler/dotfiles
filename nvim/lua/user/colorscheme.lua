local M = {
  "LunarVim/primer.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  commit = "b8d7e08eed9a61eb2f49b9196b01f7f2932735ff",
}
-- local M = {
--   "rebelot/kanagawa.nvim",
--   name = "kanagawa",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   commit = "c19b9023842697ec92caf72cd3599f7dd7be4456",
-- }
-- local M = {
--     -- "folke/tokyonight.nvim",
--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
-- }
-- local M = {
--   "lunarvim/darkplus.nvim",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
-- }

function M.config()
  -- vim.cmd.colorscheme("darkplus")
  -- vim.cmd.colorscheme "tokyonight-night"
  vim.cmd.colorscheme("primer_dark")
  -- vim.cmd.colorscheme("kanagawa")
  -- vim.cmd('colorscheme rose-pine')
  -- override primer_dark cursorline color to be lighter and more noticable
  vim.api.nvim_set_hl(0, "CursorLine", { fg = "NONE", bg = "#2f343d" })
end

return M
