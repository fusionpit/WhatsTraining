local addonName, wt = ...

local name = addonName .. "Minimap"
local launcher

-- LibDBIcon creates hidden buttons shown and only hides them at PLAYER_LOGIN, 
-- which lets button collectors and outdated embedded copies show them again
function wt.SetMinimapHidden(hidden)
    WT_Minimap.hide = hidden == true
    local icons = LibStub("LibDBIcon-1.0")
    if icons:IsRegistered(name) then
        icons:Refresh(name)
    elseif not hidden then
        icons:Register(name, launcher, WT_Minimap)
    end
end

EventUtil.ContinueOnAddOnLoaded(addonName, function()
    if type(WT_Minimap) ~= "table" then WT_Minimap = {} end
    launcher = LibStub("LibDataBroker-1.1"):NewDataObject(name, {
        type = "launcher",
        text = wt.L.TAB_TEXT,
        icon = wt.SpellbookIcon.texture(),
        OnClick = function(self, mouseButton)
            GameTooltip:Hide()
            if mouseButton == "RightButton" then
                if wt.gameVersion == "forever" then
                    wt.OpenSettings()
                else
                    if not self.optionsPopup then
                        self.optionsPopup = wt.CreateOptionsPopup(self)
                        self.optionsPopup:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT")
                    end
                    self.optionsPopup:SetShown(not self.optionsPopup:IsShown())
                end
            elseif mouseButton == "LeftButton" then
                if wt.gameVersion == "forever" and wt.FloatingFrame and wt.FloatingFrame:IsShown() then
                    wt.FloatingFrame:Hide()
                elseif wt.gameVersion ~= "forever" and SpellBookFrame:IsShown() and not InCombatLockdown() then
                    ToggleSpellBook("spell")
                else
                    wt.Open(false)
                end
            end
        end,
        OnTooltipShow = function(tooltip)
            tooltip:SetText(wt.L.TAB_TEXT)
            local openHint = wt.gameVersion == "forever" and wt.L.MINIMAP_TOGGLE_WINDOW_HINT
                or wt.L.MINIMAP_TOGGLE_SPELLBOOK_HINT
            tooltip:AddLine(openHint, 1, 1, 1)
            tooltip:AddLine(wt.L.MINIMAP_OPTIONS_HINT, 1, 1, 1)
            tooltip:AddLine(wt.L.MINIMAP_DRAG_HINT, 1, 1, 1)
        end,
    })
    wt.SpellbookIcon.onChanged(function(texture) launcher.icon = texture end)
    if not WT_Minimap.hide then LibStub("LibDBIcon-1.0"):Register(name, launcher, WT_Minimap) end
end)
