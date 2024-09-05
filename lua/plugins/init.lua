return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier",
        "gopls",
        "bash-language-server",
        "zls",
        "typescript-language-server",
        "flow",
  		},
  	},
  },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
  {
    "fatih/vim-go", lazy = false,
  },
  {
    "jbyuki/venn.nvim", lazy = false,
    config = function()
      function _G.Toggle_venn()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if venn_enabled == "nil" then
          vim.b.venn_enabled = true
          vim.cmd[[setlocal ve=all]]
          -- draw a line on HJKL keystokes
          vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
          vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
          -- draw a box by pressing "f" with visual selection
          vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
        else
          vim.cmd[[setlocal ve=]]
          vim.cmd[[mapclear <buffer>]]
          vim.b.venn_enabled = nil
        end
      end
      -- toggle keymappings for venn using <leader>v
      vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
    end
  },
  {
    "github/copilot.vim", lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false } )
    end
  },
  { -- extend the built-in nvim tree plugin
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        adaptive_size = true,
      },
      git = {
        enable = true,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },
  {
    "dhruvasagar/vim-table-mode", lazy = false,
  },
  {
    "aklt/plantuml-syntax", ft="plantuml",
  },
  {
    "folke/zen-mode.nvim", lazy = false,
    opts = {}
  },
  {
    "allaman/emoji.nvim", lazy = false,
    dependencies = {
      -- optional for telescope integration
      "nvim-telescope/telescope.nvim",
    },
    config = function(_, opts)
      require("emoji").setup(opts)
      -- optional for telescope integration
      local ts = require('telescope').load_extension 'emoji'
      vim.keymap.set('n', '<leader>te', ts.emoji, { desc = '[S]earch [E]moji' })
    end,
  },
  {
    'felpafel/inlay-hint.nvim', lazy = false,
    event = 'LspAttach',
    config = true,
  }
}
