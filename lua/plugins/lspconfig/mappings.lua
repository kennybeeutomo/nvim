local set = vim.keymap.set

set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to declaration" })
set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
set("n", "gr", vim.lsp.buf.rename, { desc = "LSP: Refactor" })
set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature help" })
set("n", "<C-j>", vim.diagnostic.open_float, { desc = "LSP: Open Diagnostics" })
