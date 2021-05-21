script_name("Adminka Binder")

local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local inicfg = require 'inicfg'

local mainIni = inicfg.load({
config =
{
AutoB = false
}
}, "Adminka Binder")

local main_window_state = imgui.ImBool(false)
local two_window_state = imgui.ImBool(false)
local AutoB = imgui.ImBool(mainIni.config.AutoB)
local test = imgui.ImInt(100)


local status = inicfg.load(mainIni, 'Adminka Binder.ini')
if not doesFileExist('moonloader/config/Adminka Binder.ini') then inicfg.save(mainIni, 'Adminka Binder.ini') end

function imgui.OnDrawFrame()
if main_window_state.v then -- ������ � ������ �������� ����� ���������� �������������� ����� ���� v (��� Value)
local sw, sh = getScreenResolution()
imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
imgui.SetNextWindowSize(imgui.ImVec2(295, 135), imgui.Cond.FirstUseEver)
imgui.Begin('##adminka', main_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar)


if imgui.Button(u8"����", imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat("/b ������������� �� ����������� �� ����.")
else sampSendChat("������������� �� ����������� �� ����.")
end end

imgui.SameLine()

if imgui.Button(u8"���. ������", imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat("/b �������� ������ � ����������� ������ �������.")
else sampSendChat("�������� ������ � ����������� ������ �������.")
end end

imgui.SameLine()

if imgui.Button(u8"����", imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat("/b ������������� �� ������� �������. �� ������ ������ ������� '�������' � ����� ���.")
else sampSendChat("������������� �� ������� �������. �� ������ ������ ������� '�������' � ����� ���.")
end end

if imgui.Button(u8"�����", imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat("/b ������������� �� ������� ������� ��� �������.")
else sampSendChat("������������� �� ������� ������� ��� �������.")
end end

imgui.SameLine()

if imgui.Button(u8"��������", imgui.ImVec2(90, 20)) then
if AutoB.v then sampSendChat("/b ������������� �� ������������� ������� ��� �������.")
else sampSendChat("������������� �� ������������� ������� ��� �������.")
end end

imgui.Separator()

if imgui.Button(u8"���������", imgui.ImVec2(-0.1, 20)) then window() end
if imgui.Button(u8'�������� ������', imgui.ImVec2(-0.1, 20)) then imgui.ShowCursor = true end
if imgui.Button(u8'��������� ������', imgui.ImVec2(-0.1, 20)) then imgui.ShowCursor = false end

imgui.End()
end

if two_window_state.v then
local sw, sh = getScreenResolution()
imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
imgui.SetNextWindowSize(imgui.ImVec2(300, 130), imgui.Cond.FirstUseEver)
imgui.Begin(u8'Adminka-Binder by Rice', main_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoScrollbar)

if imgui.RadioButton(u8"���� /b", AutoB.v) then
	AutoB.v = not AutoB.v
end

imgui.SameLine()
imgui.TextQuestion(u8'��������� �� ������� ���� �������� � ��� ����� /b.')

if imgui.InputInt(u8'', test)


imgui.Separator()

if imgui.Button(u8'��������� ���������',imgui.ImVec2(-0.1,20)) then
mainIni.config.AutoB = AutoB.v
inicfg.save(mainIni, 'Adminka Binder.ini')
sampAddChatMessage('{FF7F50}>>Adminka Binder<< {FFFFFF}�� ��������� ���������!', -1) end

if imgui.Button(u8'������� ����', imgui.ImVec2(-0.1, 20)) then window() end

imgui.End()
end
end

function main()
if not isSampfuncsLoaded() or not isSampLoaded() then return end
while not isSampAvailable() do wait(100) end

apply_custom_style()
sampAddChatMessage("{FF7F50}>>Adminka Binder<< {FFFFFF}��������� - /adm", -1)
sampRegisterChatCommand("adm", cmd_adm)
imgui.Process = false

while true do
wait(0)
imgui.Process = main_window_state.v or two_window_state.v

end
end


function cmd_adm()
main_window_state.v = not main_window_state.v
end

function window()
two_window_state.v = not two_window_state.v
end


function imgui.TextQuestion(text)
imgui.TextDisabled(u8'(���������)')
if imgui.IsItemHovered() then
imgui.BeginTooltip()
imgui.PushTextWrapPos(450)
imgui.TextUnformatted(text)
imgui.PopTextWrapPos()
imgui.EndTooltip() end end


function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.FrameBg]                = ImVec4(0.16, 0.48, 0.42, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.98, 0.85, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.98, 0.85, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.48, 0.42, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.88, 0.77, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.98, 0.85, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.98, 0.82, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.98, 0.85, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.98, 0.85, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.98, 0.85, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.10, 0.75, 0.63, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.10, 0.75, 0.63, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.98, 0.85, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.98, 0.85, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.98, 0.85, 0.95)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.81, 0.35, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.98, 0.85, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end