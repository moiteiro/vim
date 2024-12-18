return {
	 "danymat/neogen",
	 config = function()
	 	local neogen = require("neogen")
	 	vim.keymap.set("n", "<Leader>nf", ":Neogen<CR>", { noremap = true, silent=true })
	 	neogen.setup({
	 		snippet_engine = "luasnip",
	 		languages = {
	 			ruby = {
	 				template = {
	 					annotation_convention = "yard",
	 				},
	 			},
	 		},
	 	})
	 end,
}
