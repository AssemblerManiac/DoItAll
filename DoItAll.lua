DoItAll = DoItAll or {}
DoItAll.AddOnName = "DoItAll"
DoItAll.AddOnVersion = 1.66
DoItAll.FCOIS = {}
DoItAll.FCOIS.FCOItemSaver_DeconstructionSelectionHandlerVersion = 0.879
DoItAll.FCOIS.deconstructionSelectionHandlerSupported = false
DoItAll.FCOIS.loaded = false
DoItAll.FCOIS.version = 0
DoItAll.extractionActive = false

local function Initialize()
	DoItAll.Settings.Initialize()
end

local function Loaded(_, loadedAddon)
	if (DoItAll.AddOnName == loadedAddon) then
		Initialize()
        --Load libLoadedAddons
        local LIBLA = LibStub:GetLibrary("LibLoadedAddons")
        -- Registers addon to loadedAddon library
        LIBLA:RegisterAddon(DoItAll.AddOnName, DoItAll.AddOnVersion)
        DoItAll.LIBLA = LIBLA
        --Check if FCOItemSaver is loaded in the version that supports the global DeconstructionSelectionHandler
        DoItAll.FCOIS.loaded, DoItAll.FCOIS.version = LIBLA:IsAddonLoaded("FCOItemSaver")
        if FCOIS and DoItAll.FCOIS.loaded and DoItAll.FCOIS.version >= DoItAll.FCOIS.FCOItemSaver_DeconstructionSelectionHandlerVersion then
            DoItAll.FCOIS.deconstructionSelectionHandlerSupported = true
        end
	end
end

--[[
local function PlayerActivated()
end
]]

ZO_CreateStringId("SI_BINDING_NAME_SC_BANK_ALL", "Do It All") -- use BANK_ALL to keep the existing key binding
EVENT_MANAGER:RegisterForEvent(DoItAll.AddOnName, EVENT_ADD_ON_LOADED, Loaded)
--EVENT_MANAGER:RegisterForEvent(DoItAll.AddOnName, EVENT_PLAYER_ACTIVATED, PlayerActivated) -- for debugging
