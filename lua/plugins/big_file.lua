return {
  {
    "folke/snacks.nvim",
    --@type snacks.Config  -- This is a Lua type hint (optional, but good practice)
    opts = {
      bigfile = {
        notify = true,
        size = 1.5 * 1024 * 1024, -- 1.5MB
        line_length = 1000,
        setup = function(ctx)
          if vim.fn.exists(":NoMatchParen") ~= 0 then
            vim.cmd([[NoMatchParen]])
          end
          Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
          vim.b.minianimate_disable = true
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(ctx.buf) then
              vim.bo[ctx.buf].syntax = ctx.ft
            end
          end)
        end,
      },
      -- ... other Snacks options here ...
    },
    -- If you want to run setup AFTER all other plugins have loaded
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          require("snacks").setup({
            bigfile = {
              notify = true,
              size = 1.5 * 1024 * 1024, -- 1.5MB
              line_length = 1000,
              setup = function(ctx)
                if vim.fn.exists(":NoMatchParen") ~= 0 then
                  vim.cmd([[NoMatchParen]])
                end
                Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
                vim.b.minianimate_disable = true
                vim.schedule(function()
                  if vim.api.nvim_buf_is_valid(ctx.buf) then
                    vim.bo[ctx.buf].syntax = ctx.ft
                  end
                end)
              end,
            },
            -- ... other Snacks options here ...
          })
        end,
      })
    end,
  },
}
