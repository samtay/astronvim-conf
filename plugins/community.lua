return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  {
    -- TODO at some point make this consistent with 'yarn lint'
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.handlers.eslint_d = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.diagnostics.eslint_d.with {
          condition = function(util) return false end,
        })
      end
    end,
  },
}
