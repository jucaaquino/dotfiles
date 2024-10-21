return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    opts = {
        defaults = {
            mappings = { i = { ["<esc>"] = "close" } },
            preview = { msg_bg_fillchar = "/" },
            borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
    },
    dependencies = { 'nvim-lua/plenary.nvim' }
}
