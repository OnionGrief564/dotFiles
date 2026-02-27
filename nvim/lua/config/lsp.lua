require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	-- A list of servers to automatically install if they're not already installed
	ensure_installed = { "lua_ls" },
})

-- LSP mappings
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gR", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })

-- See `:help K` for why this keymap
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Lesser used LSP functionality
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
vim.keymap.set("n", "<F3>", vim.lsp.buf.format, { desc = "Format current buffer with LSP" })


-- Dynamic lspconfig servers :)
local servers_configs = {
	pylsp = {
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						ignore = { "W391" },
						maxLineLength = 120,
					},
				},
			},
		},
	},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				diagnostics = {
					enable = false,
				},
			},
		},
	},
	lua_ls = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				-- Now, you don't get error/warning "Undefined global `vim`".
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- By default, lua-language-server sends anonymized data to its developers. Stop it using the following.
			telemetry = {
				enable = false,
			},
		},
	},
	clangd = {},
}

for server, setting in pairs(servers_configs) do
	vim.lsp.config(server, {
		settings = setting,
	})
	vim.lsp.enable(server)
end
