return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  {
    "gruvbox.nvim",
    opts = {
      italic = {
        comments = true,
      },
    },
  },
  { import = "astrocommunity.pack.dart" },
  {
    "akinsho/flutter-tools.nvim",
    opts = function()
      local lsp = require("astronvim.utils.lsp").config "dartls"
      lsp.settings.analysisExcludedFolders = { "/opt/flutter/bin/cache/pkg/" }
      return {
        lsp = lsp,
        debugger = { enabled = true },
      }
    end,
  },
}
