return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" },
  },
  build = "make tiktoken",
  config = function()
    local chat = require("CopilotChat")
    local select = require("CopilotChat.select")
    
    chat.setup({
      window = {
        layout = "float",
        width = 0.8,
        height = 0.6,
      },
    })

    -- Generate commit message, copy it, and open lazygit
    vim.keymap.set("n", "<leader>cm", function()
      -- Get git root directory
      local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      if vim.v.shell_error ~= 0 then
        vim.notify("Not in a git repository", vim.log.levels.ERROR)
        return
      end
      
      -- Change to git root and get staged diff
      local staged_diff = vim.fn.system("cd " .. git_root .. " && git diff --cached")
      
      if staged_diff == "" or staged_diff:match("^fatal:") then
        vim.notify("No staged changes found. Use 'git add' first.", vm.log.levels.WARN)
        return
      end
      
      -- Reset chat to clear previous messages
      chat.reset()
      
      chat.ask(
        "Write a commit message following commitizen convention for these changes:\n\n" .. staged_diff .. "\n\nKeep title under 50 characters, wrap body at 72 characters. Output ONLY the commit message, no explanations.",
        {
          callback = function(response)
            -- Wait a bit for the response to be ready
            vim.defer_fn(function()
              -- Get the chat buffer content
              local bufnr = vim.fn.bufnr("copilot-chat")
              if bufnr == -1 then
                vim.notify("Failed to get commit message", vim.log.levels.ERROR)
                return
              end
              
              local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
              local content = table.concat(lines, "\n")
              
              -- Extract only Copilot's response (text after "# Copilot")
              local commit_msg = ""
              local in_copilot_response = false
              local response_lines = {}
              
              for _, line in ipairs(lines) do
                if line:match("^# Copilot") then
                  in_copilot_response = true
                elseif line:match("^# User") then
                  in_copilot_response = false
                elseif in_copilot_response and not line:match("^#") and line ~= "" then
                  table.insert(response_lines, line)
                end
              end
              
              commit_msg = table.concat(response_lines, "\n")
              
              -- Clean up the response (remove code blocks if any)
              commit_msg = commit_msg:gsub("```gitcommit\n", ""):gsub("```\n", ""):gsub("```", "")
              commit_msg = commit_msg:gsub("^%s+", ""):gsub("%s+$", "")
              
              if commit_msg == "" then
                vim.notify("No commit message generated", vim.log.levels.WARN)
                return
              end
              
              -- Copy to clipboard
              vim.fn.setreg("+", commit_msg)
              
              -- Close the chat window
              vim.cmd("close")
              
              -- Open lazygit in a terminal
              vim.cmd("terminal lazygit")
              vim.cmd("startinsert")
              
              vim.notify("Commit message copied to clipboard!", vim.log.levels.INFO)
            end, 2000)
          end,
        }
      )
    end, { desc = "Generate commit and open lazygit" })
  end,
  event = "VeryLazy",
}
