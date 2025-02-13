return {
    {
        'stevearc/conform.nvim',
        dependencies = { 'mason.nvim' },
        lazy = false,
        event = { 'BufReadPre', 'BufNewFile' },
        cmd = 'ConformInfo',
        opts = {
            format_on_save = {
                -- These options will be passed to conform.format()
                -- timeout_ms = 500,
                lsp_format = 'fallback',
            },
            default_format_opts = {
                timeout_ms = 3000,
                -- async = false, -- not recommended to change
                -- quiet = false, -- not recommended to change
                lsp_format = 'fallback', -- not recommended to change
            },
            formatters_by_ft = {
                lua = { 'stylua' },
                sh = { 'shfmt' },
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescriptreact = { 'prettier' },
                astro = { 'prettier' },
                svelte = { 'prettier' },
                css = { 'prettier' },
                html = { 'prettier' },
                json = { 'prettier' },
                yaml = { 'prettier' },
                markdown = { 'prettier' },
                graphql = { 'prettier' },
            },
        },
    },
}
