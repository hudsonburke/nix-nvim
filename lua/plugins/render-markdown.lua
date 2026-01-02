-- lze render-markdown configuration
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "norg", "rmd", "org", "codecompanion", "quarto", "qmd" },
    after = function()
      require("render-markdown").setup({
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
      })
    end,
  },
}
