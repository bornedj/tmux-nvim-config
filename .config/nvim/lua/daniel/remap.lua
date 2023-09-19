vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>Pv", "<cmd> Sex! <CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<M-x>", "<C-x>")

vim.keymap.set("n", "J", "mzj`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('x', '<leader>p', "\"_dp")

-- clipboard
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

vim.keymap.set("n", "Q", "<nop>")

--tmux stuff
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer.sh<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("v", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- vim.keymap.set("n", "<C-K>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-J>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- command to open a file with explorer.exe so I can open files with their native
-- windows default program. I.E. open html files in windows chrome
vim.keymap.set("n", "<leader>fp", function()
    local startingDir = vim.fn.getcwd()
    local explorer = string.format("!explorer.exe %s", vim.fn.expand('%:t'))
    vim.cmd("cd %:h")
    vim.cmd(explorer)
    vim.cmd(string.format("cd %s", startingDir))
end)

-- command to open a file explorer in the location of the current buffer
vim.keymap.set("n", "<leader>fe", function()
    local startingDir = vim.fn.getcwd()
    vim.cmd("cd %:h")
    vim.cmd("!explorer.exe .")
    vim.cmd(string.format("cd %s", startingDir))
end)

-- open windows git bash and cd into the dir of the current buffer
vim.keymap.set("n", "<leader>gb", function()
    local startingDir = vim.fn.getcwd()
    vim.cmd("cd %:h")
    vim.cmd("silent !/mnt/c/Program\\ Files/Git/git-bash.exe --cd=.")
    vim.cmd(string.format("cd %s", startingDir))
end)


-- another wsl specific bind, used to remove ^M from files 
-- that have had windows carriages added to files
vim.keymap.set("n", "<leader>ux", function()
    vim.cmd("update")
    vim.cmd("e ++ff=dos")
    vim.cmd("setlocal ff=unix")
    vim.cmd("w")
end)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>hn", function()
    vim.cmd("set number relativenumber")
end)
vim.keymap.set("n", "<leader>an", function()
    vim.cmd("set number")
    vim.cmd("set rnu!")
end)
