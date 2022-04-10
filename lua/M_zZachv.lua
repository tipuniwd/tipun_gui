zZachCheck = -1
zZachActiveTab = 1
zZrestartAchievem = 0

zZshowAch = 0
zZachSort = 2

zZachDone = {}
zZachActive = {}
zZachNotDone = {}

zztextflashes = {}
zztextflashidx = 1

zZachievemTable = {}
%generate_ach_table%

function zZachInit()
	local avar, aexists = 0, 0
	Infinity_PushMenu('zztextflash')
	for k, v in pairs(zZachievemTable) do
		avar = Infinity_GetScriptVarInt(v.var_name)
		if avar == nil then avar = 0 end
		aexists = Infinity_GetScriptVarInt(v.var_name .. '_SHOW')
		if aexists == nil then aexists = 0 end
		v.var_value = avar
		v.var_exists = aexists
	end
	zZachCheck = zZachTime()
end
function zZachTime()
	return math.floor(Infinity_GetClockTicks() / 1000)
end
function zZshowAchTextFlash()
	if zZachTime() < zZachCheck then return end
	local avar = 0
	local var_name = ''
	local ddate = 0
	local str = ''
	for k, v in pairs(zZachievemTable) do
		str = ''
		if v.var_value == 1 then
			if v.var_exists == 0 then
				var_name = v.var_name .. "_SHOW"
				ddate = zZtimstampToDaysAch(Infinity_GetTimeString())
				if tonumber(ddate) == nil then v.var_exists = 1 else v.var_exists = tonumber(ddate) end
				C:Eval('SetGlobal("' .. var_name .. '","GLOBAL",' .. v.var_exists .. ')')
				if zZachShowAchivements == 1 then
					if v.var_exists > 1 then str = '^A' .. zZachGetDateStringFromVar(zZachGetDateFromVar(v.var_exists)) .. '^-' end
					Infinity_DisplayString('^C' .. zZachText.achievs .. '^-^D' .. v.ach_label .. '^-')
					showTextFlashEx(zZachText.achievs, v.ach_label .. '\n' .. v.ach_desc, str, 3000, v.ach_bam, v.ach_icon_frame)
				end
			end
		else
			avar = Infinity_GetScriptVarInt(v.var_name)
			if avar == 1 then
				var_name = v.var_name .. "_SHOW"
				ddate = zZtimstampToDaysAch(Infinity_GetTimeString())
				if tonumber(ddate) == nil then v.var_exists = 1 else v.var_exists = tonumber(ddate) end
				C:Eval('SetGlobal("' .. var_name .. '","GLOBAL",' .. v.var_exists .. ')')
				v.var_value = 1
				if zZachShowAchivements == 1 then
					if v.var_exists > 1 then str = '^A' .. zZachGetDateStringFromVar(zZachGetDateFromVar(v.var_exists)) .. '^-' end
					Infinity_DisplayString('^C' .. zZachText.achievs .. '^-^D' .. v.ach_label .. '^-')
					showTextFlashEx(zZachText.achievs, v.ach_label .. '\n' .. v.ach_desc, str, 3000, v.ach_bam, v.ach_icon_frame)
				end
			end
		end
	end
	zZachCheck = zZachTime() + 30
end
function zZachGetDateStringFromVar(y, m, d)
	return d .. ' ' .. m .. ' ' .. y
end
function zZgetAchDateString(num)
	local str = ''
	if num > 1 then
		str = ' (^I' .. zZachGetDateStringFromVar(zZachGetDateFromVar(num)) .. '^-)'
	end
	return str
end
function zZachGenerateTables()
	local idx, idxa = 0, 0
	local reason = ''
	zZachDone = {}
	zZachActive = {}
	zZachNotDone = {}
	for k, v in pairs(zZachievemTable) do
		reason = ''
		local num = 0
		local done = 0
		local vval = 0
		if v.var_value == 1 then
			table.insert(zZachDone, {v.number, v.ach_label, v.ach_desc, v.ach_bam, v.ach_icon_frame, reason, num, v.var_exists})
		else
			idx = v.connected
			idxa = v.connectedtwo
			if idx ~= -1 or idxa ~= -1 then
				if idx ~= -1 and idx < 1001 and done == 0 then
					if zZachievemTable[idx].var_value ~= 0 then
						reason = '^C' .. zZachText.achieveDone .. '^-' .. zZachievemTable[idx].ach_label
						num = idx
						table.insert(zZachNotDone, {v.number, v.ach_label, v.ach_desc, v.ach_bam, v.ach_icon_frame, reason, num, v.var_exists})
						done = 1
					end
				end
				if idxa ~= -1 and idxa < 1001 and done == 0 then
					if zZachievemTable[idxa].var_value ~= 0 then
						reason = '^C' .. zZachText.achieveDone .. '^-' .. zZachievemTable[idxa].ach_label
						num = idxa
						table.insert(zZachNotDone, {v.number, v.ach_label, v.ach_desc, v.ach_bam, v.ach_icon_frame, reason, num, v.var_exists})
						done = 1
					end
				end %friend_of_bg1% %friend_of_bg2% %lord_of_bg1% %lord_of_bg2% %new_npc_bg1%
				if idx >= 1001 and idx <= 1100 then
					num = 0
					vval = Infinity_GetScriptVarInt(v.var_name .. '_CHECK')
					if vval == 1 then
						reason = zZachText.noNPC
						table.insert(zZachNotDone, {v.number, v.ach_label, v.ach_desc, v.ach_bam, v.ach_icon_frame, reason, num, v.var_exists})
						done = 1
					end
				end
				if idxa >= 1101 and idxa <= 1200 then
					num = 0
					vval = Infinity_GetScriptVarInt(v.var_name .. '_CHECK')
					if vval ~= 0 then
						reason = zZachText.noClassKit
						if vval == 2 and ( idxa >= 1103 and idxa <= 1110 ) then
							reason = zZachText.otherStronghold
						end
						table.insert(zZachNotDone, {v.number, v.ach_label, v.ach_desc, v.ach_bam, v.ach_icon_frame, reason, num, v.var_exists})
						done = 1
					end
				end
				if done == 0 then
					reason = ''
					num = 0
					table.insert(zZachActive, {v.number, v.ach_label, v.ach_desc, v.ach_bam, v.ach_icon_frame, reason, num, v.var_exists})
					done = 1
				end
			else
				table.insert(zZachActive, {v.number, v.ach_label, v.ach_desc, v.ach_bam, v.ach_icon_frame, reason, num, v.var_exists})
			end
		end
	end
