return {
    {
        'yetone/avante.nvim',
        event = 'VeryLazy',
        lazy = false,
        version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
        opts = {
            -- add any opts here
            behaviour = {
                auto_suggestions = false, -- Experimental stage
            },
            mappings = {
                --- @class AvanteConflictMappings
                diff = {
                    ours = 'co',
                    theirs = 'ct',
                    all_theirs = 'ca',
                    both = 'cb',
                    cursor = 'cc',
                    next = ']x',
                    prev = '[x',
                },
                suggestion = {
                    accept = '<C-l>',
                    next = '<M-]>',
                    prev = '<M-[>',
                    dismiss = '<C-]>',
                },
                jump = {
                    next = ']]',
                    prev = '[[',
                },
                submit = {
                    normal = '<CR>',
                    insert = '<C-s>',
                },
                sidebar = {
                    apply_all = 'A',
                    apply_cursor = 'a',
                    switch_windows = '<Tab>',
                    reverse_switch_windows = '<S-Tab>',
                },
            },
        },
        build = 'make',
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            --- The below dependencies are optional,
            'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
            'echasnovski/mini.icons',
            {
                -- support for image pasting
                'HakonHarnes/img-clip.nvim',
                event = 'VeryLazy',
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { 'markdown', 'Avante' },
                },
                ft = { 'markdown', 'Avante' },
            },
        },
    },
}
