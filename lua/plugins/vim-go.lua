return {
	{
		"fatih/vim-go",
		build = ":GoUpdateBinaries",
		config = function()
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					vim.cmd("GoBuild")
				end,
			})

			vim.g.go_fmt_autosave = 1
			vim.g.go_vet_autosave = 1
			vim.g.go_fmt_command = "goimports"
		end,
	},
}
