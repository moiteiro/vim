return {
  -- as treesitter is not indenting ruby code properly, including polyglot to fix it.
	{ 'sheerun/vim-polyglot' },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = {
					enable = true,
					disable = { "ruby" },
				},
			})
		end,
	},
}
