local M = {}

function M.get_azure_url(params)
  local base_url = params and params.remote_url

  if not base_url then
    if params == nil or params.git_remote_name == nil then
      error("no git remote name configured")
      return
    end

    local git_command = "git config --get remote." .. params.git_remote_name .. ".url"

    local handle = io.popen(git_command)
    if not handle then
      error("issue inferring remote URL")
      return
    end

    base_url = handle:read("*a"):gsub("%s+", ""):gsub("https://.+@", "https://")
    handle:close()
  end

  local relative_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")

  local start_line = vim.api.nvim_buf_get_mark(0, "<")[1]
  local end_line = vim.api.nvim_buf_get_mark(0, ">")[1]

  if vim.fn.mode() == "n" then
    start_line = vim.fn.line(".")
    end_line = start_line
  end

  local full_url = base_url ..
      "?path=/" .. relative_path ..
      "&line=" .. start_line ..
      "&lineEnd=" .. end_line + 1 ..
      "&lineStartColumn=1&lineEndColumn=1&lineStyle=plain&_a=contents"

  return full_url
end

return M
