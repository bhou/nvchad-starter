require "nvchad.options"

-- add yours here!

local o = vim.o
vim.opt.cursorlineopt ='both' -- to enable cursorline!

-- fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Auto Commands
-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*"},
  command = [[%s/\s\+$//e]]
})
