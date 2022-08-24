local wezterm = require 'wezterm'

local launch_menu = {}
local default_prog = {}

-- 设置SHELL终端
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then

    -- windows下启用powershell
    term = '' -- Set to empty so FZF works on windows
    table.insert(launch_menu, {
        label = 'powershell',
        args = {'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-NoLogo'}
    })
    default_prog = {'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-NoLogo'}
end

local config = {
  -- 检查更新
  check_for_updates = false,

  -- 字体
  font = wezterm.font 'JetBrains Mono', --设置默认字体
  -- font_size = 16,

  -- 主题
  color_scheme = 'Snazzy (Gogh)', --设置默认主题

  -- 快捷键
  -- leader = {
  --   key = 'b',
  --   mods = 'CTRL'
  -- },
  -- leader = { key = 'Space', mods = 'CTRL|SHIFT' },

  -- Allow using ^ with single key press.
  -- use_dead_keys = false,

  -- keys = {
  --   {
  --     key = '|',
  --     -- mods = 'LEADER|SHIFT',
  --     mods = 'LEADER',
  --     action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }, -- 垂直分割
  --   },
  -- },
  default_prog = default_prog,

}

return config
