return {
  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      local present, autotag = pcall(require, "nvim-ts-autotag")

      if present then
        autotag.setup()
      end
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },

  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  ["nvim-neorg/neorg"] = {
    ft = "neorg",
    after = "nvim-treesitter",
    config = function()
      require "custom.plugins.neorg"
    end,
  },

  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  ["andreadev-it/shade.nvim"] = {
    module = "shade",
    config = function()
      require("shade").setup {
        overlay_opacity = 50,
        opacity_step = 1,
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  ["hrsh7th/cmp-cmdline"] = {
    after = "cmp-nvim-lsp",
    config = function()
      require'cmp'.setup.cmdline(':', {
        sources = {
          { name = 'cmdline' }
        }
      })
    end,
  },

  ["hrsh7th/cmp-buffer"] = {
    after = "cmp-nvim-lsp",
    config = function()
      require'cmp'.setup.cmdline(':', {
        sources = {
          { name = 'cmdline' }
        }
      })
      require'cmp'.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })
    end
  },

  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "media_files"
    end,
   },
}
