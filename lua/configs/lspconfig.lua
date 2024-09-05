-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls",
  "gopls", "ccls", "pyright", "jsonls", "csharp_ls", "yamlls", "bashls",
  "flow", "zls", "ocamllsp",
  "tsserver",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  local setup = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }

  if lsp == 'yamlls' then
    setup.settings = {
      yaml = {
        keyOrdering = false
      }
    }
  end

  if lsp == 'grammarly' then
    setup.filetypes = { "markdown", "tex", "txt", "text" }
  end

  if lsp == 'ltex' then
    setup.filetypes = { "text", "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "tex", "pandoc" }
  end

  lspconfig[lsp].setup(setup)
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- gopls
-- enable inlay hints
lspconfig.gopls.setup({
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

-- enable inlay hints
vim.lsp.inlay_hint.enable(true)


