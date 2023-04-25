return {
  "CRAG666/code_runner.nvim",
  event = "BufRead",
  -- dependencies = "nvim-lua/plenary.nvim",
  cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
  config = function() require "user.plugins.configs.coderunner" end,
}
