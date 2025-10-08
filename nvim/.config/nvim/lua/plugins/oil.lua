---@type LazySpec
return {
	"stevearc/oil.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"benomahony/oil-git.nvim",
	},
	cmd = "Oil",
	opts = {
		columns = {
			"icon",
			"permissions",
			"size",
		},
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		lsp_file_methods = {
			timeout_ms = 1000,
			autosave_changes = true,
		},
		constrain_cursor = "name",
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name)
				local hidden = { ".DS_Store", ".." }
				return vim.tbl_contains(hidden, name)
			end,
		},
		float = {
			max_width = 120,
			max_height = 30,
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "OilActionsPost",
			callback = function(args)
				---@param url string
				---@return string
				local parse_url = function(url)
					return url:match("^.*://(.*)$")
				end

				if args.data.err then
					return
				end

				for _, action in ipairs(args.data.actions) do
					if action.type == "delete" and action.entry_type == "file" then
						local path = parse_url(action.url)
						local bufnr = vim.fn.bufnr(path)
						if bufnr == -1 then
							return
						end

						-- TODO: I don't use floating window, but if will, fix that
						-- local winnr = vim.fn.win_findbuf(bufnr)[1]
						-- if not winnr then
						-- 	return
						-- end
						--
						-- local prev_bufnr = vim.api.nvim_win_call(winnr, function()
						-- 	return vim.fn.bufnr("#")
						-- end)
						-- if prev_bufnr ~= -1 then
						-- 	vim.api.nvim_win_set_buf(winnr, prev_bufnr)
						-- end

						vim.api.nvim_buf_delete(bufnr, { force = true })
					end
				end
			end,
		})
	end,
	keys = {
		{
			"-",
			mode = "n",
			function()
				require("oil").open()
			end,
			desc = "Open file explorer",
		},
	},
}
