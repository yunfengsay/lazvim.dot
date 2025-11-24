return {
  {
    "nvim-mini/mini.nvim",
    opts = {
      files = {
        mappings = {
          go_in = "l",
          go_out = "h",
          synchronize = "s",
          trim_left = "<",
          trim_right = ">",
        },
        options = {
          use_as_default_explorer = false,
          permanent_delete = false,
        },
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts.files)
    end,
    keys = {
      {
        "<leader>fm",
        function()
          local mf = require("mini.files")
          mf.open(vim.api.nvim_buf_get_name(0), true)
          mf.reveal_cwd()
        end,
        desc = "Mini Files (buffer dir)",
      },
      {
        "<leader>fM",
        function()
          local mf = require("mini.files")
          mf.open(vim.loop.cwd(), true)
          mf.reveal_cwd()
        end,
        desc = "Mini Files (cwd)",
      },
    },
  },
}
