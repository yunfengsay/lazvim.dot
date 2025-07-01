-- Disable animations and smooth effects
return {
  -- Disable noice animations
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        command_palette = false,
      },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
          },
        },
      },
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
          opts = { skip = true },
        },
      },
    },
  },

  -- Disable snacks animations and notifications
  {
    "folke/snacks.nvim",
    opts = {
      animate = { enabled = false },
      scroll = { enabled = false },
      indent = { animate = { enabled = false } },
      notifier = { enabled = false },
    },
  },
}
