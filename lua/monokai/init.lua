local M = {}

-- default configs
M.config = {
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
}

function M.setup(config)
  if config ~= nil and type(config.italic) == "boolean" then
    vim.notify(
      "[monokai] italic config has change. please check https://github.com/nxstynate/monokai.nvim/issues/220",
      vim.log.levels.WARN
    )
    config.italic = M.config.italic
  end
  M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

M.load = function()
  if vim.version().minor < 8 then
    vim.notify_once("monokai.nvim: you must use neovim 0.8 or higher")
    return
  end

  -- reset colors
  if vim.g.colors_name then
    vim.cmd.hi("clear")
  end

  vim.g.colors_name = "monokai"
  vim.o.termguicolors = true

  local groups = require("monokai.groups").setup()

  -- add highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
