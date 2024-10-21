-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local builtin = require("telescope.builtin")

local find_hidden = function()
    builtin.find_files {
        find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    }
end

vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>F", find_hidden, { desc = "Telescope find files" })

