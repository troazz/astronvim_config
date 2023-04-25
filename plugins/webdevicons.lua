return {
  "nvim-tree/nvim-web-devicons",
  event = "BufRead",
  config = function() require "user.plugins.configs.webdevicons" end,
}
