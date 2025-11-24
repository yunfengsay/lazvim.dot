local terminals = {}

local function toggle_term(opts)
  return function()
    local key = string.format("%s:%s:%s", opts.cmd or "shell", opts.direction or "float", opts.count or 0)
    local Terminal = require("toggleterm.terminal").Terminal
    local term = terminals[key]
    if not term then
      term = Terminal:new(opts)
      terminals[key] = term
    end
    term:toggle()
  end
end

return {
  -- 关闭 LazyVim 默认的 telescope 键位，避免与 fzf-lua 冲突
  {
    "nvim-telescope/telescope.nvim",
    keys = function()
      return {}
    end,
  },

  -- 更接近 LunarVim 手感的快速检索体验
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    opts = function()
      return {
        winopts = {
          width = 0.9,
          height = 0.85,
          preview = {
            layout = "vertical",
            vertical = "down:50%",
          },
        },
        files = {
          fd_opts = [[--color=never --type f --hidden --follow --exclude .git]],
        },
        grep = {
          rg_opts = [[--hidden --column --line-number --no-heading --color=always --smart-case --max-filesize 2M]],
        },
      }
    end,
    keys = {
      { "<leader>ff", function() require("fzf-lua").files() end, desc = "查找文件 (fzf)" },
      { "<leader>fg", function() require("fzf-lua").live_grep_native() end, desc = "全局搜索 (rg)" },
      { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "缓冲区列表" },
      { "<leader>fh", function() require("fzf-lua").help_tags() end, desc = "帮助文档" },
      { "<leader>fr", function() require("fzf-lua").oldfiles() end, desc = "最近文件" },
      { "<leader>fs", function() require("fzf-lua").lsp_document_symbols() end, desc = "当前文件符号" },
      { "<leader>fS", function() require("fzf-lua").lsp_live_workspace_symbols() end, desc = "工作区符号" },
    },
  },

  -- 终端管理对齐 LunarVim 的常用操作
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      persist_mode = false,
      direction = "float",
      shade_terminals = false,
      float_opts = { border = "rounded" },
    },
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<cr>", mode = { "n", "t" }, desc = "切换浮动终端" },
      { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "浮动终端" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "水平终端" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "垂直终端" },
      {
        "<M-1>",
        toggle_term({ count = 1, direction = "horizontal" }),
        mode = { "n", "t" },
        desc = "终端1(水平)",
      },
      {
        "<M-2>",
        toggle_term({ count = 2, direction = "vertical", size = 80 }),
        mode = { "n", "t" },
        desc = "终端2(垂直)",
      },
      {
        "<M-3>",
        toggle_term({ count = 3, direction = "float" }),
        mode = { "n", "t" },
        desc = "终端3(浮动)",
      },
    },
  },
}
