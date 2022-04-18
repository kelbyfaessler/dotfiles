local opts = {
    noremap = true,
    silent = true
}

local keymap = vim.api.nvim_set_keymap

-------------------------------------------------------------------------------
-- Normal --
-------------------------------------------------------------------------------
-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window Resize
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer Navigation
keymap("n", "<s-l>", ":bnext<CR>", opts)
keymap("n", "<s-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>q", ":Bdelete<CR>", opts)

keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
-- (Bank mode means it has same behavior as :map, which is a mapping to nvo modes)
-- keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Formatting
-- For a keymap to autoformat current buffer, do something like this:
-- keymap("n", "<leader>o", ":Format<cr>", opts)

-- Telescope
-- (TODO: move keymaps from init.vim to here)

-- Comment
keymap('n', '<C-_>', '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$', opts)
keymap('n', '<leader>/', '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$', opts)

-- Git
-- keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})
keymap("n", "<leader>gi", "<cmd>FloatermNew lazygit<CR>", {noremap = true, silent = true})

-------------------------------------------------------------------------------
-- Visual --
-------------------------------------------------------------------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Comment
keymap('x', '<C-_>', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)
keymap('x', '<leader>/', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)


keymap('v', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
keymap('v', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
-------------------------------------------------------------------------------
-- Insert --
-------------------------------------------------------------------------------
-- TODO: could add keymap to escape autopaired parens (e.g. quick jl)
-- TODO: could add keymap to escape insert mode (e.g. quick jj)


-------------------------------------------------------------------------------
-- Operator --
-------------------------------------------------------------------------------
keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
