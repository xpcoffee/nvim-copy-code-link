# nvim-copy-code-link

Copies a link that references the code that is currently under the cursor/selected.

## Support

Currently supports a single Azure-devops usecase.

## Installation/ usage

Using the lazy.nvim package manager:

```lua
return {
  "xpcoffee/nvim-copy-code-link",
  config = function()
    local plugin = require "nvim-copy-code-link"

    plugin.setup({}) -- currently does nothing, but likely will in future

    vim.keymap.set({ "n", "v" }, "<leader>yr", plugin.copy_url_to_unnamed,
      { desc = "Copy link to remote repo", remap = false })
  end
}
```
