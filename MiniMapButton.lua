setfenv(1, WhatsTraining)
MiniMapButton = {}

local LibDataBroker = LibStub("LibDataBroker-1.1")
local LibDBIcon = LibStub("LibDBIcon-1.0")

function MiniMapButton:Initialise()
  -- local buttons =
  -- {
  --   { "LeftButton",   "Left Click" },
  --   { "MiddleButton", "Middle Click" },
  --   { "RightButton",  "Right Click" },
  -- }
  local object = LibDataBroker:NewDataObject("WhatsTraining_TurtleDB", {
    type = "launcher",
    text = "WhatsTraining_TurtleDB",
    icon = [[Interface\AddOns\AI_VoiceOver\Textures\MinimapButton]],

    OnClick = function(self, button)
      -- local command = Addon.db.profile.MinimapButton.Commands[button]
      -- if command and command ~= "" then
      --     local handler = Options.table.args.SlashCommands.args[command]
      --     if handler and handler.func then
      --         PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
      --         handler.func()
      --     end
      -- end
      Addon:Initialise()
      -- PlayerData:SayHello()
    end,
  })
  LibDBIcon:Register("WhatsTraining_TurtleDB", object, Addon.db.profile.MinimapButton.LibDBIcon)
end