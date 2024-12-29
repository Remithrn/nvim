return {

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      -- Show hidden files, including .env
      view_options = {
        show_hidden = true,
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- Uncomment below if you prefer nvim-web-devicons instead of mini.icons
    -- dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function(_, opts)
      -- Setup the plugin
      require("oil").setup(opts)

      -- Keymap configuration
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
}
