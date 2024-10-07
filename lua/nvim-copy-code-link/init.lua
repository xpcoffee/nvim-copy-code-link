local options = require('nvim-copy-code-link.options')
local azure_devops = require('nvim-copy-code-link.azure_devops')

local M = {}

local option_values = options.get_defaults()
function M.setup(opts)
  if not opts then
    return
  end

  if opts.git_remote_name then
    option_values.git_remote_name = opts.git_remote_name
  end
end

function M.copy_url_to_unnamed()
  local url = azure_devops.get_azure_url(option_values)
  print(url)
  vim.fn.setreg('+', url)
end

return M
