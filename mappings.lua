-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  i = {
    ["<S-Down>"] = { "<cmd>t.<cr>", desc = "" },
    ["<M-Down>"] = { "<cmd>m+<cr>", desc = "" },
    ["<S-Up>"] = { "<cmd>t -1<cr>", desc = "" },
    ["<M-Up>"] = { "<cmd>m-2<cr>", desc = "" },
    ["<C-l>"] = { "<cmd>LiveServer start<cr><cr>", desc = "" },
    ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format File" },
  },
  v = {
    ["<C-]>"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      desc = "Toggle comment line",
    },
    ["<A-j>"] = { ":m .+1<CR>==", desc = "move" },
    ["<A-k>"] = { ":m .-2<CR>==", desc = "" },
    -- ["<A-j>"] = { ":move '>+1<CR>gv-gv", desc = "" },
    ["<A-Down>"] = { ":move '>+1<CR>gv-gv", desc = "" },
    -- ["<A-k>"] = { ":move '<-2<CR>gv-gv", desc = "" },
    ["<A-Up>"] = { ":move '<-2<CR>gv-gv", desc = "" },
    ["<S-Down>"] = { ":'<,'>t'><cr>", desc = "" },
  },
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- custom mapping
    ["<C-]>"] = { function() require("Comment.api").toggle.linewise.current() end, desc = "Comment line" },
    ["<S-Down>"] = { "<cmd>t.<cr>", desc = "" },
    ["<S-Up>"] = { "<cmd>t -1<cr>", desc = "" },
    ["<M-J>"] = { "<cmd>t.<cr>", desc = "" },
    ["<M-K>"] = { "<cmd>t -1<cr>", desc = "" },
    ["<M-Down>"] = { "<cmd>m+<cr>", desc = "" },
    ["<M-Up>"] = { "<cmd>m-2<cr>", desc = "" },
    ["<M-j>"] = { "<cmd>m+<cr>", desc = "" },
    ["<M-k>"] = { "<cmd>m-2<cr>", desc = "" },
    ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format File" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    ["<leader>ns"] = {
      function() 
        require('package-info').show()
      end,
      desc = "Package info Show"
    },
    ["<leader>nd"] = {
      function() 
        require('package-info').delete()
      end,
      desc = "Package info Delete"
    }
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
