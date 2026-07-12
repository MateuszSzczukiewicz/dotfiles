local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 170 })
    end,
    group = highlight_group,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        local bs = { buffer = true, silent = true }
        local bsr = { buffer = true, remap = true, silent = true }

        vim.keymap.set("n", "<Esc>", "<cmd>bd<CR>", bs) -- Quit netrw
        vim.keymap.set("n", "h", "-", bsr) -- Go to parent directory
        vim.keymap.set("n", "l", "<CR>", bsr) -- Open file/directory
        vim.keymap.set("n", ".", "gh", bsr) -- Toggle dotfiles
        vim.keymap.set("n", "<C-l>", "<C-l>", bs) -- Refresh (restore vim default)
        vim.keymap.set("n", "gf", "<CR>", bsr) -- Open file under cursor (vim default restored)
        vim.keymap.set("n", "<Tab>", "mf", bsr) -- Mark file/directory
        vim.keymap.set("n", "<S-Tab>", "mF", bsr) -- Unmark all

        -- Vinegar-style aliases
        vim.keymap.set("n", "~", function()
            vim.cmd("Ex ~")
        end, bs) -- Go to home directory

        vim.keymap.set("n", "y.", function()
            local file = vim.fn.expand("<cfile>")
            if file == "" then
                return
            end
            local path = vim.b.netrw_curdir .. "/" .. file
            vim.fn.setreg('"', path)
            vim.fn.setreg("+", path)
            print("Yanked: " .. path)
        end, bs) -- Yank absolute path of file under cursor

        vim.keymap.set("n", "!", function()
            local dir = vim.b.netrw_curdir or vim.fn.getcwd()
            vim.cmd("lcd " .. vim.fn.fnameescape(dir))
            vim.cmd("terminal")
        end, bs) -- Open terminal in current directory

        -- Improved file creation
        vim.keymap.set("n", "%", function()
            local dir = vim.b.netrw_curdir or vim.fn.expand("%:p:h")
            vim.ui.input({ prompt = "Enter filename: " }, function(input)
                if input and input ~= "" then
                    local filepath = dir .. "/" .. input
                    vim.cmd("!touch " .. vim.fn.shellescape(filepath))
                    vim.api.nvim_feedkeys("<C-l>", "n", false)
                end
            end)
        end, bs)

        -- Improved directory creation
        vim.keymap.set("n", "d", function()
            local dir = vim.b.netrw_curdir or vim.fn.expand("%:p:h")
            vim.ui.input({ prompt = "Enter directory name: " }, function(input)
                if input and input ~= "" then
                    local newdir = dir .. "/" .. input
                    vim.cmd("!mkdir -p " .. vim.fn.shellescape(newdir))
                    vim.api.nvim_feedkeys("<C-l>", "n", false)
                end
            end)
        end, bs)
    end,
})
