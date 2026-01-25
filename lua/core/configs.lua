-- Lines Views
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
-- Line Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Clipboard
vim.opt.clipboard = "unnamed"

-- Indent Settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Other
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Fillchars
vim.opt.fillchars = {

    vert = "│",

    fold = "⠀",

    eob = " ", -- suppress ~ at EndOfBuffer

    -- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱

    msgsep = "‾",

    foldopen = "▾",

    foldsep = "│",

    foldclose = "▸"

}

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("$APPDATA/../Local/nvim-data/undo")
vim.opt.undofile = true
