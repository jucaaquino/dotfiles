vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"

vim.schedule(function() vim.o.clipboard = "unnamedplus" end)
vim.o.wrap = false
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = "> ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = false
vim.o.scrolloff = 5
vim.o.confirm = true
vim.o.colorcolumn = "80"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- Exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>t", function () vim.cmd.tabnew() end)
vim.keymap.set("n", "<leader>w", vim.cmd.tabclose)
vim.keymap.set("n", "<leader>l", "g<tab>")

vim.keymap.set("n", "<leader>1", function () vim.cmd("1tabnext") end)
vim.keymap.set("n", "<leader>2", function () vim.cmd("2tabnext") end)
vim.keymap.set("n", "<leader>3", function () vim.cmd("3tabnext") end)
vim.keymap.set("n", "<leader>4", function () vim.cmd("4tabnext") end)
vim.keymap.set("n", "<leader>5", function () vim.cmd("5tabnext") end)
vim.keymap.set("n", "<leader>6", function () vim.cmd("6tabnext") end)
vim.keymap.set("n", "<leader>7", function () vim.cmd("7tabnext") end)
vim.keymap.set("n", "<leader>8", function () vim.cmd("8tabnext") end)
vim.keymap.set("n", "<leader>9", function () vim.cmd("tablast") end)

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})


vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/NMAC427/guess-indent.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/xiyaowong/transparent.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/folke/todo-comments.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "~/Developer/mini.base16",
})

require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "-" },
        changedelete = { text = "~" },
    },
})

require("transparent").setup({
    groups = {
        "Normal",
        "NormalFloat",
        "NormalNC",
        "EndOfBuffer",
        "SignColumn",
        "SyntasticWarningSign",
        "LineNr",
        "LineNrAbove",
        "LineNrBelow",
        "Folded",
        "NonText",
        "SpecialKey",
        "VertSplit",
        "FloatBorder",
        "TelescopeBorder",
        "TelescopePromptBorder",
        "TelescopePromptNormal",
        "TelescopePromptPrefix",
        "TelescopeNormal",
        "TelescopePreviewTitle",
        "TelescopePromptTitle",
        "TelescopeResultsTitle",
        "TelescopeSelection",
        "TelescopePreviewLine",
        "TelescopeSelectionCaret",
        "ErrorFloat",
        "WarningFloat",
        "InfoFloat",
        "HintFloat",
        "DiagnosticVirtualTextError",
        "DiagnosticVirtualTextWarn",
        "DiagnosticVirtualTextInfo",
        "DiagnosticVirtualTextHint",
        "DiagnosticSignError",
        "DiagnosticSignWarn",
        "DiagnosticSignInfo",
        "DiagnosticSignHint",
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
    },
})



require("telescope").setup({
    defaults = {
        mappings = { i = { ["<esc>"] = "close" } },
        preview = { msg_bg_fillchar = "/" },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        layout_strategy = 'horizontal',
        layout_config = { width = 0.6, height = 0.6 },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
        },
    },
})

require("lazydev").setup{
    library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
}

require("mason").setup({})

local capabilities = require("blink.cmp").get_lsp_capabilities()

local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    -- rust_analyzer = {},
    -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
    --
    -- Some languages (like typescript) have entire language plugins that can be useful:
    --    https://github.com/pmizio/typescript-tools.nvim
    --
    -- But for many setups, the LSP (`ts_ls`) will work just fine
    ts_ls = {},
    html = {},
    cssls = {},
    lua_ls = {
        -- cmd = { ... },
        -- filetypes = { ... },
        -- capabilities = {},
        settings = {
            Lua = {
                completion = {
                    callSnippet = 'Replace',
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
            },
        },
    },
}

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
    'stylua', -- Used to format Lua code
})
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
    ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
    automatic_installation = false,
    handlers = {
        function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
        end,
    },
}
require("mason-tool-installer").setup({})
require("blink.cmp").setup({
    keymap = {
        preset = "default",
        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    },

    completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
        menu = {
            draw = {
                columns = { { 'label', 'label_description', gap = 1 } },
            }
        }
    },

    sources = {
        default = { "lsp", "path", "snippets", "lazydev" },
        providers = {
            lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
        },
    },

    snippets = { preset = "luasnip" },

    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    --
    -- By default, we use the Lua implementation instead, but you may enable
    -- the rust implementation via `'prefer_rust_with_warning'`
    --
    -- See :h blink-cmp-config-fuzzy for more information
    fuzzy = { implementation = "lua" },

    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
})

