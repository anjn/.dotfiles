-- Auto install jetpack
local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
    vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

vim.cmd [[ let g:python3_host_prog = '/usr/bin/python3' ]]
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
vim.cmd [[ set updatetime=100 ]]

vim.cmd('packadd vim-jetpack')
require('jetpack.packer').add {
    -- Plugin manager
    { 'tani/vim-jetpack', opt = 1 },

    -- Color schemes
    'EdenEast/nightfox.nvim',

    -- Status line
    'nvim-lualine/lualine.nvim',

    -- Display
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {}
        end,
    },
  
    'myusuf3/numbers.vim',

    {
        'petertriho/nvim-scrollbar',
        config = function()
            require("scrollbar").setup {
                excluded_buftypes = {
                    "terminal",
                },
                excluded_filetypes = {
                    "prompt",
                    "TelescopePrompt",
                    "noice",
                    "neo-tree",
                    "aerial",
                },
            }
        end,
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("ibl").setup {}
        end,
    },
  
    -- Directory tree
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',

    {
        'nvim-neo-tree/neo-tree.nvim',
        tag = '3.39.0',
        depends = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("neo-tree").setup {}
        end,
    },

    -- Code outline
    { 'stevearc/aerial.nvim',
      config = function() require('aerial').setup() end
    },
  
    -- Yank
    {
        'gbprod/yanky.nvim',
        config = function()
            require("yanky").setup {}
        end,
    },

    -- Clipboard
    {
        'AckslD/nvim-neoclip.lua',
        config = function()
            require('neoclip').setup {}
        end,
    },
  
    -- Edit
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {}
        end,
    },

    {
        'windwp/nvim-autopairs',
        config = function()
            require("nvim-autopairs").setup {}
        end,
    },

    'deris/vim-rengbang',

    'junegunn/vim-easy-align',

    -- Fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.2.1',
        depends = {
            'nvim-lua/plenary.nvim',
            'gbprod/yanky.nvim',
            'AckslD/nvim-neoclip.lua',
        },
        config = function()
            require("telescope").load_extension("yank_history")
            require('telescope').load_extension('neoclip')
            require('telescope').setup {
                defaults = {
                    color_devicons = true,
                    layout_config = {
                        width = 0.7,
                        horizontal = {
                            preview_width = 0.6
                        }
                    }
                },
                pickers = {
                    buffers = {
                        ignore_current_buffer = true,
                        sort_lastused = true,
                    },
                },
            }
        end,
    },

    'nvim-lua/plenary.nvim',

    -- TODO assign key
    {
        'nvim-telescope/telescope-frecency.nvim',
        depends = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require("telescope").load_extension("frecency")
        end,
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        depends = {
            'nvim-telescope/telescope.nvim',
        },
        -- run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install',
        run = 'make',
        config = function()
            require('telescope').load_extension('fzf')
        end,
    },

    -- Completion
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require'cmp'
            
            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                },
            })
        end,
    },
}

-- colorscheme
vim.cmd [[
    try
        colorscheme nightfox
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        set background=dark
    endtry
]]

require('lualine').setup({})

vim.cmd [[ hi Comment gui=NONE ]] -- disable italic

-- number
vim.cmd [[ let g:numbers_exclude = ['neo-tree', 'aerial', 'terminal'] ]]

-- indent-blankline
vim.opt.list = true

-- edit
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]

-- options
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- tab/indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- keymap
keymap("n", "tc", ":tabedit<Return>", opts)
keymap("n", "tn", ":tabNext<Return>", opts)
keymap("n", "tp", ":tabprevious<Return>", opts)

keymap("n", "tt", "<cmd>terminal bash<cr>", opts)
keymap("n", "tx", "<cmd>belowright new<CR><cmd>terminal bash<cr>", opts)

keymap("n", ",t", ":Neotree toggle<Return>", opts)

keymap('n', ',f', '<cmd>lua require("telescope.builtin").find_files()<cr>', {noremap = true})
keymap('n', ',g', '<cmd>lua require("telescope.builtin").live_grep()<cr>', {noremap = true})
keymap('n', ',b', '<cmd>lua require("telescope.builtin").buffers()<cr>', {noremap = true})
keymap('n', ',h', '<cmd>lua require("telescope.builtin").help_tags()<cr>', {noremap = true})
keymap('n', ',y', '<cmd>lua require("telescope").extensions.neoclip.default()<cr>', {noremap = true})
keymap('n', ',p', '<cmd>lua require("telescope").extensions.yank_history.yank_history()<cr>', {noremap = true})
keymap('n', ',a', '<cmd>AerialToggle<cr>', {noremap = true})

-- Yanky
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

---- escape from insert mode in terminal
keymap('t', '<esc>', '<c-\\><c-n>', opts)

-- terminal
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    pattern = '*',
    callback = function(args)
        vim.cmd [[ setlocal norelativenumber ]]
        vim.cmd [[ setlocal nonumber ]]
        vim.cmd [[ startinsert ]]
    end,
})
