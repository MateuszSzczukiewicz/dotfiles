local opt = vim.opt
local g = vim.g
local diagnostic = vim.diagnostic

g.mapleader = " "
opt.termguicolors = true
opt.guicursor = "i:block" -- Use block cursor in insert mode
opt.signcolumn = "yes:1" -- Always show sign column
opt.termguicolors = true -- Enable true colors
opt.ignorecase = true -- Ignore case in search
opt.swapfile = false -- Disable swap files
opt.autoindent = true -- Enable auto indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Number of spaces for a tab
opt.softtabstop = 4 -- Number of spaces for a tab when editing
opt.shiftwidth = 4 -- Number of spaces for autoindent
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.numberwidth = 2 -- Width of the line number column
opt.wrap = false -- Disable line wrapping
opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Directory for undo files
opt.undofile = true -- Enable persistent undo

g.netrw_liststyle = 1 -- Long listing view
g.netrw_banner = 0 -- Remove the upper banner
g.netrw_localcopydircmd = "cp -r"
g.netrw_keepdir = 0 -- Keep cwd in sync with netrw directory
g.netrw_fastbrowse = 0 -- Reuse netrw buffers
g.netrw_hide = 1 -- Enable hiding
g.netrw_list_hide = "^\\./$,^\\.\\./$" -- Hide . and .. entries
g.netrw_sort_by = "name"

opt.hidden = true
opt.switchbuf = "useopen,uselast"
opt.wildmode = "longest:full,full"
opt.wildoptions = "pum,fuzzy"
opt.wildignore =
    "*.o,*.obj,*.bin,*.dll,*.exe,*.jpg,*.jpeg,*.png,*.gif,*.zip,*.tar.gz,*.tar,*.pdf,*.tags,*.taghl"

opt.path:append("**") -- :find searches subdirectories

diagnostic.config({
    virtual_text = { spacing = 4, source = "if_many" },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { focusable = false, source = true },
})
