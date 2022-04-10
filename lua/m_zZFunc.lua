zZlanguage = Infinity_GetINIString('Language', 'Text', '')

fontcolors['B'] = 'FFD1FAFF'
fontcolors['F'] = 'FF2DB4FF'
fontcolors['H'] = 'FF00C800'
fontcolors['I'] = 'FFC80000'
fontcolors['K'] = 'FFFFD700'
fontcolors['Q'] = 'FF0000C8'
fontcolors['W'] = 'FFFFFFFF'
fontcolors['O'] = 'FF646EC3'
fontcolors['Z'] = 'FF66717D'
fontcolors['Y'] = 'FF000040'
fontcolors['U'] = 'FF23292F'
fontcolors['L'] = 'FF70000A'
fontcolors['E'] = 'FF808080'

function updateTable(first, second)
	for k, v in pairs(second) do
		first[k] = v
	end
end

--newBegin vars
zZCharXP = 0
zZCharKill = 0
zZstrLen = 90
zzGlowEye = 0
zzAttribVar = 0
zzAttribVarZ = -1
zzClockActive = 0
zzCangePortrait = 0
zZdualClass = 0
zZcurrId = -1
zZcolorsFromInv = 0
zzUpdInfoAttrTable = 0
zZcurrIdInvAttr = -1
zzInDescription = 0
zzTextMaxSize = 30000
journalOpen = 0
zZlastQuest = nil
zzPauseJournal = 0
zzPauseWMap = 0
zZnumRecentQuest = 10
zZnoSelectPortrait = 0
zZmapTitle = 0
selectedCampaign = 0
zZupdateGraphicOpt = 0
zZshowRaceDesc = 0
zZZjournalListMode = 1
zZsortPortraitType = 0
zZfiltPortraitType = 2
zZhelpTextString = ''
zZstoreSearchString = ''
zZgroupSearchString = ''
zzLFilterSaveName = ""
zzLFilterName = ""
zzLFilterChapter = ""
zzSFilterSaveName = ""
zzSFilterName = ""
zzSFilterChapter = ""
zZcurrPortFiltText = ""

listDualProfs = {}
listCharItems = {}
zZJournalSequence = {}
zZquestAll = {}
zZquestAllExport = {}
zZquestListTable = {}
zZquestListAllList = {}

table.insert(zZJournalSequence, {2, 0})
--newEnd

--newBegin Options
zZoptHelpString = ''

function zzGetZOpt(z)
	local zOpt = 0
	if z == 1 then
		zOpt = 2
	else
		zOpt = 0
	end
	return zOpt
end
function zzSetZOpt(z)
	local zOpt = 0
	if z == 0 then
		zOpt = 0
	else
		zOpt = 1
	end
	return zOpt
end
function zZsaveZOptions(tbl)
	for k, v in pairs(tbl) do
		Infinity_SetINIValue('Tipun UI', v[6], v[5])
	end
end

--newBegin other_settings
zZotherSettings    = {}
toggleShowClock    = Infinity_GetINIValue('Tipun UI','Always Show Clock',0)
zZprofClickable    = Infinity_GetINIValue('Tipun UI','Dual edit profs',0)
zZrecentEvents     = Infinity_GetINIValue('Tipun UI','Recent Events',0)
zZoneClickTravel   = Infinity_GetINIValue('Tipun UI','One click travel',0)
zZwMapExitRClick   = Infinity_GetINIValue('Tipun UI','Exit WMap RMC',0)
zZmultiSteal       = Infinity_GetINIValue('Tipun UI','Multi Steal',0)
zZquickLootenabled = Infinity_GetINIValue('Tipun UI','Quick loot',0)
zZchooseMemMage = Infinity_GetINIValue('Tipun UI','Auto pck Mage spells',0)
table.insert(zZotherSettings, {'FC_SHOW_CLOCK', 'FC_SHOW_CLOCK_DESC', -300, zzGetZOpt(toggleShowClock), toggleShowClock, 'Always Show Clock'})
table.insert(zZotherSettings, {'FC_DUAL_PROFS', 'FC_DUAL_PROFS_DESC', -301, zzGetZOpt(zZprofClickable), zZprofClickable, 'Dual edit profs'})
table.insert(zZotherSettings, {'RECENT_EVENTS_LABEL', 'FC_RECENT_EVENTS_DESC', -302, zzGetZOpt(zZrecentEvents), zZrecentEvents, 'Recent Events'})
table.insert(zZotherSettings, {'FC_ONE_CLICK_TRAVEL', 'FC_ONE_CLICK_TRAVEL_DESC', -303, zzGetZOpt(zZoneClickTravel), zZoneClickTravel, 'One click travel'})
table.insert(zZotherSettings, {'FC_EXIT_WMAP_RIGHT_CLICK', 'FC_EXIT_WMAP_RIGHT_CLICK_DESC', -304, zzGetZOpt(zZwMapExitRClick), zZwMapExitRClick, 'Exit WMap RMC'})
table.insert(zZotherSettings, {'FC_MULTI_STEAL', 'FC_MULTI_STEAL_DESC', -305, zzGetZOpt(zZmultiSteal), zZmultiSteal, 'Multi Steal'})
table.insert(zZotherSettings, {'FC_QUICKLOOT_LABEL', 'FC_QUICKLOOT_DESC', -306, zzGetZOpt(zZquickLootenabled), zZquickLootenabled, 'Quick loot'})
table.insert(zZotherSettings, {'FC_AUTOPICK_LABEL', 'FC_AUTOPICK_DESC', -307, zzGetZOpt(zZchooseMemMage), zZchooseMemMage, 'Auto pck Mage spells'})

function zZupdateOtherOptionsVars(nm)
	if zZotherSettings[nm][3]     == -300 then toggleShowClock    = zZotherSettings[nm][5]
	elseif zZotherSettings[nm][3] == -301 then zZprofClickable    = zZotherSettings[nm][5]
	elseif zZotherSettings[nm][3] == -302 then zZrecentEvents     = zZotherSettings[nm][5]
	elseif zZotherSettings[nm][3] == -303 then zZoneClickTravel   = zZotherSettings[nm][5]
	elseif zZotherSettings[nm][3] == -304 then zZwMapExitRClick   = zZotherSettings[nm][5]
	elseif zZotherSettings[nm][3] == -305 then zZmultiSteal       = zZotherSettings[nm][5]
	elseif zZotherSettings[nm][3] == -306 then zZquickLootenabled = zZotherSettings[nm][5]
	elseif zZotherSettings[nm][3] == -307 then zZchooseMemMage    = zZotherSettings[nm][5]
	end
end
--newEnd
--newBegin general settings
zZgeneralSettings = {}
toggleJournal = Infinity_GetINIValue('Tipun UI','Large Journal',0)
toggleMageBook = Infinity_GetINIValue('Tipun UI','Mage Book',0)
togglePriestBook = Infinity_GetINIValue('Tipun UI','Priest Book',0)
zZachShowAchivements = Infinity_GetINIValue('Tipun UI','Achievements',1)
zZachShowAchivementsActive = Infinity_GetINIValue('Tipun UI','Achievements Active',0)
zZachShowAchivementsNodone = Infinity_GetINIValue('Tipun UI','Achievements No Done',0)
zZgeneralInventory = Infinity_GetINIValue('Tipun UI','General inventory',1)
zZidentifyScreen = Infinity_GetINIValue('Tipun UI','Identify Screen',0)
zZNPCallEnabled = Infinity_GetINIValue('Tipun UI','NPC Descrioption',0)
table.insert(zZgeneralSettings, {'FC_LARGE_JOURNAL', 'FC_LARGE_JOURNAL_DESC', -400, zzGetZOpt(toggleJournal), toggleJournal, 'Large Journal'})
table.insert(zZgeneralSettings, {'FC_MAGE_BOOK', 'FC_MAGE_BOOK_DESC', -401, zzGetZOpt(toggleMageBook), toggleMageBook, 'Mage Book'})
table.insert(zZgeneralSettings, {'FC_PRIEST_BOOK', 'FC_PRIEST_BOOK_DESC', -402, zzGetZOpt(togglePriestBook), togglePriestBook, 'Priest Book'})
table.insert(zZgeneralSettings, {'FC_ALL_INVENTORYB', 'FC_ALL_INVENTORYB_DESC', -406, zzGetZOpt(zZgeneralInventory), zZgeneralInventory, 'General inventory'})
table.insert(zZgeneralSettings, {'FC_IDENTIFY_ALL_LABEL', 'FC_IDENTIFY_ALL_DESCOPT', -407, zzGetZOpt(zZidentifyScreen), zZidentifyScreen, 'Identify Screen'})
table.insert(zZgeneralSettings, {'FC_ACHIEVEM_LABEL', 'FC_ACHIEVEM_DESC', -403, zzGetZOpt(zZachShowAchivements), zZachShowAchivements, 'Achievements'})
table.insert(zZgeneralSettings, {'FC_ACHIEVEM_ACTIVE_LABEL', 'FC_ACHIEVEM_ACTIVE_DESC', -404, zzGetZOpt(zZachShowAchivementsActive), zZachShowAchivementsActive, 'Achievements Active'})
table.insert(zZgeneralSettings, {'FC_ACHIEVEM_NODONE_LABEL', 'FC_ACHIEVEM_NODONE_DESC', -405, zzGetZOpt(zZachShowAchivementsNodone), zZachShowAchivementsNodone, 'Achievements No Done'})
table.insert(zZgeneralSettings, {'FC_NPCALL_LABEL', 'FC_NPCALL_DESC', -408, zzGetZOpt(zZNPCallEnabled), zZNPCallEnabled, 'NPC Descrioption'})


function zZupdateGeneralOptionsVars(nm)
	if zZgeneralSettings[nm][3]     == -400 then toggleJournal              = zZgeneralSettings[nm][5]
	elseif zZgeneralSettings[nm][3] == -401 then toggleMageBook             = zZgeneralSettings[nm][5]
	elseif zZgeneralSettings[nm][3] == -402 then togglePriestBook           = zZgeneralSettings[nm][5]
	elseif zZgeneralSettings[nm][3] == -403 then zZachShowAchivements       = zZgeneralSettings[nm][5]
		if zZachShowAchivements == 0 then
			zZachShowAchivementsActive = 0
			zZachShowAchivementsNodone = 0
		end
		zZgeneralSettings[nm+1][4] = zzGetZOpt(zZachShowAchivementsActive)
		zZgeneralSettings[nm+2][4] = zzGetZOpt(zZachShowAchivementsNodone)
	elseif zZgeneralSettings[nm][3] == -404 then zZachShowAchivementsActive = zZgeneralSettings[nm][5]
		if zZachShowAchivements == 0 then
			zZachShowAchivementsActive = 0
			zZachShowAchivementsNodone = 0
		elseif zZachShowAchivementsActive == 0 then
			zZachShowAchivementsNodone = 0
		end
		zZgeneralSettings[nm][4] = zzGetZOpt(zZachShowAchivementsActive)
		zZgeneralSettings[nm+1][4] = zzGetZOpt(zZachShowAchivementsNodone)
	elseif zZgeneralSettings[nm][3] == -405 then zZachShowAchivementsNodone = zZgeneralSettings[nm][5]
		if zZachShowAchivements == 0 or zZachShowAchivementsActive == 0 then
			zZachShowAchivementsNodone = 0
		end
		zZgeneralSettings[nm][4] = zzGetZOpt(zZachShowAchivementsNodone)
	elseif zZgeneralSettings[nm][3] == -406 then zZgeneralInventory         = zZgeneralSettings[nm][5]
	elseif zZgeneralSettings[nm][3] == -407 then zZidentifyScreen           = zZgeneralSettings[nm][5]
	elseif zZgeneralSettings[nm][3] == -408 then zZidentifyScreen           = zZgeneralSettings[nm][5]
	end
end

--newEnd
--newEnd

--newBegin auxiliary functions
function zZinvertBoolI(bb)
	local ret = 1
	if bb == 0 then ret = 1 else ret = 0 end
	return ret
end
function zZgetTableSize(tbl)
	local x = 0
	for k, v in pairs(tbl) do x = x + 1 end
	return x
end
function zZmakeTable(length)
	local t = {}
	for i=0,length do
		table.insert(t, 1, '')
	end
	return t
end
function zZgetSpellOpacity(num)
	if bottomSpells[num].castable == 0 then
		return 180
	end
	return 255
end
function zZgetStringTable(st, sp)
	local sss = {}
	local b, e = 0, 0
	local a = ""
	repeat
		b, e = string.find(st, sp, 1, true)
		if b ~= nil then
			a = string.sub(st, 1, b - 1)
			a = string.gsub(a, "\n", "")
			table.insert(sss, {nil, a})
			st = string.sub(st, e + 1)
		end
	until b == nil
	table.insert(sss, {nil, st})
	return sss
end
function zZcolorize(st, sp, clr)
	clr = clr or 'O'
	local sss, sss2 = "", ""
	local x, d = 0, 0
	sss, sss2, d = zZgetSubString(st, sp)
	if d == 1 then
		x = string.len(sss)
		if x ~= nil and x <= zZstrLen then sss = '^' .. clr .. sss .. '^-' .. sp end
	end
	sss = sss .. sss2
	return sss
end
function zZcolorizeString(str, sep, clr)
	clr = clr or 'O'
	local st = {}
	local sss, sssa, su = "", "", ""
	sss = ""
	st = zZgetStringTable(str, "\n")
	for k, v in pairs(st) do
		sssa = v[2]
		if sss == "" then su = "" else su = "\n" end
		sssa = zZcolorize(sssa, sep, clr)
		sss = sss .. su .. sssa
	end
	return sss
end
--newEnd

--newBegin Text Functions
zZcyrSymbols = {
	{'А', 'а'},
	{'Б', 'б'},
	{'В', 'в'},
	{'Г', 'г'},
	{'Д', 'д'},
	{'Е', 'е'},
	{'Ё', 'ё'},
	{'Ж', 'ж'},
	{'З', 'з'},
	{'И', 'и'},
	{'Й', 'й'},
	{'К', 'к'},
	{'Л', 'л'},
	{'М', 'м'},
	{'Т', 'т'},
	{'О', 'о'},
	{'П', 'п'},
	{'Р', 'р'},
	{'С', 'с'},
	{'Т', 'т'},
	{'У', 'у'},
	{'Ф', 'ф'},
	{'Х', 'х'},
	{'Ц', 'ц'},
	{'Ч', 'ч'},
	{'Ш', 'ш'},
	{'Щ', 'щ'},
	{'Ъ', 'ъ'},
	{'Ы', 'ы'},
	{'Ь', 'ь'},
	{'Э', 'э'},
	{'Ю', 'ю'},
	{'Я', 'я'},
}
function zZtoLowerEx(str)
	for k, v in pairs(zZcyrSymbols) do
		str = string.gsub(str, v[1], v[2])
	end
	return str
end
function zZtoUpperEx(str)
	for k, v in pairs(zZcyrSymbols) do
		str = string.gsub(str, v[2], v[1])
	end
	return str
end
function zZgetSubString(s, fnd)
	local txa = ""
	local txb = ""
	local x = 0
	local y = 0
	local done = 0
	x, y = string.find(s, fnd, 1 , true)
	if x ~= nil then
		txa = string.sub(s, 1, x - 1)
		txb = string.sub(s, y + 1)
		done = 1
	else
		txa = s
		txb = ""
	end
	return txa, txb, done
end
function zZgetSubStringNumber(s, fnd)
	local txa = ""
	local txb = ""
	local txalvl = ""
	local x, y, z
	x, z = string.find(s, fnd, 1, true)
	if x ~= nil then
		txa = string.sub(s, 1, x - 1)
		txb = string.sub(s, z + 1) --+2
		y = string.find(txa, "%d", 1)
		if y ~= nil then txalvl = string.sub(txa, y) end
	else
		y = string.find(s, "%d", 1)
		if y ~= nil then txalvl = string.sub(s, y) end
		txb = ""
	end
	return txalvl, txb
end

function zZutfToAscii(str)
	local zzChars = {}
	local cnt = string.len(str)
	local cn, nm, xx, conv = 0, 0, 0, 0
	for i = 1, cnt, 1 do
		nm = string.byte(str, i)
		if nm >= 224 then table.insert(zzChars, {nil, nm, false}); cn = 0
		elseif nm >= 192 then 
			xx = nm
			cn = 1
		elseif nm < 128 then table.insert(zzChars, {nil, nm, true}); cn = 0
		elseif nm > 127 and nm < 192 then
			if cn == 1 then
				conv = (xx - 192) * 64 + nm - 128
				if conv >= 192 and conv <= 255 then conv = conv + 848 end
				if conv == 168 then conv = conv + 857 end
				if conv == 184 then conv = conv + 921 end
				table.insert(zzChars, {nil, conv, true})
				cn = 0
			else
				table.insert(zzChars, {nil, xx, false})
				table.insert(zzChars, {nil, nm, false})
				cn = 0
			end
		end
	end
	return zzChars
end
function zZasciiToUtf(zzTbl)
	local zzSssss = {}
	local conv, b1, b2 = 0, 0, 0
	for k, v in pairs(zzTbl) do
		if v[2] < 128 or v[3] == false then
			table.insert(zzSssss, {nil, v[2]})
		else
			conv = v[2]
			if (conv >= 192 and conv <= 255) or conv == 168 or conv == 184 then
				if conv == 168 then conv = conv + 857
				elseif conv == 184 then conv = conv + 921
				else conv = conv + 848 end
				b1 = conv % 64
				b2 = (conv - b1) / 64 + 192
				b1 = b1 + 128
				table.insert(zzSssss, {nil, b2})
				table.insert(zzSssss, {nil, b1})
			else
				table.insert(zzSssss, {nil, conv})
			end
		end
	end
	return zzSssss
