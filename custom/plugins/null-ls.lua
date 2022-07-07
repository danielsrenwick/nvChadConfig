local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

  -- eslint
  b.diagnostics.eslint_d,
  b.code_actions.eslint_d,
  b.formatting.prettier,

  -- lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,
}

local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources= sources,
    -- format on save
    on_attach = function(client, bufnr)
      vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
      vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
      vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
      vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
      vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
      vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
      vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
      vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
      vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
      vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
      vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
      vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

      if client.resolved_capabilities.document_formatting then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      end
    end,
  }
end

return M
