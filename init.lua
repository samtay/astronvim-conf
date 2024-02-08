return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "gruvbox",
  plugins = {
    {
      "nvim-neo-tree/neo-tree.nvim",
      -- the first parameter is the plugin specification
      -- the second is the table of options as set up in Lazy with the `opts` key
      config = function(plugin, opts)
        -- run the core AstroNvim configuration function with the options table
        require "plugins.configs.neo-tree"(plugin, opts)
        -- require and load extensions as necessary
        local neotree = require "neo-tree"
        neotree.follow_current_file = true
      end,
    },
  },

  default_theme = {
    highlights = {
      Comment = { italic = true },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    config = {
      clangd = { capabilities = { offsetEncoding = "utf-8" } },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            completion = {
              postfix = {
                enable = false,
              },
            },
            cargo = {
              features = { "linkedproofs" },
            },
            checkOnSave = {
              overrideCommand = {
                "cargo",
                "clippy",
                "--workspace",
                "--all-targets",
                "--features",
                "linkedproofs",
                "--tests",
                "--benches",
                "--examples",
                "--message-format=json",
              },
              allTargets = true,
            },
            rustfmt = {
              extraArgs = { "+nightly" },
            },
          },
        },
      },
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }-- Enable spell and wrap for markdown and gitcommit
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "gitcommit", "markdown" },
      callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
      end,
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown" },
      callback = function() vim.opt_local.textwidth = 80 end,
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "*" },
      callback = function()
        vim.opt.formatoptions:remove "c"
        vim.opt.formatoptions:remove "r"
        vim.opt.formatoptions:remove "o"
      end,
    })
  end,
}
