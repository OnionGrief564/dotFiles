-- Main file, contains all major plugins
return {
	'gruvbox-community/gruvbox',
	'raphamorim/lucario',
	'sjl/badwolf',
	'shaunsingh/nord.nvim',
	'mhinz/vim-janah',
	'marciomazza/vim-brogrammer-theme',
	'tomasr/molokai',
	'hiphish/rainbow-delimiters.nvim',
	'tpope/vim-repeat',
	'tpope/vim-surround', -- ys(motion)[ to add [, cs[{ to replace to { and ds{ to delete
	'tpope/vim-commentary', -- gcc to comment a line
	{ 'echasnovski/mini.operators', version = '*' },
	{ 'echasnovski/mini.pairs',     version = '*' },
	{
		'justinmk/vim-sneak',
		event = 'VimEnter',
		keys = {
			{ mode = 'n', 'F', '<Plug>Sneak_F' },
			{ mode = 'n', 'T', '<Plug>Sneak_T' },
			{ mode = 'n', 'f', '<Plug>Sneak_f' },
			{ mode = 'n', 't', '<Plug>Sneak_t' },

			{ mode = 'o', 'F', '<Plug>Sneak_F' },
			{ mode = 'o', 'T', '<Plug>Sneak_T' },
			{ mode = 'o', 'f', '<Plug>Sneak_f' },
			{ mode = 'o', 't', '<Plug>Sneak_t' },

			{ mode = 'x', 'F', '<Plug>Sneak_F' },
			{ mode = 'x', 'T', '<Plug>Sneak_T' },
			{ mode = 'x', 'f', '<Plug>Sneak_f' },
			{ mode = 'x', 't', '<Plug>Sneak_t' },
		}
	},
	'jremmen/vim-ripgrep',
	'sjl/gundo.vim',
	-- 'kana/vim-textobj-user',
	-- 'kana/vim-textobj-entire',
	-- 'kana/vim-textobj-indent',
	-- 'thinca/vim-textobj-comment', -- Doesn't work
	'nvim-lua/popup.nvim',
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	'nvim-telescope/telescope-media-files.nvim',
	'nvim-tree/nvim-web-devicons', -- optional, for file icons
	'nvim-tree/nvim-tree.lua',

	-- Vscode-like pictograms
	{
		'onsails/lspkind.nvim',
		event = { 'VimEnter' },
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
{ -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
      },
    },
  },
	-- Auto-completion engine
	-- "nvimtools/none-ls.nvim",
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	event = 'InsertEnter',
	-- 	dependencies = {
	-- 		"lspkind.nvim",
	-- 		"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
	-- 		"hrsh7th/cmp-buffer", -- buffer auto-completion
	-- 		"hrsh7th/cmp-path", -- path auto-completion
	-- 		"hrsh7th/cmp-cmdline", -- cmdline auto-completion
	-- 		{
	-- 			"L3MON4D3/LuaSnip",
	-- 			version = "v2.*",
	-- 		},
	-- 	},
	-- },
	-- Code snippet engine
}
