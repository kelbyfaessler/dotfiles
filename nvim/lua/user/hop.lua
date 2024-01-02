local M = {
    "phaazon/hop.nvim",
    event = "Bufenter",
    commit = "90db1b2c61b820e230599a04fedcd2679e64bd07",
}

function M.config()
    local hop = require("hop")
    hop.setup({})
end

return M