end
function zZachSortTbl(tab, typ)
	local function zzfsortA(s1, s2) return s1[1] < s2[1] end
	local function zzfsortB(s1, s2) return utf8.lower(s1[2]) < utf8.lower(s2[2]) end
	local function zzfsortC(s1, s2) return s1[8] < s2[8] end
	if tab == 2 then
		if typ == 1 then table.sort(zZachActive, zzfsortA)
		elseif typ == 2 then table.sort(zZachActive, zzfsortB)
		else table.sort(zZachActive, zzfsortC)
		end
	elseif tab == 3 then
		if typ == 1 then table.sort(zZachNotDone, zzfsortA)
		elseif typ == 2 then table.sort(zZachNotDone, zzfsortB)
		else table.sort(zZachNotDone, zzfsortC)
		end
	else
		if typ == 1 then table.sort(zZachDone, zzfsortA)
		elseif typ == 2 then table.sort(zZachDone, zzfsortB)
		else table.sort(zZachDone, zzfsortC)
		end
	end
end
function showTextFlashEx(title, str, date, displayTime, xbam, xbsq)
	if #zztextflashes == 0 then
		zztextflashidx = 1
	end
	local fullStr = str
	local splitLines = string.gmatch(fullStr, "[^\r\n]+")
	local line1 = splitLines()
	local line2 = splitLines()
	if(line2 == nil) then return end
	zztextflashes[zztextflashidx] = {title, line1, line2, displayTime, str, nil, xbam, xbsq, date}
	zztextflashidx = zztextflashidx + 1
end
function zZgetOpacityForInfoBlock(rampTime)
	local tf = next(zztextflashes)

	if tf then
		local time = Infinity_GetGameTicks()
		local v = zztextflashes[tf]
		if v[6] == nil then
			v[6] = time
		end
		local t = fadeInOut(time, v[6], rampTime, v[4])
		if time > v[6] + v[4] + rampTime*2 then
			zztextflashes[tf] = nil
		end
		return t
	else
		return 0
	end
end
function zZgetTFString(z)
	local tf = next(zztextflashes)

	if tf then
		return zztextflashes[tf][z]
	else
		return ''
	end
end
function zZgetTFFrame()
	local tf = next(zztextflashes)

	if tf then
		return zztextflashes[tf][8]
	else
		return 0
	end
end
function zZgetReason(ach)
	local str = ''
	if reason ~= '' then
		str = '^M' .. zZachText.achReason .. '^-' .. ach[6]
	end
	return str
end
function zZgetActiveFrame(nm, atb)
	local ret = 0
	if nm == atb then
		ret = 2
	end
	return ret
end
function zZgetNumAchivemDone()
	local final = ''
	local done, active, nodone = #zZachDone, #zZachActive, #zZachNotDone
	local all = done + active
	local allz = done + active + nodone
	if zZachActiveTab == 1 then
		final = zZachText.achAchDone .. '^A' .. done .. '^-'
		if zZachShowAchivementsActive == 1 then final = final .. zZachText.achIz .. '^A' .. all .. '^-' end
		if zZachShowAchivementsNodone == 1 then final = final .. ' (^A'  .. allz .. '^-)' end
	end
	if zZachActiveTab == 2 then
		final = zZachText.achAchAcnive .. '^A' .. active .. '^-' .. zZachText.achIz .. '^A' .. all .. '^-'
		if zZachShowAchivementsNodone == 1 then final = final .. ' (^A'  .. allz .. '^-)' end
	end
	if zZachActiveTab == 3 then
		final = zZachText.achAchNoDone .. '^A' .. nodone .. '^-' .. zZachText.achIz .. '^A' .. allz .. '^-'
	end
	return final
end
function zZgreyLuaText(s, bool)
	if bool then return '^E' .. s .. '^-' else return s end
end














