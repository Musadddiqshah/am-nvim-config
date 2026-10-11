-- ============================================
--  DASHBOARD (Shown when opening nvim without file)
-- ============================================

local M = {}

function M.show()
  -- Only show if no file argument
  if vim.fn.argc() > 0 then return end
  if vim.fn.expand("%") ~= "" then return end
  
  vim.defer_fn(function()
    local buf = vim.api.nvim_get_current_buf()
    
    -- Make it scratch buffer
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false
    vim.bo[buf].modifiable = true
    
    -- Dashboard content
    local lines = {
      "",
      "",
      "                      N E O V I M  ",
      "",
      "                       v" .. tostring(vim.version().major) .. "." .. tostring(vim.version().minor) .. "." .. tostring(vim.version().patch),
      "",
      "",
      "           ┌─────────────────────────────────────┐",
      "           │                                     │",
      "           │       Python       <leader>rp    │",
      "           │       Java         <leader>rj    │",
      "           │                                     │",
      "           │       Files        <leader>ff    │",
      "           │       Grep         <leader>fg    │",
      "           │       Explorer     <leader>e     │",
      "           │                                     │",
      "           │       Tokyo        <leader>tn    │",
      "           │       VS Code      <leader>tv    │",
      "           │                                     │",
      "           │       Help         <leader>hm    │",
      "           │                                     │",
      "           └─────────────────────────────────────┘",
      "",
      "",
      "              Press <leader>hm for full help menu",
      "",
      "",
      "                    Ready to code! ",
      "",
      "",
      "             ~ Neovim • Python + Java Setup ~",
    }
    
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false
    
    -- Center vertically (approximate)
    local line_count = #lines
    local topline = math.max(0, math.floor((vim.o.lines - line_count) / 2) - 2)
    vim.api.nvim_win_set_cursor(0, { math.max(1, topline + 3), 0 })
    vim.cmd("normal! zt")
    
    -- Set keymaps for dashboard
    local map_opts = { buffer = buf, silent = true, noremap = true }
    
    -- Press any key to dismiss
    vim.keymap.set("n", "q", function()
      vim.bo[buf].modifiable = true
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
      vim.bo[buf].modifiable = false
    end, map_opts)
    
    -- Allow editing by pressing i or a
    vim.keymap.set("n", "i", function()
      vim.bo[buf].modifiable = true
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
      vim.bo[buf].modifiable = true
      vim.cmd("startinsert")
    end, map_opts)
    
    vim.keymap.set("n", "a", function()
      vim.bo[buf].modifiable = true
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
      vim.bo[buf].modifiable = true
      vim.cmd("startinsert")
    end, map_opts)
    
    -- Quick access keymaps
    vim.keymap.set("n", "<leader>hm", function()
      vim.bo[buf].modifiable = true
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
      vim.bo[buf].modifiable = false
      require("core.help").open()
    end, map_opts)
  end, 100)
end

return M
