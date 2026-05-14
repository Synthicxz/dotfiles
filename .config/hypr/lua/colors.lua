-- Symphony/matugen color adapter.
-- matugen still generates the Hyprlang colors.conf file; Lua reads that file
-- and exposes the old $secondary / $outline_variant values as Lua strings.

local paths = require("lua.paths")

local M = {}

local function trim(value)
  return (value:gsub("^%s+", ""):gsub("%s+$", ""))
end

function M.load_hyprlang_colors(path)
  local colors = {}
  local file = io.open(path, "r")
  if not file then
    return colors
  end

  for line in file:lines() do
    -- Expected Symphony/Hyprland color lines look like: $secondary = rgba(...)
    local name, value = line:match("^%s*%$([%w_]+)%s*=%s*([^#]+)")
    if name and value then
      colors[name] = trim(value)
    end
  end

  file:close()
  return colors
end

function M.load_first_existing_hyprlang_colors(candidate_paths)
  for _, path in ipairs(candidate_paths) do
    local colors = M.load_hyprlang_colors(path)
    if next(colors) ~= nil then
      return colors, path
    end
  end
  return {}, nil
end

M.values, M.source_path = M.load_first_existing_hyprlang_colors({
  paths.home .. "/.config/symphony/current/.config/hypr/theme/colors.conf",
  paths.home .. "/symphony/themes/dynamic/.config/hypr/theme/colors.conf",
  paths.home .. "/.config/hypr/theme/colors.conf",
})

M.active_border = M.values.secondary or "rgba(89b4faee)"
M.inactive_border = M.values.outline_variant or "rgba(595959aa)"

return M
