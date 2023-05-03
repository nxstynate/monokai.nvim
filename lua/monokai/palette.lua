-- Solarized Dark
local M = {}

M.colors = {
  dark0_hard = "#272822",
  dark0 = "#383830",
  dark0_soft = "#49483e",
  dark1 = "#75715e",
  dark2 = "#a59f85",
  dark3 = "#f8f8f2",
  dark4 = "#f5f4f1",
  light0_hard = "#f9f2f4",
  light0 = "#f5f4f1",
  light0_soft = "#f5f4f1",
  light1 = "#a59f85",
  light2 = "#75715e",
  light3 = "#49483e",
  light4 = "#383830",
  bright_red = "#f92672",
  bright_green = "#a6e22e",
  bright_yellow = "#e6db74",
  bright_blue = "#66d9ef",
  bright_purple = "#ae81ff",
  bright_aqua = "#a1efe4",
  bright_orange = "#fd971f",
  neutral_red = "#f92672",
  neutral_green = "#a6e22e",
  neutral_yellow = "#e6db74",
  neutral_blue = "#66d9ef",
  neutral_purple = "#ae81ff",
  neutral_aqua = "#a1efe4",
  neutral_orange = "#fd971f",
  faded_red = "#f92672",
  faded_green = "#a6e22e",
  faded_yellow = "#e6db74",
  faded_blue = "#66d9ef",
  faded_purple = "#ae81ff",
  faded_aqua = "#a1efe4",
  faded_orange = "#fd971f",
  gray = "#a59f85",
}

M.get_base_colors = function(bg, contrast)
  local config = require("monokai").config
  local p = M.colors

  for color, hex in pairs(config.palette_overrides) do
    p[color] = hex
  end

  if bg == nil then
    bg = vim.o.background
  end

  local colors = {
    dark = {
      bg0 = p.dark0,
      bg1 = p.dark1,
      bg2 = p.dark0,
      bg3 = p.dark3,
      bg4 = p.dark4,
      fg0 = p.light0,
      fg1 = p.light1,
      fg2 = p.light2,
      fg3 = p.light3,
      fg4 = p.light4,
      red = p.bright_red,
      green = p.bright_green,
      yellow = p.bright_yellow,
      blue = p.bright_blue,
      purple = p.bright_purple,
      aqua = p.bright_aqua,
      orange = p.bright_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
    },
    light = {
      bg0 = p.light0,
      bg1 = p.light1,
      bg2 = p.light2,
      bg3 = p.light3,
      bg4 = p.light4,
      fg0 = p.dark0,
      fg1 = p.dark1,
      fg2 = p.dark2,
      fg3 = p.dark3,
      fg4 = p.dark4,
      red = p.faded_red,
      green = p.faded_green,
      yellow = p.faded_yellow,
      blue = p.faded_blue,
      purple = p.faded_purple,
      aqua = p.faded_aqua,
      orange = p.faded_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
    },
  }

  if contrast ~= nil and contrast ~= "" then
    colors[bg].bg0 = p[bg .. string.format("0_%s", contrast)]
  end

  return colors[bg]
end

return M
