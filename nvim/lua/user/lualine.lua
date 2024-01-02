local M = {
    "nvim-lualine/lualine.nvim",
    commit = "0050b308552e45f7128f399886c86afefc3eb988",
    event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
        return
    end

    local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = " ", warn = " " },
        colored = false,
        always_visible = true,
    }

    local diff = {
        "diff",
        colored = false,
        symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
        cond = hide_in_width,
    }

    local filetype = {
        "filetype",
        icons_enabled = false,
    }

    local location = {
        "location",
        padding = 0,
    }

    -- added this from default nvim-basic-ide / launch.nvim
    local filename = {
        "filename",
        file_status = true, -- Displays file status (readonly status, modified status)
        newfile_status = false, -- Display new file status (new file means no write after created)
        path = 1, -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory

        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        symbols = {
            modified = "[+]", -- Text to show when the file is modified.
            readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
            unnamed = "[No Name]", -- Text to show for unnamed buffers.
            newfile = "[New]", -- Text to show for newly created file before first write
        },
    }

    local spaces = function()
        return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end
    lualine.setup({
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { "alpha", "dashboard" },
            always_divide_middle = true,
        },
        sections = {
            -- tweaked this from default nvim-basic-ide / launch.nvim
            lualine_a = { "mode" },
            lualine_b = {},
            lualine_c = { filename },
            lualine_x = { spaces, "encoding" },
            lualine_y = { location },
            lualine_z = { "progress" },
        },
    })
end

return M
