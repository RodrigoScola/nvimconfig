-- cursor to be " " only on insert mode
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci-ve:ver25,r-cr:hor20,o:hor50"

vim.opt.nu = false
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.smartindent = true
--vim.opt.breakindent = true

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
