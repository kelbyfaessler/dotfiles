-- local M = {
--     -- "folke/tokyonight.nvim",
--     -- commit = "e52c41314e83232840d6970e6b072f9fba242eb9",
--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
-- }
local M = {
    "lunarvim/darkplus.nvim",
    commit = "1826879d9cb14e5d93cd142d19f02b23840408a6",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
}

-- M.name = "tokyonight-night"
M.name = "darkplus"
function M.config()
    local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
    if not status_ok then
        return
    end
end

return M
