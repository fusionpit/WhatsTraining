local _, wt = ...

-- The per-addon switch and reload-on-disable behavior belong to EllesmereUI.
-- Keep the facade for windows and pooled rows created after PLAYER_LOGIN.
local skin
local styled = setmetatable({}, { __mode = "k" })

local function fonts(frame, white)
    for _, region in ipairs({frame:GetRegions()}) do
        if region:IsObjectType("FontString") then
            if white then skin.Font(region, 1, 1, 1) else skin.Font(region) end
        end
    end
end

function wt.SkinCompactFrame(frame)
    if not skin or styled[frame] then return end
    styled[frame] = true
    skin.Shell(frame, { noTopBar = frame ~= wt.FloatingFrame })
    skin.FadeNineSlice(frame.NineSlice)
    skin.CloseButton(frame.Close or frame.CloseButton)
    skin.Font(frame.Title, 1, 1, 1)
    skin.EditBox(frame.searchBox)
    skin.Button(frame.weaponSkillToggleButton, {"Icon", "icon"})
    skin.Button(frame.groupingButton, {"Icon", "icon"})
    skin.ScrollBar(frame.scrollBar.ScrollBar or _G[frame.scrollBar:GetName() .. "ScrollBar"])
    skin.Panel(frame.groupingPopup)
    fonts(frame.groupingPopup, true)
    for _, child in ipairs({frame.groupingPopup:GetChildren()}) do
        if child:IsObjectType("CheckButton") then
            skin.Checkbox(child)
        elseif child:IsObjectType("Button") then
            skin.Button(child)
        end
        fonts(child, true)
    end
    for _, row in ipairs(frame.rows) do
        skin.Font(row.header)
        fonts(row.spell)
        skin.SquareIcon(row.spell.icon)
    end
end

function wt.SkinSpellBookFrame(frame)
    if not skin or not frame.weaponPage or styled[frame] then return end
    styled[frame] = true
    local tab = _G.WhatsTrainingSpellBookButton
    if tab and tab.Icon then
        tab.Icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
    end
    if tab then
        local system = tab:GetParent()
        local glow = tab.SquareBackgroundActiveGlow
        local glowAtlas = glow and glow:GetAtlas()
        skin.Tab(tab)
        -- Retain the template's native selection glow alongside EUI's line.
        if glowAtlas then
            glow:SetAtlas(glowAtlas)
            glow:SetAlpha(1)
        end
        local function updateSelection()
            local selected = tab:IsSelected()
            skin.SetTabSelection(tab, selected)
            for _, sibling in ipairs(system.tabs) do
                -- Do not change the native selection or insert our launcher
                -- into Blizzard's pool: its entries are rebuilt by the book.
                if selected then
                    skin.SetTabSelection(sibling, false)
                else
                    skin.SetTabSelection(sibling, nil)
                end
            end
            if glowAtlas then glow:SetShown(tab:IsSelected()) end
        end
        local function alignTab()
            local previous, last
            for _, sibling in ipairs(system.tabs) do
                if sibling:IsShown() then previous, last = last, sibling end
            end
            if not last then return end
            local gap = system.spacing or 0
            if previous then
                local left, right = last:GetLeft(), previous:GetRight()
                if left and right then gap = left - right end
            end
            tab:SetSize(last:GetSize())
            tab:ClearAllPoints()
            tab:SetPoint("LEFT", last, "RIGHT", gap, 0)
        end
        hooksecurefunc(tab, "SetTabSelected", updateSelection)
        hooksecurefunc(system:GetParent(), "ResizeSearchBox", alignTab)
        if system.Layout then hooksecurefunc(system, "Layout", alignTab) end
        alignTab()
        updateSelection()
    end
    -- These are WhatsTraining's pages, never the Blizzard spellbook itself.
    for _, page in ipairs({frame, frame.weaponPage}) do
        -- Let the spellbook's themed backdrop show through embedded pages.
        skin.Panel(page, { noBorder = true, noBg = true })
        skin.FadeRegions(page.header)
        fonts(page.header, true)
        fonts(page, true)
        fonts(page.columns, true)
        fonts(page.listColumns, true)
        skin.ScrollBar(page.scrollFrame.ScrollBar)
    end
    skin.Font(frame.total, 1, 1, 1)
    skin.EditBox(frame.searchBox)
    -- Keep the native SpellBookSettingsDropdownTemplate appearance.
    local controls = frame.pagingControls
    skin.PageButton(controls.PrevPageButton, "<")
    skin.PageButton(controls.NextPageButton, ">")
    skin.Font(controls.PageText, 1, 1, 1)
    wt.SkinSpellBookRows(frame)
    wt.SkinSpellBookRows(frame.weaponPage)
end

local function readable(text)
    if not text then return end
    local r, g, b = text:GetTextColor()
    local peak = math.max(r, g, b)
    -- Preserve status hues while lifting the dark parchment ink.
    if peak > 0 and peak < 0.65 then
        local scale = 0.75 / peak
        skin.White(text, r * scale, g * scale, b * scale)
    end
end

function wt.SkinSpellBookRows(page)
    if not skin then return end
    for _, pool in ipairs(page.pools) do
        for _, row in ipairs(pool) do
            if not styled[row] then
                styled[row] = true
                fonts(row)
                skin.SquareIcon(row.icon)
                if row.iconBorder then row.iconBorder:SetAlpha(0) end
            end
            if row:IsShown() then
                readable(row.name)
                readable(row.rank)
                readable(row.level)
                readable(row.heading)
                readable(row.title)
                readable(row.count)
            end
        end
    end
end

if EllesmereUI and EllesmereUI.RegisterSkin then
    EllesmereUI.RegisterSkin("WhatsTraining", function(S)
        skin = S
        if wt.MainFrame then
            if wt.MainFrame.weaponPage then
                wt.SkinSpellBookFrame(wt.MainFrame)
            elseif wt.MainFrame.rows then
                wt.SkinCompactFrame(wt.MainFrame)
            end
        end
        if wt.FloatingFrame then wt.SkinCompactFrame(wt.FloatingFrame) end
    end)
end
