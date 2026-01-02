vim.opt_local.wrap = true -- Enable soft wrapping
vim.opt_local.linebreak = true -- Break lines at word boundaries
vim.opt_local.breakindent = true -- Maintain indentation after wrapping

vim.keymap.set("n", "j", "gj", { buffer = true })
vim.keymap.set("n", "k", "gk", { buffer = true })
vim.keymap.set("n", "0", "g0", { buffer = true }) -- Go to start of display line
vim.keymap.set("n", "$", "g$", { buffer = true }) -- Go to end of display line
