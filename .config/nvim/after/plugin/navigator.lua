require('navigator').setup({
    mason = true,
    default_mapping = false,
    keymaps = {
        { key = 'gr',         func = require('navigator.reference').async_ref, desc = 'async_ref' },
        { key = '<Leader>gr', func = require('navigator.reference').reference, desc = 'reference' }, -- reference deprecated
        {
            mode = 'i',
            key = '<M-k>',
            func = vim.lsp.buf.signature_help,
            desc = 'signature_help',
        },
        {
            key = '<c-k>',
            func = vim.lsp.buf.signature_help,
            desc = 'signature_help',
        },
        { key = 'gd',    func = require('navigator.definition').definition, desc = 'definition' },
        { key = 'gD',    func = vim.lsp.buf.declaration,                    desc = 'declaration' },

        {
            key = 'gt',
            func = vim.lsp.buf.type_definition,
            desc = 'type_definition',
        },
        {
            key = 'gp',
            func = require('navigator.definition').definition_preview,
            desc = 'definition_preview',
        },
        { key = '<Leader>re', func = 'rename()' },
        { key = '<Leader>rn',  func = require('navigator.rename').rename, desc = 'rename' },
        { key = 'gi',         func = vim.lsp.buf.implementation,         desc = 'implementation' },
        {
            key = 'gG',
            func = require('navigator.diagnostics').show_buf_diagnostics,
            desc = 'show_buf_diagnostics',
        },
        {
            key = ']d',
            func = vim.diagnostic.goto_next,
            desc = 'next diagnostics',
        },
        {
            key = '[d',
            func = vim.diagnostic.goto_prev,
            desc = 'prev diagnostics',
        },
        { key = ']r',        func = require('navigator.treesitter').goto_next_usage, desc = 'goto_next_usage' },
        {
            key = '[r',
            func = require('navigator.treesitter').goto_previous_usage,
            desc = 'goto_previous_usage',
        },
    },
    lsp = {
        document_highlight = false,
        format_on_save = false
    }
})
