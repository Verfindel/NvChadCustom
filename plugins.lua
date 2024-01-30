local cmp = require "cmp"

local plugins = {
    {
        "Hoffs/omnisharp-extended-lsp.nvim",
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        },
        lazy = false,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
          {
                "nvim-telescope/telescope-live-grep-args.nvim" ,
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
                "nvim-lua/plenary.nvim",
                "debugloop/telescope-undo.nvim",
          },
        },
        config = function()
            require("telescope").load_extension("live_grep_args");
            require("telescope").load_extension("undo");
        end
    },
    {
        "tpope/vim-fugitive",
        lazy = false,
    },
    {
        "jlcrochet/vim-cs",
    },
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        opts = function ()
          return require "custom.configs.none-ls"
        end
    },
    {
        "github/copilot.vim",
        lazy = false,
    },
    {
        "zaptic/elm-vim",
        ft = "elm",
        config = function ()
          vim.g.elm_format_autosave = 1
          vim.g.syntastic_always_populate_loc_list = 1
          vim.g.syntastic_auto_loc_list = 1
          vim.g.elm_syntastic_show_warnings = 1
        end
    },
    {
        "theprimeagen/harpoon",
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
          require "plugins.configs.lspconfig"
          require "custom.configs.lspconfig"
        end
    },
    {
        "williamboman/mason.nvim",
        opts = {
          ensure_installed = {
            "rust-analyzer",
            "lua-language-server",
            "typescript-language-server",
            "eslint-lsp",
            --"prettier",
            "svelte-language-server",
            --"elm-language-server",
            "omnisharp",
          },
        },
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function ()
          return require "custom.configs.rust-tools"
        end,
        config = function(_, opts)
          require('rust-tools').setup(opts)
        end
    },
    {
        "mfussenegger/nvim-dap",
        init = function()
          require("core.utils").load_mappings("dap")
        end
    },
    {
        'saecki/crates.nvim',
        ft = {"toml"},
        config = function(_, opts)
          local crates  = require('crates')
          crates.setup(opts)
          require('cmp').setup.buffer({
            sources = { { name = "crates" }}
          })
          crates.show()
          require("core.utils").load_mappings("crates")
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function ()
          vim.g.rustfmt_autosave = 1
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        lazy = false,
        config = function(_,_)
          require("nvim-dap-virtual-text").setup()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
          local M = require "plugins.configs.cmp"
          M.completion.completeopt = "menu,menuone,noselect"
          M.mapping["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
          }
          table.insert(M.sources, {name = "crates"})
          return M
        end,
    }
}

return plugins
