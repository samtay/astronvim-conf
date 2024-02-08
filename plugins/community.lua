return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.completion.copilot-lua" },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-CR>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      },
    },
  },
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
