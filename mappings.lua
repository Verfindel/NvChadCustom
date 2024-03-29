local M = {}

M.disabled = {
  n = {
    ["<C-u>"] = "",
    ["<C-d>"] = "",
    ["<C-f>"] = "",
    ["n"] = "",
    ["N"] = "",
    ["<leader>fw"] = "",
  }
}

M.Telescope = {
  n = {
    ["<leader>fw"] = {
      function ()
        require('telescope').extensions.live_grep_args.live_grep_args()
      end,
      "Live grep args",
    },
  }
}

M.myNav = {
  n = {
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = {"<C-d>zz"},
    ["n"] = {"nzzzv"},
    ["N"] = {"Nzzzv"},
    ["<C-f>"] = {":/<C-r><C-w>", "Search for word / symbols under cursor"},
    ["<leader>fr"] = {":%s/<C-r><C-w>/<C-r><C-w>", "Replace text under cursor"},
  },
  v = {
    ["J"] = {":m '>+1<CR>gv=gv", "Move selected line / block of text in visual mode down"},
    ["K"] = {":m '<-2<CR>gv=gv", "Move selected line / block of text in visual mode up"},
  }
}
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv");
-- 	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv");
M.harpoon = {
  n = {
    ["<leader>ha"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "󱡁 Harpoon Add file",
    },
    ["<leader>ta"] = { "<CMD>Telescope harpoon marks<CR>", "󱡀 Toggle quick menu" },
    ["<leader>hb"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "󱠿 Harpoon Menu",
    },
    ["<leader>1"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "󱪼 Navigate to file 1",
    },
    ["<leader>2"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "󱪽 Navigate to file 2",
    },
    ["<leader>3"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "󱪾 Navigate to file 3",
    },
    ["<leader>4"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "󱪿 Navigate to file 4",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

return M
