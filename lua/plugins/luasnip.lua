return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" }, -- Optional, for additional snippets
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load() -- Load VS Code-style snippets
  end,
}
