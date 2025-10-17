return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = {
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
    cmdline = {
      enabled = true,
      view = 'cmdline_popup',
      opts = {},
      format = {
        cmdline = { pattern = '^:', icon = ':', lang = 'vim' },
        search_down = { kind = 'search', pattern = '^/', icon = '/', lang = 'regex' },
        search_up = { kind = 'search', pattern = '^%?', icon = '?', lang = 'regex' },
        filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
        lua = { pattern = '^:%s*lua%s+', icon = '󰢱', lang = 'lua' },
        help = { pattern = '^:%s*he?l?p?%s+', icon = '?' },
        input = {},
      },
    },
    messages = {
      enabled = true,
      view = 'notify',
      view_error = 'notify',
      view_warn = 'notify',
      view_history = 'messages',
      view_search = 'virtualtext',
    },
    popupmenu = {
      enabled = true,
      backend = 'nui',
      kind_icons = true,
    },
    redirect = {
      view = 'split',
      filter = { event = 'msg_show' },
    },
    history = {
      view = 'split',
      opts = { enter = true, format = 'details' },
      filter = {
        any = {
          { event = 'notify' },
          { error = true },
          { warning = true },
          { event = 'msg_show', kind = { '' } },
          { event = 'lsp', kind = 'message' },
        },
      },
    },
    notify = {
      enabled = true,
      view = 'notify',
    },
    status = {},
    format = {},
  },
}
