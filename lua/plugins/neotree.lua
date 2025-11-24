return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.enable_diagnostics = false
      opts.git_status_async_options = vim.tbl_deep_extend("force", opts.git_status_async_options or {}, {
        batch_size = 500,
        batch_delay = 5,
        max_lines = 4000,
      })

      opts.filesystem = vim.tbl_deep_extend("force", opts.filesystem or {}, {
        bind_to_cwd = false,
        follow_current_file = { enabled = true, leave_dirs_open = false },
        group_empty_dirs = true,
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = { ".git", "node_modules", ".next", "dist", "build", "coverage" },
          never_show = { ".DS_Store", "thumbs.db" },
        },
      })

      opts.window = vim.tbl_deep_extend("force", opts.window or {}, {
        width = 32,
      })
    end,
  },
}
