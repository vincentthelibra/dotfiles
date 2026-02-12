return {
  'barrett-ruth/live-server.nvim',
  cmd = { 'LiveServerStart', 'LiveServerStop' },
  keys = {
    { '<leader>hp', '<cmd>LiveServerStart<CR>', desc = 'Start live server' },
    { '<leader>hP', '<cmd>LiveServerStop<CR>', desc = 'Stop live server' },
  },
  config = true,
}
