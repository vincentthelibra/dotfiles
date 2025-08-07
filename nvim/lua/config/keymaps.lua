-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("i", "tn", "<Esc>", { noremap = false })

vim.keymap.set("n", "<leader>cf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format Document" })

vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
