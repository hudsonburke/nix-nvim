-- lze quarto configuration
return {
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto", "qmd" },
    after = function()
      require("quarto").setup({})
    end,
  },
  {
    "jmbuhr/otter.nvim",
    ft = { "quarto", "qmd" },
  },
  {
    -- directly open ipynb files as quarto documents
    -- and convert back behind the scenes
    "GCBallesteros/jupytext.nvim",
    ft = { "ipynb" },
    after = function()
      require("jupytext").setup({
        custom_language_formatting = {
          python = {
            extension = "qmd",
            style = "quarto",
            force_ft = "quarto",
          },
          r = {
            extension = "qmd",
            style = "quarto",
            force_ft = "quarto",
          },
        },
      })
    end,
  },
}
