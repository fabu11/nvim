local wk = require("which-key")

local n_opts = {
    mode = "n",
    prefix="<space>",
    buffer=nil,
    silent=true,
    noremap=true,
    nowait=false,
    expr=false,
}
local n_maps = {
    ["1"] = {"<Cmd>BufferLineGoToBuffer 1<CR>", "Show Buffer 1"},
    ["2"] = {"<Cmd>BufferLineGoToBuffer 2<CR>", "Show Buffer 2"},
    ["3"] = {"<Cmd>BufferLineGoToBuffer 3<CR>", "Show Buffer 3"},
    ["4"] = {"<Cmd>BufferLineGoToBuffer 4<CR>", "Show Buffer 4"},
    ["5"] = {"<Cmd>BufferLineGoToBuffer 5<CR>", "Show Buffer 5"},
    ["6"] = {"<Cmd>BufferLineGoToBuffer 6<CR>", "Show Buffer 6"},
    ["7"] = {"<Cmd>BufferLineGoToBuffer 7<CR>", "Show Buffer 7"},
    ["8"] = {"<Cmd>BufferLineGoToBuffer 8<CR>", "Show Buffer 8"},
    ["9"] = {"<Cmd>BufferLineGoToBuffer 9<CR>", "Show Buffer 9"},
    f = {
        name="File",
        t = {"<cmd>NvimTreeToggle<cr>", "Toggle Tree"},
        f = {"<cmd>Telescope find_files<cr>", "Find Files"},
        r = {"<cmd>Telescope oldfiles<cr>", "Recent Files"},
        w = {"<cmd>Telescope live_grep<cr>", "Find Words"},
        s = {"<cmd>Telescope grep_string<cr>", "Find String"},
        u = {"<cmd>UndotreeToggle<CR>", "Toggle UndoTree"},
        p = {"<cmd>MarkdownPreviewToggle<CR>", "Toggle .md Preview"}
    },
   t = {
        name="Terminal",
        t = {"<cmd>ToggleTerm direction=horizontal size=10<CR>", "Open Horizontal Terminal"},
        f = {"<cmd>ToggleTerm direction=float<CR>", "Open Floating Terminal"},
        v = {"<cmd>ToggleTerm direction=vertical size=100<CR><CR>", "Open Vertical Terminal"},
        g = {"<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Open LazyGit"},
        ["1"] = {"<cmd>ToggleTerm 1<CR>", "(Current Term must be Horiz) Split 1"},
        ["2"] = {"<cmd>ToggleTerm 2<CR>", "(Current Term must be Horiz) Split 2"},
        ["3"] = {"<cmd>ToggleTerm 3<CR>", "(Current Term must be Horiz) Split 3"},
   },
   e={"<cmd>TroubleToggle<CR>", "Toggle Diagnostics"},
   l={
       name="Language",
       r={":RunCode<CR>", "Run Code"},
   },
   c ={
    name="Comments",
    ["/"] = {nil, "Toggle Line"}, -- Nil because defined in comments.lua through setup()
    b = {nil, "Toggle Block"},
    A = {nil, "Add comment to end of line"},
    O = {nil, "Add comment line above"},
    o = {nil, "Add comment line below"},
   },
    y={":'<,'>w !clip.exe<CR><CR>", "Copy to System Clipboard"},
    ["T"]={"<cmd>lua require('telescope.builtin').colorscheme({enable_preview=true})<CR>", "Choose Theme"},
    w={
        name="window",
        ["2"]={"<cmd>vs<cr>", "Split into 2"},
        ["3"]={"<cmd>vs<CR><cmd>vs<CR>", "Split into 2"},
        ["<Left>"]={"<cmd>vertical resize +5<CR>", "Resize Left"},
        ["<Right>"]={"<cmd>vertical resize -5<CR>", "Resize Left"},
        ["<Up>"]={"<cmd>resize +5<CR>", "Resize Up"},
        ["<Down>"]={"<cmd>resize -5<CR>", "Resize Down"},
        ["="]={"<cmd>wincmd =<CR>", "Resize Equal"}
    },
    
}


local v_opts = {
    mode = "v",
    prefix="<space>",
    buffer=nil,
    silent=true,
    noremap=true,
    nowait=false,
    expr=false,
}

local v_maps = {
    y={":'<,'>w !clip.exe<CR><CR>", "Copy to System Clipboard"},
    c = {
        name="Comments",
        ["/"] = {nil, "Toggle Line"},
        b = {nil, "Toggle Block"},
    }
}

local x_opts = {
    mode = "v",
    prefix="<space>",
    buffer=nil,
    silent=true,
    noremap=true,
    nowait=false,
    expr=false,
}

local x_maps = {
    [">"] = {">>", "Shift Right"},
    ["<"] = {"<lt><lt>", "Shift Left"}
}
wk.register(n_maps, n_opts)
wk.register(v_maps, v_opts)
wk.register(x_maps, x_opts)

wk.setup {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 5, 5, 1, 5 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    winblend = 1, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000, -- positive value to position WhichKey above other floating windows.
  },
  triggers="<space>",
  triggers_nowait = {
    "<lt>",
    "<gt>",
  },
  ignore_missing = true,
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}
