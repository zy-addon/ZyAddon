local ZyAddon = {};
local MaxSoulShardCount = 4;

local eventHandler = CreateFrame("Frame", "ZyAddon_workerFrame");
eventHandler:SetScript("OnEvent", function(self, event, ...) ZyAddon:CoreEventHandler(event, ...); end);
eventHandler:RegisterEvent("BAG_UPDATE");

function ZyAddon:CoreEventHandler(event, ...)
	local bagId = ...
	if(GetItemCount(6265) > MaxSoulShardCount) then
		for slot=1, GetContainerNumSlots(bagId), 1 do

			local itemLink = GetContainerItemLink(bagId, slot);

			if (itemLink) then
				local _, itemID = strsplit(":", itemLink)
				itemID = tonumber(itemID);
				if (itemID == 6265) then
					PickupContainerItem(bagId, slot);
					if (CursorHasItem()) then
						DeleteCursorItem();
					end
					break
				end
			end
		end
	end
end