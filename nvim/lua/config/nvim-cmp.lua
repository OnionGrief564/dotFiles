vim.diagnostic.config({
    virtual_lines = true,
    -- virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})


-- require('blink.cmp').setup({
-- 	keymap = {
-- 		preset = 'super-tab',
-- 	},

-- 	appearance = {
-- 		nerd_font_variant = 'mono',
-- 	},

-- 	completion = {
-- 		-- By default, you may press `<c-space>` to show the documentation.
-- 		-- Optionally, set `auto_show = true` to show the documentation after a delay.
-- 		documentation = { auto_show = true, auto_show_delay_ms = 500 },
-- 	},

-- 	sources = {
-- 		default = { 'lsp', 'path', 'snippets', 'buffer'},
-- 	},

-- 	snippets = { preset = 'luasnip' },

-- 	-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
-- 	-- which automatically downloads a prebuilt binary when enabled.
-- 	--
-- 	-- By default, we use the Lua implementation instead, but you may enable
-- 	-- the rust implementation via `'prefer_rust_with_warning'`
-- 	--
-- 	-- See :h blink-cmp-config-fuzzy for more information
-- 	fuzzy = { implementation = 'lua' },

-- 	-- Shows a signature help window while you type arguments for a function
-- 	signature = { enabled = true },
-- })
