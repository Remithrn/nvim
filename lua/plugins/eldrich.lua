return {
  {
    "eldritch-theme/eldritch.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      vim.cmd("colorscheme eldritch")
    end,
  },

  -- Configure LazyVim to use Eldritch as the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "eldritch",
    },
  },
}
