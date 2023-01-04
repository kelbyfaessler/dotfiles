local servers = {
	"sumneko_lua",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
    -- added by me:
    "astro",
    "rust_analyzer",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig = require("lspconfig")

local jsonls_opts = require("user.lsp.settings.jsonls")
lspconfig.sumneko_lua.setup(jsonls_opts)

local sumneko_opts = require("user.lsp.settings.sumneko_lua")
lspconfig.sumneko_lua.setup(sumneko_opts)

local pyright_opts = require("user.lsp.settings.pyright")
lspconfig.sumneko_lua.setup(pyright_opts)
