return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        keys = {
            { '-', '<cmd>Oil<cr>', desc = 'Open parent directory' },
        },
    },
}
