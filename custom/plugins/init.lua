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

   ["jose-elias-alvarez/nvim-lsp-ts-utils"] = {
      after = "nvim-lspconfig",
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

   ["olimorris/persisted.nvim"] = {
      after = "telescope.nvim",
      config = function()
         require("persisted").setup()
         require("telescope").load_extension("persisted")
      end,
   },

   ["f-person/git-blame.nvim"] = {
      config = function()
         require "custom.plugins.git-blame"
      end,
   },

   ["sQVe/sort.nvim"] = { },

   ["cljoly/telescope-repo.nvim"] = {
      after = {
         "plenary.nvim",
         "telescope.nvim",
      },
      config = function()
         require("telescope").load_extension("repo")
      end,
   },

   ["lewis6991/spellsitter.nvim"] = {
      after = "nvim-treesitter",
      config = function()
         require("spellsitter").setup()
      end,
   },

   ["yamatsum/nvim-cursorline"] = {
      config = function()
         require "custom.plugins.cursorline"
      end,
   },

   ["vim-test/vim-test"] = {
      config = function()
         require "custom.plugins.vimtest"
      end,
   },

   ["vuki656/package-info.nvim"] = {
     requires = "MunifTanjim/nui.nvim",
     config = function()
       require('package-info').setup({
         package_manager = 'npm'
       })
     end,
   },

   ["TimUntersberger/neogit"] = {
     requires = 'nvim-lua/plenary.nvim',
     config = function()
      require('neogit').setup()
     end,
   },

   ["tanvirtin/vgit.nvim"] = {
     requires = 'nvim-lua/plenary.nvim',
     config = function()
       require('vgit').setup()
     end,
   },

   ["sindrets/diffview.nvim"] = {
     requires = 'nvim-lua/plenary.nvim',
     config = function()
       require('diffview').setup()
     end,
   },

   ["kdheepak/lazygit.nvim"] = { },
}
