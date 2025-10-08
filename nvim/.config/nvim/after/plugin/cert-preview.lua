local function is_certificate(filename)
	local cmd = { "file", "-b", filename }
	local res = vim.system(cmd, { text = true }):wait()

	return res.stdout:gsub("\n", "") == "PEM certificate"
end

local function create_win()
	local win_opts = {
		number = false,
		relativenumber = false,
	}

	local buf = vim.api.nvim_create_buf(false, true)

	local win = vim.api.nvim_open_win(buf, true, {
		split = "right",
		win = 0,
	})

	for opt, value in pairs(win_opts) do
		vim.api.nvim_set_option_value(opt, value, { win = win })
	end

	vim.keymap.set("n", "q", function()
		vim.api.nvim_win_close(win, false)
	end, { buffer = buf })

	return win, buf
end

local function preview_cert()
	local cert_file = vim.api.nvim_buf_get_name(0)

	if not is_certificate(cert_file) then
		vim.notify("Provided file is not a PEM certificate", vim.log.levels.ERROR)
		return
	end

	local cmd = { "openssl", "x509", "-noout", "-text", "-in", cert_file }

	local cert_details = vim.system(cmd, { text = true }):wait()
	if cert_details.code ~= 0 then
		vim.notify("Failed to get certificate details", vim.log.levels.ERROR)
	end

	local _, buf = create_win()

	local text = vim.split(cert_details.stdout, "\n", {})

	vim.api.nvim_buf_set_lines(buf, 0, #text, false, text)

	vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
end

vim.api.nvim_create_user_command("PreviewCertificate", preview_cert, {})
