local M = {}

function M.edit_nvim()
	require("telescope.builtin").find_files({
		prompt_title = "~ dotfiles ~",
		shorten_path = false,
		cwd = "~/.config/nvim",
		follow = true,
	})
end

function M.edit_zsh()
	require("telescope.builtin").find_files({
		prompt_title = "~ dotfiles ~",
		shorten_path = false,
		cwd = "~/.config/zsh",
		hidden = true,
		follow = true,
	})
end

function M.find_files()
	require("telescope.builtin").find_files({
		hidden = true,
		no_ignore = true,
		file_ignore_patterns = {
			".git/",
			".cache",
			"%.class",
			"node_modules",
		},
	})
end

return M
