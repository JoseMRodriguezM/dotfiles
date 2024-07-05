return {
  "jbyuki/nabla.nvim",
  lazy = false,
  enabled = true,
  keys = {
    {
      "<leader>eq",
      function()
        require("nabla").popup()
      end,
      desc = "toggle nabla",
    },
    {
      "<leader>tn",
      function()
        require("nabla").toggle_virt()
      end,
      desc = "toggle nabla",
    },
  },
}
