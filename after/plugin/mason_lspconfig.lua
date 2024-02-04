require("mason").setup()
require("mason-lspconfig").setup(
    {
        ensure_installed = { "lua_ls", "rust_analyzer" },

    }
)


require("lspconfig").tsserver.setup({
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end
})
