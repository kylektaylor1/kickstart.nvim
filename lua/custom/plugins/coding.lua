return {
    {
        'folke/ts-comments.nvim',
        event = 'VeryLazy',
        opts = {},
    },
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
