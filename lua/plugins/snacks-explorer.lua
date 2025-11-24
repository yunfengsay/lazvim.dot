local Util = require("lazyvim.util")

local function snacks_explorer(scope)
  return function()
    local cwd = scope == "root" and Util.root() or vim.fn.getcwd()
    require("snacks").explorer({
      preset = "neo-tree",
      cwd = cwd,
      sources = { "filesystem", "git_status", "buffers" },
    })
  end
end

return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.explorer = vim.tbl_deep_extend("force", {
        replace_netrw = false,
        layout = { preset = "neo-tree" },
        filtered = {
          ignore = true,
          git_status = { show = { "A", "M", "?" } },
        },
      }, opts.explorer or {})
    end,
    keys = {
      { "<leader>e", snacks_explorer("cwd"), desc = "Snacks Explorer (cwd)" },
      { "<leader>E", snacks_explorer("root"), desc = "Snacks Explorer (root dir)" },
      { "<leader>fe", snacks_explorer("root"), desc = "Snacks Explorer (root dir)" },
      { "<leader>fE", snacks_explorer("cwd"), desc = "Snacks Explorer (cwd)" },
    },
  },
}
