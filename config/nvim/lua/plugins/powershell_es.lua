return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      powershell_es = {
        settings = {
          powershell = { codeFormatting = { Preset = "Stroustrup" } },
        },
      },
    },
  },
}
