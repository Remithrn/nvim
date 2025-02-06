-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shell = "nu.exe"

-- Neo-tree setup
require("neo-tree").setup({
  window = {
    position = "right", -- Change this to "right" for the tree to appear on the right side
    width = 30, -- Set the width of the Neo-tree window
  },
})
vim.cmd.colorscheme("eldritch")

vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ff5f87", bold = true })
vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#5faf5f", bold = true })
vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#87afd7" })
