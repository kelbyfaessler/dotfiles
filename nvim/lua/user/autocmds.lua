vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.cmd("set formatoptions-=cro")
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = {
        "netrw",
        "Jaq",
        "qf",
        "help",
        "man",
        "lspinfo",
        "spectre_panel",
        "lir",
        "DressingSelect",
        "tsplayground",
        "",
    },
    callback = function()
        vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
    end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
    callback = function()
        vim.cmd("quit")
    end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
})

-------------------------------------------------------------------------------
-- autocommands not in nvim-basic-ide / launch.nvim that I added:
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "python", "astro" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "javascript", "typescript", "vue", "html", "javascriptreact", "svelte" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})
