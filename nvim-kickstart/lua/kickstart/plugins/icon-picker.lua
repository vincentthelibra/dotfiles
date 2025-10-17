return {
  'ziontee113/icon-picker.nvim',
  config = function()
    require('icon-picker').setup { disable_legacy_commands = true }

    -- Optional: add a keybinding
    vim.keymap.set('i', '<C-i>', '<cmd>IconPickerInsert<cr>', { desc = 'Insert icon' })
  end,
}
