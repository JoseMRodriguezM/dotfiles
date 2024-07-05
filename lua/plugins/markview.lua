return {
  "OXY2DEV/markview.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Used by the code bloxks
  },

  config = function()
    require("markview").setup({
      header = {
        {
          style = "simple",
        },
      },
      code_block = {},
      inline_code = {},

      block_quote = {},

      horizontal_rule = {},

      hyperlink = {},
      image = {},

      table = {

        table_hls = { "rainbow1" },
        use_virt_lines = false,
      },
      list_item = {
        marker_plus = {
          add_padding = false,
          marker = "•",
          marker_hl = "rainbow2",
        },
        marker_minus = {
          add_padding = false,
          marker = "•",
          marker_hl = "rainbow2",
        },
        marker_star = {
          add_padding = false,

          marker = "•",
          marker_hl = "rainbow2",
        },
      },
      checkbox = {},
      highlight_groups = {},
    })
  end,
}
