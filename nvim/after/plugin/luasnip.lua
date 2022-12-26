local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } }
      },
    },
  },
}

-- Keymaps
require("which-key").register({
  {
    ["<C-k>"] = { function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, "Expand current snippet or jump to the next" },
    ["<C-j>"] = { function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, "Jump to the previous snippet" },
    mode = { "i", "s" },
  },
  {
    ["<C-l>"] = { function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, "Select a node from list" },
    mode = "i",
  },
  silent = true,
})

-- Load custom snippets
require("thecrabilia.snippets").load_snippets()
