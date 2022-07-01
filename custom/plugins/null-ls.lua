local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

  -- eslint
  b.formatting.eslint,
  b.diagnostics.eslint.with {
    "javascript", "javascriptreact"
  },

  -- webdev stuff
  b.formatting.prettierd.with {
    filetypes = { "html", "json", "yaml", "markdown", "css" }
  },
  b.formatting.deno_fmt,

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
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      end
    end,
  }
end

return M
