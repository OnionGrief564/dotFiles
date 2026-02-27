return {
	{ -- Autocompletion
		'saghen/blink.cmp',
		version = '1.*',
		dependencies = {
			-- Snippet Engine
			{
				'L3MON4D3/LuaSnip',
				version = '2.*',
			},
		},
	},

	-- LSP manager
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{ "neovim/nvim-lspconfig", dependencies = { 'saghen/blink.cmp' } },
}
