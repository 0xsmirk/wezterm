local wezterm = require 'wezterm'

local launch_menu = {}
local default_prog = {}
local act = wezterm.action
local mykeys = {}

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

--[[
--本人常用快捷键:
--创建新Wezterm: ctrl+shift+n
--创建新Tab: ctrl+shift+t
--切换Tab: alt+1/2/.../8
--屏幕左右分割: ctrl+shift+s
--屏幕上下分割: ctrl+shift+d
--分割的屏幕之间移动: ctrl+shift+上下左右
--全屏显示: ctrl+f11
--]]

-- 重新定义Tab切换快捷键
-- 描述：通过alt+1/2/3/../8进行切换Tab标签
for i = 1, 8 do
  table.insert(mykeys, {
    key = tostring(i),
    mods = 'ALT',
    action = act.ActivateTab(i - 1),
  })
end

-- 重新定义左右分割
-- 描述：通过ctrl+shift+s
table.insert(mykeys, {
    key = 's',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
})

-- 重新定义上下分割
-- 描述：通过ctrl+shift+d
table.insert(mykeys, {
    key = 'd',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
})

table.insert(mykeys, {
    key = 'F11',
    mods = 'CTRL',
    action = wezterm.action.ToggleFullScreen,
})

local config = {
  -- 检查更新
  check_for_updates = false,

  -- 字体
  font = wezterm.font 'JetBrains Mono', --设置默认字体
  -- font_size = 16,

  -- 主题
  color_scheme = 'Snazzy (Gogh)', --设置默认主题

  default_prog = default_prog,

  -- 快捷键
  keys = mykeys,
  
}

return config
