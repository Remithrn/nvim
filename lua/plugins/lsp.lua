return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "VenvSelect", "VenvSelectCached" }, -- Loads only when these commands are used
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Virtual Environment" },
    { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached Virtual Environment" },
  },
  config = function()
    require("venv-selector").setup({
      -- Uncomment and set options if needed
      -- name = "venv",
      -- auto_refresh = false,
    })
  end,
}
