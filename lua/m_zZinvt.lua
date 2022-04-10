InvAll = {
	invalidSlot = { valid = 0 }
}

function InvAll:create()
	local self = setmetatable({}, { __index = self })
	self.keymap = keybindingsForIds({ 56, 57, 58, 59, 60, 61 })
	for _, i in pairs(self.keymap.missing) do
		popupInfo(string.format(
			"Shortcut to select character %d is unassigned.\n" ..
			"Inventory won't work correctly."
		, i))
		break
	end
	--characters
	self.selected = 0
	self.charSlot = { [1] = nil, [2] = nil, [3] = nil, [4] = nil, [5] = nil, [6] = nil }
	local cnt = Infinity_GetNumCharacters()
	self.count = 0
	self.currChar = id
	self.currCharKey = self.keymap[1]
	local slt = 2
	for i = 1, cnt do
		Infinity_OnPortraitLClick(i - 1)
		Infinity_UpdateLuaStats()
		if inventoryScreen:IsSpriteOrderable() then
			local char = characters[id]
			local name = char.name
			if self.currChar == id then
				self.charSlot[1] = { name=name, id=id, idx=i, key=self.keymap[i] }
				self.selected = 1
				self.currCharKey = self.keymap[i]
			else
				self.charSlot[slt] = { name=name, id=id, idx=i, key=self.keymap[i] }
				slt = slt + 1
			end
			self.count = self.count + 1
		end
	end
	self.swapChars = function(idx)
		local temp = self.charSlot[1]
		self.charSlot[1] = self.charSlot[idx]
		self.charSlot[idx] = temp
		self.selected = idx
	end
	self.updateHighlight = nil
	
	return self
end

function keybindingsForIds(keys)
	local bindingsById = {}
	for _, category in pairs(keybindings) do
		for _, key in pairs(category) do
			bindingsById[key[1]] = key
		end
	end
	local map = { missing = {} }
	for index, name in pairs(keys) do
		local key = bindingsById[name]
		if key and key[6] ~= 0 then
			map[index] = string.char(key[6])
		else
			table.insert(map.missing, index)
		end
	end
	return map
end

function InvAll:Equip(inv_slot, char_slot)
	char_slot = char_slot or 1
	local char = characters[self.charSlot[char_slot].id]
	if char then
		if inv_slot ==  1 then return char.equipment.weapon0   end
		if inv_slot ==  2 then return char.equipment.weapon1   end
		if inv_slot ==  3 then return char.equipment.weapon2   end
		if inv_slot ==  4 then return char.equipment.weapon3   end
		if inv_slot ==  5 then return char.equipment.personal0 end
		if inv_slot ==  6 then return char.equipment.personal1 end
		if inv_slot ==  7 then return char.equipment.personal2 end
		if inv_slot ==  8 then return char.equipment.armor     end
		if inv_slot ==  9 then return char.equipment.gauntlets end
		if inv_slot == 10 then return char.equipment.helmet    end
		if inv_slot == 11 then return char.equipment.amulet    end
		if inv_slot == 12 then return char.equipment.quiver0   end
		if inv_slot == 13 then return char.equipment.quiver1   end
		if inv_slot == 14 then return char.equipment.quiver2   end
		if inv_slot == 15 then return char.equipment.belt      end
		if inv_slot == 16 then return char.equipment.ringleft  end
		if inv_slot == 17 then return char.equipment.ringright end
		if inv_slot == 18 then return char.equipment.cloak     end
		if inv_slot == 19 then return char.equipment.boots     end
		if inv_slot == 20 then return char.equipment.shield    end
	end
	return self.invalidSlot
end

function InvAll:Slot(inv_slot, char_slot)
	local char = characters[self.charSlot[char_slot].id]
	if char then
		return char.equipment['group' .. (inv_slot - 1)]
	end
	return self.invalidSlot
end

function InvAll:SelChar(n, upd)
	upd = upd or true
	local chslot = self.charSlot[n]
	if chslot then
		mouseOverPortrait = chslot.idx - 1
		Infinity_PressKeyboardButton(chslot.key)
		if upd then
			self.selected = n
		end
	end
end

function InvAll:updateHlight()
	local sel = self.selected
	for i = 1, self.count do
		if i ~= sel then
			self:SelChar(i, false)
		end
	end
	self.updateHighlight = nil
	mouseOverPortrait = -2
	self:SelChar(sel)
	zZinvAllTime = zZachTime() + 3
