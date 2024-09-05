require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<C-p>", "<cmd> Telescope find_files <CR>", { desc = "find files" })
map("n", "<leader>s", "<cmd> Telescope live_grep <CR>", { desc = "find string" })
map("n", "<leader>f", "<cmd> Telescope grep_string <CR>", { desc = "grep string" })
map("n", "<leader>o", ":!open % <CR>")
map("n", "<leader>q", ":copen <CR>")
map("n", "<leader>Q", ":cclose <CR>")
map("n", "<leader>i",
  ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) <CR>",
  { desc = "toggle inlay hints" }
)
map("n", "<leader>tr",
  function()
    require('base64').toggle_transparency()
  end,
  { desc = "grep string" }
)
map("n", "<leader>gn", ":Gitsigns next_hunk <CR>")
map("n", "<leader>gp", ":Gitsigns prev_hunk <CR>")
map("n", "<leader>d", ":TroubleToggle <CR>", { desc = "toggle trouble windows" })

map("i", "<C-J>", 'copilot#Accept("\\<CR>")',
  { desc = "accept copilot suggestions", expr = true, replace_keycodes = false })
