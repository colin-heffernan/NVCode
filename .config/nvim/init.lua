-- Keep track of start time for Alpha to use later
vim.g.start_time = vim.fn.reltime()

-- Load configs for autoloaded plugins
require("nvcode.options")
require("nvcode.keymaps")
require("nvcode.plugins")
