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

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 0
vim.g.netrw_liststyle = 3
 
-- KEYMAPS --

local map = vim.keymap.set

map("n", "<C-e>", vim.cmd.write)
map("i", "<C-e>", vim.cmd.write)
map("n", "<C-t>", function() vim.cmd.Lex(20) end)

local builtin = require("telescope.builtin")
local find_hidden = function()
    builtin.find_files {find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }}
end
local harpoon = require("harpoon")
harpoon:setup()

map("n", "<C-f>", builtin.find_files)
map("n", "<C-h>", find_hidden)

map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<leader>f", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

map("n", "<leader>j", function() harpoon:list():select(1) end)
map("n", "<leader>k", function() harpoon:list():select(2) end)
map("n", "<leader>l", function() harpoon:list():select(3) end)
map("n", "<leader>;", function() harpoon:list():select(4) end)

vim.cmd("autocmd BufReadPost *.rhubarb set filetype=c")
vim.cmd("autocmd BufReadPost *.glsl set filetype=glsl")
vim.cmd.colorscheme("catppuccin-mocha")