end
function zZtoUpper(str, idx, num, find)
	if find ~= nil then
		
	end
	idx = idx or 1
	if idx < 1 then idx = 1 end
	local strlen = string.len(str)
	num = num or strlen
	num = num + idx - 1
	if num > strlen then num = strlen end
	local zzTbla = zZutfToAscii(str)
	local zzTblb = {}
	local stra, s = "", ""
	local x, y, aa, o = 0, 0, 0, 0
	for k, v in pairs(zzTbla) do
		x = x + 1
		y = y + 1
		if v[3] then
			aa = v[2]
			if aa < 128 then s = string.char(aa); s = string.upper(s); aa = string.byte(s)
			elseif aa == 1105 then
				if y >= idx and x <= num then o = 16 else o = 0 end
				aa = aa - o - 921
			elseif aa >= 1072 and aa <= 1103 then
				if y >= idx and x <= num then o = 32 else o = 0 end
				aa = aa - o - 848
			elseif aa == 1025 then aa = aa - 857
			elseif aa >= 1040 and aa <= 1071 then aa = aa - 848
			end
			v[2] = aa
		end
	end
	zzTblb = zZasciiToUtf(zzTbla)
	for k, v in pairs(zzTblb) do
		stra = stra .. string.char(v[2])
	end
	return stra
end
function zZtoLower(str, idx, num)
	idx = idx or 1
	if idx < 1 then idx = 1 end
	local strlen = string.len(str)
	num = num or strlen
	num = num + idx - 1
	if num > strlen then num = strlen end
	local zzTbla = zZutfToAscii(str)
	local zzTblb = {}
	local stra, s = "", ""
	local x, y, aa, o = 0, 0, 0, 0
	for k, v in pairs(zzTbla) do
		x = x + 1
		y = y + 1
		if v[3] then
			aa = v[2]
			if aa < 128 then s = string.char(aa); s = string.lower(s); aa = string.byte(s)
			elseif aa == 1025 then
				if y >= idx and x <= num then o = 16 else o = 0 end
				aa = aa + o - 857
			elseif aa >= 1040 and aa <= 1071 then
				if y >= idx and x <= num then o = 32 else o = 0 end
				aa = aa + o - 848
			elseif aa == 1105 then aa = aa - 921
			elseif aa >= 1072 and aa <= 1103 then aa = aa - 848
			end
			v[2] = aa
		end
	end
	zzTblb = zZasciiToUtf(zzTbla)
	for k, v in pairs(zzTblb) do
		stra = stra .. string.char(v[2])
	end
	return stra
end
--newEnd

