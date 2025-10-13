-- Auto-open neo-tree when opening a directory
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function(data)
    local directory = vim.fn.isdirectory(data.file) == 1

    if directory then
      vim.cmd.cd(data.file)
      require('neo-tree.command').execute { toggle = false }
    end
  end,
})
