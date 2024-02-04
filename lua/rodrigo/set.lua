-- cursor to be " " only on insert mode
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci-ve:ver25,r-cr:hor20,o:hor50"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true


vim.opt.guifont = "Fira Code"

--vim.opt.termguicolors = true
vim.opt.scrolloff = 20
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50


-- PRETtier
vim.g['prettier#quickfix_enabled'] = '1'
vim.g['prettier#config#single_quote'] = 'true'
vim.g['prettier#config#trailing_comma'] = 'es5'
vim.g['prettier#config#semi'] = 'false'