require("todo-comments").setup{
    keywords = {
        FIX = {
            icon = "F",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = "T", color = "info" },
        HACK = { icon = "H ", color = "warning" },
        WARN = { icon = "W ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "P ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "N ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "T ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
}

local gruvbox = {
    background = '#1d2021',
    foreground = '#ebdbb2',

    normal = {
        black   = '#282828',
        red     = '#cc241d',
        green   = '#98971a',
        yellow  = '#d79921',
        blue    = '#458588',
        magenta = '#b16286',
        cyan    = '#689d6a',
        white   = '#a89984',
    },

    bright = {
        black   = '#928374',
        red     = '#fb4934',
        green   = '#b8bb26',
        yellow  = '#fabd2f',
        blue    = '#83a598',
        magenta = '#d3869b',
        cyan    = '#8ec07c',
        white   = '#ebdbb2',
    }
}

local kanagawa = {
    background = '#181616',
    foreground = '#c5c9c5',

    normal = {
        black = '#0d0c0c',
        blue = '#8ba4b0',
        cyan = '#8ea4a2',
        green = '#8a9a7b',
        magenta = '#a292a3',
        red = '#c4746e',
        white = '#C8C093',
        yellow = '#c4b28a',
    },

    bright = {
        black = '#a6a69c',
        blue = '#7FB4CA',
        cyan = '#7AA89F',
        green = '#87a987',
        magenta = '#938AA9',
        red = '#E46876',
        white = '#c5c9c5',
        yellow = '#E6C384',
    }
}

local nightowl = {
    background = "#011627",
    foreground = "#d6deeb",

    normal = {
        black = "#1d3b53",
        red = "#EF5350",
        green = "#22da6e",
        yellow = "#c5e478",
        blue = "#82AAFF",
        magenta = "#C792EA",
        cyan = "#21c7a8",
        white = "#ffffff",
    },

    bright = {
        black = "#575656",
        red = "#EF5350",
        green = "#22da6e",
        yellow = "#ffeb95",
        blue = "#82AAFF",
        magenta = "#C792EA",
        cyan = "#7fdbca",
        white = "#ffffff",
    }
}

local colors = nightowl

local alacritty_theme = table.concat{
    "[colors.primary]\n",
    "background = '",   colors.background,      "'\n",
    "foreground = '",   colors.foreground,      "'\n",
    "[colors.normal]\n",
    "black   = '",      colors.normal.black,    "'\n",
    "red     = '",      colors.normal.red,      "'\n",
    "green   = '",      colors.normal.green,    "'\n",
    "yellow  = '",      colors.normal.yellow,   "'\n",
    "blue    = '",      colors.normal.blue,     "'\n",
    "magenta = '",      colors.normal.magenta,  "'\n",
    "cyan    = '",      colors.normal.cyan,     "'\n",
    "white   = '",      colors.normal.white,    "'\n",
    "[colors.bright]\n",
    "black   = '",      colors.bright.black,    "'\n",
    "red     = '",      colors.bright.red,      "'\n",
    "green   = '",      colors.bright.green,    "'\n",
    "yellow  = '",      colors.bright.yellow,   "'\n",
    "blue    = '",      colors.bright.blue,     "'\n",
    "magenta = '",      colors.bright.magenta,  "'\n",
    "cyan    = '",      colors.bright.cyan,     "'\n",
    "white   = '",      colors.bright.white,    "'\n",
}

local file = io.open('/Users/juca/.config/alacritty/theme.toml', 'w')
file:write(alacritty_theme)
file:close()

require("colors").setup({
    palette = {
        base00 = colors.background,
        base01 = colors.normal.black,
        base02 = colors.normal.black,
        base03 = colors.bright.black,
        base04 = colors.normal.white,
        base05 = colors.normal.white,
        base06 = colors.normal.white,
        base07 = colors.normal.white,
        base08 = colors.bright.red,
        base09 = colors.normal.white,
        base0A = colors.normal.yellow,
        base0B = colors.normal.green,
        base0C = colors.bright.white,
        base0D = colors.bright.white,
        base0E = colors.bright.yellow,
        base0F = colors.bright.white,
    },

    -- Whether to support cterm colors. Can be boolean, `nil` (same as
    -- `false`), or table with cterm colors. See `setup()` documentation for
    -- more information.
    use_cterm = nil,
})

require("nvim-treesitter").setup{
    ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "vimdoc",
    },
    auto_install = true,
    highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { "ruby", "html" },
    },
    indent = { enable = true, disable = { "ruby", "html" } },
}



-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })




--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

        -- Find references for the word under your cursor.
        map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

        local function client_supports_method(client, method, bufnr)
            if vim.fn.has("nvim-0.11") == 1 then
                return client:supports_method(method, bufnr)
            else
                return client.supports_method(method, { bufnr = bufnr })
            end
        end


        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if
            client
            and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
        then
            map("<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "[T]oggle Inlay [H]ints")
        end
    end
})

vim.diagnostic.config({
    severity_sort = true,
    float = { border = "rounded", source = "if_many" },
    underline = { severity = vim.diagnostic.severity.ERROR },
    virtual_text = {
        source = "if_many",
        spacing = 2,
        format = function(diagnostic)
            local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
        end,
    },
})

