vim.g.mapleader = ' '
vim.keymap.set({'n', 'x'}, 'cp', '"+y', {desc = 'Copy'})
vim.keymap.set({'n', 'x'}, 'cv', '"+p', {desc = 'Paste'})


local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  -- You can "comment out" the line below after lazy.nvim is installed
  --  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  {'folke/tokyonight.nvim'},
  {'nvim-lualine/lualine.nvim'}, 
  {'williamboman/mason.nvim'},
})
      

vim.o.relativenumber = true
vim.o.number = true

vim.o.mouse = 'a'

vim.o.autoindent = true
vim.o.ts = 2
vim.o.sw = 2
vim.o.expandtab = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = false

vim.o.wrap = true
vim.o.breakindent = true

vim.o.termguicolors = true
vim.cmd.colorscheme('tokyonight')


require('lualine').setup()
require('mason').setup()
