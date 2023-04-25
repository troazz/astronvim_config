local status_ok, alpha = pcall(require, "alpha")
if not status_ok then return end

local board = {
  "  ___  _____  ____  ____    ____  _____  ____    __    ____  _  _  ____ ",
  " / __)(  _  )(  _ \( ___)  ( ___)(  _  )(  _ \  (  )  (_  _)( \/ )( ___)",
  "( (__  )(_)(  )(_) ))__)    )__)  )(_)(  )   /   )(__  _)(_  \  /  )__) ",
  " \___)(_____)(____/(____)  (__)  (_____)(_)\_)  (____)(____)  \/  (____)",
}

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = board
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
  dashboard.button("z", "鈴 Lazy", ":Lazy<CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.config.layout[1].val = vim.fn.max { 1, vim.fn.floor(vim.fn.winheight(0) * 0.0) }
dashboard.config.layout[3].val = 1
dashboard.config.opts.noautocmd = true

local function footer()
  local footer_text = "MikkaLab"
  return footer_text
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

