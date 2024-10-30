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

local map = vim.keymap.set

map("n", "<C-s>", vim.cmd.write)
map("i", "<C-s>", vim.cmd.write)
map("n", "<Enter>", "o<ESC>")

--map("n", "<C-d>", "<C-d>")
--map("n", "<C-u>", "<C-u>")
--map("n", "n", "nzz")
--map("n", "N", "Nzz")

local builtin = require("telescope.builtin")
local find_hidden = function()
    builtin.find_files {find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }}
end
local harpoon = require("harpoon")
harpoon:setup()

map("n", "<C-f>", builtin.find_files)
map("n", "<C-h>", find_hidden)

map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

map("n", "<C-j>", function() harpoon:list():select(1) end)
map("n", "<C-k>", function() harpoon:list():select(2) end)
map("n", "<C-l>", function() harpoon:list():select(3) end)
map("n", "<C-_>", function() harpoon:list():select(4) end)

vim.cmd("autocmd BufReadPost *.rhubarb set filetype=c")
vim.cmd("autocmd BufReadPost *.glsl set filetype=c")
vim.cmd.colorscheme("gruvbox")

