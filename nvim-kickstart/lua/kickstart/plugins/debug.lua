-- debug.lua
-- Go + Python debugging (Windows-aware for debugpy path)

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
  },
  keys = {
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>dB',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: Toggle DAP UI',
    },
    {
      '<F6>',
      function()
        require('dap').terminate()
      end,
      desc = 'Debug: Stop/Terminate',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'delve', -- Go
        'python', -- Python (debugpy)
      },
    }

    -- UI
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }
    vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '🟡', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '🚫', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '▶️', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '📝', texthl = 'DapLogPoint', linehl = '', numhl = '' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Go (Windows must attach; already handled)
    require('dap-go').setup {
      delve = { detached = vim.fn.has 'win32' == 0 },
    }

    -- --- Python (Windows-aware debugpy path) ---
    local function mason_debugpy_python()
      local base = vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/'
      if vim.fn.has 'win32' == 1 then
        return base .. 'Scripts/python.exe'
      else
        return base .. 'bin/python'
      end
    end

    -- Use Mason's debugpy; dap-python will still honor an activated venv/conda for the target app
    local dap_py = require 'dap-python'
    dap_py.setup(mason_debugpy_python())

    -- Optional but handy:
    dap_py.test_runner = 'pytest' -- run tests via pytest for :lua require('dap-python').test_*
    -- Uncomment to always use external console on Windows
    -- require('dap').configurations.python = {
    --   { type = 'python', request = 'launch', name = 'Launch file', program = '${file}', console = 'integratedTerminal' },
    -- }
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        pythonPath = function()
          -- This will use the active virtual environment's Python
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return vim.fn.exepath 'python' -- Falls back to system/activated Python
          end
        end,
      },
    }
  end,
}
