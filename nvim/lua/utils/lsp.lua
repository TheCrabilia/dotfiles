local M = {}

function M.lsp_formatting(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			local allowed_clients = { "null-ls", "pylsp" }
			return vim.tbl_contains(allowed_clients, client.name)
		end,
		bufnr = bufnr,
		timeout_ms = 2000,
	})
	vim.cmd.write()
end

function M.on_attach(_, bufnr)
	-- Configure diagnostics
	local signs = { Error = "E ", Warn = "W ", Hint = "H ", Info = "I " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
	vim.diagnostic.config({
		serverity_sort = true,
		signs = true,
		underline = true,
		update_in_insert = false,
		virtual_text = true,
	})

	-- Set keymaps
	local builtin = require("telescope.builtin")
	local set = vim.keymap.set

   -- stylua: ignore start
   set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, remap = false, desc = "Help" })
   set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, remap = false, desc = "Rename" })
   set("n", "<leader>lf", function() M.lsp_formatting(bufnr) end, { buffer = bufnr, remap = false, desc = "Format Document" })
   set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, remap = false, desc = "Code Action" })
   set("n", "<leader>ld", function() builtin.lsp_definitions() end, { buffer = bufnr, remap = false, desc = "Definitions" })
   set("n", "<leader>lt", function() builtin.lsp_type_definitions() end, { buffer = bufnr, remap = false, desc = "Type Definitions" })
   set("n", "<leader>li", function() builtin.lsp_implementations() end, { buffer = bufnr, remap = false, desc = "Implementations" })
   set("n", "<leader>lR", function() builtin.lsp_references() end, { buffer = bufnr, remap = false, desc = "References" })
	-- stylua: ignore end
end

function M.handlers()
	local border = {
		{ "┌", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "┐", "FloatBorder" },
		{ "│", "FloatBorder" },
		{ "┘", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "└", "FloatBorder" },
		{ "│", "FloatBorder" },
	}
	return {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
	}
end

-- Automate pylsp module installation in it's virtual environment
function M.mason_post_install(pkg)
	if pkg.name ~= "python-lsp-server" then
		return
	end

	local venv = vim.fn.stdpath("data") .. "/mason/packages/python-lsp-server/venv"
	local Job = require("plenary.job")

	Job:new({
		command = venv .. "/bin/pip",
		args = {
			"install",
			"--upgrade",
			"--disable-pip-version-check",
			"python-lsp-ruff",
			"python-lsp-black",
			"pylsp-rope",
		},
		cwd = venv,
		env = { VIRTUAL_ENV = venv },
		on_exit = function()
			print("Finished installing pylsp modules.")
		end,
		on_start = function()
			print("Installing pylsp modules...")
		end,
	}):start()
end

function M.set_default_config(opts)
	opts = opts or {}

	local lspconfig = require("lspconfig")
	lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, opts)
end

return M
