return {
    {
        'MagicDuck/grug-far.nvim',
        opts = { headerMaxWidth = 80 },
        cmd = 'GrugFar',
        keys = {
            {
                '<leader>sr',
                function()
                    local grug = require 'grug-far'
                    local ext = vim.bo.buftype == '' and vim.fn.expand '%:e'
                    grug.open {
                        transient = true,
                        prefills = {
                            filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
                        },
                    }
                end,
                mode = { 'n', 'v' },
                desc = 'Search and Replace',
            },
        },
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts_extend = { 'spec' },
        opts = {
            preset = 'helix',
            defaults = {},
            spec = {
                {
                    mode = { 'n', 'v' },
                    { '<leader><tab>', group = 'tabs' },
                    { '<leader>a', group = 'ai' },
                    { '<leader>c', group = 'code' },
                    { '<leader>d', group = 'debug' },
                    { '<leader>dp', group = 'profiler' },
                    { '<leader>f', group = 'file/find' },
                    { '<leader>g', group = 'git' },
                    { '<leader>gh', group = 'hunks' },
                    { '<leader>q', group = 'quit/session' },
                    { '<leader>s', group = 'search' },
                    { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
                    { '<leader>x', group = 'diagnostics/quickfix', icon = { icon = '󱖫 ', color = 'green' } },
                    { '[', group = 'prev' },
                    { ']', group = 'next' },
                    { 'g', group = 'goto' },
                    { 'gs', group = 'surround' },
                    { 'z', group = 'fold' },
                    {
                        '<leader>b',
                        group = 'buffer',
                        expand = function()
                            return require('which-key.extras').expand.buf()
                        end,
                    },
                    {
                        '<leader>w',
                        group = 'windows',
                        proxy = '<c-w>',
                        expand = function()
                            return require('which-key.extras').expand.win()
                        end,
                    },
                    -- better descriptions
                    { 'gx', desc = 'Open with system app' },
                },
            },
        },
        keys = {
            {
                '<leader>?',
                function()
                    require('which-key').show { global = false }
                end,
                desc = 'Buffer Keymaps (which-key)',
            },
            {
                '<c-w><space>',
                function()
                    require('which-key').show { keys = '<c-w>', loop = true }
                end,
                desc = 'Window Hydra Mode (which-key)',
            },
        },
        config = function(_, opts)
            local wk = require 'which-key'
            wk.setup(opts)
            if not vim.tbl_isempty(opts.defaults) then
                vim.notify 'which-key: opts.defaults is deprecated. Please use opts.spec instead.'
                wk.register(opts.defaults)
            end
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        opts = {
            signs = {
                add = { text = '▎' },
                change = { text = '▎' },
                delete = { text = '' },
                topdelete = { text = '' },
                changedelete = { text = '▎' },
                untracked = { text = '▎' },
            },
            signs_staged = {
                add = { text = '▎' },
                change = { text = '▎' },
                delete = { text = '' },
                topdelete = { text = '' },
                changedelete = { text = '▎' },
            },
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                map('n', ']h', function()
                    if vim.wo.diff then
                        vim.cmd.normal { ']c', bang = true }
                    else
                        gs.nav_hunk 'next'
                    end
                end, 'Next Hunk')
                map('n', '[h', function()
                    if vim.wo.diff then
                        vim.cmd.normal { '[c', bang = true }
                    else
                        gs.nav_hunk 'prev'
                    end
                end, 'Prev Hunk')
                map('n', ']H', function()
                    gs.nav_hunk 'last'
                end, 'Last Hunk')
                map('n', '[H', function()
                    gs.nav_hunk 'first'
                end, 'First Hunk')
                map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
                map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')
                map('n', '<leader>ghS', gs.stage_buffer, 'Stage Buffer')
                map('n', '<leader>ghu', gs.undo_stage_hunk, 'Undo Stage Hunk')
                map('n', '<leader>ghR', gs.reset_buffer, 'Reset Buffer')
                map('n', '<leader>ghp', gs.preview_hunk_inline, 'Preview Hunk Inline')
                map('n', '<leader>ghb', function()
                    gs.blame_line { full = true }
                end, 'Blame Line')
                map('n', '<leader>ghB', function()
                    gs.blame()
                end, 'Blame Buffer')
                map('n', '<leader>ghd', gs.diffthis, 'Diff This')
                map('n', '<leader>ghD', function()
                    gs.diffthis '~'
                end, 'Diff This ~')
                map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
            end,
        },
    },
}
