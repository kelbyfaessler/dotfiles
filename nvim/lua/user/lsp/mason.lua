require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")

local jsonls_opts = require("user.lsp.settings.jsonls")
lspconfig.sumneko_lua.setup(jsonls_opts)

local sumneko_opts = require("user.lsp.settings.sumneko_lua")
lspconfig.sumneko_lua.setup(sumneko_opts)

local pyright_opts = require("user.lsp.settings.pyright")
lspconfig.sumneko_lua.setup(pyright_opts)
