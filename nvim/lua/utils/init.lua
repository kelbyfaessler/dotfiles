local M = {}

-- Previously these names come from the "lspconfig" column on this page:
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
--
-- After the 0.9 upgrade, I don't know where the names come from anymore and will have to
-- research to add more

M.servers = {
    "lua_ls",
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
    "svelte",
    "prismals",
}

return M
