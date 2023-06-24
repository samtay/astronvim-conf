-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    ---------------------- files/find ----------------------
    ["<leader>ft"] = {
      function()
        require("neo-tree.command").execute {
          toggle = true,
          reveal_force_cwd = true,
        }
      end,
      desc = "Toggle File Tree",
    },
    ["<leader>fT"] = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end,
      desc = "Toggle File Tree Focus",
    },
    ["<leader>fr"] = {
      function() require("telescope.builtin").oldfiles() end,
      desc = "Find recent files",
    },
    ["<leader>fg"] = {
      function() require("telescope.builtin").git_files() end,
      desc = "Find files tracked in git",
    },
    ["<leader>fs"] = {
      function() require("telescope.builtin").lsp_document_symbols() end,
      desc = "Find symbols",
    },
    ---------------------- lsp ----------------------
    ["gr"] = {
      function() require("telescope.builtin").lsp_references() end,
      desc = "References of current word",
    },
    ["gi"] = {
      function() require("telescope.builtin").lsp_implementations() end,
      desc = "Implementations of current word",
    },
    ["gt"] = {
      function() require("telescope.builtin").lsp_type_definitions() end,
      desc = "Type definition of current word",
    },
    ["gd"] = {
      function() require("telescope.builtin").lsp_definitions() end,
      desc = "Definition of current word",
    },
    ["gS"] = {
      function() require("telescope.builtin").lsp_document_symbols() end,
      desc = "Find symbols",
    },
    ["gs"] = {
      function() require("aerial").toggle() end,
      desc = "Symbols outline",
    },
    ["ga"] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP code action",
    },
    ---------------------- errors ----------------------
    ["<leader>e"] = { false, desc = " Errors" },
    ["<leader>ee"] = {
      function() require("telescope.builtin").diagnostics() end,
      desc = "View and search errors",
    },
    ["<leader>ek"] = {
      function() vim.diagnostic.goto_prev() end,
      desc = "Previous error",
    },
    ["<leader>ej"] = {
      function() vim.diagnostic.goto_next() end,
      desc = "Next error",
    },
    ["<leader>eo"] = {
      function() vim.diagnostic.open_float() end,
      desc = "Open error in hover window",
    },
    ---------------------- dotfiles ----------------------
    ["<leader>."] = { false, desc = " Dotfiles" },
    ["<leader>.n"] = {
      "<cmd>sp ~/.config/nvim/<cr>",
      desc = "Open AstroNvim directory",
    },
    ["<leader>.a"] = {
      "<cmd>sp ~/.config/astronvim/lua/user/<cr>",
      desc = "Open AstroNvim user directory",
    },
    ["<leader>.r"] = {
      "<cmd>AstroReload<cr>",
      desc = "Reload AstroNvim",
    },
    ["<leader>.k"] = {
      "<cmd>sp ~/.config/kitty/kitty.conf<cr>",
      desc = "Open kitty config",
    },
    ["<leader>.x"] = {
      "<cmd>sp ~/.config/xmonad/xmonad.hs<cr>",
      desc = "Open xmonad config",
    },
    ---------------------- rust  ----------------------
    ["<leader>r"] = { false, desc = " Rust" },
    ["<leader>rr"] = { "<cmd>RustRunnables<cr>", desc = "Find runnable" },
    ["<leader>rD"] = { "<cmd>RustDebuggables<cr>", desc = "Find debuggable" },
    ["<leader>rd"] = { "<cmd>RustOpenExternalDocs<cr>", desc = "Open in docs.rs" },
    ["<leader>rm"] = { "<cmd>RustExpandMacro<cr>", desc = "Expand macro" },
    ["<leader>rc"] = { "<cmd>RustOpenCargo<cr>", desc = "Open Cargo.toml" },
    ["<leader>rp"] = { "<cmd>RustParentModule<cr>", desc = "Go to parent module" },
    ---------------------- mobile dev ----------------------
    -- would be nice to gate these on presence of flutter
    ["<leader>m"] = { false, desc = " Mobile Development" },
    ["<leader>mm"] = {
      function() require("telescope").extensions.flutter.commands() end,
      desc = "Find flutter commands",
    },
    ["<leader>mr"] = {
      "<cmd>FlutterReload<cr>",
      desc = "Reload Flutter project",
    },
    ["<leader>mx"] = {
      "<cmd>FlutterRun<cr>",
      desc = "Run Flutter project",
    },
    ["<leader>md"] = {
      "<cmd>FlutterDevices<cr>",
      desc = "Choose a device",
    },
    ["<leader>mq"] = {
      "<cmd>FlutterQuit<cr>",
      desc = "End Flutter session",
    },
    ---------------------- theme/ui ----------------------
    ["<leader>uT"] = {
      function() require("telescope.builtin").colorscheme { enable_preview = true } end,
      desc = "Pick themes",
    },
    ["<leader><leader>"] = {
      function() require("notify").dismiss { silent = true } end,
      desc = "Dismiss notifications",
    },
    ["<leader>un"] = {
      require("astronvim.utils.ui").toggle_ui_notifications,
      desc = "Toggle notifications",
    },
    ["<leader>uN"] = {
      require("astronvim.utils.ui").change_number,
      desc = "Change line numbering",
    },
    ---------------------- windows ----------------------
    ["<leader>w"] = { false, desc = "󰖮 Windows" },
    ["<leader>w/"] = { "<cmd>vsplit<cr>", desc = "Vertical Split (or use '|')" },
    ["<leader>w-"] = { "<cmd>split<cr>", desc = "Horizontal Split (or use '\\')" },
    ["<leader>w="] = { "<C-w>=", desc = "Resize windows equally" },
    ["<leader>wc"] = { "<cmd>q<cr>", desc = "Close window (or use <spc>q)" },
    ["<leader>wd"] = { "<cmd>q<cr>", desc = "Close window (or use <spc>q)" },
    ["<leader>w<cr>"] = { "<C-w>o", desc = "Close other windows" },
    -- ["<leader>wh"] = { "<C-w>h", desc = "Move to left split" },
    ["<leader>wh"] = { function() require("smart-splits").move_cursor_left() end, desc = "Focus left split" },
    ["<leader>wj"] = { function() require("smart-splits").move_cursor_down() end, desc = "Focus below split" },
    ["<leader>wk"] = { function() require("smart-splits").move_cursor_up() end, desc = "Focus above split" },
    ["<leader>wl"] = { function() require("smart-splits").move_cursor_right() end, desc = "Focus right split" },
    ["<leader>wH"] = { function() require("smart-splits").swap_buf_left() end, desc = "Move buf to left split" },
    ["<leader>wJ"] = { function() require("smart-splits").swap_buf_down() end, desc = "Move buf to below split" },
    ["<leader>wK"] = { function() require("smart-splits").swap_buf_up() end, desc = "Move buf to above split" },
    ["<leader>wL"] = { function() require("smart-splits").swap_buf_right() end, desc = "Move buf to right split" },
    ---------------------- buffers ----------------------
    ["<leader><tab>"] = { "<C-^>", desc = "Previous buffer" },
    ["<leader>bc"] = { "<cmd>bdelete<cr>", desc = "Close buffer (or use <spc>c)" },
    ["<leader>bd"] = { "<cmd>bdelete<cr>", desc = "Close buffer (or use <spc>c)" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ---------------------- utils ----------------------
    ["<leader>?"] = { function() require("telescope.builtin").keymaps() end, desc = "Keymaps" },
    ["<leader>/"] = { function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
    ["<leader>;"] = {
      function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Toggle comment line",
    },
    ["<leader>s"] = { "<cmd>w<cr>", desc = "Save buffer" },
    ["<leader>S"] = { "<cmd>wa<cr>", desc = "Save all buffers" },
    ["<C-s>"] = { "<cmd>w !sudo tee > /dev/null %<cr>", desc = "Force save" },
    ["<cr>"] = { "o<esc>k", desc = "Insert line below" },
    ["<s-cr>"] = { "O<esc>j", desc = "Insert line above" },
    ["<leader>pr"] = { "<cmd>AstroReload<cr>", desc = "Reload AstroNvim" },
    -- setting a mapping to false will disable it
    ["<leader>o"] = false,
    ["gy"] = { '"+y', desc = "Copy to system clipboard" },
    ["gp"] = { '"+p', desc = "Paste from system clipboard" },
    ["gP"] = { '"+P', desc = "Paste from system clipboard" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["<leader>;"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      desc = "Toggle comment for selection",
    },
    ["<leader>/"] = {
      "\"zy<cmd>exec 'Telescope grep_string default_text=' . escape(@z, ' ')<cr>",
      desc = "Live grep selection",
    },
    ["gy"] = { '"+y', desc = "Copy to system clipboard" },
    ["gp"] = { '"+p', desc = "Paste from system clipboard" },
    ["gP"] = { '"+P', desc = "Paste from system clipboard" },
  },
  -- c = {
  --   ["w!!"] = { "w !sudo tee > /dev/null %" },
  -- },
}
