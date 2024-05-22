local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local none_ls = require("null-ls")

local opts = {
  sources = {
    --none_ls.builtins.code_actions.eslint,
    --none_ls.builtins.diagnostics.eslint,
    none_ls.builtins.formatting.prettier,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

return opts
