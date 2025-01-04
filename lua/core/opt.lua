-- Just some vim.opts
local set = vim.opt
local cmd = vim.cmd

set.shiftwidth = 2
set.softtabstop = 2
set.tabstop = 2
set.smartindent = true
set.nu = true


-- mouse settings
cmd.aunmenu { "PopUp.How-to\\ disable\\ mouse" }
cmd.anoremenu { "PopUp.Open\\ File <Cmd>:lua require('telescope.builtin').find_files()<CR>" }
cmd.anoremenu { "PopUp.Close\\ File <Cmd>:lua require('ijcc.utils').close_buffer()<CR>" }

-- remove comment on newline
cmd('autocmd BufEnter * set formatoptions-=cro')
cmd('autocmd BufEnter * setlocal formatoptions-=cro')
--misc
set.cursorlineopt = "number"
set.wrap = false
set.termguicolors = true
set.scrolloff = 8
set.signcolumn = "yes"
set.isfname:append("@-@")
set.hidden = true
-- Ignore default vim colorschemes
vim.cmd(
    [[set wildignore+=blue.vim,darkblue.vim,delek.vim,desert.vim,elflord.vim,evening.vim,industry.vim,koehler.vim,lunaperche.vim,morning.vim,murphy.vim,pablo.vim,peachpuff.vim,quiet.vim,retrobox.vim,ron.vim,shine.vim,slate.vim,sorbet.vim,torte.vim,wildcharm.vim,zaibatsu.vim,zellner.vim,habamax.vim,default.vim]])


-- undo
set.updatetime = 50
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true