--newBegin autoloot
function alphanumericSortEntries(o)
   local function conv(s)
      local res, dot = "", ""
      for n, m, c in tostring(s):gmatch"(0*(%d*))(.?)" do
         if n == "" then
            dot, c = "", dot..c
         else
            res = res..(dot == "" and ("%03d%s"):format(#m, m) or "."..n)
            dot, c = c:match"(%.?)(.*)"
         end
         res = res..c:gsub(".", "\0%0")
      end
      return res
   end
   table.sort(o,
      function (a, b)
         local ca, cb = conv(a.string), conv(b.string)
         return ca < cb or ca == cb and a.string < b.string
      end)
   return o
end

function fillDumpLevel(tableName, levelTable, levelToFill, levelTableKey)
	local tableKey, tableValue = next(levelTable, levelTableKey)
	while tableValue ~= nil do
		local tableValueType = type(tableValue)
		if tableValueType == 'string' or tableValueType == 'number' or tableValueType == 'boolean' then
			local entry = {}
			entry.string = tableValueType..' '..tableKey..' = '
			entry.value = tableValue
			table.insert(levelToFill, entry)
		elseif tableValueType == 'table' then
			if tableKey ~= '_G' then
				local entry = {}
				entry.string = tableValueType..' '..tableKey..':\n'
				entry.value = {}
				entry.value.previous = {}
				entry.value.previous.tableName = tableName
				entry.value.previous.levelTable = levelTable
				entry.value.previous.levelToFill = levelToFill
				entry.value.previous.levelTableKey = tableKey
				table.insert(levelToFill, entry)
				return fillDumpLevel(tableKey, tableValue, entry.value)
			end
		elseif tableValueType == 'userdata' then
			metatable = getmetatable(tableValue)
			local entry = {}
			if metatable ~= nil then
				entry.string = tableValueType..' '..tableKey..':\n'
				entry.value = {}
				entry.value.previous = {}
				entry.value.previous.tableName = tableName
				entry.value.previous.levelTable = levelTable
				entry.value.previous.levelToFill = levelToFill
				entry.value.previous.levelTableKey = tableKey
				table.insert(levelToFill, entry)
				return fillDumpLevel(tableKey, metatable, entry.value)
			else
				entry.string = tableValueType..' '..tableKey..' = '
				entry.value = 'nil'
				table.insert(levelToFill, entry)
			end
		else
			local entry = {}
			entry.string = tableValueType..' '..tableKey
			entry.value = nil
			table.insert(levelToFill, entry)
		end
		--Iteration
		tableKey, tableValue = next(levelTable, tableKey)
		--Iteration
	end
	--Sort the now finished level
	alphanumericSortEntries(levelToFill)
	--Sort the now finished level
	local previous = levelToFill.previous
	if previous ~= nil then
		--Clear out "previous" metadata, as it is no longer needed.
		local previousTableName = previous.tableName
		local previousLevelTable = previous.levelTable
		local previousLevelToFill = previous.levelToFill
		local previousLevelTableKey = previous.levelTableKey
		levelToFill.previous = nil
		--Clear out "previous" metadata, as it is no longer needed.
		return fillDumpLevel(previousTableName, previousLevelTable, previousLevelToFill, previousLevelTableKey)
	else
		return levelToFill
	end
end

function printEntries(entriesTable, indentLevel, indentStrings, previousState, levelTableKey)
	tableEntryKey, tableEntry = next(entriesTable, levelTableKey)
	while(tableEntry ~= nil) do
		tableEntryString = tableEntry.string
		tableEntryValue = tableEntry.value
		indentString = indentStrings[indentLevel]
		if tableEntryValue ~= nil then
			if type(tableEntryValue) ~= 'table' then
				valueToPrint = string.gsub(tostring(tableEntryValue), '\n', '\\n')
				print(indentString..tableEntryString..valueToPrint)
			else
				print(indentString..tableEntryString)
				print(indentString..'{')
				local previous = {}
				previous.entriesTable = entriesTable
				previous.indentLevel = indentLevel
				previous.levelTableKey = tableEntryKey
				previous.previousState = previousState
				indentLevel = indentLevel + 1
				indentStringsSize = #indentStrings
				if indentLevel > indentStringsSize then
					indentStrings[indentStringsSize + 1] = indentStrings[indentStringsSize]..'\t'
				end
				return printEntries(tableEntryValue, indentLevel, indentStrings, previous)
			end
		else
			print(indentString..tableEntryString)
		end
		--Increment
		tableEntryKey, tableEntry = next(entriesTable, tableEntryKey)
		--Increment
	end
	print(indentStrings[indentLevel - 1]..'}')
	--Finish previous levels
	if previousState ~= nil then
		return printEntries(previousState.entriesTable, previousState.indentLevel, indentStrings,
							previousState.previousState, previousState.levelTableKey)
	end
end

function dump(key, valueToDump)
	valueToDumpType = type(valueToDump)
	if valueToDumpType == 'string' or valueToDumpType == 'number' or valueToDumpType == 'boolean' then
		print(valueToDumpType..' '..key..' = '..valueToDump)
	elseif valueToDumpType == 'table' then
		print(valueToDumpType..' '..key..':')
		print('{')
		entries = fillDumpLevel(key, valueToDump, {})
		printEntries(entries, 1, {[0] = '', [1] = '\t'})
	elseif valueToDumpType == 'userdata' then
		metatable = getmetatable(valueToDump)
		if metatable ~= nil then
			print(valueToDumpType..' '..key..':')
			print('{')
			entries = fillDumpLevel(key, metatable, {})
			printEntries(entries, 1, {[0] = '', [1] = '\t'})
		else
			print(valueToDumpType..' '..key..' = nil')
		end
	else
		print(valueToDumpType..' '..key)
	end
end

function doesCharacterHaveSpace()
	characters = {}
	Infinity_UpdateLuaStats()
	for key, character in pairs(characters) do
		local equipment = character.equipment
		for i = 0, 15, 1 do
			local groupKey = "group"..i
			local isEmpty = equipment[groupKey].empty
			if isEmpty == 1 then
				return true
			end
		end
	end
	return false
end

function getPricePerWeight(price, weight)
	if price == 0 then
		return 0
	elseif weight == 0 then
		return price
	else
		return price / weight
	end
end

function decideWhetherToPickUp(itemRes, itemInfo)
	-- Critical Items
	if bubbAutolootOptionsCriticalItemsToggle == 1 then
		if itemInfo.critical == 1 then
			return true
		end
	end
	-- Enchanted Weapons
	if bubbAutolootOptionsEnchantedWeaponsToggle == 1 then
		if bubbAutolootOptionsEnchantedWeaponsField ~= "" then
			if itemInfo.enchantment >= tonumber(bubbAutolootOptionsEnchantedWeaponsField) then
				return true
			end
		end
	end
	-- Gold
	if bubbAutolootOptionsGoldToggle == 1 then
		if itemRes == "MISC07" then
			return true
		end
	end
	-- Price
	if bubbAutolootOptionsPriceToggle == 1 then
		if bubbAutolootOptionsPriceField ~= "" then
			if itemInfo.price >= tonumber(bubbAutolootOptionsPriceField) then
				return true
			end
		end
	end
	-- Price per Weight
	if bubbAutolootOptionsPricePerWeightToggle == 1 then
		if bubbAutolootOptionsPricePerWeightField ~= "" then
			if getPricePerWeight(itemInfo.price, itemInfo.weight) >= tonumber(bubbAutolootOptionsPricePerWeightField) then
				return true
			end
		end
	end
	return false
end

function pickupLoot()
	if bubbAutolootOptionsOnToggle == 1 then
		-- Stupid check because LUA starts tables at index 1
		if loot.groundItems[0] == nil then
			return
		end
		local groundItemCount = #loot.groundItems
		for i = groundItemCount, 0, -1 do
			if doesCharacterHaveSpace() then
				local groundItemSlot = loot.groundItems[i]
				local groundItem = groundItemSlot.item
				local info = zzItemListAll[groundItem.res]
				if decideWhetherToPickUp(groundItem.res, info) then
					Infinity_DisplayString(stringsAll.pickupLootInfo .. groundItem.name)
					worldScreen:OnGroundButtonClick(groundItemSlot.slotId, groundItemSlot.containerId, groundItem.res)
				end
			else
				return
			end
		end
	end
end

function initializeAutolootOptionsMenu(itemName)
	local screenWidth, screenHeight = Infinity_GetScreenSize()
	local backgroundX, backgroundY, backgroundWidth, backgroundHeight = Infinity_GetArea('bubbAutolootOptionsBackground')
	local horizontalMargin = screenWidth - backgroundWidth
	local newBackGroundX = horizontalMargin / 2
	local verticalMargin = screenHeight - backgroundHeight
	local newBackGroundY = verticalMargin / 2
	-- Background
	Infinity_SetArea('bubbAutolootOptionsBackground', newBackGroundX, newBackGroundY, nil, nil)
	-- Exit Button
	Infinity_SetArea('bubbAutolootOptionsExitButton', newBackGroundX + backgroundWidth - 54, newBackGroundY + 10, nil, nil)
	-- Autoloot On
	Infinity_SetArea('bubbAutolootOptionsOnToggle', newBackGroundX + 10, newBackGroundY + 10 + (32 + 10) * 0, nil, nil)
	Infinity_SetArea('bubbAutolootOptionsOn',       newBackGroundX + 52, newBackGroundY + 10 + (32 + 10) * 0, nil, nil)
	-- Critical Items
	Infinity_SetArea('bubbAutolootOptionsCriticalItemsToggle', newBackGroundX + 10, newBackGroundY + 10 + (32 + 10) * 1, nil, nil)
	Infinity_SetArea('bubbAutolootOptionsCriticalItems',       newBackGroundX + 52, newBackGroundY + 10 + (32 + 10) * 1, nil, nil)
	-- Enchanted Weapons
	Infinity_SetArea('bubbAutolootOptionsEnchantedWeaponsToggle', newBackGroundX + 10, newBackGroundY + 10 + (32 + 10) * 2, nil, nil)
	Infinity_SetArea('bubbAutolootOptionsEnchantedWeapons',      newBackGroundX + 52, newBackGroundY + 10 + (32 + 10) * 2, nil, nil)
	Infinity_SetArea('bubbAutolootOptionsEnchantedWeaponsField', newBackGroundX + 52 + 356 + 5, newBackGroundY + 10 + (32 + 10) * 2, nil, nil)
	-- Gold
	Infinity_SetArea('bubbAutolootOptionsGoldToggle', newBackGroundX + 10, newBackGroundY + 10 + (32 + 10) * 3, nil, nil)
	Infinity_SetArea('bubbAutolootOptionsGold',       newBackGroundX + 52, newBackGroundY + 10 + (32 + 10) * 3, nil, nil)
	-- Price
	Infinity_SetArea('bubbAutolootOptionsPriceToggle', newBackGroundX + 10,           newBackGroundY + 10 + (32 + 10) * 4, nil, nil)
	Infinity_SetArea('bubbAutolootOptionsPrice',       newBackGroundX + 52,           newBackGroundY + 10 + (32 + 10) * 4, nil, nil)
	Infinity_SetArea('bubbAutolootOptionsPriceField',  newBackGroundX + 52 + 356 + 5, newBackGroundY + 10 + (32 + 10) * 4, nil, nil)
	-- Price per Weight
	Infinity_SetArea('bubbAutolootOptionsPricePerWeightToggle', newBackGroundX + 10, newBackGroundY + 10 + (32 + 10) * 5, nil, nil)
	Infinity_SetArea('bubbAutolootOptionsPricePerWeight',       newBackGroundX + 52, newBackGroundY + 10 + (32 + 10) * 5, nil, nil)
	Infinity_SetArea('bubbAutolootOptionsPricePerWeightField',  newBackGroundX + 52 + 356 + 5, newBackGroundY + 10 + (32 + 10) * 5, nil, nil)

end

function zZautolootSeq()
	local bool = loot.groundItems[0] ~= nil
	if bool then return 18 else return 16 end
end

bubbAutolootOptionsActive =                 Infinity_GetINIValue('Bubb Autoloot', 'bubbAutolootOptionsActive',                   0)
bubbAutolootOptionsOnToggle =               Infinity_GetINIValue('Bubb Autoloot', 'bubbAutolootOptionsOnToggle',                 0)
bubbAutolootOptionsCriticalItemsToggle =    Infinity_GetINIValue('Bubb Autoloot', 'bubbAutolootOptionsCriticalItemsToggle',      0)
bubbAutolootOptionsEnchantedWeaponsToggle = Infinity_GetINIValue('Bubb Autoloot', 'bubbAutolootOptionsEnchantedWeaponsToggle',   0)
bubbAutolootOptionsEnchantedWeaponsField =  Infinity_GetINIValue('Bubb Autoloot', 'bubbAutolootOptionsEnchantedWeaponsField',  '1')
bubbAutolootOptionsGoldToggle =             Infinity_GetINIValue('Bubb Autoloot', 'bubbAutolootOptionsGoldToggle',               0)
bubbAutolootOptionsPriceToggle =            Infinity_GetINIValue('Bubb Autoloot', 'bubbAutolootOptionsPriceToggle',              0)
bubbAutolootOptionsPriceField =             Infinity_GetINIValue('Bubb Autoloot', 'bubbAutolootOptionsPriceField',             '1')
bubbAutolootOptionsPricePerWeightToggle =   Infinity_GetINIValue('Bubb Autoloot', 'bubbAutolootOptionsPricePerWeightToggle',     0)
bubbAutolootOptionsPricePerWeightField =    Infinity_GetINIValue('Bubb Autoloot', 'bubbAutolootOptionsPricePerWeightField',    '1')

bubbAutolootOptionsPausedOnOpen = false
--newEnd

--newBegin Characer Record Functions
function zZdisplayTHAC()
	thactxt = ''
	thactxt =  characters[currentID].THAC0.current
	if (characters[currentID].THAC0.offhand ) then
		thactxt = thactxt .. ' / ' .. characters[currentID].THAC0.offhand
	end
	return thactxt
end
function zZgetDamage()
	local str = characters[currentID].damage.min .. '-' .. characters[currentID].damage.max
	if(characters[currentID].damage.minOffhand and characters[currentID].damage.maxOffhand) then
		str = str .. "\n" .. characters[currentID].damage.minOffhand .. '-' .. characters[currentID].damage.maxOffhand 
	end
	return str
end

--newBegin classes functions
function zZgenerateClsResult(z)
	clsStr, z = zZgetSubString(z, ":")
	lvlNum, z = zZgetSubStringNumber(z, "\n")
	zcrXP, z = zZgetSubStringNumber(z, "\n")
	znxtXP, z = zZgetSubStringNumber(z, "\n")
	return clsStr, lvlNum, zcrXP, znxtXP
end
function zZgenClsStr(clsz, lvlz, xpcz, xpnz, lvlzz, check, drain)
	local strexp = '/^$' .. xpnz .. '^-'
	local x = 0
	local y = 0
	if check == true then
		if xpnz == "" or xpnz == nil then
			x = tonumber(lvlz)
			y = tonumber(lvlzz)
			multclass = 2
			if x >= y then strexp = ' (^$' .. stringsAll.notacti .. '^-)'
			else
				strexp = ' (^$' .. stringsAll.acti .. '^-)'
				dualactive = 1
			end
		end
	end
	if drain ~= 0 then
		xpcz = '^R' .. Infinity_FetchString(%str57435%) .. '^-'
		strexp = ''
	end
	return '^O' .. clsz .. '^-:  ' .. stringsAll.lvl .. ' ^F' .. lvlz .. '^- ' .. stringsAll.exp .. ' ' .. xpcz .. strexp
end
function zZgetAllLevelString()
	multclass = 0
	zZsetVariables()
	local out = characters[currentID].classlevel.first.details
	local sss = ""
	local sssa = ""
	local sssb = ""
	local sssc = ""
	local cls, lvl, xpc, xpn = zZgenerateClsResult(out)
	local lvlu = lvl
	local aa, bb, cc = 0
	lvlFirst = tonumber(lvl)
	xpFirst = tonumber(xpc)
	xpNextFirst = tonumber(xpn)
	nameFirst = cls
	xpFirstLvl = zZgetCurrentLevelString(nameFirst, lvlFirst)
	sssa = zZgenClsStr(cls, lvl, xpc, xpn, lvlu, false, 0)
	aa = xpn - xpc
	if aa < 0 then aa = 0 end
	if ( characters[currentID].classlevel.second ) then
		multclass = 1
		out = characters[currentID].classlevel.second.details
		cls, lvl, xpc, xpn = zZgenerateClsResult(out)
		lvlSecond = tonumber(lvl)
		nameSecond = cls
		sssb = zZgenClsStr(cls, lvl, xpc, xpn, lvlu, true, 0)
		if multclass == 1 then
			xpSecond = tonumber(xpc)
			xpNextSecond = tonumber(xpn)
			bb = xpn - xpc
			if bb < 0 then bb = 0 end
			xpSecondLvl = zZgetCurrentLevelString(nameSecond, lvlSecond)
		end
	end
	if ( characters[currentID].classlevel.third ) then
		multclass = 3
		out = characters[currentID].classlevel.third.details
		cls, lvl, xpc, xpn = zZgenerateClsResult(out)
		lvlThird = tonumber(lvl)
		xpThird = tonumber(xpc)
		xpNextThird = tonumber(xpn)
		nameThird = cls
		sssc = zZgenClsStr(cls, lvl, xpc, xpn, lvlu, false, 0)
		xpThirdLvl = zZgetCurrentLevelString(nameThird, lvlThird)
		cc = xpn - xpc
		if cc < 0 then cc = 0 end
	end
	if (multclass == 1 or multclass == 3) then
		if sssb ~= "" then sssa = sssa .. ' (^A' .. aa .. '^-)' end
		if sssb ~= "" then sssb = sssb .. ' (^A' .. bb .. '^-)' end
		if multclass == 3 and sssc ~= "" then sssc = sssc .. ' (^A' .. cc .. '^-)' end
	end
	sss = sss .. sssa
	if sssb ~= "" then sss = sss .. '\n' .. sssb end
	if sssc ~= "" then sss = sss .. '\n' .. sssc end
	local zstr = ""
	if multclass == 1 or multclass == 3 then
		zstr = Infinity_FetchString(19721)
		zstr = '^O' .. zstr .. '^-\n'
	elseif multclass == 2 then
		zstr = Infinity_FetchString(19722)
		zstr = '^O' .. zstr .. '^-\n'
	end
	sss = zstr .. sss
	return sss
end
function zZgetLevelDrain()
	local ret = ''
	local str, ssa, ssb = '', '', ''
	local sss = ''
	local x, y  = 0, 0
	str = characters[currentID].classlevel.first.details
	ssa, str = zZgetSubString(str, '\n')
	sss = Infinity_FetchString(%str57435%)
	if str == sss then
		drained = 1
		ssa, ssb = zZgetSubString(ssa, ':')
		ssb = zZgetSubStringNumber(ssb .. '\n', '\n')
		nameFirst = ssa
		lvlFirst = tonumber(ssb)
		ret = zZgenClsStr(ssa, ssb, 0, 0, '0', false, 1)
	end
	if drained == 1 then
		if ( characters[currentID].classlevel.second ) then
			str = characters[currentID].classlevel.second.details
			ssa, str = zZgetSubString(str, '\n')
			ssa, ssb = zZgetSubString(ssa, ':')
			ssb = zZgetSubStringNumber(ssb .. '\n', '\n')
			nameSecond = ssa
			lvlSecond = tonumber(ssb)
			ret = ret .. '\n' .. zZgenClsStr(ssa, ssb, 0, 0, '0', false, 1)
			multclass = 2
		end
		if ( characters[currentID].classlevel.third ) then
			str = characters[currentID].classlevel.third.details
			ssa, str = zZgetSubString(str, '\n')
			ssa, ssb = zZgetSubString(ssa, ':')
			ssb = zZgetSubStringNumber(ssb .. '\n', '\n')
			nameThird = ssa
			lvlThird = tonumber(ssb)
			ret = ret .. '\n' .. zZgenClsStr(ssa, ssb, 0, 0, '0', false, 1)
			multclass = 3
		end
	end
	return ret
end
function zZgetNextLevelString()
	local ret = ''
	if drained ~= 0 then
		ret =  t("NEXT_LEVEL_LABEL") .. " ^R" .. stringsAll.noXP  .. "^- " .. t("XP_LABEL")
	end
	return ret
end
function zZgetStrengthDetail()
    local outList = { }
    for k, v in ipairs(characters[currentID].proficiencies.ability) do
        table.insert(outList, {v.current})
    end
    local out = outList[1][1] .. ', ' .. outList[2][1]
    return out
end
function zZgetDexDetail()
    local outList = { }
    for k, v in ipairs(characters[currentID].proficiencies.ability) do
        table.insert(outList, {v.current})
    end
    local out = outList[5][1]
    return out
end
function zZgetConDetail()
    local outList = { }
    for k, v in ipairs(characters[currentID].proficiencies.ability) do
        table.insert(outList, {v.current})
    end
    local out = outList[8][1]
    return out
end
function zZgetChaDetail()
    local outList = { }
	local out = ''
    for k, v in ipairs(characters[currentID].proficiencies.ability) do
        table.insert(outList, {v.current})
    end
	if characters[currentID].hasMageBook and (zZgetTableSize(outList) < 11) then
		out = outList[10][1]
	elseif characters[currentID].hasMageBook and (zZgetTableSize(outList) >= 11) then
		out = outList[12][1]
	else
		out = outList[9][1]
	end
    return out
end
function zzAttribItemsStrGen()
	zzAttribStr = ''
	local str, stra = '', ''
	if currentItem == 1 then str = zZgetStrengthDetail() end
	if currentItem == 2 then str = zZgetDexDetail() end
	if currentItem == 3 then str = zZgetConDetail() end
	if currentItem == 6 then str = zZgetChaDetail() end
	local x = 999
	while x ~= 0 do
		stra, str, x = zZgetSubString(str, ', ')
		if stra ~= '' then
			zzAttribStr = zzAttribStr .. zZcolorizeString(stra, ':')
			if x == 1 then zzAttribStr = zzAttribStr .. ', ' end
		end
	end
end
function zzAttribItemsStrGenE()
	local x = 0
	x = string.find(zZhelpTextString, '\n', 1, true)
	if x ~= nil then
		zZhelpTextString = string.sub(zZhelpTextString, 1, x - 1)
		zZhelpTextString = zZcolorizeString(zZhelpTextString, ":")
	end
end 
function zzAttribItemsStrGenEx() 
	if zzAttribStr == '' or zzAttribStr == nil then
		return zZhelpTextString
	else
		return zzAttribStr .. '\n\n' .. zZhelpTextString
	end
end
--newEnd
--newBegin classes progressbar functions
function zZsetVariables()
	multclass = 0
	
	dualactive = 0
	lvlFirst = 0
	xpFirst = 0
	xpFirstLvl = 0
	xpNextFirst = 0
	nameFirst = ""
	lvlSecond = 0
	xpSecond = 0
	xpSecondLvl = 0
	xpNextSecond = 0
	nameSecond = ""
	lvlThird = 0
	xpThird = 0
	xpThirdLvl = 0
	xpNextThird = 0
	drained = 0
	nameThird = ""
	zZclassData = {}
end
function zZgetCurrentClassIDData(namez)
	for k, v in pairs(clastxtList) do
		local str = Infinity_FetchString(v[1])
		if string.lower(namez) == string.lower(str) then
			zZclassData = {v[1], v[2], v[3], v[4], v[5], v[6], v[7]}
		end
	end
end
function zZgetCurrentClassIDDataEx(namez)
	local cucu = -1
	local strz = namez
	for k, v in pairs(clastxtList) do
		local str = Infinity_FetchString(v[1])
		if string.lower(strz) == string.lower(str) then
			cucu = v[5]
		end
	end
	return cucu
end
function zZgetCurrentLevelString(nemem, lvlg)
	local clsID = zZgetCurrentClassIDDataEx(nemem)
	local z = 0
	--mage
	if clsID == 1 then
		for k, v in pairs(mageXPList) do
			if lvlg == v[1] then z = v[2] end
		end
	end
	--fighter
	if clsID == 2 then
		for k, v in pairs(fighterXPList) do
			if lvlg == v[1] then z = v[2] end
		end
	end
	--cleric
	if clsID == 3 then
		for k, v in pairs(clericXPList) do
			if lvlg == v[1] then z = v[2] end
		end
	end
	--thief
	if clsID == 4 then
		for k, v in pairs(thiefXPList) do
			if lvlg == v[1] then z = v[2] end
		end
	end
	--bard
	if clsID == 5 then
		for k, v in pairs(bardXPList) do
			if lvlg == v[1] then z = v[2] end
		end
	end
	--paladin
	if clsID == 6 then
		for k, v in pairs(paladinXPList) do
			if lvlg == v[1] then z = v[2] end
		end
	end
	--druid
	if clsID == 11 then
		for k, v in pairs(druidXPList) do
			if lvlg == v[1] then z = v[2] end
		end
	end
	--ranger
	if clsID == 12 then
		for k, v in pairs(rangerXPList) do
			if lvlg == v[1] then z = v[2] end
		end
	end
	--sorcerer
	if clsID == 19 then
		for k, v in pairs(sorcererXPList) do
			if lvlg == v[1] then z = v[2] end
		end
	end
	--monk
	if clsID == 20 then
		for k, v in pairs(monkXPList) do
			if lvlg == v[1] then z = v[2] end
		end
	end
	--shaman
	if clsID == 21 then
		for k, v in pairs(shamanXPList) do
			if lvlg == v[1] then z = v[2] end
		end
	end
	return z
end
function zZgetFClassProgressBar(nemem, lvlg, nxtxp, currxp, zzz, fstxp)
	local first = fstxp
	local second = nxtxp
	local deltaA = currxp - first
	local deltaB = second - first
	if multclass == 2 and zzz == 2 then
		deltaB = 100
		if dualactive == 1 then
			deltaA = 99
		else
			deltaA = 0
		end
	end
	local ret = getPercent(deltaA, deltaB)
	return ret
end
function zZgetAllClassPercent()
	local pa = zzGetClassMinMaxXP(0)
	local pb = zzGetClassMinMaxXP(1)
	local delta = pb - pa
	local att = xpFirst - pa
	local ret = att * 100 / delta
	return ret
end
function zZgetAllClassMinMaxXPVal()
	local pa = zzGetClassMinMaxXP(0)
	local pb = zzGetClassMinMaxXP(1)
	local ret = pa .. ' - ' .. pb
	local delta = pb - pa
	local att = xpFirst - pa
	if att >= delta then ret = '' end
	return ret
end
function zzGetClassMinMaxXP(tp)
	local start = 0
	local a, b, c, d = 0, 0, 0, 0
	if start == 0 then
		if tp == 0 then a = xpFirstLvl else a = xpNextFirst end
		start = 1
	end
	if start == 1 and (multclass == 1 or multclass == 3) then
		if tp == 0 then b = xpSecondLvl else b = xpNextSecond end
		start = 2
	end
	if start == 2 and multclass == 3 then
		if tp == 0 then c = xpThirdLvl else c = xpNextThird end
		start = 3
	end
	if start == 1 then return a end
	if start == 2 then
		if tp == 0 then
			if a > b then return a else return b end
		else
			if a > b then return b else return a end
		end
	end
	if start == 3 then
		if tp == 0 then
			if a > b then d = a else d = b end
			if d > c then return d else return c end
		else
			if a > b then d = b else d = a end
			if d > c then return c else return d end
		end
	end
end
--newEnd
--newBegin updateAttrTable
function zZcombatAttributes(chr)
	local val = 0
	local ssss = '     '
	zZthac0Details(chr, 0)
	table.insert(listItems, {t('NUM_ATTACKS_LABEL'), 0, chr.proficiencies.numAttacks.current, 1, 0, 0, val, 1, 0})
	table.insert(listItems, {t('AC_LABEL'), 0, chr.AC.current, 1, 0, 0, val, 1, 0})
	if chr.AC.slashing ~= 0 then
		table.insert(listItems, {ssss .. stringsAll.slashing, 0, chr.AC.slashing, 0, 0, 0, val, 1, 0})
	end
	if chr.AC.piercing ~= 0 then
		table.insert(listItems, {ssss .. stringsAll.piercing, 0, chr.AC.piercing, 0, 0, 0, val, 1, 0})
	end
	if chr.AC.crushing ~= 0 then
		table.insert(listItems, {ssss .. stringsAll.crushing, 0, chr.AC.crushing, 0, 0, 0, val, 1, 0})
	end
	if chr.AC.missile ~= 0 then
		table.insert(listItems, {ssss .. stringsAll.missile, 0, chr.AC.missile, 0, 0, 0, val, 1, 0})
	end
end
function zZgetSavingThrows(chr)
	local val = 0
	local z, w = ""
	local ssss = t(chr.proficiencies.savingThrows)
	for i=1, 5, 1 do
		z, ssss = zZgetSubString(ssss, ':')
		w, ssss = zZgetSubStringNumber(ssss, '\n')
		table.insert(listItems, {z, 0, w, 1, 0, 0, val, 1, 0})
	end
end
function zZProficiencies(chr, u)
	local val = 0
	local z, w, g = ""
	local x, a = 0
	local ssss = ""
	if u == 0 then
		ssss = t(chr.proficiencies.weapons.current)
	else
		ssss = t(chr.proficiencies.fightingstyles.current)
	end
	local profTable = {}
	for i=1, 10000, 1 do
		w, ssss = zZgetSubString(ssss, '\n')
		table.insert(profTable, {w})
		if string.len(ssss) == 0 then break end
	end
	for k, v in pairs(profTable) do
		g = v[1]
		x = string.find(g, '+')
		if x ~= nil then
			z = string.sub(g, 1, x - 1)
			w = string.sub(g, x)
			a = string.len(w)
			table.insert(listItems, {z, 0, a, 1, 1, 1, val, 1, 0})
		end
	end
	profTable = {}
end
function zZResistances(chr)
	local val = 0
	local z, w = ""
	local ssss = chr
	for i=1, 10000, 1 do
		z, ssss = zZgetSubString(ssss, ':')
		w, ssss = zZgetSubStringNumber(ssss, '\n')
		table.insert(listItems, {z, 0, w, 1, 0, 0, val, 1, 0})
		if string.len(ssss) == 0 then break end
	end
end
function zzClassSkills(chr)
	local val = 0
	local zzskills = {}
	local zzskl = 0
	local sstr, sstra = ""
	for k, v in ipairs(chr.proficiencies.class_skills) do
		if v.current ~= nil and v.current ~= 0 then
			sstr = Infinity_FetchString(v.strRef)
			sstra = v.current
			zzskl = zzskl +1
			table.insert(zzskills, {sstr, sstra})
		end
	end
	if zzskl ~= 0 then
		table.insert(listItems, {t('SKILLS_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
		for k, v in pairs(zzskills) do
			table.insert(listItems, {v[1], 0, v[2], 1, 0, 0, val, 1, 0})
		end
	end
	zzskills = {}
end
function zzAbilityBonus(chr)
	local val = 0
	local z, w, g = ""
	local x, y = 0
	for k, v in ipairs(chr.proficiencies.ability) do
		g = v.current
		x, y = string.find(g, ':', 1, true)
		if x ~= nil then
			z = string.sub(g, 1, x - 1)
			w = string.sub(g, y + 1)
			table.insert(listItems, {z, 0, w, 1, 0, 0, val, 1, 0})
		else
			table.insert(listItems, {g, 1, "", 0, 0, 0, val, 1, 0})
		end
	end
	return val
end
function zZcolorizeCharScript(str)
	pos = pos or 1
	local stra, strb = "", ""
	local x, rt = 0, 0
	local b, e
	b, e = string.find(str, '(', 1, true)
	rt = b
	if b ~= nil then
		stra = string.sub(str, 1, b - 1)
		str  = string.sub(str, e + 1)
		x = x + 1
	end
	if x > 0 then
		b, e = string.find(str, ')', 1, true)
		if b ~= nil then
			strb = string.sub(str, 1, b - 1)
			str  = string.sub(str, e + 1)
			if str == nil then str = "" end
			x = x + 1
		end
	end
	if x == 2 then
		str = stra .. '(^D' .. strb .. '^-)' .. str
	end
	return str
end
function zZcreateInfoTable(char)
	local val = 0
	local scro = ""
	table.insert(listItems, {stringsAll.themain, 1, "", 0, 0, 0, val, 1, 0})
	local rep = zZcolorizeCharScript(char.proficiencies.reputation.current)
	table.insert(listItems, {t('REPUTATION_LABEL'), 0, rep, 1, 0, 0, val, 1, 0})
	table.insert(listItems, {t('LORE_LABEL'), 0, char.proficiencies.lore.current, 1, 0, 0, val, 1, 0})
	--CombatStats
	table.insert(listItems, {t('COMBAT_STATS_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	zZcombatAttributes(char)
	--Saving Throws
	table.insert(listItems, {t('SAVING_THROWS_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	zZgetSavingThrows(char)
	--proficiencies
	if characters[currentID].proficiencies.weapons.current ~= "" then
		table.insert(listItems, {t('PROFICIENCIES_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
		zZProficiencies(char, 0)
	end
	--fighting styles
	if characters[currentID].proficiencies.fightingstyles.current ~= "" then
		table.insert(listItems, {t('FIGHTING_STYLES_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
		zZProficiencies(char, 1)
	end
	--resistances
	zzResistStr = char.proficiencies.resistances
	zzResistVal = string.find(zzResistStr, ":", 1, true)
	if zzResistVal ~= nil then
		table.insert(listItems, {t('RESISTANCES_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
		zZResistances(zzResistStr)
	end
	--skills
	zzClassSkills(char)
	--ability bonuses
	table.insert(listItems, {Infinity_FetchString(10315), 1, "", 0, 0, 0, val, 1, 0})
	zzAbilityBonus(char)
	--script
	table.insert(listItems, {t('CURRENT_SCRIPT_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	scro = zZcolorizeCharScript(t(char.proficiencies.currentScript))
	table.insert(listItems, {scro, 0, "", 1, 0, 0, val, 1, 0})
	--empty
	table.insert(listItems, {"", 2, "", 0, 0, 0, val, 1, 0})
	val = 0
	for k, v in pairs(listItems) do
		val = val + 1
		v[7] = val
	end
end
function zZhpDetails(chr, act)
	act = act or 1
	local val = 0
	local str, stra, strb = "", "", ""
	local zzClas, zzRace, zzAbil = "", "", ""
	local zzTbl = {}
	local bamt = 0
	zzClas = Infinity_FetchString(12136)
	zzRace = Infinity_FetchString(1048)
	zzAbil = Infinity_FetchString(10315)
	str = tostring(chr.HP.details)
	str = string.gsub(str, zzRace, zzRace .. '\n')
	str = string.gsub(str, zzAbil, zzAbil .. '\n')
	str = string.gsub(str, zzClas, zzClas .. '\n')
	zzTbl = zZgetStringTable(str, '\n')
	for k, v in pairs(zzTbl) do
		str = v[2]
		stra, strb = zZgetSubString(str, ':')
		strb = string.gsub(strb, ' ', '')
		if strb ~= "" then stra = '    ' .. stra; bamt = 0
		else stra = '^D' .. stra .. '^-:'; bamt = 1 end
		table.insert(listItems, {stra, 0, strb, bamt, 0, 0, val, act, 0})
	end
end
function zZgetSecondSep(str, sep)
	local a, b, e, x = 0, 0, 0, 0
	local strc = ""
	x = 0
	a, e = string.find(str, sep, 1, true)
	if a ~= nil then
		b = string.find(str, sep, a + 1, true)
		if b ~= nil then
			strc = string.sub(str, 1, a - 1)
			str  = string.sub(str, e + 1)
			x = 1
		end
	end
	return str, strc, x
end
function zZarmorClassDetails(str, act)
	act = act or 1
	local val, x = 0, 0
	local stra, strb, strc = "", "", ""
	local zzTbl = {}
	local bamt = 0
	zzTbl = zZgetStringTable(str, '\n')
	for k, v in pairs(zzTbl) do
		str = v[2]
		str, strc, x = zZgetSecondSep(str, ":")
		stra, strb = zZgetSubString(str, ':')
		strb = string.gsub(strb, ' ', '')
		if x == 1 then stra = strc .. ': ' .. stra end
		if strb ~= "" then stra = '     ' .. stra; bamt = 0
		else stra = '^D' .. stra .. '^-:'; bamt = 1 end
		table.insert(listItems, {stra, 0, strb, bamt, 0, 0, val, act, 0})
	end
end
function zZthac0DetailsTwo(str, act)
	act = act or 1
	local val, x = 0, 0
	local stra, strb, strc = "", "", ""
	local zzTbl = {}
	local bamt = 0
	zzTbl = zZgetStringTable(str, '\n')
	for k, v in pairs(zzTbl) do
		str = v[2]
		str, strc, x = zZgetSecondSep(str, ":")
		stra, strb = zZgetSubString(str, ':')
		strb = string.gsub(strb, ' ', '')
		if x == 1 then stra = strc .. ': ' .. stra end
		if strb ~= "" then stra = '     ' .. stra; bamt = 0
		else stra = '^D' .. stra .. '^-:'; bamt = 1 end
		table.insert(listItems, {stra, 0, strb, bamt, 0, 0, val, act, 0})
	end
end
function zZdamageDetailsTwo(str)
	local val, x = 0, 0
	local stra, strb, strc = "", "", ""
	local zzTbl = {}
	local bamt = 0
	zzTbl = zZgetStringTable(str, '\n')
	for k, v in pairs(zzTbl) do
		str = v[2]
		str, strc, x = zZgetSecondSep(str, ":")
		stra, strb = zZgetSubString(str, ':')
		strb = string.gsub(strb, ' ', '')
		strb = string.gsub(strb, stringsAll.dice, '^B' .. stringsAll.dice .. '^-')
		if x == 1 then stra = strc .. ': ' .. stra end
		if strb ~= "" then stra = '     ' .. stra; bamt = 0
		else stra = '^D' .. stra .. '^-:'; bamt = 1 end
		table.insert(listItems, {stra, 0, strb, bamt, 0, 0, val, 1, 0})
	end
end
function zZthac0Details(chr, u)
	local val = 0
	local sB, sE, tB, tE
	if u == 1 then sB, sE, tB, tE = '^D', '^-:', '^H', '^-' else sB, sE, tB, tE = '', '', '', '' end
	if ( chr.THAC0.detailsOffhand ~= nil and chr.THAC0.detailsOffhand ~= "" ) then
		table.insert(listItems, {sB .. t('MAIN_HAND_THAC0') .. sE, 0, tB .. chr.THAC0.current .. tE, 1, 0, 0, val, 1, 0})
		if u == 1 then zZthac0DetailsTwo(chr.THAC0.details) end
		table.insert(listItems, {sB .. t('OFF_HAND_THAC0') .. sE, 0, tB .. chr.THAC0.offhand .. tE, 1, 0, 0, val, 1, 0})
		if u == 1 then zZthac0DetailsTwo(chr.THAC0.detailsOffhand) end
	else
		table.insert(listItems, {sB .. t('THAC0_LABEL') .. sE, 0, tB .. chr.THAC0.current .. tE, 1, 0, 0, val, 1, 0})
		if u == 1 then zZthac0DetailsTwo(chr.THAC0.details) end
	end
end
function zZdamageDetails(chr)
	local val = 0
	local dmgStr = '^H' .. chr.damage.min .. '^-' .. '-' .. '^H' .. chr.damage.max .. '^-'
	if (chr.damage.maxOffhand) then
		table.insert(listItems, {'^D' .. t('MAIN_HAND_DAMAGE') .. '^-:', 0, dmgStr, 1, 0, 0, val, 1, 0})
		zZdamageDetailsTwo(chr.damage.details)
		dmgStr = '^H' .. chr.damage.minOffhand .. '^-' .. '-' .. '^H' .. chr.damage.maxOffhand .. '^-'
		table.insert(listItems, {'^D' .. t('OFF_HAND_DAMAGE') .. '^-:', 0, dmgStr, 1, 0, 0, val, 1, 0})
		zZdamageDetailsTwo(chr.damage.detailsOffhand)
	else
		table.insert(listItems, {'^D' .. t('DAMAGE_LABEL') .. '^-:', 0, dmgStr, 1, 0, 0, val, 1, 0})
		zZdamageDetailsTwo(chr.damage.details)
	end
end
function zZcreateInfoTableCombat(char)
	local str, x, y = "", "", ""
	local a, b, c = 0, 0, 0
	local val = 0
	x, y = "", "^-"
	--hit points
	table.insert(listItems, {t('HP_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	a = char.HP.current
	b = char.HP.max
	c = a * 100 / b
	if c < 15 then x = '^R'
	elseif c >= 90 then x = '^H' else y = "" end
	str = x .. a .. y .. ' / ^H' .. b .. '^-'
	table.insert(listItems, {t('HP_LABEL'), 0, str, 1, 0, 0, val, 1, 0})
	zZhpDetails(char)
	-- armor class
	table.insert(listItems, {t('AC_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	table.insert(listItems, {t('AC_LABEL'), 0, '^H' .. char.AC.current .. '^-', 1, 0, 0, val, 1, 0})
	zZarmorClassDetails(char.AC.details)
	--attacs per round
	table.insert(listItems, {t('NUM_ATTACKS_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	table.insert(listItems, {t('NUM_ATTACKS_LABEL'), 0, char.proficiencies.numAttacks.current, 1, 0, 0, val, 1, 0})
	--proficiencies
	if characters[currentID].proficiencies.weapons.current ~= "" then
		table.insert(listItems, {t('PROFICIENCIES_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
		zZProficiencies(char, 0)
	end
	--fighting styles
	if characters[currentID].proficiencies.fightingstyles.current ~= "" then
		table.insert(listItems, {t('FIGHTING_STYLES_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
		zZProficiencies(char, 1)
	end
	--thac0
	table.insert(listItems, {t('THAC0_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	zZthac0Details(char, 1)
	--damage
	table.insert(listItems, {t('DAMAGE_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	zZdamageDetails(char)
	--Saving Throws
	table.insert(listItems, {t('SAVING_THROWS_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	zZgetSavingThrows(char)
	--resistances
	zzResistStr = char.proficiencies.resistances
	zzResistVal = string.find(zzResistStr, ":", 1, true)
	if zzResistVal ~= nil then
		table.insert(listItems, {t('RESISTANCES_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
		zZResistances(zzResistStr)
	end
	--script
	table.insert(listItems, {t('CURRENT_SCRIPT_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	local scro = zZcolorizeCharScript(t(char.proficiencies.currentScript))
	table.insert(listItems, {scro, 0, "", 1, 0, 0, val, 1, 0})
	--empty
	table.insert(listItems, {"", 2, "", 0, 0, 0, val, 1, 0})
	val = 0
	for k, v in pairs(listItems) do
		val = val + 1
		v[7] = val
	end
end
function zZgetAttributeTableText(tp)
	local a, b, c = "", "", ""
	if tp[2] == 1 then a = '^$'; b = '^-' end
	if tp[2] == 0 then a = '    '; b = "" end
	c = a .. tp[1] .. b
	return c
end
function zZgetAttributeTableBam(tp)
	local a = ''
	if tp[2] == 1 or tp[4] == 0 then a = '' else a = 'fcatrtbl' end
	return a
end
function zZgetAttributeTablePng(tp)
	local a = ''
	if tp[2] == 0 then a = 'fcatrtbn'
	elseif tp[2] == 2 then a = 'fcatrtbo'
	else a = 'fcatrtbm' end
	return a
end
function zZgetAttributeTablePngInv(tp)
	local a = ''
	if tp[2] == 0 then a = ''
	elseif tp[2] == 2 then a = ''
	else a = 'fcatrtbm' end
	return a
end
function zZgetAttributeTableValue(tp)
	local x = tp[3]
	local y = tp[6]
	if y == 1 then x = "" end
	return x
end
function zZgetAttributeTableSeq(tp)
	local x = tp[5]
	local y = tp[3]
	if x == 0 then
		return 0
	else
		return y
	end
end
function zZgetAttributeTableSeqTwo(tp)
	local x = tp[2]
	local y = 0
	if x == 0 then y = 0
	else
		y = tp[9] + 1
	end
	return y
end
function filterCreTablAttr(t)
	local out = {}
	for k, v in pairs(t) do
		if v[8] == 1 then
			table.insert(out, v)
		end
	end
	return out
end
function zZfoldUnfold()
	local stadada, az = 0, 0
	az = filterCreTablAttr(listItems)[AttrItem][7]
	if listItems[az][2] == 1 then
		stadada = 1
		for i = az + 1, #listItems - 1, 1 do
			if listItems[i][2] == 0 and stadada == 1 then listItems[i][8] = zZinvertBoolI(listItems[i][8]) else stadada = 0 end
		end
	end
end
function zZunfoldCreAttr(x)
	for k, v in pairs(listItems) do
		if v[2] == 0 then v[8] = x end
	end
end
--newEnd
--newBegin class desc
function zZgetClassStrClassNames()
	zZclassDescription = {}
	local stra = ''
	local str = characters[currentID].classlevel.first.details
	str = zZgetSubString(str, '\n')
	nameFirst = zZgetSubString(str, ':')
	if characters[currentID].classlevel.second then
		str = characters[currentID].classlevel.second.details
		str = zZgetSubString(str, '\n')
		nameSecond = zZgetSubString(str, ':')
		multclass = 1
	end
	if characters[currentID].classlevel.third then
		str = characters[currentID].classlevel.third.details
		str = zZgetSubString(str, '\n')
		nameThird = zZgetSubString(str, ':')
		multclass = 3
	end
end
function zZgetClassStr(chr)
	zZgetLevelDrain()
	if drained == 0 then
		zZgetAllLevelString()
	end
	local strz = ""
	local kita, kitb, kitc = "", "", ""
	zZclassDescription = {}
	strz = ""
	if multclass == 1 or multclass == 3 then
		strz = chr.kitDesc
		strz = zZcolorizeString(strz, ':')
		table.insert(zZclassDescription, {nil, strz, 0})
		table.insert(zZclassDescription, {nil, "", 1})
	end
	zZgetCurrentClassIDData(nameFirst)
	strz = Infinity_FetchString(zZclassData[3])
	strz = zZcolorizeString(strz, ':')
	table.insert(zZclassDescription, {nil, strz, 0})
	if zZclassData[6] ~= 16384 then
		for k, v in pairs(clastxtList) do
			if zZclassData[5] == v[5] and v[6] == 16384 then
				kita = Infinity_FetchString(v[3])
				kita = '( ^O' .. Infinity_FetchString(zZclassData[1]) .. '^- )\n' .. zZcolorizeString(kita, ':')
			end
		end
	end
	if multclass > 0 then
		table.insert(zZclassDescription, {nil, "", 1})
		zZgetCurrentClassIDData(nameSecond)
		strz = Infinity_FetchString(zZclassData[3])
		strz = zZcolorizeString(strz, ':')
		table.insert(zZclassDescription, {nil, strz, 0})
		if zZclassData[6] ~= 16384 then
			for k, v in pairs(clastxtList) do
				if zZclassData[5] == v[5] and v[6] == 16384 then
					kitb = Infinity_FetchString(v[3])
					kitb = '( ^O' .. Infinity_FetchString(zZclassData[1]) .. '^- )\n' .. zZcolorizeString(kitb, ':')
				end
			end
		end
	end
	if multclass == 3 then
		table.insert(zZclassDescription, {nil, "", 1})
		zZgetCurrentClassIDData(nameThird)
		strz = Infinity_FetchString(zZclassData[3])
		strz = zZcolorizeString(strz, ':')
		table.insert(zZclassDescription, {nil, strz, 0})
		if zZclassData[6] ~= 16384 then
			for k, v in pairs(clastxtList) do
				if zZclassData[5] == v[5] and v[6] == 16384 then
					kitc = Infinity_FetchString(v[3])
					kitc = '( ^O' .. Infinity_FetchString(zZclassData[1]) .. '^- )\n' .. zZcolorizeString(kitc, ':')
				end
			end
		end
	end
	if kita ~= "" or kitb ~= "" or kitc ~= "" then
		table.insert(zZclassDescription, {nil, "", 1})
		table.insert(zZclassDescription, {nil, ' ^O' .. stringsAll.originalClass .. '^-:', 0})
		if kita ~= "" then
			table.insert(zZclassDescription, {nil, "", 1})
			table.insert(zZclassDescription, {nil, kita, 0})
		end
		if kitb ~= "" then
			table.insert(zZclassDescription, {nil, "", 1})
			table.insert(zZclassDescription, {nil, kitb, 0})
		end
		if kitc ~= "" then
			table.insert(zZclassDescription, {nil, "", 1})
			table.insert(zZclassDescription, {nil, kitc, 0})
		end
	end
	strz = ''
	local stra = ''
	for k, v in pairs(zZclassDescription) do
		stra = ''
		if v[3] == 0 then stra = v[2]
		else stra = '^Q_______________________________________________________^-' end
		strz = strz .. '\n' .. stra
	end
	return strz
end
function zZclassDescriptionMosaic(row)
	local x
	x = zZclassDescription[row][3]
	if x == 0 then
		return ""
	else
		return "fcatrtbo"
	end
end
--newEnd
--newBegin recedesc
function zZgetRaceDescCharRec(ref)
	local desc = -1
	local str = ''
	for k, v in pairs(racetextList) do
		if v[2] == ref or v[4] == ref then desc = v[3]; break end
	end
	if desc == -1 then str = '^O' .. Infinity_FetchString(desc) .. '^-' else str = zZscriptDescColorize(Infinity_FetchString(desc)) end
	return str
end
--newEnd
--newBegin character options
function zZgetScriptSoundPng(tp, to)
	local a = ''
	if tp == to then a = 'fcatrtbm'
	else a = 'fcatrtbn' end
	return a
end
function zZgetScriptSmartPng(tp, to)
	local a = ''
	if tp == to then a = 'fcatrtbu'
	else a = 'fcatrtnu' end
	return a
end
function zZgetChooseSpellPng(tp, to)
	local a = ''
	if tp == to then a = 'fcchsspa'
	else a = 'fcchsspb' end
	return a
end
function zZgetCharImportPng(tp, to)
	local a = ''
	if tp == to then a = 'fcchsspc'
	else a = 'fcchsspd' end
	return a
end
function zZgetImportExportPng(tp, to)
	local a = ''
	if tp == to then a = 'fcatrtbc'
	else a = 'fcatrtbd' end
	return a
end
function zZscriptDescColorize(str) 
	str = string.gsub(str, '%(', '(^D')
	str = string.gsub(str, '%)', '^-)')
	--if zZlanguage == "ru_RU" then
	--	str = string.gsub(str, '«', '«^D') --0171
	--	str = string.gsub(str, '»', '^-»') --0187
	--end
	local strz, sss = '', ''
	local x, y, z = 0, 0, 0
	strz = str
	while x ~= nil do
		x, y = string.find(strz, '"', 1, true)
		if x ~= nil then
			if z == 0 then
				sss = sss .. string.sub(strz, 1, x - 1) .. '"^D'
				z = 1
			else
				sss = sss .. string.sub(strz, 1, x - 1) .. '^-"'
				z = 0
			end
			strz = string.sub(strz, y + 1)
		else
			sss = sss .. strz
		end
	end
	str = sss
	str = zZcolorizeString(str, ':')
	return str --.. ' - ' .. x .. ' - ' .. z
end
function zZscriptDescColorizeInv(str) 
	str = string.gsub(str, '%(', '(^U')
	str = string.gsub(str, '%)', '^-)')
	--if zZlanguage == "ru_RU" then
	--	str = string.gsub(str, '«', '«^U') --0171
	--	str = string.gsub(str, '»', '^-»') --0187
	--end
	local strz, sss = '', ''
	local x, y, z = 0, 0, 0
	strz = str
	while x ~= nil do
		x, y = string.find(strz, '"', 1, true)
		if x ~= nil then
			if z == 0 then
				sss = sss .. string.sub(strz, 1, x - 1) .. '"^U'
				z = 1
			else
				sss = sss .. string.sub(strz, 1, x - 1) .. '^-"'
				z = 0
			end
			strz = string.sub(strz, y + 1)
		else
			sss = sss .. strz
		end
	end
	str = sss
	str = zZcolorizeString(str, ':', 'M')
	return str --.. ' - ' .. x .. ' - ' .. z
end
function zZsetLowerUpperStr(str, row)
	if zZlanguage == "ru_RU" then
		str = zZtoLower(str, 2, nil)
		local x, y, z = 0, 0, 0
		local s, u = '', ''
		if row == 2 then u = ' '; z = nil else u = ', '; z = 1 end
		x, y = string.find(str, u, 1, true)
		if x ~= nil then
			s = string.sub(str, 1, x - 1)
			str = zZtoUpper(string.sub(str, y + 1), 1, z)
			str = s .. u .. str
		end
	end
	return str
end
function zZgetChargenGuiPfc(row, current)
	if(row == current) then
		return "FCGUIPFC"
	else
		return ""
	end
end
function zZsetScriptTextOffset(str, row, lidx)
	if row == lidx then str = '    ' .. str end
	return str
end
function zZsetTextColorTableScript(str, row, idx)
	if row == idx then str = '^$' .. str .. '^-' end
	return str
end
function zZsetTextColorTableSpell(str, row, idx)
	if row == idx then str = '^M' .. str .. '^-' end
	return str
end
function zZsetScriptNameTableText(str, row, idx)
	str = zZsetLowerUpperStr(str, row)
	str = zZsetScriptTextOffset(str, row, idx)
	str = zZsetTextColorTableScript(str, row, idx)
	return str
end
function zZsetScriptNameTableTextOther(str, row, idx)
	if zZlanguage == "ru_RU" then str = zZtoUpper(str, 1, 1) end
	str = zZsetScriptTextOffset(str, row, idx)
	str = zZsetTextColorTableScript(str, row, idx)
	return str
end
function zZsetScriptNameTableTextEx(str, row, idx)
	str = zZsetScriptTextOffset(str, row, idx)
	str = zZsetTextColorTableScript(str, row, idx)
	return str
end
function zzGetWLevelUpTooltip()
	return '   ^O' .. t(stringsAll.zzLClick) .. '^-: ' .. t(stringsAll.zzLvlUp) .. '\n' .. '   ^O' .. t(stringsAll.zzRClick) .. '^-: ' .. Infinity_FetchString(%str16306%)
end
function zZgetCharOverflowCnt(num)
	if num == 0 then return stringsAll.zzOverflowZero .. '.' end
	if num == 1 then return stringsAll.zzOverflow .. ' ^O' .. num .. '^- ' .. stringsAll.zzOverflowOne .. '.' end
	if num >  1 then return stringsAll.zzOverflow .. ' ^O' .. num .. '^- ' .. stringsAll.zzOverflowNoOne .. '.' end
end
function zzGenerateChargenInformation(str)
	if createCharScreen:GetCurrentStep() == 0 then return zZscriptDescColorize(str) end
	local strTpl = {}
	strTpl = zZgetStringTable(str, '\n')
	local sss, sssa, sssb, sssc, sssd = '', '', '', '', ''
	local x, y, z = 0, 0, 0
	for k, v in pairs(strTpl) do
		sssa, sssb, x = zZgetSubString(v[2], ':')
		if x == 1 then
			sssc, sssd, z = zZgetSubString(sssb, ' +')
			if z == 1 then
				sssb = '^$' .. sssc .. '^-: +' .. sssd --.. '\n'
				y = 0
			end
			sss = sss .. '^O' .. sssa .. '^-: ' .. sssb .. '\n'
			y = 0
		else
			sssc, sssd, z = zZgetSubString(v[2], ' +')
			if z == 1 then
				sss = sss .. '^$' .. sssc .. '^-: +' .. sssd .. '\n'
				y = 0
			else
				if sssa == '' then sssd = '' else sssd = '^$*^- ' end
				if y == 1 then sss = sss .. '^O' .. sssa .. '^-:\n'; y = 0 else sss = sss .. sssd .. sssa .. '\n' end
				if sssa == '' then y = 1 end
			end
		end
	end
	return sss
end
function zzCreatePortraitsTable()
	local gnd, letM, letW = 1, 'M', 'W'
	local tempTbl = {}
	local ppt = 0
	local port = ""
	local sss, ssw, sssz = '', '', ''
	local ssx = createCharScreen:GetCurrentPortrait()
	port = createCharScreen:GetCurrentPortrait()
	sss = string.upper(string.sub(port, -1))
	if sss == 'L' then
		table.insert(tempTbl, {port, 1, ''})
	end
	repeat
		createCharScreen:IncCurrentPortrait()
		port = createCharScreen:GetCurrentPortrait()
		if port ~= ssx then
			sss = string.upper(string.sub(port, -1))
			if sss == 'L' then
				if string.len(port) < 8 then
					if port ~= tempTbl[#tempTbl][1] then
						table.insert(tempTbl, {port, 1, ''})
					end
				else
					ssw = string.sub(port, 1, 7)
					sssz = string.sub(tempTbl[#tempTbl][1], 1, 7)
					if ssw ~= sssz then
						table.insert(tempTbl, {port, 1, ''})
					end
				end
			end
		else
			ppt = 1
		end
	until
		ppt == 1
	if toggleFemale ~= 0 then gnd = 2 end
	for k, v in pairs(portraits) do
		port = v[1] .. 'L'
		if v[2] == gnd then
			if epilogueNPCName[v[1]] ~= nil then
				sssz = Infinity_FetchString(epilogueNPCName[v[1]])
			else
				sssz = ''
			end
			table.insert(zzPortraitTable, {nil, port, sssz})
			for k2, v2 in pairs(tempTbl) do
				if v2[1] == port then
					v2[2] = 0
					break
				end
			end
		end
	end
	for k, v in pairs(tempTbl) do
		sss = string.upper(string.sub(v[1], 1, 1))
		if (sss == letM or sss == letW) and v[2] == 1 then
			if gnd == 1 and sss ~= letM then v[2] = 0
			elseif gnd == 2 and sss ~= letW then v[2] = 0 end
		end
		if v[2] == 1 then
			table.insert(zzPortraitTable, {nil, v[1], v[3]})
		end
	end
	for k, v in pairs(zzPortraitTable) do
		if v[3] == '' or v[3] == nil then
			ppt = string.len(v[2])-1
			if ppt > 7 then ppt = 7 end
			sssz = string.upper(string.sub(v[2], 1, ppt))
			if zZportraitsLbl[sssz] ~= nil then v[3] = zZportraitsLbl[sssz] end
		end
	end
	zZsortPortraits()
end
function zZgetPortFiltEnablled(row)
	local ret = false
	local stra, strb, strc = '', '', ''
	if zZfiltPortraitType == 0 and zzPortraitTable[row][3] ~= '' and zzPortraitTable[row][3] ~= nil then
		ret = true
	elseif zZfiltPortraitType == 1 and (zzPortraitTable[row][3] == '' or zzPortraitTable[row][3] == nil) then
		ret = true
	elseif zZfiltPortraitType == 2 then
		if zZcurrPortFiltText == "" then
			ret = true
		else
			stra = string.lower(zZcurrPortFiltText)
			strb = string.lower(zzPortraitTable[row][2])
			strc = string.lower(zzPortraitTable[row][3])
			if string.find(strb, stra, 1, true) or string.find(strc, stra, 1, true) then
				ret = true
			end
		end
	end
	return ret
end
function zZgetPortFiltFrame(row)
	if row == (zZfiltPortraitType + 1) then
		return 2
	else
		return 0
	end
end
function zZgetPortSortFrame(row)
	if row == (zZsortPortraitType + 1) then
		return 2
	else
		return 0
	end
end
function zZsortPortraits()
	local tempTblA, tempTblB = {}, {}
	if zZsortPortraitType == 0 then
		local zzfsortA = function(s1, s2) return string.lower(s1[2]) < string.lower(s2[2]) end
		table.sort(zzPortraitTable, zzfsortA)
	elseif zZsortPortraitType == 1 then
		local zzfsortB = function(s1, s2) return string.lower(s1[2]) > string.lower(s2[2]) end
		table.sort(zzPortraitTable, zzfsortB)
	elseif zZsortPortraitType == 2 then
		local zzfsortC = function(s1, s2) return string.lower(s1[3]) < string.lower(s2[3]) end
		for k, v  in pairs(zzPortraitTable) do
			if v[3] == '' or v[3]  == nil then table.insert(tempTblB, v) else table.insert(tempTblA, v) end
		end
		table.sort(tempTblA, zzfsortC)
		zzPortraitTable = {}
		for k, v in pairs(tempTblA) do table.insert(zzPortraitTable, v) end
		for k, v in pairs(tempTblB) do table.insert(zzPortraitTable, v) end
	elseif zZsortPortraitType == 3 then
		local zzfsortD = function(s1, s2) return string.lower(s1[3]) > string.lower(s2[3]) end
		table.sort(zzPortraitTable, zzfsortD)
	end
end
function zZcheckChargenPortraitFunc()
	if zZcheckChargenPortrait == zZcurrPortFiltText then return end
	zZcheckChargenPortrait = zZcurrPortFiltText
	zzGetCurrentPortrait()
end
function zzGetCurrentPortrait()
	if not zZgetPortFiltEnablled(currentChargenPort) then
		for k, v in pairs(zzPortraitTable) do
			if zZgetPortFiltEnablled(k) then currentChargenPort = k; break end
		end
	end
	local port = zzPortraitTable[currentChargenPort][2]
	local prt = ""
	repeat
		createCharScreen:IncCurrentPortrait()
		prt = createCharScreen:GetCurrentPortrait()
	until prt == port
end
function zZgetPortraitString(row)
	local strb = zzPortraitTable[row][3]
	local stra = string.upper(string.sub(zzPortraitTable[row][2], 1, 8))
	if row == currentChargenPort then stra = '^F' .. stra .. '^-' end
	if strb ~= '' and strb ~= nil then stra = stra .. '  (^O' .. strb .. '^-)' end
	return stra 
end
function zZgetPortMosaic(row, vart)
	if row == vart then
		return 'fcprttbu'
	else
		return 'fcatrtbz'
	end
end
function zZgetRaceCassMosaic(row, vart)
	if row == vart then
		return 'fcrcltbu'
	else
		return 'fcrcltbz'
	end
end
function zZgetHatedRaceCassMosaic(row, vart)
	if row == vart then
		return 'fcrclt1u'
	else
		return 'fcrclt1z'
	end
end
function zZgetDifficultyMosaic(row, vart)
	if row == vart then
		return 'fcrcltba'
	else
		return 'fcrcltbb'
	end
end
function zZremoveFirstString(str)
	local x = 0
	if currentChargenHatedRace ~= nil then
		x = string.find(str, '\n')
		if x ~= nil then
			str = string.sub(str, x + 1)
		end
	end
	return str
end
function zZresultCApointe()
	local t = chargen.extraAbilityPoints
	t = tonumber(t)
	if t > 0 then
		t = '^Q' .. t .. '^-'
	else
		t = '^B' .. t .. '^-'
	end
	return t
end
function zZgetDifferenceBetweenCPSP()
	local cp = tonumber(chargen.totalRoll)
	local sp = storedPoint
	local db = cp - sp
	if db == 0 then return t(db) end
	if db >  0 then return '^H' .. '+ ' .. t(db) .. '^-' end
	if db <  0 then
		db = db * -1
		return '^Q' .. '- ' .. t(db) .. '^-'
	end
end
function zZgetStoredRoll()
	local strc = 0
	local except = 0
	strc = chargen.ability[rowNumber].storedRoll
	return strc
end
function zZchangePortraitTitle()
	local txt = ''
	if zzCangePortrait ~= 0 then txt = t('CUSTOMIZE_TITLE')
	else txt = t('CHARGEN_TITLE') end
	return txt
end
function zZchangeColorsTitle()
	local txt = ''
	if zzCangePortrait ~= 0 or zZcolorsFromInv ~= 0 then txt = t('COLOR_CHOICES_TITLE')
	else txt = t('CHARGEN_TITLE') end
	return txt
end
function zZchangeCreatePartyTitle()
	local txt = ''
	if chargen.levelingUp ~= true then txt = t('CREATE_PARTY_BUTTON')
	else txt = t('HIGH_LEVEL_ABILITIES_BUTTON') end
	return txt
end
function zZchargenSpellDesc(str)
	local x, y, a, b, c = 0, 0, 0, 0, 0
	local strx, stra = '', ''
	x, y = string.find(str, '\n(', 1, true)
	if x ~= nil then
		strx = '^O' .. string.sub(str, 1, x - 1) .. '^-'
		stra = zZscriptDescColorize(string.sub(str, y))
		strx = strx .. '\n' .. stra
	else
		a, b = string.find(str, '\n', 1, true)
		if a ~= nil then
			stra = string.sub(str, 1, b)
			c = string.find(stra, '.', 1, true)
			if c == nil then
				strx = '^O' .. string.sub(str, 1, a - 1) .. '^-'
				stra = zZscriptDescColorize(string.sub(str, b))
				strx = strx .. '\n\n' .. stra
			else
				strx = zZscriptDescColorize(str)
			end
		else
			strx = zZscriptDescColorize(str)
		end
	end
	return strx
end
function zZinventorySpellDesc(str)
	local x, y, a, b, c = 0, 0, 0, 0, 0
	local strx, stra = '', ''
	x, y = string.find(str, '\n(', 1, true)
	if x ~= nil then
		strx = '^M' .. string.sub(str, 1, x - 1) .. '^-'
		stra = zZscriptDescColorizeInv(string.sub(str, y))
		strx = strx .. '\n' .. stra
	else
		a, b = string.find(str, '\n', 1, true)
		if a ~= nil then
			stra = string.sub(str, 1, b)
			c = string.find(stra, '.', 1, true)
			if c == nil then
				strx = '^M' .. string.sub(str, 1, a - 1) .. '^-'
				stra = zZscriptDescColorizeInv(string.sub(str, b))
				strx = strx .. '\n\n' .. stra
			else
				strx = zZscriptDescColorizeInv(str)
			end
		else
			strx = zZscriptDescColorizeInv(str)
		end
	end
	return strx
end
function zZitemIdentify(idi)
	local str = ''
	if idi ~= 1 then str = zZscriptDescColorize(t(stringsAll.zzNIdentyf)) .. '\n\n' end
	return str
end
function zzGenMegePriestSplTitle(str)
	local stra, strb, strc = '', '', ''
	local dn, x = 0, 0
	stra, strb, dn = zZgetSubString(str, ':')
	if dn == 1 then
		x = string.find(strb, '%d', 1)
		if x ~= nil then
			strc = '^$' .. string.sub(strb, x - 1) .. '^-'
			strb = string.sub(strb, 1, x - 2)
		end
		str = '^O' .. stra .. '^-: ' .. strb .. strc
	end
	return str
end
function zZgetHatedRaceBitmap(idx)
	local str = ''
	if idx < 10 then str = '00' .. idx
	elseif idx < 100 then str = '0' .. idx
	else str = tostring(idx)
	end
	str = 'HTRAC' .. str
	return str
end
function zZtoUpperWithCheckLang(str, f, l)
	if zZlanguage == "ru_RU" then
		return zZtoUpper(str, f, l)
	end
	return str
end
--newEnd
--newBegin Dual Class
function zZProficienciesDual(chr, u)
	local val = 0
	local z, w, g = "", "", ""
	local x, a = 0, 0
	local ssss = ""
	if u == 0 then
		ssss = t(chr.proficiencies.weapons.current)
	else
		ssss = t(chr.proficiencies.fightingstyles.current)
	end
	local profTable = {}
	for i=1, 10000, 1 do
		w, ssss = zZgetSubString(ssss, '\n')
		table.insert(profTable, {w})
		if string.len(ssss) == 0 then break end
	end
	for k, v in pairs(profTable) do
		g = v[1]
		x = string.find(g, '+')
		if x ~= nil then
			z = string.sub(g, 1, x - 2)
			w = string.sub(g, x)
			a = string.len(w)
			table.insert(listDualProfs, {nil, z, a})
		end
	end
	profTable = {}
end
function zZgetDualClassProfs(nm)
	local d = 0 
	for k, v in pairs(listDualProfs) do
		if string.lower(v[2]) == string.lower(nm) then d = v[3]; break end
	end
	return d
end
function zZgetDualClassTitle()
	if zZdualClass ~= 0 then
		return t("DUALCLASS_TITLE")
	else
		return t("CHARGEN_TITLE")
	end
end
function plusButtonClickable(row)
	local clickable =  (chargen.proficiency[row].value < chargen.proficiency[row].max)
	clickable = clickable and chargen.extraProficiencySlots > 0
	clickable = clickable and (zZgetDualClassProfs(Infinity_FetchString(chargen.proficiency[row].name)) == 0 or zZprofClickable == 1)
	return clickable
end
function minusButtonClickable(row)
	if zZgetDualClassProfs(Infinity_FetchString(chargen.proficiency[row].name)) > 0 and zZprofClickable ~= 1 then
		return false
	end
	return (chargen.proficiency[row].value > chargen.proficiency[row].min)
end
function zZdualClassCreatePartyButton()
	if zZdualClass == 0 then
		return "CREATE_PARTY_BUTTON"
	else
		return ""
	end
end
function zZcolorizeCharImport(str)
	local a, b, c, d = 0, 0, 0, 0
	local s, z = '', ''
	a, b = string.find(str, ' - ', 1, true)
	if a ~= nil then
		s = string.sub(str, 1, a - 1)
		if s ~= '' then s = '^O' .. s .. '^- - ' end
		str = string.sub(str, b + 1)
		c, d = string.find(str, ' - ', 1, true)
		if c ~= nil then
			z = string.sub(str, 1, c - 1)
			if z ~= '' then z = '^$' .. z .. '^- - ' end
			str = string.sub(str, d + 1)
		end
	end
	s = s .. z .. str
	return s
end
--newEnd
--newEnd

--newBegin Options
function zZgetBkgBam(row, vart)
	if row == vart then
		return 'fcbkgbam'
	else
		return ''
	end
end
--newEnd

--newBegin Inventory
function zzInventorThacO(chr)
	if chr.THAC0.offhand then
		return chr.THAC0.offhand
	else
		return chr.THAC0.current
	end
end
function zZgetInventoryDamage(xarea, xx, xw)
	local str = characters[id].damage.min .. ' - ' .. characters[id].damage.max
	if(characters[id].damage.minOffhand and characters[id].damage.maxOffhand) then
		str = str .. "\n" .. characters[id].damage.minOffhand .. ' - ' .. characters[id].damage.maxOffhand 
	end
	zZgetInventoryDamageArea(xarea, xx, xw)
	return str
end
function zZgetInventoryDamageArea(zarea, zx, zw)
	local xdmin = characters[id].damage.min
	local xdmax = characters[id].damage.max
	if(characters[id].damage.minOffhand and characters[id].damage.maxOffhand) then
		local xdmino = characters[id].damage.minOffhand
		local xdmaxo = characters[id].damage.maxOffhand
		if (xdmin > xdmino) then xdmin = xdmino end
		if (xdmax < xdmaxo) then xdmax = xdmaxo end
	end
	if (xdmin < 0)  then xdmin = 0  end
	if (xdmax > 50) then xdmax = 50 end
	xdmin = math.floor(xdmin * zw / 50)
	xdmax = math.ceil( xdmax * zw / 50)
	if (xdmin < 0)  then xdmin = 0 end
	if (xdmax > zw) then xdmax = zw end
	xdmax = xdmax - xdmin
	xdmin = zx + xdmin
	Infinity_SetArea(zarea, xdmin, nil, xdmax, nil)
end
function zzUpdInfoAttrTableFunc(char)
	if zzUpdInfoAttrTable == 1 then
		zZcreateInfoTableInventory(char)
		zzUpdInfoAttrTable = 0
	end
	if zZcurrIdInvAttr ~= id or tempStats[id] ~= nil then
		zzUpdInfoAttrTable = 1
	end
end
function zZcurrTableUpdTitles(char, vart)
	local st = ''
	if vart == 'AC' then
		st = char.AC.current
	elseif vart == 'HP' then
		st = char.HP.current .. '/' .. char.HP.max
	elseif vart == 'THAC0' then
		st = char.THAC0.current
		if char.THAC0.offhand then
			st = st .. '/' .. char.THAC0.offhand
		end
		st = st
	elseif vart == 'DAMAGE' then
		local mina, maxa = char.damage.min, char.damage.max
		if char.damage.minOffhand and char.damage.maxOffhand then
			if mina > char.damage.minOffhand then mina = char.damage.minOffhand end
			if maxa < char.damage.maxOffhand then maxa = char.damage.maxOffhand end
		end
		st = mina .. '-' .. maxa
	end
	return st
end
function zZthac0DetailsInv(chr)
	local val = 0
	if ( chr.THAC0.detailsOffhand ~= nil and chr.THAC0.detailsOffhand ~= "" ) then
		zZthac0DetailsTwo(chr.THAC0.details)
		table.insert(listItems, {'', 0, '', 0, 0, 0, val, 1, 0})
		zZthac0DetailsTwo(chr.THAC0.detailsOffhand)
	else
		zZthac0DetailsTwo(chr.THAC0.details)
	end
end
function zZdamageDetailsInv(chr)
	local val = 0
	if (chr.damage.maxOffhand) then
		zZdamageDetailsTwo(chr.damage.details)
		table.insert(listItems, {'', 0, '', 0, 0, 0, val, 1, 0})
		zZdamageDetailsTwo(chr.damage.detailsOffhand)
	else
		zZdamageDetailsTwo(chr.damage.details)
	end
end
function zZcreateInfoTableInventory(char)
	listItems = {}
	local val = 0
	-- armor class
	table.insert(listItems, {t('AC_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	zZarmorClassDetails(char.AC.details)
	table.insert(listItems, {'', 0, '', 0, 0, 0, val, 1, 0})
	--hit points
	table.insert(listItems, {t('HP_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	zZhpDetails(char)
	table.insert(listItems, {'', 0, '', 0, 0, 0, val, 1, 0})
	--thac0
	table.insert(listItems, {t('THAC0_LABEL'), 1, "", 0, 0, 0, val, 1, 0})
	zZthac0DetailsInv(char)
	table.insert(listItems, {'', 0, '', 0, 0, 0, val, 1, 0})
	--damage
	local dmga = ''
	if char.damage.minOffhand and char.damage.maxOffhand then dmga = zZcurrTableUpdTitles(char, 'DAMAGE') end
	table.insert(listItems, {t('DAMAGE_LABEL'), 1, dmga, 0, 0, 0, val, 1, 0})
	zZdamageDetailsInv(char)
	--empty
	val = 0
	for k, v in pairs(listItems) do
		val = val + 1
		v[7] = val
	end
end
function zZgetAttributeInvTableText(tp)
	local a, b, c = "", "", ""
	if tp[2] == 1 then a = '^$'; b = '^-' end
	c = a .. tp[1] .. b
	c = string.gsub(c, '     ', '')
	return c
end
--newBegin All Inventory
function zzSelectCurrentInv(curu)
	if curu == 1 then zx = zzCZIchar1 zxx = zzChar1 zzChar1 = zzSelected zzCZIchar1 = zzCZIchar0 zzSelected = zxx zzCZIchar0 = zx end
	if curu == 2 then zx = zzCZIchar2 zxx = zzChar2 zzChar2 = zzSelected zzCZIchar2 = zzCZIchar0 zzSelected = zxx zzCZIchar0 = zx end
	if curu == 3 then zx = zzCZIchar3 zxx = zzChar3 zzChar3 = zzSelected zzCZIchar3 = zzCZIchar0 zzSelected = zxx zzCZIchar0 = zx end
	if curu == 4 then zx = zzCZIchar4 zxx = zzChar4 zzChar4 = zzSelected zzCZIchar4 = zzCZIchar0 zzSelected = zxx zzCZIchar0 = zx end
	if curu == 5 then zx = zzCZIchar5 zxx = zzChar5 zzChar5 = zzSelected zzCZIchar5 = zzCZIchar0 zzSelected = zxx zzCZIchar0 = zx end
	zzInvUpdate(zzChar1)
	zzAreasSelected(zzChar1, curu)
end
function zzTempAC()
	if tempStats[id] == nil then
		return characters[id].AC.current
	else
		return getStat(characters[id].AC.current,'AC',-1) .. '\n' .. getTempStat(characters[id].AC.current,'AC',-1)
	end
end
function zzTempHP()
	if tempStats[id] == nil then
		return characters[id].HP.current .. '/' .. characters[id].HP.max 
	else
		return characters[id].HP.current .. '/' .. getStat(characters[id].HP.max, 'HP', 1) .. '\n' .. getTempHP() 
	end
end
function zzTempTHAC0()
	if tempStats[id] == nil then 
		return zZcurrTableUpdTitles(characters[id], 'THAC0')
	else 
		return getStat(characters[id].THAC0.current,'THAC0', -1) .. '\n' .. getTempStat(characters[id].THAC0.current,'THAC0',-1) 
	end
end
function zzInvUpdate(cuur)
	for i = 1, zzChrInvCnt do
		Infinity_PressKeyboardButton(i)
	end
	Infinity_OnPortraitLClick(cuur)
end
function zzAreasSelected(ptr, curr)
	if ptr >= 0 then
		Infinity_OnPortraitLClick(ptr)
		Infinity_SetArea("slotsArea1", nil, nil, 416, 104)
		Infinity_SetArea("slotsArea2", nil, nil, 416, 104)
		Infinity_SetArea("slotsArea3", nil, nil, 416, 104)
		Infinity_SetArea("slotsArea4", nil, nil, 416, 104)
		Infinity_SetArea("slotsArea5", nil, nil, 416, 104)
		Infinity_SetArea("slotsArea0", nil, nil, 326, 466)
		Infinity_SetArea("slotsArea" .. curr, nil, nil, 0, 0)
	end
end
--newEnd
function zZgetTextFromLongTexst(str, size)
	zzInvPageCnt = 0
	local tbl = {}
	local x, y = 0, 0
	local ztr = ''
	while x ~= nil do
		x, y = string.find(str, '\n', size, true)
		if x ~= nil then
			ztr = string.sub(str, 1, x - 1)
			str = string.sub(str, y + 1)
			table.insert(tbl, {nil, ztr})
		else
			table.insert(tbl, {nil, str})
		end
		zzInvPageCnt = zzInvPageCnt + 1
	end
	if zzInvPageCnt > 1 then
		Infinity_SetArea('zzItemDesc', nil, nil, nil, 295)
	else
		Infinity_SetArea('zzItemDesc', nil, nil, nil, 338)
	end
	ztr = tbl[zzCurrentDesc][2]
	return ztr
end
--newEnd
--newBegin Popups
function zZscrollPopupRequests(amt, maxamt)
	local x = 1
	if     maxamt > 700 then x = 30
	elseif maxamt > 500 then x = 20
	elseif maxamt > 200 then x = 10
	elseif maxamt > 100 then x = 5
	elseif maxamt > 60  then x = 3
	elseif maxamt > 20  then x = 2
	end
	if scrollDirection > 0 then
		return amt - x
	elseif scrollDirection < 0 then
		return amt + x
	end
end
--newEnd
--newBegin Journal
function zZhighlightJourFilter(text)
	if JourFilter == 0 and text == t('FC_QUESTS_ALL') then
		return '^M' .. text .. '^-'
	elseif JourFilter == 1 and text == t('FC_QUESTS_ACTIVE') then
		return '^M' .. text .. '^-'
	elseif JourFilter == 2 and text == t('FC_QUESTS_COMPLETED') then
		return '^M' .. text .. '^-'
	end
	return '^5' .. text .. '^-'
end
function zzCloseAll()
	for i=1,#questDisplay,1 do
		if questDisplay[i].expanded == 1 then questDisplay[i].expanded = nil end
	end
end
function zzOpenAll(tbl)
	for i=1,#tbl,1 do
		tbl[i].expanded = 1
	end
end
function zZeditJourEntry()
	journalNoteEditRef = getJournalEntryRef(selectedJournal)
	journalNoteOld = Infinity_FetchString(journalNoteEditRef)
	local x = string.find(journalNoteOld,stringsAll.zzNoteEditDate)
	if x ~= nil then
		journalNoteOld = string.sub(journalNoteOld,1,x - 3)
	end
	if string.find(journalNoteOld,stringsAll.zzNoteTw) ~= nil then
		journalNoteEdit = string.sub(journalNoteOld,string.len(stringsAll.zzNoteTw) + 3)
	elseif string.find(journalNoteOld,stringsAll.zzNoteEdit) ~= nil then
		journalNoteEdit = string.sub(journalNoteOld,string.len(stringsAll.zzNoteEdit) + 4)
	else
		journalNoteEdit = journalNoteOld .. '\n\n'
	end
	journalMode = const.JOURNAL_MODE_EDIT
end
function zZsaveJourEntry()
	if (journalNoteEditRef == nil) then
		journalNoteEdit = stringsAll.zzNoteTw .. '\n\n' .. journalNoteEdit .. '\n\n' .. stringsAll.zzNoteEditDate .. ': ' .. Infinity_GetTimeString()
		Infinity_OnAddUserEntry(journalNoteEdit)
	else
		if string.find(journalNoteOld,stringsAll.zzNoteTw) then
			journalNoteEdit = stringsAll.zzNoteTw .. '\n\n' .. journalNoteEdit .. '\n\n' .. stringsAll.zzNoteEditDate .. ': ' .. Infinity_GetTimeString()
		else
			journalNoteEdit = stringsAll.zzNoteEdit .. ':\n\n' .. journalNoteEdit .. '\n' .. stringsAll.zzNoteEditDate .. ': ' .. Infinity_GetTimeString()
		end
		Infinity_OnEditUserEntry(journalNoteEditRef, journalNoteEdit)
	end
	journalMode = const.JOURNAL_MODE_JOURNAL
end
function zZnteColorize(str)
	local x, y, pos, edt, nte, dat = 0, 0, 1, 0, 0, 0
	local dn = getJournalDarken(rowNumber)
	x, y = string.find(str, stringsAll.zzNoteEdit, 1, true)
	if x ~= nil then pos = y + 4; edt = 1 end
	x, y = string.find(str, stringsAll.zzNoteTw, 1, true)
	if x ~= nil then pos = y + 3; nte = 1 end
	x, y = string.find(str, stringsAll.zzNoteEditDate, 1, true)
	if x ~= nil then dat = 1 end
	local stra, strb, clr, strc = '', '', '', ''
	x, y = string.find(str, '\n', pos, true)
	if x ~= nil then
		if edt == 1 or nte == 1 then strc = string.sub(str, 1, pos - 1) end
		stra = string.sub(str, pos, x - 1)
		strb = string.sub(str, y + 1)
		if string.len(stra) <= zZstrLen then
			if dn == true then clr = '^K' else clr = '^L' end
			stra = clr .. stra .. '^-'
		end
		str = strc .. stra .. '\n' .. strb
	end
	if dn == true then clr = '^R' else clr = '^M' end
	if edt == 1 then
		str = string.gsub(str, stringsAll.zzNoteEdit, clr .. stringsAll.zzNoteEdit .. '^-')
	end
	if dat == 1 then
		str = string.gsub(str, stringsAll.zzNoteEditDate, clr .. stringsAll.zzNoteEditDate .. '^-')
	end
	return str
end
function zzHideMyNotes(str)
	local x, y = string.find(str, stringsAll.zzNoteTw, 1, true)
	if x ~= nil then
		str = string.sub(str, y + 3)
	end
	return str
end
function PauseJournal()
	if worldScreen:CheckIfPaused() then
		return
	else
		worldScreen:TogglePauseGame(true)
	end
end
function zZsidebarJourDiz()
	if journalOpen == 0 then
		return true
	else
		if toggleJournal == 0 then
			return true
		else
			return false
		end
	end
end
function zZgetJournalOpenable()
	if toggleJournal == 0 then
		return game:GetJournalOpenable()
	else
		return 1
	end
end
function zzToogleQuestJournal()
	if zZJournalSequence[1][1] == 2 then
		zZJournalSequence[1][1] = 0
		zZJournalSequence[1][2] = 2
	else
		zZJournalSequence[1][1] = 2
		zZJournalSequence[1][2] = 0
	end
end
function zZjournalLblTitle(asy)
	if zZJournalSequence[1][1] == 2 then
		if asy == 1 then
			return t('FC_QUESTS_ACTIVE')
		else
			return t('FC_QUESTS_COMPLETED')
		end
	else
		if asy == 1 then
			return t("JOURNAL_LABEL")
		else
			return t('FC_MY_NOTES')
		end
	end
end
function hideFinished(row)
	return (questDisplay[row].stateType ~= const.ENTRY_TYPE_COMPLETE)
end
function hideUnfinished(row)
	return (questDisplay[row].stateType == const.ENTRY_TYPE_COMPLETE)
end
function myNotes(row)
	local text = Infinity_FetchString(journalDisplay[row].text)
	if(text == "") then text = journalDisplay[row].text end
	local pairText = nil
	if(journalDisplay[row].title) then
		pairText = Infinity_FetchString(journalDisplay[row+1].text) or journalDisplay[row+1].text
		if(pairText == "") then pairText = journalDisplay[row+1].text end 
	else 
		if (journalDisplay[row].entry) then
			pairText = Infinity_FetchString(journalDisplay[row-1].text) or journalDisplay[row-1].text
			if(pairText == "") then pairText = journalDisplay[row-1].text end 
		end
	end
	if(string.find(pairText,stringsAll.zzNoteTw)) then return 1 end
	if(string.find(text,stringsAll.zzNoteTw)) then return 1 end
	return nil
end
function NotMyNotes(row)
	local text = Infinity_FetchString(journalDisplay[row].text)
	if(text == "") then text = journalDisplay[row].text end
	local pairText = nil
	if(journalDisplay[row].title) then
		pairText = Infinity_FetchString(journalDisplay[row+1].text) or journalDisplay[row+1].text
		if(pairText == "") then pairText = journalDisplay[row+1].text end 
	else 
		if (journalDisplay[row].entry) then
			pairText = Infinity_FetchString(journalDisplay[row-1].text) or journalDisplay[row-1].text
			if(pairText == "") then pairText = journalDisplay[row-1].text end 
		end
	end
	if(string.find(pairText,stringsAll.zzNoteTw)) then return nil end
	if(string.find(text,stringsAll.zzNoteTw)) then return nil end
	return 1
end
--newBegin
function CheckPauseJournalBegin()
	if worldScreen:CheckIfPaused() then
		zzPauseJournal = 1
	else
		zZeval("ActionOverride(Player%s, PauseGame())", zZgetSelectedCharacterIndex() or 1)
	end
end
function CheckPauseJournalEnd()
	if zzPauseJournal == 0 then
		worldScreen:TogglePauseGame(true)
	else
		zzPauseJournal = 0
	end
end
function zzLockScrolJournal(r)
	if r == 1 then
		zZeval("ActionOverride(Player%s, LockScroll())", zZgetSelectedCharacterIndex() or 1)
	else
		zZeval("ActionOverride(Player%s, UnlockScroll())", zZgetSelectedCharacterIndex() or 1)
	end
end
function zZeval(script, ...)
	C:Eval(script:format(...))
end
function zZgetSelectedCharacterIndex()
	local selected = Infinity_GetSelectedCharacterName()
	local n = Infinity_GetNumCharacters()
	for i = 1, n do
		if zZgetCharacterName(i - 1) == selected then
			return i
		end
	end
end
function zZgetCharacterName(index)
	local tt = Infinity_GetPortraitTooltip(index)
	return tt and tt:match("(.*)\n")
end
--newEnd
function zzGetDaysInYear()
	local days = 0
	for k, v in pairs(zzMonths) do
		days = days + v[2]
	end
	return days
end
zzDaysInYear = zzGetDaysInYear()
function zzGetDateFromString(strd)
	local x, y = string.find(strd, '%(')
	local ztr = ''
	if x ~= nil then
		ztr = string.sub(strd, y + 1)
		ztr = string.gsub(ztr, '%)', '')
		ztr = string.gsub(ztr, ',', '')
	end
	local tbl = {}
	local x, y, i = 0, 0, 0
	while x ~= nil do
		x, y = string.find(ztr, ' ', 1, true)
		if x ~= nil then
			i = i + 1
			tbl[i] = string.sub(ztr, 1, x - 1)
			ztr = string.sub(ztr, y + 1)
		else
			i = i + 1
			tbl[i] = ztr
		end
	end
	return tbl
end
function zzGetAllDays(tbl)
	local d = tonumber(tbl[1])
	local m = tbl[2]
	local y = tonumber(tbl[3])
	local yd = y * zzDaysInYear
	local md = 0
	local all = 0
	for k, v in pairs(zzMonths) do
		if m == Infinity_FetchString(v[3]) then
			break
		end
		md = md + v[2]
	end
	all = yd + md + d
	return all
end
function zZgetHourFromString(str)
	local x, y = string.find(str, '%d+')
	if x ~= nil then
		local v, w = string.find(str, '%d+', y + 1)
		if v ~= nil then
			str = string.sub(str, v, w)
		end
	end
	return str
end
function zZtimstampToDays(str)
	local tbl = zzGetDateFromString(str)
	local days = zzGetAllDays(tbl)
	local hour = zZgetHourFromString(str)
	days = days * 100 + tonumber(hour)
	return days
end
function zZtimstampToDaysAch(str)
	local tbl = zzGetDateFromString(str)
	local days = zzGetAllDays(tbl)
	return days
end
function zZachGetDateFromVar(num)
	local year, days, month = math.floor(num / zzDaysInYear) , num % zzDaysInYear, ''
	for i = 1, #zzMonths do
		if days <= zzMonths[i][2] then
			month = Infinity_FetchString(zzMonths[i][3])
			break
		else
			days = days - zzMonths[i][2]
		end
	end
	return year, month, days
end
function zZquestListCreate()
	local aaa, done, vajno = 0, 0, 0
	local chpt = -1
	local tempTbl = {}
	for k, quest in pairs(quests) do
		aaa = aaa + 1
		done = 0
		if (quest.stateType ~= nil and quest.stateType ~= const.ENTRY_TYPE_NONE and quest.stateType ~= const.ENTRY_TYPE_USER and quest.stateType ~= const.ENTRY_TYPE_INFO) then
			if quest.text == %str74295% then quest.stateType = const.ENTRY_TYPE_INPROGRESS; vajno = aaa end
			for k2, objective in pairs(quest.objectives) do
				if (objective.stateType ~= const.ENTRY_TYPE_NONE and objective.stateType ~= const.ENTRY_TYPE_USER and objective.stateType ~= const.ENTRY_TYPE_INFO and objective.stateType ~= nil) then
					if objective.text == nil or objective.text == '' then
						objective.text = quest.text
					end
					for k3, entry in pairs(objective.entries) do
						if entry.timeStamp ~= nil then
							chpt = -1
							if objective.stateType == const.ENTRY_TYPE_INPROGRESS or objective.stateType == const.ENTRY_TYPE_COMPLETE then
								done = 1
								for i = %strChapterZero%, Infinity_GetMaxChapterPage() do
									local contain = containsChapter(entry.chapters, i)
									if contain ~= nil then chpt = i; break end
								end
								table.insert(zZquestListAllList, {questId=aaa, objective=objective.text, date=entry.timeStamp, text=entry.id, chapter=chpt, closed=0})
							end
						end
					end
				end
			end
			if done == 1 then
				if quest.text == %str74295% then
					table.insert(zZquestListTable, {id=aaa, text=quest.text, stateType=quest.stateType})
				else
					table.insert(tempTbl, {id=aaa, text=quest.text, stateType=quest.stateType})
				end
			end
		end
	end
	local function zzfsortA(s1, s2) return string.lower(Infinity_FetchString(s1.text)) < string.lower(Infinity_FetchString(s2.text)) end
	local function zzfsortB(s1, s2) return zZtimstampToDays(s1.date) > zZtimstampToDays(s2.date) end
	table.sort(tempTbl, zzfsortA)
	table.sort(zZquestListAllList, zzfsortB)
	if zZgetTableSize(tempTbl) > 0 then
		for k, v in pairs(tempTbl) do
			table.insert(zZquestListTable, v)
		end
	end
end
function zZgenerateQuestTables()
	local zZquestInProgr = {}
	local zZquestComplet = {}
	local zZquestInfo = {}
	local zZachLast = {}
	local zZquestAllTemp = {}
	zZquestAll = {}
	local days = 0
	local nums = 3
	for k, quest in pairs(quests) do
		if (quest.stateType ~= nil and quest.stateType ~= const.ENTRY_TYPE_NONE and quest.stateType ~= const.ENTRY_TYPE_USER) then
			for k2, objective in pairs(quest.objectives) do
				if (objective.stateType ~= const.ENTRY_TYPE_NONE and objective.stateType ~= const.ENTRY_TYPE_USER and objective.stateType ~= const.ENTRY_TYPE_INFO and objective.stateType ~= nil) then
					if objective.text == nil or objective.text == '' then
						if type(quest.text) == 'number' then
							objective.text = Infinity_FetchString(quest.text)
						else
							objective.text = quest.text
						end
					end
					for k3, entry in pairs(objective.entries) do
						if entry.timeStamp ~= nil then
							days = zZtimstampToDays(entry.timeStamp)
							if objective.stateType == const.ENTRY_TYPE_INPROGRESS then
								table.insert(zZquestInProgr, {days, objective.text, entry.text, entry.timeStamp})
							elseif objective.stateType == const.ENTRY_TYPE_COMPLETE then
								table.insert(zZquestComplet, {days, objective.text .. " (^D" .. t("OBJECTIVE_FINISHED_NORMAL") .. "^-)", entry.text, entry.timeStamp})
							end
						end
					end
				end
			end
		end
	end
	--journal
	local str, stra, strb = '', '', ''
	local x, y = 0, 0
	local tbl = {}
	for k,entry in pairs(looseEntries) do
		days = zZtimstampToDays(entry.timeStamp)
		if type(entry.text) == 'number' then
			str = Infinity_FetchString(entry.text)
		else
			str = entry.text
		end
		stra = t('JOURNAL_LABEL')
		x, y = string.find(str, '\n', 1, true)
		if x ~= nil then
			strb = string.sub(str, 1, x - 1)
			if string.len(strb) <= zZstrLen then
				stra = strb .. ' (^D' .. t('JOURNAL_LABEL') .. '^-)'
				str = string.sub(str, y + 1)
			end
		end
		x, y = string.find(str, '\n', 1, true)
		if x ~= nil and x == 1 then
			str = string.sub(str, y + 1)
		end
		table.insert(zZquestInfo, {days, stra, str, entry.timeStamp})
	end
	
	if zZgetTableSize(zZquestInProgr) > 0 then table.sort(zZquestInProgr, zZcompareQuestInprogr) end
	if zZgetTableSize(zZquestComplet) > 0 then table.sort(zZquestComplet, zZcompareQuestComplet) end
	if zZgetTableSize(zZquestInfo)    > 0 then table.sort(zZquestInfo,    zZcompareQuestInfo)    end
	
	if zZachShowAchivements == 1 then
		zZachGenerateTables()
		math.randomseed(timer:GetCurrentTime())
		for k, v in pairs(zZachDone) do
			v[9] = v[8]
			v[8] = v[8] * 100 + math.random(1, 24)
		end
		zZachSortTbl(1, 3)
	end
	
	local x = 1
	if zZrecentEvents == 0 then
		for k, v in pairs(zZquestInProgr) do
			table.insert(zZquestAll, v)
			if x == zZnumRecentQuest then break end
			x = x + 1
		end
		x = 1
		for k, v in pairs(zZquestComplet) do
			table.insert(zZquestAll, v)
			if x == zZnumRecentQuest then break end
			x = x + 1
		end
		x = 1
		for k, v in pairs(zZquestInfo) do
			table.insert(zZquestAll, v)
			if x == zZnumRecentQuest then break end
			x = x + 1
		end
		if zZachShowAchivements == 1 then
			for k, v in pairs(zZachDone) do
				table.insert(zZquestAll, {v[8], v[2] .. ' (^D' .. zZachText.achievems .. '^-)', v[3], zZachGetDateStringFromVar(zZachGetDateFromVar(v[9]))})
				if x == zZnumRecentQuest then break end
				x = x + 1
			end
		end
	else
		for k, v in pairs(zZquestInProgr) do
			table.insert(zZquestAllTemp, v)
		end
		for k, v in pairs(zZquestComplet) do
			table.insert(zZquestAllTemp, v)
		end
		for k, v in pairs(zZquestInfo) do
			table.insert(zZquestAllTemp, v)
		end
		if zZachShowAchivements == 1 then
			for k, v in pairs(zZachDone) do
				table.insert(zZquestAllTemp, {v[8], v[2] .. ' (^D' .. zZachText.achievems .. '^-)', v[3], zZachGetDateStringFromVar(zZachGetDateFromVar(v[9]))})
			end
		end
		if zZgetTableSize(zZquestAllTemp) > 0 then table.sort(zZquestAllTemp, zZcompareQuestAllTemp) end
		x = 1
		if zZachShowAchivements == 1 then nums = 4 end
		for k, v in pairs(zZquestAllTemp) do
			table.insert(zZquestAll, v)
			if x == zZnumRecentQuest * nums then break end
			x = x + 1
		end
	end
	if zZachShowAchivements == 1 then
		zZachDone = {}
		zZachActive = {}
		zZachNotDone = {}
	end
	
	if zZgetTableSize(zZquestAll)    > 0 then table.sort(zZquestAll, zZcompareQuestAll) end
end
function zZcompareQuestInprogr(s1, s2) return s1[1] > s2[1] end
function zZcompareQuestComplet(s1, s2) return s1[1] > s2[1] end
function zZcompareQuestInfo(s1, s2)    return s1[1] > s2[1] end
function zZcompareQuestAllTemp(s1, s2) return s1[1] > s2[1] end
function zZcompareQuestAll(s1, s2)     return s1[1] > s2[1] end
function zZquestListRecent()
	zZquestAllExport = {}
	local str = ''
	zZgenerateQuestTables()
	if zZgetTableSize(zZquestAll) > 0 then
		for k, v in pairs(zZquestAll) do
			str = '^O' .. k .. '^-.  ' .. '^$' .. v[2] .. '^-\n'
			str = str .. '^A' .. v[4] .. '^-\n'
			str = str .. v[3]
			table.insert(zZquestAllExport, {nil, str})
		end
	end
end
function zZsetLastQuest(id)
	local quest = quests[entryToQuest[id]]
	if (not quest) then return end
	for k,objective in pairs(quest.objectives) do
		for k2,entry in pairs(objective.entries) do
			if(entry.id == id) then
				if (entry.stateType ~= const.ENTRY_TYPE_USER and entry.stateType ~= const.ENTRY_TYPE_INFO) then
					zZlastQuest = id
				end
				return
			end
		end
	end
end
function zZgetLastQuest(row)
	local ret = false
	local quest = quests[entryToQuest[zZlastQuest]].text
	if tonumber(quest) ~= nil then
		local qst = questDisplay[row].text
		if quest == qst then ret = true end
	end
	return ret
end
function zZchapterText()
	local chpt = Infinity_GetMaxChapterPage()
	if (%strchapterArena%) then
		return t("ARENA_MODE_LABEL")
	else%strchapterText%
	end
end
function zZchapterListText(chpt)
	if (%strchapterArena%) then
		return t("ARENA_MODE_LABEL")
	else%strchapterText%
	end
end
function zZgetQuestEnabled(row)
	if zZZjournalListMode == 3 then return true end
	if zZquestListTable[row].stateType == const.ENTRY_TYPE_INPROGRESS and zZZjournalListMode == 1 then
		return true
	elseif zZquestListTable[row].stateType == const.ENTRY_TYPE_COMPLETE and zZZjournalListMode == 2 then
		return true
	end
	return false
end
function zZgetQuestString(row, vart)
	local str = Infinity_FetchString(zZquestListTable[row].text)
	if row == vart then str = '^F' .. str .. '^-' end
	if zZZjournalListMode == 3 and zZquestListTable[row].stateType == const.ENTRY_TYPE_COMPLETE then
		str = str .. " (^D" .. t("OBJECTIVE_FINISHED_NORMAL") .. "^-)"
	end
	return str
end
function zZgetQuestListEnabled(row)
	if zZquestListAllList[row].questId == zZquestListTable[currQuestList].id then return true end
	return false
end
function zZgetQuestListString(row)
	local str, stra, strb = '', '', ''
	local x, y = 0, 0
	if type(zZquestListAllList[row].objective) == number then
		strb = Infinity_FetchString(zZquestListAllList[row].objective)
	else
		strb = zZquestListAllList[row].objective
	end
	str = '^M' .. strb .. '^- (^D' .. zZchapterListText(zZquestListAllList[row].chapter) .. '^-)\n^L'  .. zZquestListAllList[row].date .. '^-'
	if zZquestListAllList[row].closed == 0 then
		stra = Infinity_FetchString(zZquestListAllList[row].text)
		x, y = string.find(stra, strb, 1, true)
		if x == 1 then
			stra = string.gsub(stra, strb, '', 1)
		end
		x = 0
		while x ~= nil do
			x, y = string.find(stra, '\n', 1)
			if x == 1 then
				stra = string.gsub(stra, '\n', '', 1)
			else
				x = nil
			end
		end
		str = str .. '\n\n' .. stra
		str = str .. '\n'
	end
	return str
end
function zZgetQuestListFrame(num)
	local set = 1
	if zZZjournalListMode == 3 or zZZjournalListMode == num then set = 0 end
	return set
end
function zZsetQuestListVar(num)
	if zZZjournalListMode == 3 or zZZjournalListMode == num then
		zZZjournalListMode = zZZjournalListMode - num
	else
		zZZjournalListMode = zZZjournalListMode + num
	end
	if zZZjournalListMode == 0 then
		if num == 1 then
			zZZjournalListMode = 2
		elseif num == 2 then
			zZZjournalListMode = 1
		end
	end
	zZsetcurrQuestList()
end
function zZsetcurrQuestList()
	if zZZjournalListMode == 3 then
		currQuestList = 1
	else
		local  z = -1
		if zZZjournalListMode == 1 then x = const.ENTRY_TYPE_INPROGRESS
		elseif zZZjournalListMode == 2 then x = const.ENTRY_TYPE_COMPLETE end
		for k, v in pairs(zZquestListTable) do
			if v.stateType == x then currQuestList = k; break end
		end
	end
end
--newEnd
--newBegin store
function zZstoreTextColor(txt)
	tx = ''
	local x = string.find(txt, "%(")
	if x ~= nil then
		tx = string.sub(txt, x)
		txt = string.sub(txt, 1, x - 1)
		txt = txt .. ' ^B' .. tx .. '^-'
	end
	return txt
end
function zZgroupSplitStack(count)
	local idx = zZgetIdx(zZsorterGItm(store.groupItems), storeGroupItemsVar)
	storeScreen:SelectGroupItem(idx-1, true);
	storeScreen:SetGroupItemCount(idx-1, count);
end
function zZstoreSplitStack(count)
	local idx = zZgetIdx(zZstoreTbl(store.storeItems), storeItemsVar)
	storeScreen:SelectStoreItem(idx-1, true);
	storeScreen:SetStoreItemCount(idx-1, count);
end
function zZgetCostEnabled(container, cost, gold)
	local ret = true
	if not container and cost > gold then
		ret = false
	end
	return ret
end
function zZcanMuttiSteal(clck)
	if zZmultiSteal == 0 then
		return clck
	else
		local nb = 0
		for _, v in pairs(store.storeItems) do
			if v.highlight == 1 then nb = nb + 1 end
		end
		return nb > 0 and nb + #store.groupItems <= 16
	end
end
function zZsorterGItm(t)
	local zBag = {}
	local zValid = {}
	local zNValid = {}
	local zzType = {}
	local zzRet = {}
	local z = 0
	local itype = ''
	s1, s2 = '', ''
	for k, v in pairs(t) do
		if v.item.isBag == 1 then
			z = z + 1
			table.insert(zBag, {v, z})
		elseif v.valid == 1 then
			z = z + 1
			table.insert(zValid, {v, z})
		else
			z = z + 1
			table.insert(zNValid, {v, z})
		end
	end
	for k, v in pairs(zBag) do
		if zzGroupItemType == 'All' then
			table.insert(zzType, {v[1], v[2]})
		else
			itype = zzItemListAll[v[1].item.res].itemtype
			if itype == nil then itype = 'Misc' end
			if itype == zzGroupItemType then
				table.insert(zzType, {v[1], v[2]})
			end
		end
	end
	for k, v in pairs(zValid) do
		if zzGroupItemType == 'All' then
			table.insert(zzType, {v[1], v[2]})
		else
			itype = zzItemListAll[v[1].item.res].itemtype
			if itype == nil then itype = 'Misc' end
			if itype == zzGroupItemType then
				table.insert(zzType, {v[1], v[2]})
			end
		end
	end
	for k, v in pairs(zNValid) do
		if zzGroupItemType == 'All' then
			table.insert(zzType, {v[1], v[2]})
		else
			itype = zzItemListAll[v[1].item.res].itemtype
			if itype == nil then itype = 'Misc' end
			if itype == zzGroupItemType then
				table.insert(zzType, {v[1], v[2]})
			end
		end
	end
	if (zZgroupSearchString == nil or zZgroupSearchString == "") then
		zzRet = zzType
	else
		for k, v in pairs(zzType) do
			s1, s2 = zZforCompareStoreStrings(v[1].label, zZgroupSearchString)
			if string.find(s1, s2) then
				table.insert(zzRet, {v[1], v[2]})
			end
		end
	end
	zValid = {}
	zNValid = {}
	zBag = {}
	return zzRet
end
function zZgetIdx(t, i)
	local o = 0
	for k, v in pairs(t) do
		o = o + 1
		if o == i then o = v[2] break end
	end
	return o
end
function zZstoreTbl(t)
	local zzTbl = {}
	local zzType = {}
	local zzRet = {}
	local z = 1
	local s1, s2, tp = '', '', ''
	local itype = ''
	for k, v in pairs(t) do
		table.insert(zzTbl, {v, z})
		z = z + 1
	end
	if zzItemType == 'All' then
		zzType = zzTbl
	else
		for k, v in pairs(zzTbl) do
			itype = zzItemListAll[v[1].item.res].itemtype
			if itype == nil then itype = 'Misc' end
			if itype == zzItemType then
				table.insert(zzType, {v[1], v[2]})
			end
		end
	end
	if (zZstoreSearchString == nil or zZstoreSearchString == "") then
		zzRet = zzType
	else
		for k, v in pairs(zzType) do
			s1, s2 = zZforCompareStoreStrings(v[1].label, zZstoreSearchString)
			if string.find(s1, s2) then
				table.insert(zzRet, {v[1], v[2]})
			end
		end
	end
	return zzRet
end
function zZforCompareStoreStrings(sa, sb)
	local sta, stb = '', ''
	if zZlanguage == 'ru_RU' then
		sta = zZtoLowerEx(sa)
		stb = zZtoLowerEx(sb)
	else
		sta = string.lower(sa)
		stb = string.lower(sb)
	end
	return sta, stb
end
function zzBuySellSelectAll(items)
	local selected, unselected = {}, {}
	local indices = unselected
	for k, v in ipairs(items) do
		if v.valid == 1 then
			if v.highlight == 1 and indices == unselected then
				indices = selected
			end
			table.insert(indices, k - 1)
		end
	end
	return indices, indices == unselected
end
function zZfilter(t)
	local out = {}
	for k, v in pairs(t) do
		if v.valid == 1 or zZcurrItm == k or zZvalidIdent[k] == 1 then
			table.insert(out, v)
			zZvalidIdent[k] = 1
		else
			zZvalidIdent[k] = 0
		end
	end
	return out
end
function zZgetIdxID(t, i)
	local o = 0
	for k, v in pairs(t) do
		o = o + 1
		if v.valid == 1 then i = i - 1 end
		if i == 0 then break end
	end
	return o
end
function zZgetIdentifyDescStr(str)
	local tbl = {}
	local x, y = 0, 0
	local stra, strb, strc, r = '', '', '', ''
	while x ~= nil do
		strb = ''
		x = string.find(str, '-------', 1, true)
		if x ~= nil then
			strb = string.sub(str, 1, x - 1)
			y = string.find(str, '-\n', x + 6, true)
			if y ~= nil then
				strc = '^Y' .. string.sub(str, x, y - 2) .. '^-'
				str = string.sub(str, y + 1)
			else
				x = nil
				str = ''
			end
			if string.find(strb, '\n', 1, true) == 1 then
				strb = string.sub(strb, 2)
			end
		end
		if strb ~= '' then
		strb = zZinventorySpellDesc(strb)
		table.insert(tbl, {nil, strb})
		end
	end 
	for k, v in pairs(tbl) do
		if k == 1 then r = '' else r = '\n' end
		stra = stra .. r .. v[2] .. strc
	end
	return stra
end
function zZchecItemInCreInventory(item, tbl)
	local ret = false
	for k, v in pairs(tbl) do
		if item == v.item.res then
			ret = true
			break
		end
	end
	return ret
end
function zZchecItemInCreEquip(item, tbl)
	local ret = false
	for k, v in pairs(tbl) do
		if item == v[1].item.res then
			ret = true
			break
		end
	end
	return ret
end
--newEnd
--newBegin
function zZdialogTextSize()
	if worldNPCDialogPortrait == nil or worldNPCDialogPortrait == '' or worldNPCDialogPortrait == 'NONE' then
		Infinity_SetArea('worldNPCDialog', 40, nil, 804, nil)
		Infinity_SetArea('worldPlayerDialogChoicesList', 50, nil, 794, nil)
	else
		Infinity_SetArea('worldNPCDialog', 154, nil, 690, nil)
		Infinity_SetArea('worldPlayerDialogChoicesList', 164, nil, 680, nil)
	end
end
--newEnd
--newBegin spell books
function chackMageSelChar()
	local nm = Infinity_GetSelectedCharacterName()
	if nm == spellBookselName then return end
	spellBookselName = nm
	zZtoogleMageBookFunc()
end
function zZtoogleMageBookFunc()
	if toggleMageBook == 0 then
		if showContingency then
			Infinity_SetArea('bookListMage', nil, 410, nil, 156)
			Infinity_SetArea('bookDescription', nil, 410, nil, 156)
		else
			Infinity_SetArea('bookListMage', nil, 186, nil, 398)
			Infinity_SetArea('bookDescription', nil, 186, nil, 398)
		end
		Infinity_SetArea('zZmagePageInfo', nil, 606, nil, nil)
		Infinity_SetArea('zzContingBtn', nil, 606, nil, nil)
		Infinity_SetArea('zzMemorizeMageBtn', nil, 606, nil, nil)
		Infinity_SetArea('zzContingDoneBtn', nil, 606, nil, nil)
	else
		if showContingency then
			Infinity_SetArea('bookListMage', nil, 410, nil, 230)
			Infinity_SetArea('bookDescription', nil, 454, nil, 186)
			Infinity_SetArea('zzMagePlaceholder', nil, 410, nil, 38)
			Infinity_SetArea('memorizedListMageNew', nil, 410, nil, 38)
		else
			Infinity_SetArea('bookListMage', nil, 186, nil, 454)
			if characters[id].hasSorcererBook and bookMode == 0 then
				Infinity_SetArea('zzMagePlaceholder', nil, 186, nil, 0)
				Infinity_SetArea('memorizedListMageNew', nil, 186, nil, 0)
				Infinity_SetArea('bookDescription', nil, 186, nil, 454)
			else
				Infinity_SetArea('zzMagePlaceholder', nil, 186, nil, 218)
				Infinity_SetArea('memorizedListMageNew', nil, 186, nil, 218)
				Infinity_SetArea('bookDescription', nil, 410, nil, 230)
			end
		end
		Infinity_SetArea('zZmagePageInfo', nil, 680, nil, nil)
		Infinity_SetArea('zzContingBtn', nil, 680, nil, nil)
		Infinity_SetArea('zzMemorizeMageBtn', nil, 680, nil, nil)
		Infinity_SetArea('zzContingDoneBtn', nil, 680, nil, nil)
	end
end
function zZspellBookBkg(a, b, itm)
	if a == b then
		return itm
	else
		return ''
	end
end
function zZcolorizeSpellPageInfo(txt)
	local txa, txb = zZgetSubString(txt, ':')
	return '^O' .. txa .. '^-:' .. txb
end
function chackPriestSelChar()
	local nm = Infinity_GetSelectedCharacterName()
	if nm == spellBookselName then return end
	spellBookselName = nm
	zZtooglePriestBookFunc()
end
function zZtooglePriestBookFunc()
	if togglePriestBook == 0 then
		Infinity_SetArea('bookListPriest', nil, nil, nil, 372)
		Infinity_SetArea('priestBookDrsc', nil, 202, nil, 372)
		Infinity_SetArea('zzPriestPageInfo', nil, 606, nil, nil)
		Infinity_SetArea('zzMemorizePriestBtn', nil, 606, nil, nil)
	else
		Infinity_SetArea('bookListPriest', nil, nil, nil, 435)
		if characters[id].hasShamanBook then
			Infinity_SetArea('zzPriestPlaceholder', nil, nil, nil, 0)
			Infinity_SetArea('memorizedListPriestNew', nil, nil, nil, 0)
			Infinity_SetArea('priestBookDrsc', nil, 202, nil, 435)
		else
			Infinity_SetArea('zzPriestPlaceholder', nil, nil, nil, 210)
			Infinity_SetArea('memorizedListPriestNew', nil, nil, nil, 210)
			Infinity_SetArea('priestBookDrsc', nil, 416, nil, 221)
		end
		Infinity_SetArea('zzPriestPageInfo', nil, 680, nil, nil)
		Infinity_SetArea('zzMemorizePriestBtn', nil, 680, nil, nil)
	end
end
--newEnd
--newBegin Map
function zZshowMapNotes()
	if showNotes == 1 then showNotes = 0 else showNotes = 1 end
end
function CheckPauseWMapBegin()
	if worldScreen:CheckIfPaused() then
		zzPauseWMap = 1
	else
		worldScreen:TogglePauseGame(true)
	end
end
function CheckPauseWMapEnd()
	if zzPauseWMap == 0 then
		worldScreen:TogglePauseGame(true)
	else
		zzPauseWMap = 0
	end
end
function zZworldMapTitle()
	local str = t('WORLD_MAP_BUTTON')
	if zZlanguage == 'ru_RU' then
		str = zZtoLower(str, 2)
	end
	return str
end
--newEnd
--newBegin SaveLoad
--load
function zZsetLoadObjectPosition()
	local screenWidth, screenHeight = Infinity_GetScreenSize()
	Infinity_SetArea('zzLoadUnselect', -screenWidth / 8, 0, screenWidth, screenHeight)
	Infinity_SetArea('zzLoadBottom', nil, screenHeight - 160, nil, nil)
	Infinity_SetArea('zzLoadArea', nil, nil, nil, screenHeight - 160 - 120)
	Infinity_SetArea('zzLoadBtnLoad', nil, screenHeight - 68, nil, nil)
	Infinity_SetArea('zzLoadBtnDel', nil, screenHeight - 68, nil, nil)
	Infinity_SetArea('zzLoadBtnBack', nil, screenHeight - 68, nil, nil)
	Infinity_SetArea('zzLoadFilterSaveName', nil, screenHeight - 138, nil, nil)
	Infinity_SetArea('zzLoadFilterName', nil, screenHeight - 138, nil, nil)
	Infinity_SetArea('zzLoadFilterChapter', nil, screenHeight - 138, nil, nil)
end
function zZgetLoadMenuTitle()
	if currentSave == nil or currentSave == 0 then
		return stringsAll.zzNoLoadSel
	else
		return gameSaves.files[currentSave].slotName .. ' (^D' .. gameSaves.files[currentSave].sName .. '^-)'
	end
end
function zzGetLoadNumSaves(tb)
	if (tb.isImporting~=1) then
		return ' ( ^D' .. #tb.files .. '^- )'
	end
	return ''
end
function zzFuncLoadFilterName(rowNumber)
	if (zzLFilterName == nil or zzLFilterName == "") then return 1 end
	local text = gameSaves.files[rowNumber].sName
	if (string.find(string.lower(text), string.lower(zzLFilterName))) then
		return 1
	else
		return nil
	end
end
function zzFuncLoadFilterSaveName(rowNumber)
	if(zzLFilterSaveName == nil or zzLFilterSaveName == "") then return 1 end
	local text = gameSaves.files[rowNumber].fileName
	if(string.find(string.lower(text), string.lower(zzLFilterSaveName))) then
		return 1
	else
		return nil
	end
end
function zzFuncLoadFilterChapter(rowNumber)
	if (zzLFilterChapter == nil or zzLFilterChapter == "") then return 1 end
	local text = gameSaves.files[rowNumber].chapter
	if (string.find(string.lower(text), string.lower(zzLFilterChapter))) then
		return 1
	else
		return nil
	end
end
--save
function zZsetSaveObjectPosition()
	local screenWidth, screenHeight = Infinity_GetScreenSize()
	Infinity_SetArea('zzSaveUnselect', -screenWidth / 8, 0, screenWidth, screenHeight)
	Infinity_SetArea('zzSaveBottom', nil, screenHeight - 160, nil, nil)
	Infinity_SetArea('zzSaveArea', nil, nil, nil, screenHeight - 160 - 120)
	Infinity_SetArea('zzSaveBtnSave', nil, screenHeight - 68, nil, nil)
	Infinity_SetArea('zzSaveBtnSaveNew', nil, screenHeight - 68, nil, nil)
	Infinity_SetArea('zzSaveBtnDel', nil, screenHeight - 68, nil, nil)
	Infinity_SetArea('zzSaveBtnBack', nil, screenHeight - 68, nil, nil)
	Infinity_SetArea('zzSaveFilterSaveName', nil, screenHeight - 138, nil, nil)
	Infinity_SetArea('zzSaveFilterName', nil, screenHeight - 138, nil, nil)
	Infinity_SetArea('zzSaveFilterChapter', nil, screenHeight - 138, nil, nil)
end
function zzFuncSaveFilterName(rowNumber)
	if (zzSFilterName == nil or zzSFilterName == "") then return 1 end
	local text = gameSaves.files[rowNumber].sName
	if (string.find(string.lower(text), string.lower(zzSFilterName))) then
		return 1
	else
		return nil
	end
end
function zzFuncSaveFilterSaveName(rowNumber)
	if(zzSFilterSaveName == nil or zzSFilterSaveName == "") then return 1 end
	local text = gameSaves.files[rowNumber].fileName
	if(string.find(string.lower(text), string.lower(zzSFilterSaveName))) then
		return 1
	else
		return nil
	end
end
function zzFuncSaveFilterChapter(rowNumber)
	if (zzSFilterChapter == nil or zzSFilterChapter == "") then return 1 end
	local text = gameSaves.files[rowNumber].chapter
	if (string.find(string.lower(text), string.lower(zzSFilterChapter))) then
		return 1
	else
		return nil
	end
end
function zZgetSaveMenuTitle()
	if currentSave == nil or currentSave == 0 then
		return stringsAll.zzNoSaveSel
	else
		return gameSaves.files[currentSave].slotName .. ' (^D' .. gameSaves.files[currentSave].sName .. '^-)'
	end
end
--newEnd
--newBegin StartGame
function zZsetStartAreaPositions() --SoD_EET
	local screenWidth, screenHeight = Infinity_GetScreenSize()
	local bttop, btheight = 120, 55
	Infinity_SetArea('zZstartAreaBkg', nil, nil, screenWidth, screenHeight)
	Infinity_SetArea('zzStrSide', screenWidth - 440, (screenHeight/2) - (2160/2), nil, nil)
	Infinity_SetArea('zzStartBottom', (screenWidth/2) - (3840/2), screenHeight - 190, nil, nil)
	Infinity_SetArea('zzStartTop', (screenWidth/2) - (3840/2), nil, nil, nil) 
	Infinity_SetArea('zZlblStartVersion', (screenWidth - 440) + (390/2) - (249/2), screenHeight - 255, nil, nil)
	Infinity_SetArea('zZstartList', nil, screenHeight - 170, nil, nil)
	Infinity_SetArea('zZstartListDesc', nil, screenHeight - 170, screenWidth - 460, nil)
	%strStartTitle%
	Infinity_SetArea('zZstartDndLogo', (screenWidth - 440)/2 - (270/2) + 15, screenHeight - 255, nil, nil)
	if screenHeight > 768 then
		%strBigLogoPos%
	end
	local currBtn = 4
	if not getCampaignImportEnabled() and not getCampaignTutorialEnabled() then
		currBtn = 3
	end
	Infinity_SetArea('zZbtnStartContinue', (screenWidth - 440) + (390/2) - (249/2), bttop, nil, nil)
	Infinity_SetArea('zZbtnStartNewGame', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 1, nil, nil)
	Infinity_SetArea('zZbtnStartLoadGame', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 2, nil, nil)
	Infinity_SetArea('zZbtnStartPregenChar', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 3, nil, nil)
	Infinity_SetArea('zZbtnStartImportGame', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 4, nil, nil)
	Infinity_SetArea('zZbtnStartTutorialGame', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 4, nil, nil)
	Infinity_SetArea('zZbtnStartMultiplayer', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * (currBtn+1), nil, nil)
	Infinity_SetArea('zZbtnStartOptions', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * (currBtn+2), nil, nil)
	Infinity_SetArea('zZbtnStartCredits', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * (currBtn+3), nil, nil)
	Infinity_SetArea('zZbtnStartQuit', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * (currBtn+4), nil, nil)
	Infinity_SetArea('zZbtnStartShop', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * (currBtn+4), nil, nil)
	--options
	Infinity_SetArea('zZstartAreaBkgOpt', nil, nil, screenWidth, screenHeight)
	Infinity_SetArea('zzStrSideOpt', screenWidth - 440, (screenHeight/2) - (2160/2), nil, nil)
	Infinity_SetArea('zzStartBottomOpt', (screenWidth/2) - (3840/2), screenHeight - 190, nil, nil)
	Infinity_SetArea('zzStartTopOpt', (screenWidth/2) - (3840/2), nil, nil, nil)
	%strStartTitleOpt%
	Infinity_SetArea('zZlblStartVersionOpt', (screenWidth - 440) + (390/2) - (249/2), screenHeight - 255, nil, nil)
	Infinity_SetArea('zZstartDndLogoOpt', (screenWidth - 440)/2 - (270/2) + 15, screenHeight - 255, nil, nil)
	Infinity_SetArea('zZstartGameplayOpt', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 2, nil, nil)
	Infinity_SetArea('zZstartGraphicOpt', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 3, nil, nil)
	Infinity_SetArea('zZstartSoundOpt', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 4, nil, nil)
	Infinity_SetArea('zZstartLangOpt', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 5, nil, nil)
	Infinity_SetArea('zZstartMoviesOpt', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 6, nil, nil)
	Infinity_SetArea('zZstartBackOpt', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 7, nil, nil)
	Infinity_SetArea('zZshowNPCList', (screenWidth - 440) + (390/2) - (249/2), bttop + btheight * 8 + 20, nil, nil)
end
function getCampaignImportEnabled()
	return startCampaignData[selectedCampaign].importEnabled
end
function getCampaignTutorialEnabled()
	return startCampaignData[selectedCampaign].tutorialEnabled
end
function zZgetCampaignSeq(rw, hq)
	if rw == hq then return 1 else return 0 end
end
function zZgetCampTitle(row)
	local txt = startCampaignData[row].name
	return eetStrings[txt]
end
function zZgetCampDescription(row)
	local txt = startCampaignData[row].description
	return eetStrings[txt]
end
function zZselectCurrentCampaign(cmp)
	%strSelCurCamp%
end
function zZupdateGraphicOptFunc()
	if zZupdateGraphicOpt ~= 0 then
		zZsetStartAreaPositions()
		zZupdateGraphicOpt = 0
	end
end
%strEscMenuTitleArea%
--newEnd

--newBegin raznoe
function zZgetEpilogueName(ename)
	local name = ename
	local ln = string.len(ename)
	local ss = string.sub(ename, 1, ln - 1)
	local namet = epilogueNPCName[ss]
	if namet ~= nil then
		name = Infinity_FetchString(namet)
		if zZlanguage == "ru_RU" then
			name = zZtoUpper(name)
		end
	end
	return name
end
function zZgetEpilogueThrone()
	local ret = true
	local grsc = Infinity_GetScriptVarInt("PlayerChoseEssence")
	if grsc == 1 then ret = false end
	return ret
end
function getCampaignBackground(num)
	return '4KBACK' .. num
end
function zZgetNameForHelp(n)
	local str = Infinity_GetPortraitTooltip(n)
	local x = string.find(str, '\n', 1, true)
	if x ~= nil then
		str = string.sub(str, 1, x - 1)
	end
	return str
end
function zZgameHavePassword(str)
	if str == stringsAll.zzNo then
		return '^H' .. str .. '^-'
	else
		return '^Q' .. str .. '^-'
	end
end
--newEnd












