local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }


    -- in insert mode open the completion menu

    vim.keymap.set("n", "<C-i>", function()
        vim.cmd(":EslintFixAll")
        --        vim.cmd(":lua vim.lsp.buf.formatting_sync()")
    end, opts)
    vim.keymap.set("n", "<leader>sa", function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>fa", function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
    end, opts)
    --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "tsserver", "rust_analyzer" },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
    },
})

local cmp = require("cmp")
local cmp_select = { behavio = cmp.SelectBehavior.Select }




cmp.setup({
    --[[
    completion = {
        autocomplete = false
    },
    buffer = {
        completion = {
            autocomplete = false
        }
    },

    formatting = lsp_zero.cmp_format(),
    ]] --
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer",  keyword_length = 1 },
    },


    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),


        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        --['<C-Space>'] = cmp.mapping.complete(),
        ["<C-k>"] = cmp.mapping({
            i = function()
                if cmp.visible() then
                    cmp.abort()
                else
                    cmp.complete()
                end
            end,
            c = function()
                if cmp.visible() then
                    cmp.close()
                else
                    cmp.complete()
                end
            end,
        }),
    }),
})

-- Apply format when save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     callback = function()
--         vim.lsp.buf.format()
--     end,
-- })
-- Setup language servers.
local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({
    autoClosingTags = true,
})
lspconfig.rust_analyzer.setup({
    -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
        ["rust-analyzer"] = {},
    },
})


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)



vim.keymap.set('i', '<C-l>', '<ESC>')


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "<leader>da", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<space>f", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end,
})
