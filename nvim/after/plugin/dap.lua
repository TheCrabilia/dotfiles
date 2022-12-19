local dap = require("dap")

require("mason-nvim-dap").setup({
  automatic_setup = true,
})

require("mason-nvim-dap").setup_handlers()

dap.configurations.java = {
  {
    type = "java";
    request = "attach";
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5005;
  }
}
