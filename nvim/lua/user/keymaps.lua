local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-------------------------------------------------------------------------------
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   operator_mode = "o",

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

keymap(
  "n",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
  {}
)
keymap(
  "n",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
  {}
)
keymap(
  "n",
  "t",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
  {}
)
keymap(
  "n",
  "T",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
  {}
)
keymap("n", "<leader>a", "<cmd>lua require'hop'.hint_words()<cr>", {})

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Formatting
keymap("n", "<leader>o", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Searching
keymap("n", "<esc>", "<cmd>noh<CR>", opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
-- keymap("n", "<leader>f", ":lua require('telescope.builtin').find_files({layout_strategy='center'})<CR>", opts)
-- keymap("n", "<leader>g", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>g", ":lua require('telescope.builtin').live_grep({layout_strategy='horizontal'})<CR>", opts)
keymap("n", "<leader>p", ":Telescope projects<CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)

-- Comment
keymap("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", opts)
keymap("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", opts)

-- Git
-- keymap("n", "<leader>gi", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
-- keymap("n", "<leader>gi", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})
keymap("n", "<leader>i", "<cmd>FloatermNew lazygit<CR>", { noremap = true, silent = true })

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-------------------------------------------------------------------------------
-- Visual --
-------------------------------------------------------------------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Comment
keymap("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", opts)
keymap("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", opts)

keymap(
  "v",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
  {}
)
keymap(
  "v",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
  {}
)
keymap(
  "v",
  "t",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
  {}
)
keymap(
  "v",
  "T",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
  {}
)
keymap("v", "<leader>a", "<cmd>lua require'hop'.hint_words()<cr>", {})
-------------------------------------------------------------------------------
-- Insert --
-------------------------------------------------------------------------------
-- TODO: could add keymap to escape autopaired parens (e.g. quick jl)
-- TODO: could add keymap to escape insert mode (e.g. quick jj)

-------------------------------------------------------------------------------
-- Operator --
-------------------------------------------------------------------------------
keymap(
  "o",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
  {}
)
keymap(
  "o",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
  {}
)
keymap(
  "o",
  "t",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1, inclusive_jump = true })<cr>",
  {}
)
keymap(
  "o",
  "T",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1, inclusive_jump = true })<cr>",
  {}
)
-- The hint_words keymap doesn't seem to work in operator mode with leader key
-- keymap('v', '<leader>a', "<cmd>lua require'hop'.hint_words({inclusive_jump = true})<cr>", {})

keymap("x", "p", [["_dP]])

vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")
