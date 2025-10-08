vim.diagnostic.config({
	severity_sort = true,
	underline = { severity = vim.diagnostic.severity.ERROR },
	update_in_insert = false,
	float = {
		border = "single",
		source = "if_many",
	},
	signs = {
		[vim.diagnostic.severity.ERROR] = "E ",
		[vim.diagnostic.severity.WARN] = "W ",
		[vim.diagnostic.severity.INFO] = "I ",
		[vim.diagnostic.severity.HINT] = "H ",
	},
	virtual_text = {
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(event)
		local bufnr = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		local function map(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
		end

		map("gd", function()
			require("telescope.builtin").lsp_definitions()
		end, "Go to definition")
		map("gri", function()
			require("telescope.builtin").lsp_implementations()
		end, "Go to implementation")
		map("grr", function()
			require("telescope.builtin").lsp_references()
		end, "List references")
		map("gO", function()
			require("telescope.builtin").lsp_document_symbols()
		end, "Document symbols")

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_declaration) then
			map("gD", vim.lsp.buf.declaration, "Go to declaration")
		end
	end,
})

vim.lsp.config("*", {
	flags = { debounce_text_changes = 200 },
})

vim.lsp.enable({
	"ansiblels",
	"basedpyright",
	"clangd",
	"dockerls",
	"gopls",
	"helm_ls",
	"jsonls",
	"lua_ls",
	"ocamllsp",
	"taplo",
	"terraformls",
	"yamlls",
})
