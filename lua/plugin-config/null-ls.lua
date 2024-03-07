local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls")
  return
end


-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.clang_format.with(
    {
        filetypes = { "c", "cpp", "cuda",},
        -- args = {"--assume-filename", "/home/ccx/.clang-format"}
    }
    ),
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.code_actions.gitsigns,
}



null_ls.setup({
    debug = false,
    sources = sources,
    on_attach = function(_)
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = false})")
    end,
})
