vim.filetype.add({
    extension = {
        mdx = 'jsx'
    }
})

local ft_to_parser = require("nvim-treesitter.parsers")
ft_to_parser.mdx = "markdown"