end

--newBegin quickloot new
function zZnewQuickLootOrigFrame()
	if groundItemsButtonToggle == 0 then return 0 else return 2 end
end
function zZnewQuickLootFrame()
	if zZinvQuickLoot == 0 then return 0 else return 2 end
end
function zZgroundItemText()
	if zZinvQuickLoot == 0 then return t("GROUND_LABEL") else return Infinity_FetchString(%str99897%) end
end
function zZgroundItemCountText()
	local str = ''
	if zZinvQuickLoot == 0 then
		str = Infinity_GetCurrentGroundPage()+1 .. '/' .. Infinity_GetMaxGroundPage()+1
	else
		str = '--'
		if worldScreen:GroundScrollEnabled(-1) then str = '<< ' .. str end
		if worldScreen:GroundScrollEnabled(1) then str = str .. ' >>' end
	end
	return str
end
function zZsCharEquipmentFrame()
	if zZshowCharEquipment == 0 then return 0 else return 2 end
end
function zZsCharEquipmentCheck()
	local idx = zZgetSelectedCharacterIndex()
	if idx == zZtempStoreEquipment then return end
	zZshowCharEquipment = 0
	zZtempStoreEquipment = -1
	zZsCharEquipment = {}
end
function zZsCharEquipmentCreate()
	zZsCharEquipment = {}
	local idx = zZgetSelectedCharacterIndex()
	id = Infinity_OnPortraitLClick(idx-1)
	Infinity_UpdateLuaStats()
		
	zZtempStoreEquipment = idx
	if characters[id].equipment.weapon0.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.weapon0, 12010, ' 1'})
	end
	if characters[id].equipment.weapon1.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.weapon1, 12010, ' 2'})
	end
	if characters[id].equipment.weapon2.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.weapon2, 12010, ' 3'})
	end
	if characters[id].equipment.weapon3.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.weapon3, 12010, ' 4'})
	end
	if characters[id].equipment.personal0.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.personal0, 12012, ' 1'})
	end
	if characters[id].equipment.personal1.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.personal1, 12012, ' 2'})
	end
	if characters[id].equipment.personal2.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.personal2, 12012, ' 3'})
	end
	if characters[id].equipment.armor.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.armor, 11997, ''})
	end
	if characters[id].equipment.gauntlets.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.gauntlets, 11998, ''})
	end
	if characters[id].equipment.helmet.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.helmet, 11999, ''})
	end
	if characters[id].equipment.amulet.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.amulet, 12000, ''})
	end
	if characters[id].equipment.quiver0.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.quiver0, 12009, ' 1'})
	end
	if characters[id].equipment.quiver1.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.quiver1, 12009, ' 2'})
	end
	if characters[id].equipment.quiver2.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.quiver2, 12009, ' 3'})
	end
	if characters[id].equipment.belt.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.belt, 12001, ''})
	end
	if characters[id].equipment.ringleft.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.ringleft, 12002, ''})
	end
	if characters[id].equipment.ringright.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.ringright, 12003, ''})
	end
	if characters[id].equipment.cloak.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.cloak, 12004, ''})
	end
	if characters[id].equipment.boots.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.boots, 12005, ''})
	end
	if characters[id].equipment.shield.empty == 0 then
		table.insert(zZsCharEquipment, {characters[id].equipment.shield, 12006, ''})
	end
end
--newEnd
--newBegin all identify
IdentAll = {
	invalidSlot = { valid = 0 }
}

