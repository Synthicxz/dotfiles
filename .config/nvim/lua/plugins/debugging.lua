return {
  -- Print-debug helper
  {
    "andrewferrier/debugprint.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },

  -- Core debugger
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",

      -- Python DAP helper
      "mfussenegger/nvim-dap-python",

      -- External tool installer + DAP bridge
      "mason-org/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Debug: Continue" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
      { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },

      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Debug: Conditional Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Debug: Continue" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Debug: Step Into" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Debug: Step Out" },
      { "<leader>dr", function() require("dap").repl.open() end, desc = "Debug: Open REPL" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Debug: Toggle UI" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Debug: Terminate" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason").setup()

      require("mason-nvim-dap").setup({
        ensure_installed = {
          "python",
        },
        automatic_installation = true,
        handlers = {},
      })

      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      local debugpy_python = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(debugpy_python)

      -- Important for Nix/dev shells:
      -- Run the debugged program with whatever `python` Neovim inherited.
      -- So: cd project -> nix develop -> nvim .
      require("dap-python").resolve_python = function()
        local python = vim.fn.exepath("python")
        if python ~= "" then
          return python
        end
        return "python"
      end

      require("dap-python").test_runner = "pytest"

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
