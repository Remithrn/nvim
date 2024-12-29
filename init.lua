-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shell = "powershell.exe"

-- Neo-tree setup
require("neo-tree").setup({
  window = {
    position = "right", -- Change this to "right" for the tree to appear on the right side
    width = 30, -- Set the width of the Neo-tree window
  },
})
