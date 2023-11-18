local M = {}
-- TODO: generalize and de-densify...
function M.readInit()
    local path = vim.fn.stdpath('config') .. "/settings.json"
    local fp, err = io.open(path, 'r')
    if not fp then
        print(err, " |  Creating settings.json...")
        vim.cmd("colorscheme onedark")
        return
    end
    local content = fp:read('*all')
    fp:close()
    if not content then
        print("Error reading settings.json")
        return
    end
    local success, data = pcall(vim.json.decode, content)
    if not success then
        print("Error decoding JSON:", data)
        return
    end
        if data["colorscheme"] then
        local color_value = data.colorscheme
        print(color_value)
        vim.cmd("colorscheme " .. color_value)
    else
        print("Missing 'color' key in settings.json")
    end
end


function M.c_dashboard()
    require('dashboard').setup {
        -- config
        theme = 'doom', --  theme is doom and hyper default is hyper
        config = {
            header = require("ijcc.utils").get_dashboard_art(),
            center = {
                {
                    desc = 'Find File           ',
                    desc_hl = 'Number',
                    key = 'f',
                    key_hl = 'Number',
                    key_format = ' %s', -- remove default surrounding `[]`
                    action = "require('telescope.builtin').find_files()"
                },
                {
                    desc = 'Open Tree           ',
                    desc_hl = 'Number',
                    key = 't',
                    key_hl = 'Number',
                    key_format = ' %s', -- remove default surrounding `[]`
                    action = "vim.api.nvim_command(':NvimTreeOpen')"
                },
                {
                    desc = 'Find Recent Files  ',
                    desc_hl = 'Number',
                    key = 'r',
                    key_hl = 'Number',
                    key_format = ' %s', -- remove default surrounding `[]`
                    action = "require('telescope.builtin').oldfiles()"
                },
                {
                    desc = 'Find Word          ',
                    desc_hl = 'Number',
                    key = 'w',
                    key_hl = 'Number',
                    key_format = ' %s', -- remove default surrounding `[]`
                    action = "require('telescope.builtin').live_grep()"
                },
                {
                    desc = 'Search Git Files   ',
                    desc_hl = 'Number',
                    key = 'g',
                    key_hl = 'Number',
                    key_format = ' %s', -- remove default surrounding `[]`
                    action = "require('telescope.builtin').git_files()"
                },
            },
            footer = {"i just can't vim       https://github.com/fabu11"}
        },
        hide = {
            statusline=true,    -- hide statusline default is true
            tabline = true,       -- hide the tabline
            winbar  = true,       -- hide winbar
        },
    }
end
function M.close_buffer(exit)
    if vim.bo.buftype == 'terminal' then
        vim.cmd(':startinsert')
        vim.api.nvim_input('<C-d>')
    end
    local buffer_count = vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))
    if buffer_count == 1 then
        if vim.bo.modified then
            vim.api.nvim_err_writeln("Buffer has unsaved changes!")
            return
        end
        if exit then
            vim.cmd('qa')
            return
        end
        vim.cmd('Dashboard')
    else
        if vim.bo.modified then
            vim.api.nvim_err_writeln("Buffer has unsaved changes!")
            return
        end
        vim.cmd('Bunlink')
    end
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
  "", ""},

{ "",
  "▪   ▐▄▄▄ ▄▄·      ▌ ▐·▪  • ▌ ▄ ·. ",
   "██   ·██▐█ ▌▪    ▪█·█▌██ ·██ ▐███▪",
   "▐█·▪▄ ████ ▄▄    ▐█▐█•▐█·▐█ ▌▐▌▐█·",
   "▐█▌▐▌▐█▌▐███▌     ███ ▐█▌██ ██▌▐█▌",
   "▀▀▀ ▀▀▀•·▀▀▀     . ▀  ▀▀▀▀▀  █▪▀▀▀",
   "", ""},

    {"",
    [[_//     _//    _//         _//         _//_//_//       _//]],
    [[_//     _// _//   _//       _//       _// _//_/ _//   _///]],
    [[_//     _//_//               _//     _//  _//_// _// _ _//]],
    [[_//     _//_//                _//   _//   _//_//  _//  _//]],
    [[_//     _//_//                 _// _//    _//_//   _/  _//]],
    [[_//_/   _// _//   _//           _////     _//_//       _//]],
    [[_// _////     _////              _//      _//_//       _//]],
    "",""}
   }
        if #array > 0 then
            local randomIndex = math.random(1, #array)
            return array[randomIndex]
        else
            return nil
        end
    end


return M
