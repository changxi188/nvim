-- 基础配置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer插件管理
require("plugins")
-- 主题设置
require("colorscheme")
-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.comment")

-- debugger
require("dap.vimspector") --lua/dap/vimspector/iniit.lua

-- 内置LSP
-- require("lsp.setup")
-- require("lsp.cmp")


-- 自动命令
-- require("autocmds")
-- require("plugin-config.project")
-- require("plugin-config.dashboard")
-- require("plugin-config.toggleterm")
-- require("plugin-config.surround")
-- require("plugin-config.nvim-autopairs")
-- require("plugin-config.fidget")
-- require("lsp.ui")
-- -- 格式化
-- -- require("lsp.formatter")
-- require("lsp.null-ls")
-- -- DAP
-- require("dap.nvim-dap")
-- -- utils
-- -- 复制到windows剪贴板
-- require('utils.fix-yank')