local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
	vim.notify("JDTLS not found, install with `:MasonInstall jdtls`")
	return
end

local JDTLS_LOCATION = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local CACHE_DIR = os.getenv("XDG_CACHE_HOME") or os.getenv("HOME") .. "/.cache"
local WORKSPACE_PATH = CACHE_DIR .. "/java/workspaces/"

local SYSTEM = "linux"
if vim.fn.has("mac") == 1 then
	SYSTEM = "mac"
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. project_name

local root_markers = { ".git", "mvnw", "gradlew", "Makefile" }
local root_dir = require("jdtls.setup").find_root(root_markers)

local extended_client_capabilities = jdtls.extendedClientCapabilities
extended_client_capabilities.resolveAdditionalTextEditsSupport = true

local builtin = require("telescope.builtin")
local on_attach = function(_, bufnr)
	require("jdtls").setup_dap({ hotcodereplace = "auto" })
	require("jdtls.dap").setup_dap_main_class_configs()

	require("which-key").register({
		K = { vim.lsp.buf.hover, "Help" },
		{
			r = {
				function()
					local term = require("toggleterm")
					-- local name = vim.fn.expand("%:t:r")
					-- local full_name = vim.fn.expand("%:t")
					vim.cmd.write()
					term.exec(
						"javac -d "
							.. root_dir
							.. "/build "
							.. root_dir
							.. "/src/*.java && java -cp "
							.. root_dir
							.. "/build Main",
						1,
						vim.o.columns * 0.4,
						".",
						"vertical",
						true,
						true
					)
				end,
				"Run current Java file",
			},
			l = {
				name = "LSP",
				r = { vim.lsp.buf.rename, "Rename" },
				f = { vim.lsp.buf.format, "Format Document" },
				a = { vim.lsp.buf.code_action, "Code Action" },
				d = { builtin.lsp_definitions, "Definitions" },
				t = { builtin.lsp_type_definitions, "Type Definitions" },
				i = { builtin.lsp_implementations, "Implementations" },
				R = { builtin.lsp_references, "References" },
			},
			d = {
				name = "Diagnostics",
				n = { vim.diagnostic.goto_next, "Move to the next diagnostic" },
				p = { vim.diagnostic.goto_prev, "Move to the previous diagnostic" },
				l = { builtin.diagnostics, "List diagnostics" },
			},
			prefix = "<leader>",
		},
	}, { buffer = bufnr })
end

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		vim.fn.glob(JDTLS_LOCATION .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		JDTLS_LOCATION .. "/config_" .. SYSTEM,
		"-data",
		workspace_dir,
	},
	on_attach = on_attach,
	root_dir = root_dir,
	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			maven = {
				downloadSources = false,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			format = {
				enabled = true,
				settings = {
					profile = "GoogleStyle",
				},
			},
		},
		signatureHelp = { enabled = true },
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
		},
		contentProvider = { preferred = "fernflower" },
		extendedClientCapabilities = extended_client_capabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	},

	flags = {
		allow_incremental_sync = true,
	},

	init_options = {
		bundles = {
			vim.fn.glob(
				vim.fn.getenv("HOME")
					.. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
				true
			),
		},
	},
}

jdtls.start_or_attach(config)
