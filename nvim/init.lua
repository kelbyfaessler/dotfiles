require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")
spec("user.colorscheme")
spec("user.devicons")
spec("user.treesitter")
spec("user.mason")
spec("user.schemastore")
spec("user.lspconfig")
-- spec "user.navic"
-- spec "user.breadcrumbs"
spec("user.null-ls")
spec("user.illuminate")
spec("user.telescope")
-- spec("user.telescope-tabs")
spec("user.nvimtree")
spec("user.lualine")
-- spec "user.whichkey"
spec("user.cmp")
spec("user.autopairs")
spec("user.comment")
spec("user.gitsigns")
-- spec "user.neogit"
-- spec "user.diffview"
-- spec "user.indentline"
spec("user.alpha")
-- spec "user.netrw"
spec("user.project")
-- spec "user.toggleterm"
-- spec "user.bufdelete"
-- Extras
spec("user.extras.colorizer")
spec("user.extras.smoothie")
-- spec("user.extras.copilot")
spec("user.extras.fidget")
spec("user.extras.modicator")
-- spec("user.extras.matchup")
spec("user.extras.bqf")
-- spec("user.extras.dial")
-- spec("user.extras.dressing")
spec("user.extras.surround")
spec("user.extras.eyeliner")
-----------------------------------------------------
-- added by me on top of nvim-basic-ide / launch.nvim
-- spec("user.hop")
spec("user.bufferline")
-----------------------------------------------------
require("user.lazy")
