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
				null_ls.builtins.diagnostics.rubocop.with({
					command = "bundle",
					args = { "exec", "rubocop", "--format", "json", "--force-exclusion", "--stdin", "$FILENAME" },
					to_stdin = true,
				}),
				null_ls.builtins.formatting.rubocop.with({
					command = "bundle",
					args = { "exec", "rubocop", "--auto-correct", "--force-exclusion", "--stdin", "$FILENAME", "--stderr" },
					to_stdin = true,
				}),

				-- javascript
				null_ls.builtins.formatting.prettier,
			}
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
