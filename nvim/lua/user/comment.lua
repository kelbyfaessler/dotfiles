local comment = require("Comment")

comment.setup {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,

    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    basic = false,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = false,
    ---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
    extended = false,
    },
    pre_hook = function(ctx)
        -- Only calculate commentstring for tsx filetypes
        if vim.bo.filetype == "typescriptreact" then
            local U = require("Comment.utils")

            -- Determine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.blockwise then
                location = require("ts_context_commentstring.utils").get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require("ts_context_commentstring.utils").get_visual_start_location()
            end

            return require("ts_context_commentstring.internal").calculate_commentstring({
                key = type,
                location = location,
            })
        end
    end,
}
