require('blink.cmp').setup({
	keymap = {
		preset = 'super-tab',
	},

	appearance = {
		nerd_font_variant = 'mono',
	},

	completion = {
		-- By default, you may press `<c-space>` to show the documentation.
		-- Optionally, set `auto_show = true` to show the documentation after a delay.
		documentation = { auto_show = false, auto_show_delay_ms = 500 },
	},

	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer'},
	},

	snippets = { preset = 'luasnip' },

	-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
	-- which automatically downloads a prebuilt binary when enabled.
	--
	-- By default, we use the Lua implementation instead, but you may enable
	-- the rust implementation via `'prefer_rust_with_warning'`
	--
	-- See :h blink-cmp-config-fuzzy for more information
	fuzzy = { implementation = 'lua' },

	-- Shows a signature help window while you type arguments for a function
	signature = { enabled = true },
})



-- local has_words_before = function()
-- 	unpack = unpack or table.unpack
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

-- local luasnip = require("luasnip")
-- local cmp = require("nvim-cmp")

-- cmp.setup({
-- 	snippet = {
-- 		-- REQUIRED - you must specify a snippet engine
-- 		expand = function(args)
-- 			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
-- 		end,
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		-- Use <C-d/f> to scroll the docs
-- 		['<C-d>'] = cmp.mapping.scroll_docs(-4),
-- 		['<C-f>'] = cmp.mapping.scroll_docs(4),
-- 		-- Use <C-k/j> to switch in items
-- 		['<C-k>'] = cmp.mapping.select_prev_item(),
-- 		['<C-j>'] = cmp.mapping.select_next_item(),
-- 		-- Use <CR>(Enter) to confirm selection
-- 		-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
-- 		['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),

-- 		-- A super tab
-- 		-- source: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
-- 		["<Tab>"] = cmp.mapping(function(fallback)
-- 			-- Hint: if the completion menu is visible select next one
-- 			if cmp.visible() then
-- 				cmp.select_next_item()
-- 			elseif has_words_before() then
-- 				cmp.complete()
-- 			elseif luasnip.expand_or_jumpable() then
--                 luasnip.expand_or_jump()
-- 			else
-- 				fallback()
-- 			end
-- 		end, { "i", "s" }), -- i - insert mode; s - select mode
-- 		["<S-Tab>"] = cmp.mapping(function(fallback)
-- 			if cmp.visible() then
-- 				cmp.select_prev_item()
-- 			elseif luasnip.jumpable(-1) then
-- 				luasnip.jump(-1)
-- 			else
-- 				fallback()
-- 			end
-- 		end, { "i", "s" }),
-- 	}),

-- 	-- Let's configure the item's appearance
-- 	-- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
-- 	formatting = {
-- 		-- Set order from left to right
-- 		-- kind: single letter indicating the type of completion
-- 		-- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
-- 		-- menu: extra text for the popup menu, displayed after "word" or "abbr"
-- 		fields = { 'abbr', 'menu' },

-- 		-- customize the appearance of the completion menu
-- 		format = function(entry, vim_item)
-- 			vim_item.menu = ({
-- 				nvim_lsp = '[Lsp]',
-- 				luasnip = '[Luasnip]',
-- 				buffer = '[File]',
-- 				path = '[Path]',
-- 			})[entry.source.name]
-- 			return vim_item
-- 		end,
-- 	},

-- 	-- Set source precedence
-- 	sources = cmp.config.sources({
-- 		{ name = 'nvim_lsp' }, -- For nvim-lsp
-- 		{ name = 'luasnip' }, -- For luasnip user
-- 		{ name = 'buffer' }, -- For buffer word completion
-- 		{ name = 'path' }, -- For path completion
-- 	})
-- })
