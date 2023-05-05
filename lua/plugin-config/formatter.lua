local status, formatter = pcall(require, "formatter")
if not status then
  vim.notify("没有找到 formatter")
  return
end

formatter.setup({
  filetype = {
--[[
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            -- "--config-path "
            --   .. os.getenv("XDG_CONFIG_HOME")
            --   .. "/stylua/stylua.toml",
            "-",
          },
          stdin = true,
        }
      end,
    }
    ]]--

    cpp = {
      function()
        return {
          exe = "clang-format",
          args = {
            "--config-path"
            -- "--config-path "
            --   .. os.getenv("XDG_CONFIG_HOME")
            --   .. "/stylua/stylua.toml",
          },
          stdin = true,
        }
      end,
    }
  },
})

-- format on save
vim.api.nvim_exec(
  [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.h, *.cpp, *.cc, *.hpp FormatWrite
    augroup END
]],
  true
)

