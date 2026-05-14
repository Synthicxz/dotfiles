-- Tiny helpers so the actual config files stay readable.

local M = {}

function M.bind(keys, dispatcher, description, flags)
  local out_flags = {}
  if flags then
    for k, v in pairs(flags) do
      out_flags[k] = v
    end
  end
  if description then
    out_flags.description = description
  end
  return hl.bind(keys, dispatcher, out_flags)
end

function M.bind_exec(keys, command, description, flags)
  return M.bind(keys, hl.dsp.exec_cmd(command), description, flags)
end

function M.start(command)
  hl.exec_cmd(command)
end

return M
