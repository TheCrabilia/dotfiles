local check_ok, jdtls = pcall(require, "jdtls")
if not check_ok then
  return
end

local config = {
  cmd = { "/Users/ispirts/.local/share/nvim/mason/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1])
}

jdtls.setup_dap()
jdtls.start_or_attach(config)
