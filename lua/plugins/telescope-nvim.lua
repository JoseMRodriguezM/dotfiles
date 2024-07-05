-- Fuzzy finder
return {
  -- https://github.com/nvim-telescope/telescope.nvim
  "nvim-telescope/telescope.nvim",
  lazy = true,
  branch = "0.1.x",
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = function(plugin)
        local obj = vim.system({ "cmake", "-S.", "-Bbuild", "-DCMAKE_BUILD_TYPE=Release" }, { cwd = plugin.dir }):wait()
        if obj.code ~= 0 then
          error(obj.stderr)
        end
        obj = vim.system({ "cmake", "--build", "build", "--config", "Release" }, { cwd = plugin.dir }):wait()
        if obj.code ~= 0 then
          error(obj.stderr)
        end
        obj = vim.system({ "cmake", "--install", "build", "--prefix", "build" }, { cwd = plugin.dir }):wait()
        if obj.code ~= 0 then
          error(obj.stderr)
        end
      end,
    },
  },
  opts = {
    defaults = {
      layout_config = {
        vertical = {
          width = 0.75,
        },
      },
    },
  },
}
