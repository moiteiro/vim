-- to install new lsp, use :Mason, then select a linter or formmatter that you want
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
        -- lua
				null_ls.builtins.formatting.stylua,

        -- ruby
				-- NOTE: to make rubocop work with docker, is important to configure gems folders
				-- accessable for both enviroments: it can be done via volume configuration
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,

        -- javascript
        require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.formatting.prettier,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
