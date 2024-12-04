vim.o.expandtab = true
vim.o.tabstop=2
vim.o.shiftwidth=2
vim.o.softtabstop=2
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.backspace=indent,eol,start
vim.api.nvim_set_option_value("colorcolumn", "101", {})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "catppuccin-mocha" } },
  checker = { enabled = true },
})

-- history
if vim.fn.has("persistent_undo") == 1 then
  local undo_dir = vim.fn.expand("~/.config/nvim/undo")
  if vim.fn.isdirectory(undo_dir) == 0 then
    vim.fn.mkdir(undo_dir, "p")
  end

  vim.o.undodir = "./.nvim-undo//," .. undo_dir .. "//"
  vim.o.undofile = true
end
