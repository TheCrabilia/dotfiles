local function make_argocd_fly()
	local cmd = { "uvx", "make-argocd-fly", "--remove-output-dir" }

	local res = vim.system(cmd, { text = true }):wait()
	if res.code ~= 0 then
		vim.notify("Failed to run make-argocd-fly", vim.log.levels.ERROR)
		vim.notify(res.stdout, vim.log.levels.ERROR)
	end
end

vim.api.nvim_create_user_command("MakeArgoCDFly", make_argocd_fly, {})
