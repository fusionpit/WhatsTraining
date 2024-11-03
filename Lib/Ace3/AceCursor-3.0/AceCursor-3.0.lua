local ACECURSOR_MAJOR, ACECURSOR_MINOR = "AceCursor-3.0", 4
local AceCursor, oldminor = LibStub:NewLibrary(ACECURSOR_MAJOR, ACECURSOR_MINOR)

if not AceCursor then return end -- No upgrade needed

local AceCore = LibStub("AceCore-3.0")
local _G = AceCore._G
local hooksecurefunc = AceCore.hooksecurefunc

local ttName = "AceCursorTT"
local tt = CreateFrame("GameTooltip", ttName, nil, "GameTooltipTemplate")
tt:SetOwner(WorldFrame,"ANCHOR_NONE")
tt:SetScript("OnHide", function ()
    this:SetOwner(WorldFrame,"ANCHOR_NONE")
  end)
AceCursor.tooltip = tt

local cursorType, cursorData, cursorSubType, cursorSubData
function _G.GetCursorInfo()
	return cursorType, cursorData, cursorSubType, cursorSubData
end

local function setcursoritem(link)
	local _,_,id = strfind(link,"|Hitem:(%d+):")
	cursorType = "item"
	cursorData = tonumber(id)
	cursorSubType = link
	cursorSubData = nil
end

-- ClearCursor
if not AceCore_ClearCursor then
	hooksecurefunc("ClearCursor", function()
		return _G.AceCore_ClearCursor()
	end)
end

function _G.AceCore_ClearCursor()
	cursorType, cursorData, cursorSubType, cursorSubData = nil,nil,nil,nil
end

-- PickupContainerItem
if not AceCore_PickupContainerItem then
	hooksecurefunc("PickupContainerItem",
		function(container, slot)
			return _G.AceCore_PickupContainerItem(container, slot)
		end)
end

function _G.AceCore_PickupContainerItem(container, slot)
	if CursorHasItem() then
		return setcursoritem(GetContainerItemLink(container, slot))
	end
end

-- PickupInventoryItem
if not AceCore_PickupInventoryItem then
	hooksecurefunc("PickupInventoryItem",
		function(slot)
			return _G.AceCore_PickupInventoryItem(slot)
		end)
end

function _G.AceCore_PickupInventoryItem(slot)
	if CursorHasItem() then
		return setcursoritem(GetInventoryItemLink("player", slot))
	else
		cursorType, cursorData, cursorSubType, cursorSubData = nil,nil,nil,nil
	end
end

-- EquipCursorItem
if not _G.AceCore_EquipCursorItem then
	hooksecurefunc("EquipCursorItem",
		function(slot)
			return _G.AceCore_EquipCursorItem(slot)
		end)
end

function _G.AceCore_EquipCursorItem(slot)
		cursorType, cursorData, cursorSubType, cursorSubData = nil,nil,nil,nil
end

-- PickupBagFromSlot
if not _G.AceCore_PickupBagFromSlot then
	hooksecurefunc("PickupBagFromSlot",
		function(inventoryID)
			return _G.AceCore_PickupBagFromSlot(inventoryID)
		end)
end

function _G.AceCore_PickupBagFromSlot(inventoryID)
	return setcursoritem(GetInventoryItemLink("player", inventoryID))
end

-- PutItemInBag
if not _G.AceCore_PutItemInBag then
	hooksecurefunc("PutItemInBag",
		function(inventoryID)
			return _G.AceCore_PutItemInBag(inventoryID)
		end)
end

function _G.AceCore_PutItemInBag(inventoryID)
	cursorType, cursorData, cursorSubType, cursorSubData = nil,nil,nil,nil
end

-- PickupSpell
if not _G.AceCore_PickupSpell then
	hooksecurefunc("PickupSpell",
		function(spellbookID, bookType)
			return _G.AceCore_PickupSpell(spellbookID, bookType)
		end)
end

function _G.AceCore_PickupSpell(spellbookID, bookType)
	cursorType = "spell"
	cursorData = spellbookID
	cursorSubType = bookType
	cursorSubData = nil	-- Ace3v: how to get spellID?
end

-- PickupMacro
if not _G.AceCore_PickupMacro then
	hooksecurefunc("PickupMacro",
		function(macroID)
			return _G.AceCore_PickupMacro(macroID)
		end)
end

function _G.AceCore_PickupMacro(macroID)
	cursorType = "macro"
	cursorData = macroID
	cursorSubType = nil
	cursorSubData = nil
end

