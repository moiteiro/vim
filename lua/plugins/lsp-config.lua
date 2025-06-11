-- DEBUG
-- Entrar no :Mason e verificar se há dependencias para serem atualizadas
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
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tailwindcss.setup({
        capabilities = capabilities
      })
      -- havia configurado com ts_ls mas nao estava reconhecendo meu codigo para sugerir no autocomplete.
      -- se no futuro parar de funcionar, trocar novamente por ts_ls
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      -- lspconfig.tsserver.setup({
      --   capabilities = capabilities
      -- })
      lspconfig.solargraph.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}


-- to install new lsp, use :Mason, then select a linter or formmatter that you want
-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		lazy = false,
-- 		opts = {
-- 			auto_install = true,
-- 		},
-- 		--config = function()
-- 		--	require("mason-lspconfig").setup({
-- 		--		ensure_installed = {
-- 		--			"lua_ls",
-- 		--			"ts_ls",
-- 		--			--"eslint",
-- 		--			'ruby_lsp',
-- 		--			"gopls",
-- 		--		},
-- 		--	})
-- 		--end,
-- 	},
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		config = function()
-- 			local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- 			local lspconfig = require("lspconfig")
-- 
-- 			lspconfig.lua_ls.setup({})
-- 			lspconfig.ts_ls.setup({})
-- 			--lspconfig.eslint.setup({})
-- 			lspconfig.ruby_lsp.setup({
-- 				capabilities = capabilities,
-- 			})
-- 			lspconfig.gopls.setup({})
-- 			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- 			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
-- 			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
-- 		end,
-- 	},
-- }
