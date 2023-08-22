local M = {}
local fn = vim.fn

M.jobid = 0

function M.serve()
	if fn.executable("mdbook") ~= 1 then
		print("mdbook: error: mdbook executable not found")
		return
	end

	if M.jobid ~= 0 then
		M.stop()
		return
	end

	print("mdbook: started server on http://localhost:3000")
	M.jobid = fn.jobstart({ "mdbook", "serve", "." }, {
		on_exit = function(_, code)
			M.jobid = 0
			if code ~= 0 then
				print("mdbook: exit", code)
			end
		end,
	})
end

function M.stop()
	if M.jobid == 0 then
		print("mdbook: server is not running")
		return
	end
	fn.jobstop(M.jobid)
	M.jobid = 0
	print("mdbook: server stopped")
end

vim.api.nvim_create_user_command("MdBookServe", M.serve, {})
vim.api.nvim_create_user_command("MdbookStop", M.stop, {})

return M
