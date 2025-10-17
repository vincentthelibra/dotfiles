return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      require('mini.icons').setup {
        style = 'glyph',
        filetype = {
          norg = { glyph = '󰎞', hl = 'MiniIconsYellow' },
        },
        extension = {
          norg = { glyph = '󰎞', hl = 'MiniIconsYellow' },
        },
      }

      require('mini.files').setup {
        options = {
          use_as_default_explorer = false,
          mappings = {
            close = 'q',
            go_in = 'l', -- or '<Right>'
            go_in_plus = '<CR>',
            go_out = 'h', -- or '<Left>'
            go_out_plus = 'H',
            reset = '<BS>',
            reveal_cwd = '.',
            show_help = 'g?',
            synchronize = 's', -- Changed from '=' to 's'
            trim_left = '<',
            trim_right = '>',
          },
        },
      }

      require('mini.splitjoin').setup()

      require('mini.tabline').setup()

      --- Keymaps section ---
      vim.keymap.set('n', '<leader>fm', function()
        require('mini.files').open()
      end, { desc = 'Open mini.files explorer' })

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
