return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
        presets = {
          inc_rename = true,
        },
      })
    end,
  },
  {
    "akinsho/nvim-bufferline.lua",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = { options = { separator_style = "slope" } },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local icons = LazyVim.config.icons
      return {
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { LazyVim.lualine.pretty_path() },
          },
          lualine_x = {
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = { "encoding" },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
      }
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
      ██╗      ███╗   ██╗██╗   ██╗██╗███╗   ███╗
      ╚██╗     ████╗  ██║██║   ██║██║████╗ ████║
       ╚██╗    ██╔██╗ ██║██║   ██║██║██╔████╔██║
       ██╔╝    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
      ██╔╝     ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
      ╚═╝      ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
   ]],
        },
      },
    },
  },
}