--[[------------------------------------
The Action part is not fully working yet
--------------------------------------]]
-- PickupAction
if not _G.AceCore_PickupAction then
	hooksecurefunc("PickupAction",
		function(slot)
			return _G.AceCore_PickupAction(slot)
		end)
end

function _G.AceCore_PickupAction(slot)
	-- cursorType = "action"
	-- cursorData = slot
	-- cursorSubType = nil
	-- cursorSubData = nil
end

-- PlaceAction
if not _G.AceCore_PlaceAction then
	hooksecurefunc("PlaceAction",
		function(slot)
			return _G.AceCore_PlaceAction(slot)
		end)
end

function _G.AceCore_PlaceAction(slot)
	cursorType, cursorData, cursorSubType, cursorSubData = nil,nil,nil,nil
end

local function setcursoraction(id)
	AceCursor.tooltip:SetOwner(UIParent, "ANCHOR_NONE")
	AceCursor.tooltip:ClearLines()
	AceCursor.tooltip:SetAction(id)
	cursorType = "action"
	cursorData = getglobal(ttName .."TextLeft1"):GetText()
	AceCursor.tooltip:Hide()
	cursorSubType = GetActionTexture(id)
	cursorSubData = id
end

local function setcursorpetaction(id)
	AceCursor.tooltip:SetOwner(UIParent, "ANCHOR_NONE")
	AceCursor.tooltip:ClearLines()
	AceCursor.tooltip:SetPetAction(id)
	cursorType = "petaction"
	cursorData = getglobal(ttName .."TextLeft1"):GetText()
	AceCursor.tooltip:Hide()
	local name, subtext, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(id);
	cursorSubType = texture
	cursorSubData = id
end

local function ActionButton_OnClick()
	local id = ActionButton_GetPagedID(this)
	if ( IsShiftKeyDown() ) then
		setcursoraction(id)
		PickupAction(id)
	else
		if ( MacroFrame_SaveMacro ) then
			MacroFrame_SaveMacro();
		end
		UseAction(id, 1);
	end
	ActionButton_UpdateState();
end

local function ActionButton_OnDragStart()
	if ( LOCK_ACTIONBAR ~= "1" ) then
		local id = ActionButton_GetPagedID(this)
		setcursoraction(id)
		PickupAction(id);
		ActionButton_UpdateHotkeys(this.buttonType);
		ActionButton_UpdateState();
		ActionButton_UpdateFlash();
	end
end

local function ActionButton_OnReceiveDrag()
	if ( LOCK_ACTIONBAR ~= "1" ) then
		PlaceAction(ActionButton_GetPagedID(this));
		ActionButton_UpdateHotkeys(this.buttonType);
		ActionButton_UpdateState();
		ActionButton_UpdateFlash();
	end
end

local actionButtons = {
	"ActionButton",
	"BonusActionButton",
	"MultiBarLeftButton",
	"MultiBarRightButton",
	"MultiBarBottomLeftButton",
	"MultiBarBottomRightButton",
}

for _,btn in actionButtons do
	for i=1,12 do
		local frame = _G[btn..i]
		frame:SetScript("OnDragStart",ActionButton_OnDragStart)
		frame:SetScript("OnReceiveDrag",ActionButton_OnReceiveDrag)
		frame:SetScript("OnClick",ActionButton_OnClick)
	end
end

local function PetActionButton_OnClick()
	this:SetChecked(0);
	local id = this:GetID()
	if ( IsShiftKeyDown() ) then
		setcursorpetaction(id)
		PickupPetAction(id)
	else
		if ( arg1 == "LeftButton" ) then
			if ( IsPetAttackActive(id) ) then
				PetStopAttack();
			else
				CastPetAction(id);
			end
		else
			TogglePetAutocast(id);
		end
	end
end

local function PetActionButton_OnDragStart()
	if ( LOCK_ACTIONBAR ~= "1" ) then
		local id = this:GetID()
		setcursorpetaction(id)
		this:SetChecked(0);
		PickupPetAction(id);
		PetActionBar_Update();
	end
end

local function PetActionButton_OnReceiveDrag()
	if ( LOCK_ACTIONBAR ~= "1" ) then
		this:SetChecked(0);
		PickupPetAction(this:GetID());
		PetActionBar_Update();
	end
end

for i=1,10 do
	local frame = _G["PetActionButton"..i]
	frame:SetScript("OnDragStart",PetActionButton_OnDragStart)
	frame:SetScript("OnReceiveDrag",PetActionButton_OnReceiveDrag)
	frame:SetScript("OnClick",PetActionButton_OnClick)
end
