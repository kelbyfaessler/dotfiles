local M = {
    "nvim-treesitter/nvim-treesitter",
    commit = "226c1475a46a2ef6d840af9caa0117a439465500",
    event = "BufReadPost",
    dependencies = {
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            event = "VeryLazy",
            commit = "729d83ecb990dc2b30272833c213cc6d49ed5214",
        },
        {
            "kyazdani42/nvim-web-devicons",
            event = "VeryLazy",
            commit = "0568104bf8d0c3ab16395433fcc5c1638efc25d4",
        },
    },
}

function M.config()
    local treesitter = require("nvim-treesitter")
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        ignore_install = { "" }, -- List of parsers to ignore installing
        highlight = {
            enable = true, -- false will disable the whole extension
            disable = { "" }, -- list of language that will be disabled
        },
        indent = { enable = true, disable = { "yaml" } },

        --nvim-autopairs config:
        autopairs = {
            enable = true,
        },

        --comment config
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },

        --nvim-ts-rainbow config:
        rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        },
    })
end

return M
