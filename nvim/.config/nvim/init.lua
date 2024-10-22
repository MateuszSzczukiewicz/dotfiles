local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.fn.system("kitty @ set-spacing padding-left=0 padding-top=0 padding-right=0 padding-bottom=0")
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.fn.system("kitty @ set-spacing padding-left=default padding-top=default padding-right=default padding-bottom=default")
  end,
})

require("vim-options")
require("lazy").setup("plugins")
