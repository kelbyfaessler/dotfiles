return {
  cmd_env = { RUFF_TRACE = "messages" },
  init_options = {
    settings = {
      -- Ruff language server settings go here
      logLevel = "debug",
    },
  },
}
