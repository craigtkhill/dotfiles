return {
  "meeehdi-dev/bropilot.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "j-hui/fidget.nvim",
  },
  opts = {
    provider = "ollama",
    auto_suggest = true,
    model = "rust-coder:latest",
    debounce = 500,
    keymap = {
      accept_word = "<Tab>",
      accept_line = "<S-Tab>",
      accept_block = "<S-Down>",
      suggest = "<S-Up>",
    },
    ollama_url = "http://localhost:11434/api",
  },
}
