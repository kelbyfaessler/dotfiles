local M = {
    "j-hui/fidget.nvim",
    event = "VimEnter",
    commit = "44585a0c0085765195e6961c15529ba6c5a2a13b",
}

function M.config()
    local fidget = require("fidget")
    fidget.setup({})
end

return M
