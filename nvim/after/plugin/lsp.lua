local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.set_preferences({
  set_lsp_keymaps = false,
})

lsp.on_attach(require("thecrabilia.keymaps").lsp_keymaps)

local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<Tab>"] = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  }),
})

cmp_mappings["<CR>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.setup()

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.black,
    formatting.isort,
  },
}
