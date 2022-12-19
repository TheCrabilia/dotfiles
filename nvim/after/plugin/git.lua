local check_ok, git = pcall(require, "git")
if not check_ok then
  return
end

git.setup {
  default_mappings = false,
  target_branch = "main",
}

