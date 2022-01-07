local opts = {
    noremap = true,
    silent = true
}

local keymap = vim.api.nvim_set_keymap

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
