
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use 'xiyaowong/transparent.nvim'
    use('mbbill/undotree')

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- COLORSCHEMES --
    use 'rose-pine/neovim'
    use 'folke/tokyonight.nvim'
    use 'haishanh/night-owl.vim'
	use 'tanvirtin/monokai.nvim'
    use 'morhetz/gruvbox'
    use 'rebelot/kanagawa.nvim'
    use 'sainnhe/everforest'
    use 'dracula/vim'
    use 'catppuccin/nvim'
    use 'jdsimcoe/hyper.vim'
    use 'luisiacc/the-matrix.nvim'
    use 'fxn/vim-monochrome'
    use 'vim-scripts/chlordane.vim'
    use 'shaunsingh/nord.nvim'
    use 'thedenisnikulin/vim-cyberpunk'
    use 'whatyouhide/vim-gotham'
    use 'maxmx03/solarized.nvim'
    use 'blazkowolf/gruber-darker.nvim'
end)

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

require("transparent").setup({ groups = { 'Normal', 'NormalFloat', 'NormalNC', 'EndOfBuffer', 'SignColumn', 'SyntasticWarningSign', 'LineNr', 'Folded', 'NonText', 'SpecialKey', 'VertSplit', 'FloatBorder', 'TelescopeBorder', 'TelescopePromptBorder', 'TelescopePromptNormal', 'TelescopePromptPrefix', 'TelescopeNormal', 'TelescopePreviewTitle', 'TelescopePromptTitle', 'TelescopeResultsTitle', 'TelescopeSelection', 'TelescopePreviewLine', 'TelescopeSelectionCaret', 'ErrorFloat', 'WarningFloat', 'InfoFloat', 'HintFloat', 'DiagnosticVirtualTextError', 'DiagnosticVirtualTextWarn', 'DiagnosticVirtualTextInfo', 'DiagnosticVirtualTextHint', 'DiagnosticSignError', 'DiagnosticSignWarn', 'DiagnosticSignInfo', 'DiagnosticSignHint', }})

-- KEY MAPS
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- telescope remaps
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<leader>f', builtin.find_files)

require('telescope').setup {
    defaults = {
        mappings = { i = { ["<esc>"] = actions.close } },
        preview = { msg_bg_fillchar = "/" },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
}


-- treesitter --
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "lua", "python", "glsl", "rust", "c" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.cmd('colo tokyonight-moon')
vim.cmd("autocmd BufReadPost *.rhubarb set filetype=c")
vim.cmd("autocmd BufReadPost *.rhu set filetype=c")
vim.cmd("hi TelescopeBorder gui=bold")
vim.cmd("hi TelescopePromptBorder gui=bold")
--vim.cmd("hi TelescopeBorder guifg=#817f7f")
