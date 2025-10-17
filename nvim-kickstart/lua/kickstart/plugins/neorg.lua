return {
  'nvim-neorg/neorg',
  run = ':Neorg sync-parsers',
  lazy = false,
  version = '*',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {
          config = {
            folds = {
              foldlevelstart = 99,
            },
            -- Hide the @code and @end markers
            code_blocks = {
              conceal = true, -- Hides the @code/@end tags
            },
            -- Control background dimming behavior
            dim_code_blocks = {
              enabled = true, -- Enable code block background
              width = 'fullwidth', -- Options: "fullwidth" or "content"
              padding = {
                top = 1,
                bottom = 1,
              },
            },
          },
        },
        ['core.dirman'] = {
          config = {
            workspaces = {
              work = '~/notes/work',
              home = '~/notes/home',
            },
            default_workspace = 'work',
          },
        },
      },
    }

    vim.opt.conceallevel = 2
  end,
}
