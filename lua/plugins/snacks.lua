return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = false,
        ignored = true,
        exclude = {
          "node_modules",
          ".git",
          "dist",
          "build",
          ".yarn",
          "*.min.js",
          "*-lock.json",
          "yarn.lock",
          "*coverage*",
        },
        sources = {
          files = {
            hidden = false,
            ignored = true,
          },
        },
      },
    },
  },
}
