require("config.lazy")

-- SETTINGS --
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "0"
vim.opt.clipboard:append("unnamedplus")

-- KEYMAPS --
local builtin = require("telescope.builtin")
local find_hidden = function()
    builtin.find_files {
        find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    }
end

vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>F", find_hidden, { desc = "Telescope find files" })

vim.cmd("autocmd BufReadPost *.rhubarb set filetype=c")
vim.cmd.colorscheme("tokyonight")
