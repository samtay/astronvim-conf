return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "ledger/vim-ledger",
    ft = { "ledger", "journal" },
    config = function()
      vim.api.nvim_create_augroup("ledger", { clear = false })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = "ledger",
        callback = function() vim.cmd "LedgerAlignBuffer" end,
        desc = "Align on decimal point",
      })
    end,
  },
  "NoahTheDuke/vim-just",
}
