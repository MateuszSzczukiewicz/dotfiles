local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop>")

keymap("n", "j", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true })
keymap("n", "k", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true })
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<Leader>w", "<cmd>w!<CR>", s)
keymap("n", "<Leader>q", "<cmd>q<CR>", s)
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s)
keymap("n", "<Leader>_", "<cmd>vsplit<CR>", s)
keymap("n", "<Leader>-", "<cmd>split<CR>", s)
keymap("n", "<Leader>fo", function() require('conform').format({ lsp_fallback = true }) end, s)
keymap("v", "<Leader>p", '"_dP')
keymap("x", "y", [["+y]], s)
keymap("t", "<Esc>", "<C-\\><C-N>")
keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')
keymap("n", "<leader>u", '<cmd>UndotreeToggle<CR>', s)
keymap("n", "<leader>os", '<cmd>Obsession<CR>', s)

keymap("n", "<C-a>", function() require('dial.map').manipulate('increment', 'normal') end, s)
keymap("n", "<C-x>", function() require('dial.map').manipulate('decrement', 'normal') end, s)
keymap("v", "<C-a>", function() require('dial.map').manipulate('increment', 'visual') end, s)
keymap("v", "<C-x>", function() require('dial.map').manipulate('decrement', 'visual') end, s)

keymap("n", "<leader>m", function() require('treesj').toggle() end, s)

keymap({"n", "o", "x"}, "w", function() require('spider').motion('w') end, s)
keymap({"n", "o", "x"}, "e", function() require('spider').motion('e') end, s)
keymap({"n", "o", "x"}, "b", function() require('spider').motion('b') end, s)

keymap("n", "<leader>ml", "<cmd>MarksListAll<CR>", s)
keymap("n", "<leader>mn", "<cmd>MarksNext<CR>", s)
keymap("n", "<leader>mp", "<cmd>MarksPrev<CR>", s)

keymap("n", "*", "<Plug>(asterisk-z*)")
keymap("n", "#", "<Plug>(asterisk-z#)")
keymap("x", "*", "<Plug>(asterisk-z*)")
keymap("x", "#", "<Plug>(asterisk-z#)")

keymap("n", "<leader>ts", function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
end, s) -- Trim trailing whitespace manually

keymap("n", "<leader>ps", '<cmd>lua vim.pack.update()<CR>')
keymap("n", "<Leader>e", "<cmd>Ex %:p:h<CR>")

-- Vinegar-style '-' : open netrw at current dir, or go up if already in netrw
keymap("n", "-", function()
    if vim.bo.filetype == 'netrw' then
        vim.api.nvim_feedkeys('-', 'n', false)
    else
        vim.cmd('Ex %:p:h')
    end
end, s)

keymap("n", "<leader>gs", '<cmd>Git<CR>', s)
keymap("n", "<leader>ga", '<cmd>Gwrite<CR>', s)
keymap("n", "<leader>gr", '<cmd>Gread<CR>', s)
keymap("n", "<leader>gm", '<cmd>GMove<CR>', s)
keymap("n", "<leader>gD", '<cmd>GDelete<CR>', s)
keymap("n", "<leader>gd", '<cmd>Gvdiffsplit<CR>', s)
keymap("n", "<leader>gl", '<cmd>Gclog<CR>', s)
keymap("n", "<leader>gg", '<cmd>Git grep<CR>', s)
keymap("n", "<leader>gb", '<cmd>GBrowse<CR>', s)
keymap("n", "<leader>gp", '<cmd>Git push<CR>', s)

keymap("n", ";", ":", { noremap = true })

-- Buffer navigation
keymap("n", "[b", "<cmd>bprevious<CR>", s)
keymap("n", "]b", "<cmd>bnext<CR>", s)
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", s)
keymap("n", "<leader><leader>", "<C-^>", s) -- Alternate file

-- Minimalist buffer picker (no telescope)
keymap("n", "<leader>b", function()
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    if #bufs == 0 then return end
    local items = {}
    for _, buf in ipairs(bufs) do
        local name = buf.name ~= '' and vim.fn.fnamemodify(buf.name, ':~:.') or '[No Name]'
        local modified = buf.changed == 1 and ' [+]' or ''
        table.insert(items, string.format('%3d: %s%s', buf.bufnr, name, modified))
    end
    vim.ui.select(items, { prompt = 'Buffer:' }, function(_, idx)
        if idx then vim.cmd('buffer ' .. bufs[idx].bufnr) end
    end)
end, s)

-- Minimalist file finder (fd + vim.ui.select, capped at 500)
keymap("n", "<leader>f", function()
    local cmd = 'fd --type f --hidden --exclude .git --strip-cwd-prefix | head -n 500'
    local files = vim.fn.systemlist(cmd)
    if vim.v.shell_error ~= 0 and vim.v.shell_error ~= 141 or #files == 0 then
        vim.notify('No files found', vim.log.levels.WARN)
        return
    end
    vim.ui.select(files, { prompt = 'File:' }, function(file)
        if file then vim.cmd('edit ' .. vim.fn.fnameescape(file)) end
    end)
end, s)

-- Grep into quickfix (fast, native, no vim.ui.select lag)
keymap("n", "<leader>g", function()
    vim.ui.input({ prompt = 'Grep: ' }, function(query)
        if not query or query == '' then return end
        local root = vim.fn.getcwd()
        local cmd = string.format('rg --vimgrep --smart-case --hidden --glob !.git %s %s | head -n 200',
            vim.fn.shellescape(query), vim.fn.shellescape(root))
        local lines = vim.fn.systemlist(cmd)
        if vim.v.shell_error ~= 0 and vim.v.shell_error ~= 141 or #lines == 0 then
            vim.notify('No matches', vim.log.levels.WARN)
            return
        end
        local qf = {}
        for _, line in ipairs(lines) do
            local file, lnum, col, text = line:match('^(.-):(%d+):(%d+):(.*)$')
            if file then
                table.insert(qf, { filename = file, lnum = tonumber(lnum), col = tonumber(col), text = text })
            end
        end
        vim.fn.setqflist(qf, 'r')
        vim.cmd('copen')
    end)
end, s)

-- Grep word under cursor into quickfix
keymap("n", "<leader>G", function()
    local word = vim.fn.expand('<cword>')
    local root = vim.fn.getcwd()
    local cmd = string.format('rg --vimgrep --smart-case --hidden --glob !.git %s %s | head -n 200',
        vim.fn.shellescape(word), vim.fn.shellescape(root))
    local lines = vim.fn.systemlist(cmd)
    if vim.v.shell_error ~= 0 and vim.v.shell_error ~= 141 or #lines == 0 then
        vim.notify('No matches', vim.log.levels.WARN)
        return
    end
    local qf = {}
    for _, line in ipairs(lines) do
        local file, lnum, col, text = line:match('^(.-):(%d+):(%d+):(.*)$')
        if file then
            table.insert(qf, { filename = file, lnum = tonumber(lnum), col = tonumber(col), text = text })
        end
    end
    vim.fn.setqflist(qf, 'r')
    vim.cmd('copen')
end, s)

-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", s)
keymap("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", s)
keymap("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", s)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", s)

-- Todo comments
keymap("n", "]t", function() require('todo-comments').jump_next() end, s)
keymap("n", "[t", function() require('todo-comments').jump_prev() end, s)
keymap("n", "<leader>tt", "<cmd>TodoTrouble<CR>", s)
keymap("n", "<leader>tl", "<cmd>TodoLocList<CR>", s)
