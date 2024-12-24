local M = {}

-- Function to check if a buffer is empty
local function is_buffer_empty(buf)
  -- Get the number of lines in the buffer
  local line_count = vim.api.nvim_buf_line_count(buf)
  -- Check if the buffer has only one empty line
  if line_count == 1 then
    local first_line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
    return first_line == ""
  end
  return false
end

-- Function to release a buffer that is empty and has no name
function M.release_empty_unnamed_buffers()
  -- Get a list of all buffers
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    -- Check if the buffer has no name and is empty
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name == "" and is_buffer_empty(buf) then
      -- Check if the buffer is loaded to avoid errors
      if vim.api.nvim_buf_is_loaded(buf) then
        -- Try to delete the buffer
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end
end

-- safely close buffer to spec
function M.close_buffer(exit)
  if vim.bo.buftype == 'terminal' then
    vim.cmd(':startinsert')
    vim.api.nvim_input('<C-d>') -- quit terminal
    return
  end
  if vim.bo.modified then
    vim.api.nvim_err_writeln("Buffer has unsaved changes!")
    return
  end
  local buffer_count = vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))
  if buffer_count <= 1 then
    if exit then
      vim.cmd('qa')
      return
    end
    vim.cmd('Dashboard')
  else
    vim.cmd('bd')
  end
  M.release_empty_unnamed_buffers()
end

function M.get_dashboard_art()
  local array = {

    { "",
      "██▓ ▄▄▄██▀▀▀▄████▄      ██▒   █▓ ██▓ ███▄ ▄███▓",
      "▓██▒   ▒██  ▒██▀ ▀█     ▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
      "▒██▒   ░██  ▒▓█    ▄     ▓██  █▒░▒██▒▓██    ▓██░",
      "░██░▓██▄██▓ ▒▓▓▄ ▄██▒     ▒██ █░░░██░▒██    ▒██ ",
      "░██░ ▓███▒  ▒ ▓███▀ ░      ▒▀█░  ░██░▒██▒   ░██▒",
      "░▓   ▒▓▒▒░  ░ ░▒ ▒  ░      ░ ▐░  ░▓  ░ ▒░   ░  ░",
      " ▒ ░ ▒ ░▒░    ░  ▒         ░ ░░   ▒ ░░  ░    ░ ░",
      " ▒ ░ ░ ░ ░  ░                ░░   ▒ ░░      ░   ",
      " ░   ░   ░  ░ ░               ░   ░         ░   ",
      "          ░                  ░                  ",
      "", "" },

    { "",
      "▪   ▐▄▄▄ ▄▄·      ▌ ▐·▪  • ▌ ▄ ·. ",
      "██   ·██▐█ ▌▪    ▪█·█▌██ ·██ ▐███▪",
      "▐█·▪▄ ████ ▄▄    ▐█▐█•▐█·▐█ ▌▐▌▐█·",
      "▐█▌▐▌▐█▌▐███▌     ███ ▐█▌██ ██▌▐█▌",
      "▀▀▀ ▀▀▀•·▀▀▀     . ▀  ▀▀▀▀▀  █▪▀▀▀",
      "", "" },

    -- { "",
    --   [[_//     _//    _//         _//         _//_//_//       _//]],
    --   [[_//     _// _//   _//       _//       _// _//_/ _//   _///]],
    --   [[_//     _//_//               _//     _//  _//_// _// _ _//]],
    --   [[_//     _//_//                _//   _//   _//_//  _//  _//]],
    --   [[_//     _//_//                 _// _//    _//_//   _/  _//]],
    --   [[_//_/   _// _//   _//           _////     _//_//       _//]],
    --   [[_// _////     _////              _//      _//_//       _//]],
    --   "", "" },
    { "",
      ' ▄█       ▄█  ▄████████       ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ',
      '███      ███ ███    ███      ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ',
      '███▌     ███ ███    █▀       ███    ███ ███▌ ███   ███   ███ ',
      '███▌     ███ ███             ███    ███ ███▌ ███   ███   ███  ',
      '███▌     ███ ███             ███    ███ ███▌ ███   ███   ███  ',
      '███      ███ ███    █▄       ███    ███ ███  ███   ███   ███  ',
      '███      ███ ███    ███      ███    ███ ███  ███   ███   ███  ',
      '█▀   █▄ ▄███ ████████▀        ▀██████▀  █▀    ▀█   ███   █▀   ',
      '     ▀▀▀▀▀▀                                                   ',
      "", "" },
  }
  if #array > 0 then
    math.randomseed(os.time())
    local randomIndex = math.random(1, #array)
    return array[randomIndex]
  else
    return nil
  end
end

return M
