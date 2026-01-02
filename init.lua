-- NOTE: this just gives nixCats global command a default value
-- so that it doesnt throw an error if you didnt install via nix.
-- usage of both this setup and the nixCats command is optional,
-- but it is very useful for passing info from nix to lua so you will likely use it at least once.
require('nixCatsUtils').setup {
  non_nix_value = true,
}

-- NOTE: Load options and keymaps
require('config.options')
require('config.keymaps')
require('config.autocmds')

-- NOTE: Configure treesitter (already loaded by nix, just needs setup)
if nixCats('general') then
  require("nvim-treesitter.configs").setup({
    -- nix already ensured they were installed, completely disable all installation features
    ensure_installed = {},
    auto_install = false,
    sync_install = false,
    update = false,
    install = false,
    highlight = { enable = true },
    indent = { enable = true },
  })
  -- Override the TSUpdate command to do nothing
  vim.api.nvim_create_user_command("TSUpdate", function()
    vim.notify("TSUpdate disabled - treesitter grammars are managed by nix", vim.log.levels.INFO)
  end, {})
end

-- NOTE: register the nixCats for_cat handler for lze
-- this makes it easy to conditionally enable plugins based on categories
require("lze").register_handlers(require('nixCatsUtils.lzUtils').for_cat)

-- NOTE: Load lze plugins
require('lze').load(require('config.lze'))

-- NOTE: Load colorscheme after plugins are loaded
local colorschemeName = nixCats('colorscheme')
if not require('nixCatsUtils').isNixCats then
  colorschemeName = 'nightfox'
end
-- Use pcall in case the colorscheme isn't available
local ok = pcall(vim.cmd.colorscheme, colorschemeName or "nightfox")
if not ok then
  vim.notify("Colorscheme '" .. (colorschemeName or "nightfox") .. "' not found, using default", vim.log.levels.WARN)
end
