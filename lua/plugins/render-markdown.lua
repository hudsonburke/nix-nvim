return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    ft = { "markdown", "norg", "rmd", "org", "codecompanion", "quarto", "qmd" },
    opts = {
      win_options = {
        conceallevel = {
          default = 0,
          rendered = 0,
        },
      },
      code = {
        enabled = true,
        conceal_delimiters = false,
        language_icon = true,
        language_name = true,
        width = "full",
      },
    },
  },
}
