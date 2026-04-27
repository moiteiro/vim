-- Solargraph com erro?
-- A executção depende de uma gemset específica para cada versão do ruby
-- 1 - garanta que há um .ruby_version version dentro do projeto com major, minor and bugfix
-- 2 - crie um novo gemset específico para essa versão do ruby (nesse exemplo 3.3.0) do solargraph: 
--   rvm use 3.3.0@solargraph --create
--   gem install solargraph
--    
-- 3 - teste com:
--   solorgraph stdio
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		automatic_enable = true,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- LSPs normais (Mason)
			local servers = {
				tailwindcss = {},
				ts_ls = {},
				html = {},
				lua_ls = {},
				gopls = {},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end

			local function solargraph_cmd()
				local ruby_version = "3.3.0"

				local file = io.open(".ruby-version", "r")
				if file then
					ruby_version = file:read("*l") or ruby_version
					file:close()
				end

				return {
					"bash",
					"-lc",
					"rvm use " .. ruby_version .. "@solargraph do solargraph stdio",
				}
			end

			vim.lsp.config("solargraph", {
				capabilities = capabilities,
				cmd = solargraph_cmd(),
			})
			vim.lsp.enable("solargraph")

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