function IdentAll:create()
	local self = setmetatable({}, { __index = self })
	self.keymap = keybindingsForIds({ 56, 57, 58, 59, 60, 61 })
	for _, i in pairs(self.keymap.missing) do
		popupInfo(string.format(
			"Shortcut to select character %d is unassigned.\n" ..
			"Inventory won't work correctly."
		, i))
		break
	end
	--characters
	self.charId = -1
	self.slotName = ''
	self.validIdx = -1
	self.exchChar = -1
	self.itemAllTable = {}
	self.itemValid = {}
	self.numValid = 0 --num items in valid table
	self.firstSlot = 1 --first slot for table
	self.selected = 0
	self.glow = 0
	self.charSlot = { [1] = nil, [2] = nil, [3] = nil, [4] = nil, [5] = nil, [6] = nil }
	self.charSelect = {}
	local cnt = Infinity_GetNumCharacters()
	self.count = 0
	self.currChar = id
	self.currCharKey = self.keymap[1]
	local slt = 2
	for i = 1, cnt do
		Infinity_OnPortraitLClick(i - 1)
		Infinity_UpdateLuaStats()
		if inventoryScreen:IsSpriteOrderable() then
			local char = characters[id]
			local name = char.name
			if self.currChar == id then
				self.charSlot[1] = { name=name, id=id, idx=i, key=self.keymap[i]}
				self.selected = 1
				self.currCharKey = self.keymap[i]
			else
				self.charSlot[slt] = { name=name, id=id, idx=i, key=self.keymap[i]}
				slt = slt + 1
			end
			self.count = self.count + 1
		end
	end
	Infinity_SetArea('zZidentSelectCharBkg', nil, nil, nil, 26 * (self.count-1) + 12)
	Infinity_SetArea('zZidentSelectCharList', nil, nil, nil, 26 * (self.count-1))
	self:SelChar(self.selected)
	self.valid = {
		['all']         = {1, 'all',         stringsAll.identAll},
		['notempty']    = {2, 'notempty',    stringsAll.identNoEmpty},
		['notidentify'] = {3, 'notidentify', stringsAll.identNoIdent}
	}
	self.validtwo = {}
	for k, v in pairs(self.valid) do
		self.validtwo[v[1]] = {v[2], v[3]}
	end
	self:createItemTable()
	self:createItemValid()
	self.createSelTbl = function()
		local k = 1
		self.charSelect = {}
		for i = 2, 6 do
			if self.charSlot[i] ~= nil then
				self.charSelect[k] = { name=self.charSlot[i].name, idx=self.charSlot[i].idx, lore=characters[self.charSlot[i].id].proficiencies.lore.current }
				k = k + 1
			end
		end
	end
	self.createSelTbl()
	self.swapChars = function(idx)
		local temp = self.charSlot[1]
		self.charSlot[1] = self.charSlot[idx]
		self.charSlot[idx] = temp
		self.createSelTbl()
		self:createItemTable()
		self:createItemValid()
		self:SelChar(1)
	end
	
	return self
end
function IdentAll:createItemTable()
	self.itemAllTable = {}
	for i = 1, 6 do
		if self.charSlot[i] ~= nil then
			local ids = self.charSlot[i].id
			local idx = self.charSlot[i].idx
			local name = self.charSlot[i].name
			local key = self.charSlot[i].key
			local char = characters[ids]
			local emptyCount = 16
			for j = 1, 16 do
				local slot = 'group' .. (j-1)
				local equip = char.equipment[slot]
				local empty = equip.empty
				local identified = 0
				local res = ''
				local nameitm = ''
				local desc = ''
				if empty == 0 then
					identified = equip.item.identified
					res = equip.item.res
					nameitm = equip.item.name
					desc = equip.item.description
				else
					emptyCount = emptyCount - 1
				end
				table.insert(self.itemAllTable, {
					char = { name=name, id=ids, idx=idx, key=key },
					item = { slot=slot, empty=empty, identified=identified, res=res, name=nameitm, desc=desc },
					selected = 0
				})
			end
			self.charSlot[i].empty = emptyCount
		end
	end
end
function IdentAll:createItemValid()
	TEXT_itemdescIdent = t('FC_IDENTIFY_ALL_DESC')
	self.glow = 0
	self.itemValid = {}
	self.numValid = 0
	self.firstSlot = 1
	local valid = self.valid[zZidentItemType][1]
	if not valid then return end
	for k, v in pairs(self.itemAllTable) do
		if valid == 1 then
			v.selected = 0
			table.insert(self.itemValid, v)
			self.numValid = self.numValid + 1
		elseif valid == 2 then
			if v.item.empty == 0 then
				v.selected = 0
				table.insert(self.itemValid, v)
				self.numValid = self.numValid + 1
			end
		elseif valid == 3 then
			if v.item.empty == 0 and v.item.identified == 0 then
				v.selected = 0
				table.insert(self.itemValid, v)
				self.numValid = self.numValid + 1
			end
		end
	end
end
function IdentAll:setItemSlot(slt)
	slt = slt or 1
	local slot = self.firstSlot + (slt - 1)
	local equip = self.itemValid[slot]
	if equip and slot <= self.numValid then
		local char = characters[equip.char.id]
		return char.equipment[equip.item.slot]
	end
	return self.invalidSlot
