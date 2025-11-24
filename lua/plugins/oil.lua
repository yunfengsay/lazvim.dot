return {
  {
    "stevearc/oil.nvim",
    cmd = { "Oil" },
    keys = {
      {
        "<leader>fo",
        function()
          require("oil").open_float()
        end,
        desc = "Oil 文件管理 (浮窗)",
      },
      {
        "-",
        function()
          require("oil").open_float(vim.fn.expand("%:p:h"))
        end,
        desc = "Oil 打开当前文件夹",
      },
    },
    opts = {
      default_file_explorer = false,
      columns = { "icon" },
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
    },
  },
}
