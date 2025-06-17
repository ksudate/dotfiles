return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    keys = {
      {
        "dv",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd("DiffviewOpen")
          else
            vim.cmd("DiffviewClose")
          end
        end,
        desc = "Toggle Diffview window",
      },
    },
  },
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup({
        opts = {
          -- 例: ブラウザで開く場合
          action_callback = require("gitlinker.actions").open_in_browser,
          -- 例: クリップボードにコピー（デフォルト）
          -- action_callback = require("gitlinker.actions").copy_to_clipboard,
          print_url = true,
          add_current_line_on_normal_mode = true,
        },
      })
    end,
  },
  {
    "t3ntxcl3s/ecolog.nvim",
    opts = {
      vim_env = true,
      load_shell = true,
      integrations = {
        nvim_cmp = true,
        telescope = true,
      },
      shelter = {
        configuration = {
          partial_mode = true,
        },
        modules = {
          cmp = true,
          files = true,
        },
      },
    },
  },
}
