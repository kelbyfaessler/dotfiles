local M = {
    "kyazdani42/nvim-tree.lua",
    commit = "59e65d88db177ad1e6a8cffaafd4738420ad20b6",
    event = "VimEnter",
}

function M.config()
    local tree_cb = require("nvim-tree.config").nvim_tree_callback
    require("nvim-tree").setup({
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
        renderer = {
            icons = {
                show = {
                    git = true,
                    folder = true,
                    file = true,
                    folder_arrow = false,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                        arrow_open = "",
                        arrow_closed = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "",
                        staged = "S",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "U",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
        },
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = {},
        open_on_tab = false,
        hijack_cursor = false,
        update_cwd = false,
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        view = {
            width = 30,
            hide_root_folder = true,
            side = "left",
            mappings = {
                custom_only = true,
                list = {
                    { key = { "l", "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
                    -- If I want to use space to open files/dirs in nvim-tree:
                    -- { key = {" ", "l", "<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
                    { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
                    { key = "v", cb = tree_cb("vsplit") },
                    -- nvim-basic-ide / launch.nvim uses 'v' for vsplit, does that override visual mode?
                    -- If I have issues, can switch to ctrl+v
                    -- { key = "<C-v>", cb = tree_cb("vsplit") },
                    { key = "<C-x>", cb = tree_cb("split") },
                    -- <C-t> interferes with toggleterm and I don't need this tree keymap
                    -- { key = "<C-t>",                        cb = tree_cb("tabnew") },
                    -- { key = "<", cb = tree_cb("prev_sibling") },
                    -- { key = ">", cb = tree_cb("next_sibling") },
                    -- { key = "P", cb = tree_cb("parent_node") },
                    { key = { "h", "<BS>" }, cb = tree_cb("close_node") },
                    { key = "<Tab>", cb = tree_cb("preview") },
                    -- { key = "K", cb = tree_cb("first_sibling") },
                    -- { key = "J", cb = tree_cb("last_sibling") },
                    { key = "I", cb = tree_cb("toggle_ignored") },
                    { key = "H", cb = tree_cb("toggle_dotfiles") },
                    { key = "R", cb = tree_cb("refresh") },
                    { key = "a", cb = tree_cb("create") },
                    { key = "d", cb = tree_cb("remove") },
                    { key = "D", cb = tree_cb("trash") },
                    { key = "r", cb = tree_cb("rename") },
                    { key = "<C-r>", cb = tree_cb("full_rename") },
                    { key = "x", cb = tree_cb("cut") },
                    { key = "c", cb = tree_cb("copy") },
                    { key = "p", cb = tree_cb("paste") },
                    { key = "y", cb = tree_cb("copy_name") },
                    { key = "Y", cb = tree_cb("copy_path") },
                    { key = "gy", cb = tree_cb("copy_absolute_path") },
                    -- { key = "[c", cb = tree_cb("prev_git_item") },
                    -- { key = "]c", cb = tree_cb("next_git_item") },
                    -- { key = "-", cb = tree_cb("dir_up") },
                    -- { key = "s", cb = tree_cb("system_open") },
                    { key = "q", cb = tree_cb("close") },
                    -- { key = "g?", cb = tree_cb("toggle_help") },
                },
            },
            number = false,
            relativenumber = false,
            signcolumn = "yes",
        },
        trash = {
            cmd = "trash",
            require_confirm = true,
        },
    })
end

return M
