local M = {}

M.jobid = 0

function M.start_server()
	if M.jobid ~= 0 then
		vim.fn.jobstop(M.jobid)
		return
	end

	local port = os.getenv("PORT")
	if port == nil then
		port = "8005"
		vim.fn.setenv("PORT", port)
	end

	print("marp: started server on http://localhost:" .. port)
	M.jobid = vim.fn.jobstart({ "marp", "--server", "--preview", vim.fn.getcwd() }, {
		on_exit = function(_, code)
			M.jobid = 0
			if code ~= 143 then
				print("marp: exit", code)
			end
		end,
	})
end

function M.stop_server()
	vim.fn.jobstop(M.jobid)
	M.jobid = 0
	print("marp: server stopped")
end

vim.api.nvim_create_user_command("MarpStartServer", M.start_server, {})
vim.api.nvim_create_user_command("MarpStopServer", M.stop_server, {})

return M
