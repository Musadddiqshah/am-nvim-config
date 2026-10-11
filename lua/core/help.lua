-- ============================================
--  HELP MENU
-- ============================================

local M = {}

function M.open()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = 70
  local height = 40
  
  -- Calculate center position
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)
  
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
    title = "  NEOVIM HELP ",
    title_pos = "center",
  })
  
  local lines = {
    "  ╔════════════════════════════════════════════════════════════════╗",
    "  ║                      NEOVIM KEYMAPS                       ║",
    "  ╠════════════════════════════════════════════════════════════════╣",
    "  ║                                                                ║",
    "  ║   PYTHON                                                     ║",
    "  ║     <leader>rp      Run Python in new terminal                ║",
    "  ║                                                                ║",
    "  ║   JAVA                                                        ║",
    "  ║     <leader>rj      Run Java in new terminal                  ║",
    "  ║                                                                ║",
    "  ║   FILE OPERATIONS                                            ║",
    "  ║     <leader>nf      New file                                  ║",
    "  ║     <leader>rf      Rename current file                       ║",
    "  ║     <leader>df      Delete current file                       ║",
    "  ║     <leader>cp      Copy current file                         ║",
    "  ║     <leader>w       Save file                                 ║",
    "  ║     <leader>q       Quit file                                 ║",
    "  ║     <leader>wq      Save and quit                             ║",
    "  ║                                                                ║",
    "  ║   FILE EXPLORER                                              ║",
    "  ║     <leader>e       Toggle file explorer                      ║",
    "  ║     <leader>E       Focus file explorer                       ║",
    "  ║     a (in tree)     Create new file                           ║",
    "  ║     r (in tree)     Rename file                               ║",
    "  ║     d (in tree)     Delete file                               ║",
    "  ║                                                                ║",
    "  ║   SEARCH                                                     ║",
    "  ║     <leader>ff      Find files                                ║",
    "  ║     <leader>fg      Live grep (search all files)              ║",
    "  ║     <leader>fb      Find buffers                              ║",
    "  ║     <leader>fs      Search word under cursor                  ║",
    "  ║     <leader>fh      Search help tags                          ║",
    "  ║     /text           Search in current file                    ║",
    "  ║     n / N           Next / Previous match                     ║",
    "  ║     *               Search word under cursor                  ║",
    "  ║     <leader>hl      Clear search highlight                    ║",
    "  ║                                                                ║",
    "  ║   THEMES                                                     ║",
    "  ║     <leader>tn      Tokyo Night theme                         ║",
    "  ║     <leader>tv      VS Code theme                             ║",
    "  ║     <leader>tt      Toggle themes                             ║",
    "  ║     <leader>hd      High contrast mode                        ║",
    "  ║                                                                ║",
    "  ║    TERMINAL                                                   ║",
    "  ║     <leader>tt      Open terminal                             ║",
    "  ║     <Esc>           Exit terminal insert mode                 ║",
    "  ║     <C-q>           Close terminal                            ║",
    "  ║                                                                ║",
    "  ║  🪟 WINDOW NAVIGATION                                          ║",
    "  ║     <C-h>           Move to left window                       ║",
    "  ║     <C-j>           Move to bottom window                     ║",
    "  ║     <C-k>           Move to top window                        ║",
    "  ║     <C-l>           Move to right window                      ║",
    "  ║     <C-\\>          Alternate windows                          ║",
    "  ║                                                                ║",
    "  ║   BUFFERS                                                    ║",
    "  ║     <leader>bn      Next buffer                               ║",
    "  ║     <leader>bp      Previous buffer                           ║",
    "  ║     <leader>bd      Delete buffer                             ║",
    "  ║                                                                ║",
    "  ║   LSP (Code Intelligence)                                    ║",
    "  ║     gd              Go to definition                          ║",
    "  ║     K               Hover info                                ║",
    "  ║     gr              Find references                           ║",
    "  ║     <leader>ca      Code actions                              ║",
    "  ║     <leader>rn      Rename symbol                             ║",
    "  ║     [d              Previous diagnostic                       ║",
    "  ║     ]d              Next diagnostic                           ║",
    "  ║     <leader>ld      Show diagnostic                           ║",
    "  ║                                                                ║",
    "  ║    EDITING                                                    ║",
    "  ║     J (visual)      Move lines down                           ║",
    "  ║     K (visual)      Move lines up                             ║",
    "  ║     < (visual)      Decrease indent                           ║",
    "  ║     > (visual)      Increase indent                           ║",
    "  ║                                                                ║",
    "  ║    TOGGLES                                                    ║",
    "  ║     <leader>nu      Toggle line numbers                       ║",
    "  ║     <leader>hl      Toggle search highlight                   ║",
    "  ║     <leader>wf      Toggle word wrap                          ║",
    "  ║                                                                ║",
    "  ║   HELP                                                       ║",
    "  ║     <leader>hm      This help menu                            ║",
    "  ║     <leader>hk      Quick help (command line)                 ║",
    "  ║                                                                ║",
    "  ╠════════════════════════════════════════════════════════════════╣",
    "  ║              Press q or <Esc> to close this window             ║",
    "  ╚════════════════════════════════════════════════════════════════╝",
  }
  
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_option(buf, "filetype", "help")
  
  -- Keybindings to close
  local close_opts = { buffer = buf, silent = true }
  vim.keymap.set("n", "q", function()
    vim.api.nvim_win_close(win, true)
  end, close_opts)
  vim.keymap.set("n", "<Esc>", function()
    vim.api.nvim_win_close(win, true)
  end, close_opts)
  vim.keymap.set("n", "<CR>", function()
    vim.api.nvim_win_close(win, true)
  end, close_opts)
end

return M
