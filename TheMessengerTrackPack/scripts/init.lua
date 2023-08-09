-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Logic
ScriptHost:LoadScript("scripts/logic.lua")

-- Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/modifiers.json")

if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.json")
    -- Locations
    ScriptHost:LoadScript("scripts/locations.lua")
end

-- Layout
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")

-- AutoTracking for Poptracker
ScriptHost:LoadScript("scripts/autotracking/archipelago.lua")
