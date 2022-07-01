local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  local servers = {
    'bashls',
    'ccls',
    'clangd',
    'cmake',
    'cssls',
    'eslint',
    'html',
    'jsonls',
    'pylsp',
    'rust_analyzer',
    'sumneko_lua',
    'vimls',
    'yamlls',
  }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities
    }
  end

  -- for omnisharp
  local omnisharp_bin = "/bin/omnisharp"
  lspconfig.omnisharp.setup {
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
      on_attach = attach,
      capabilities = capabilities
  }
end

return M
