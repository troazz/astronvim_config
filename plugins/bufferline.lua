return {
  "akinsho/bufferline.nvim",
  event = "BufRead",
  config = function() require "user.plugins.configs.bufferline" end,
}
