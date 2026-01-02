-- lze configuration for nixCats
-- This replaces the lazy.lua configuration
-- NOTE: colorscheme and treesitter are loaded in init.lua
-- NOTE: plugins provided by nix are already on the runtimepath

return {
  -- Neo-tree file explorer
  {
    "neo-tree.nvim",
    for_cat = "general",
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree<cr>",
        desc = "Explorer (Neo-tree)",
      },
      {
        "<leader>fe",
        "<cmd>Neotree toggle<cr>",
        desc = "Explorer (Neo-tree)",
      },
      {
        "<leader>E",
        "<cmd>Neotree reveal<cr>",
        desc = "Explorer reveal current file",
      },
    },
    after = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "",
          },
          git_status = {
            symbols = {
              added = "",
              deleted = "",
              modified = "",
              renamed = "➜",
              untracked = "★",
              ignored = "◌",
              unstaged = "✗",
              staged = "✓",
              conflict = "",
            },
          },
        },
        window = {
          position = "left",
          width = 30,
          mappings = {
            ["<space>"] = "toggle_node",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["Z"] = "expand_all_nodes",
            ["a"] = {
              "add",
              config = {
                show_path = "none",
              },
            },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy",
            ["m"] = "move",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              ".git",
              ".DS_Store",
            },
            never_show = {},
          },
          follow_current_file = {
            enabled = true,
          },
          use_libuv_file_watcher = true,
        },
        buffers = {
          follow_current_file = {
            enabled = true,
          },
        },
      })
    end,
  },

  -- Lazydev for Lua development
  {
    "folke/lazydev.nvim",
    for_cat = "general",
    event = "BufRead",
    after = function()
      require("lazydev").setup({
        library = {
          { path = (nixCats.nixCatsPath or "") .. "/lua", words = { "nixCats" } },
        },
      })
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    for_cat = "general",
    event = { "BufReadPre", "BufNewFile" },
    after = function()
      -- Your LSP configuration here
      local lspconfig = require("lspconfig")
      
      -- Lua LSP
      lspconfig.lua_ls.setup({})
      
      -- Nix LSP
      lspconfig.nil_ls.setup({})
      
      -- Python LSP
      lspconfig.pyright.setup({})
    end,
  },

  -- Blink completion
  {
    "saghen/blink.cmp",
    for_cat = "general",
    event = "InsertEnter",
    after = function()
      require("blink-cmp").setup({
        -- Your completion configuration
      })
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    for_cat = "general",
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    },
    after = function()
      require("telescope").setup({})
      -- telescope-fzf-native is already loaded by nix
      pcall(require("telescope").load_extension, "fzf")
    end,
  },

  -- Which-key
  {
    "folke/which-key.nvim",
    for_cat = "general",
    event = "DeferredUIEnter",
    after = function()
      require("which-key").setup({})
    end,
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    for_cat = "general",
    event = { "BufReadPre", "BufNewFile" },
    after = function()
      require("gitsigns").setup({})
    end,
  },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    for_cat = "general",
    event = "DeferredUIEnter",
    after = function()
      require("lualine").setup({})
    end,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    for_cat = "general",
    event = "DeferredUIEnter",
    after = function()
      require("bufferline").setup({})
    end,
  },

  -- Mini plugins
  {
    "echasnovski/mini.ai",
    for_cat = "general",
    event = "DeferredUIEnter",
    after = function()
      require("mini.ai").setup({})
    end,
  },

  {
    "echasnovski/mini.pairs",
    for_cat = "general",
    event = "InsertEnter",
    after = function()
      require("mini.pairs").setup({})
    end,
  },

  {
    "echasnovski/mini.icons",
    for_cat = "general",
    event = "DeferredUIEnter",
    after = function()
      require("mini.icons").setup({})
    end,
  },

  -- Conform for formatting
  {
    "stevearc/conform.nvim",
    for_cat = "general",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    after = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          nix = { "nixpkgs-fmt" },
        },
      })
    end,
  },

  -- Lint
  {
    "mfussenegger/nvim-lint",
    for_cat = "general",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Snacks
  {
    "folke/snacks.nvim",
    for_cat = "general",
    event = "DeferredUIEnter",
    after = function()
      require("snacks").setup({
        input = {},
        picker = {},
        terminal = {},
      })
    end,
  },

  -- Noice
  {
    "folke/noice.nvim",
    for_cat = "general",
    event = "DeferredUIEnter",
    after = function()
      require("noice").setup({})
    end,
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    for_cat = "general",
    cmd = { "Trouble" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    },
    after = function()
      require("trouble").setup({})
    end,
  },

  -- Todo Comments
  {
    "folke/todo-comments.nvim",
    for_cat = "general",
    event = { "BufReadPost", "BufNewFile" },
    after = function()
      require("todo-comments").setup({})
    end,
  },

  -- Flash
  {
    "folke/flash.nvim",
    for_cat = "general",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
    after = function()
      require("flash").setup({})
    end,
  },

  -- Vim Illuminate
  {
    "RRethy/vim-illuminate",
    for_cat = "general",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Persistence
  {
    "folke/persistence.nvim",
    for_cat = "general",
    event = "BufReadPre",
    after = function()
      require("persistence").setup({})
    end,
  },

  -- TS Comments
  {
    "folke/ts-comments.nvim",
    for_cat = "general",
    event = "DeferredUIEnter",
    after = function()
      require("ts-comments").setup({})
    end,
  },

  -- TS Autotag
  {
    "windwp/nvim-ts-autotag",
    for_cat = "general",
    event = "InsertEnter",
    after = function()
      require("nvim-ts-autotag").setup({})
    end,
  },

  -- Grug Far (find and replace)
  {
    "MagicDuck/grug-far.nvim",
    for_cat = "general",
    cmd = "GrugFar",
    after = function()
      require("grug-far").setup({})
    end,
  },

  -- Opencode
  {
    "NickvanDyke/opencode.nvim",
    for_cat = "general",
    event = "DeferredUIEnter",
    after = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {}

      vim.o.autoread = true

      vim.keymap.set({ "n", "x" }, "<C-a>", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask opencode" })
      vim.keymap.set({ "n", "x" }, "<C-x>", function()
        require("opencode").select()
      end, { desc = "Execute opencode action…" })
      vim.keymap.set({ "n", "x" }, "ga", function()
        require("opencode").prompt("@this")
      end, { desc = "Add to opencode" })
      vim.keymap.set({ "n", "t" }, "<C-.>", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })
      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "opencode half page up" })
      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "opencode half page down" })
      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
    end,
  },

  -- Quarto
  {
    "quarto-dev/quarto-nvim",
    for_cat = "general",
    ft = { "quarto", "qmd" },
    after = function()
      require("quarto").setup({})
    end,
  },

  {
    "jmbuhr/otter.nvim",
    for_cat = "general",
    ft = { "quarto", "qmd" },
  },

  {
    "GCBallesteros/jupytext.nvim",
    for_cat = "general",
    ft = { "ipynb" },
    after = function()
      require("jupytext").setup({
        custom_language_formatting = {
          python = {
            extension = "qmd",
            style = "quarto",
            force_ft = "quarto",
          },
          r = {
            extension = "qmd",
            style = "quarto",
            force_ft = "quarto",
          },
        },
      })
    end,
  },

  -- Render Markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    for_cat = "general",
    ft = { "markdown", "norg", "rmd", "org", "codecompanion", "quarto", "qmd" },
    after = function()
      require("render-markdown").setup({
        win_options = {
          conceallevel = {
            default = 0,
            rendered = 0,
          },
        },
        code = {
          enabled = true,
          conceal_delimiters = false,
          language_icon = true,
          language_name = true,
          width = "full",
        },
      })
    end,
  },

  -- Topiary
  {
    "tweag/topiary",
    for_cat = "general",
    cmd = { "Topiary" },
  },
}
