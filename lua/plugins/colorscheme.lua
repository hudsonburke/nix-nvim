-- lze colorscheme configuration
return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    after = function()
      vim.cmd.colorscheme("nightfox")
    end,
  },
}