end
function IdentAll:Slot(inv_slot, char_slot)
	local char = characters[self.charSlot[char_slot].id]
	if char then
		return char.equipment['group' .. (inv_slot - 1)]
	end
	return self.invalidSlot
end
function IdentAll:setItemName(slt)
	slt = slt or 1
	local slot = self.firstSlot + (slt - 1)
	local equip = self.itemValid[slot]
	if equip and slot <= self.numValid then
		return equip.item.name .. '\n(^B' .. equip.char.name .. '^-)'
	end
	return ''
end
function IdentAll:incDecItem(val)
	if self.firstSlot + val > self.numValid - 7 then self.firstSlot = 1 end
	if self.firstSlot + val < 1 then self.firstSlot = 1
	else self.firstSlot = self.firstSlot + val end 
end
function IdentAll:chackIncDecItem(val)
	if self.firstSlot + val > self.numValid - 7 then return false end
	if self.firstSlot + val < 1 then return false end
	return true
end
function IdentAll:scrollList()
	if scrollDirection > 0 then
		if self:chackIncDecItem(-1) then self:incDecItem(-1) end
	elseif scrollDirection < 0 then
		if self:chackIncDecItem(1) then self:incDecItem(1) end
	end
end
function IdentAll:getItemProp(val, prop)
	local itm = characters[self.itemValid[self.firstSlot+val-1].char.id].equipment[self.itemValid[self.firstSlot+val-1].item.slot]
	return itm.item[prop]
end
function IdentAll:getEquipProp(val, prop)
	local ret = 0
	local eqp = self.itemValid[self.firstSlot+val-1]
	local itm = characters[eqp.char.id].equipment[eqp.item.slot]
	ret = itm[prop]
	if prop == 'highlight' then
		if eqp.selected == 1 then ret = 2 else ret = 0 end
	end
	return ret
end
function IdentAll:getDesc(val, bool)
	--bool = bool or true
	if bool == nil then bool = true end
	TEXT_itemdescIdent = t('FC_IDENTIFY_ALL_DESC')
	self.glow = 0
	if bool then val = self.firstSlot+val-1 else val = val end
	local itm = self.itemValid[val]
	if itm then
		TEXT_itemdescIdent = itm.item.desc
		self.glow = val
	end
end
function IdentAll:setExchChaar(val, bool)
	if bool == nil then bool = true end
	local itm = self.itemValid[self.firstSlot+val-1]
	self.exchChar = -1
	local idx = itm.char.idx
	if bool and itm and itm.item.identified == 0 then
		if idx ~= self.charSlot[1].idx and itm.selected == 1 then
			for i = 2, #self.charSlot do
				if idx == self.charSlot[i].idx then self.exchChar = i; break end
			end
			zZidentExchangeMode = 1
		end
	else
		if not bool then
			if idx ~= self.charSlot[1].idx and itm.item.identified ~= 0 then
				for i = 2, #self.charSlot do
					if idx == self.charSlot[i].idx then self.exchChar = i; break end
				end
				zZidentExchangeMode = 1
			end
		end
	end
end
function IdentAll:checkSelected(val)
	local itm = self.itemValid[self.firstSlot+val-1]
	if itm.selected == 1 then return true else return false end
end
function IdentAll:selectItem(val, bool)
	if bool == nil then bool = true end
	local tt = self.firstSlot+val-1
	if not bool then tt = val end
	local itm = self.itemValid[tt]
	self.charId = -1
	self.slotName = ''
	self.validIdx = -1
	if itm.selected == 1 then
		itm.selected = 0
		characters[itm.char.id].equipment[itm.item.slot].highlight = 0
	else
		if characters[itm.char.id].equipment[itm.item.slot].empty == 0 then
			itm.selected = 1
			self.charId = itm.char.id
			self.slotName = itm.item.slot
			self.validIdx = tt
			characters[itm.char.id].equipment[itm.item.slot].highlight = 1
		end
	end
	if itm.selected == 1 then
		for k, v in pairs(self.itemValid) do
			if k ~= tt then
				v.selected = 0
				characters[v.char.id].equipment[v.item.slot].highlight = 0
			end
		end
	end
	self:getDesc(val, bool)
end
function IdentAll:SelChar(n)
	local chslot = self.charSlot[n]
	if chslot then
		mouseOverPortrait = chslot.idx - 1
		Infinity_PressKeyboardButton(chslot.key)
	end
end
--newEnd















