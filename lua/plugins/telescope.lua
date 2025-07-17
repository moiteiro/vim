return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end,
  },
}

-- return {
--   {
--     "nvim-telescope/telescope-ui-select.nvim",
--   },
--   {
--     "nvim-telescope/telescope.nvim",
--     tag = "0.1.5",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     config = function()
--       require("telescope").setup({
--         extensions = {
--           ["ui-select"] = {
--             require("telescope.themes").get_dropdown({}),
--           },
--         },
--       })
--       local builtin = require("telescope.builtin")
--       vim.keymap.set("n", "<C-p>", builtin.find_files, {})
--       vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
--       vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
--
--       require("telescope").load_extension("ui-select")
--     end,
--   },
-- }
