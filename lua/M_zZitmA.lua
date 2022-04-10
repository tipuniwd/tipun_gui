function zZNPCddataTblCrreeate(vart)
	zZNPCddataTbl = {}
	table.insert( zZNPCddataTbl, { t('GENDER_TITLE'), string.lower(Infinity_FetchString(zZallNPCList[vart].gender)) } )
	table.insert( zZNPCddataTbl, { t('RACE_TITLE'), string.lower(Infinity_FetchString(zZallNPCList[vart].race)) } )
	local str = string.lower(Infinity_FetchString(zZallNPCList[vart].class))
	if zZallNPCListReplace[zZallNPCList[vart].className] ~= nil then
		local z = 1
		local strz = ''
		str = ''
		for i = 1, #zZallNPCListReplace[zZallNPCList[vart].className] do
			if z > 1 then strz = '/' else strz = '' end
			str = str .. strz .. string.lower(Infinity_FetchString(zZallNPCListReplace[zZallNPCList[vart].className][i]))
			z = z + 1
		end
	end
	if zZallNPCList[vart].kit > 0 then
		str = str .. ' ^O(^-^B' .. string.lower(Infinity_FetchString(zZallNPCList[vart].kit)) .. '^-^O)^-'
	end
	table.insert( zZNPCddataTbl, { t('CLASS_TITLE'), str } )
	table.insert( zZNPCddataTbl, { t('ALIGNMENT_TITLE'), string.lower(Infinity_FetchString(zZallNPCList[vart].alignment)) } )
	if zZallNPCList[vart].racialEnemy > 0 then
		table.insert( zZNPCddataTbl, { t('HATED_RACE_TITLE'), string.lower(Infinity_FetchString(zZallNPCList[vart].racialEnemy)) } )
	end
	str = zZallNPCList[vart].STR
	if zZallNPCList[vart].STTREXTRA > 0 then
		if zZallNPCList[vart].STTREXTRA == 100 then
			str = str .. '^O/^-00'
		else
			str = str .. '^O/^-' .. zZallNPCList[vart].STTREXTRA
		end
	end
	table.insert( zZNPCddataTbl, { t('STRENGTH_LABEL'), str } )
	table.insert( zZNPCddataTbl, { t('DEXTERITY_LABEL'), zZallNPCList[vart].DEX } )
	table.insert( zZNPCddataTbl, { t('CONSTITUTION_LABEL'), zZallNPCList[vart].CON } )
	table.insert( zZNPCddataTbl, { t('INTELLIGENCE_LABEL'), zZallNPCList[vart].INT } )
	table.insert( zZNPCddataTbl, { t('WISDOM_LABEL'), zZallNPCList[vart].WIS } )
	table.insert( zZNPCddataTbl, { t('CHARISMA_LABEL'), zZallNPCList[vart].CHR } )
	TEXT_charName = Infinity_FetchString(zZallNPCList[vart].name)
	TEXT_charBio = Infinity_FetchString(zZallNPCList[vart].bio)
end

--[[ store filter ]]
zzItemType = 'All'
zZshowItemTypeFilter = 0
zzGroupItemType = 'All'
zZshowGroupItemTypeFilter = 0

zzItemTypeList = {}
table.insert(zzItemTypeList, {'Misc', stringsAll.zzMisc, 0})
table.insert(zzItemTypeList, {'Amulet', stringsAll.zzAmulet, 0})
table.insert(zzItemTypeList, {'Armor', stringsAll.zzArmor, 0})
table.insert(zzItemTypeList, {'Belt', stringsAll.zzBelt, 0})
table.insert(zzItemTypeList, {'Boot', stringsAll.zzBoot, 0})
table.insert(zzItemTypeList, {'Arrow', stringsAll.zzArrow, 0})
table.insert(zzItemTypeList, {'Bracers', stringsAll.zzBracers, 0})
table.insert(zzItemTypeList, {'Helmet', stringsAll.zzHelmet, 0})
table.insert(zzItemTypeList, {'Key', stringsAll.zzKey, 0})
table.insert(zzItemTypeList, {'Potion', stringsAll.zzPotion, 0})
table.insert(zzItemTypeList, {'Ring', stringsAll.zzRing, 0})
table.insert(zzItemTypeList, {'Scroll', stringsAll.zzScroll, 0})
table.insert(zzItemTypeList, {'Shield', stringsAll.zzShield, 0})
table.insert(zzItemTypeList, {'Bullet', stringsAll.zzBullet, 0})
table.insert(zzItemTypeList, {'Bow', stringsAll.zzBow, 0})
table.insert(zzItemTypeList, {'Dagger', stringsAll.zzDagger, 0})
table.insert(zzItemTypeList, {'Mace', stringsAll.zzMace, 0})
table.insert(zzItemTypeList, {'Sling', stringsAll.zzSling, 0})
table.insert(zzItemTypeList, {'SmallSword', stringsAll.zzSmallSword, 0})
table.insert(zzItemTypeList, {'LargeSword', stringsAll.zzLargeSword, 0})
table.insert(zzItemTypeList, {'Hammer', stringsAll.zzHammer, 0})
table.insert(zzItemTypeList, {'Morningstar', stringsAll.zzMorningstar, 0})
table.insert(zzItemTypeList, {'Flail', stringsAll.zzFlail, 0})
table.insert(zzItemTypeList, {'Dart', stringsAll.zzDart, 0})
table.insert(zzItemTypeList, {'Axe', stringsAll.zzAxe, 0})
table.insert(zzItemTypeList, {'Staff', stringsAll.zzStaff, 0})
table.insert(zzItemTypeList, {'Crossbow', stringsAll.zzCrossbow, 0})
table.insert(zzItemTypeList, {'Spear', stringsAll.zzSpear, 0})
table.insert(zzItemTypeList, {'Halberd', stringsAll.zzHalberd, 0})
table.insert(zzItemTypeList, {'Bolt', stringsAll.zzBolt, 0})
table.insert(zzItemTypeList, {'Cloack', stringsAll.zzCloack, 0})
table.insert(zzItemTypeList, {'Gem', stringsAll.zzGem, 0})
table.insert(zzItemTypeList, {'Wand', stringsAll.zzWand, 0})
table.insert(zzItemTypeList, {'Bag', stringsAll.zzBag, 0})
table.insert(zzItemTypeList, {'Book', stringsAll.zzBook, 0})
function zZsortItemTypeList(s1, s2)
	return string.lower(s1[2]) < string.lower(s2[2])
end
table.sort(zzItemTypeList, zZsortItemTypeList)
table.insert(zzItemTypeList, 1, {'All', stringsAll.zzAll, 0})

zZdonateAmountTable = {}
function zZcreateDonateAmountTable()
	table.insert(zZdonateAmountTable, {'^D' .. stringsAll.zzDonateAmtChng .. '^- ^$1000^- ^D' .. stringsAll.zzGP .. '^-', 1000, 1})
	table.insert(zZdonateAmountTable, {stringsAll.zzDonateAmtChng .. ' ^$500^- ' .. stringsAll.zzGP, 500, 1})
	table.insert(zZdonateAmountTable, {'^D' .. stringsAll.zzDonateAmtChng .. '^- ^$200^- ^D' .. stringsAll.zzGP .. '^-', 200, 1})
	table.insert(zZdonateAmountTable, {stringsAll.zzDonateAmtChng .. ' ^$100^- ' .. stringsAll.zzGP, 100, 1})
	table.insert(zZdonateAmountTable, {'^D' .. stringsAll.zzDonateAmtChng .. '^- ^$50^- ^D' .. stringsAll.zzGP .. '^-', 50, 1})
	table.insert(zZdonateAmountTable, {stringsAll.zzDonateAmtChng .. ' ^$10^- ' .. stringsAll.zzGP, 10, 1})
	table.insert(zZdonateAmountTable, {'^D' .. stringsAll.zzDonateAmtChng .. '^- ^$5^- ^D' .. stringsAll.zzGP .. '^-', 5, 1})
	table.insert(zZdonateAmountTable, {stringsAll.zzDonateAmtChng .. ' ^$1^- ' .. stringsAll.zzGP, 1, 1})
end

function zZgetItemTypeLabel(tp)
	local st = ''
	for k, v in pairs(zzItemTypeList) do
		if v[1] == tp then
			st = v[2]
			break
		end
	end
	return st
end
function zZgenerateAvailableItenType(tbl)
	for k, v in pairs(zzItemTypeList) do
		v[3] = 0
	end
	zzItemTypeList[1][3] = 1
	local tp = ''
	for k, v in pairs(tbl) do
		tp = zzItemListAll[v.item.res].itemtype
		for x, y in pairs(zzItemTypeList) do
			if y[1] == tp then y[3] = 1; break end
		end
	end
end
function zZitemTypeFilterColor(str)
	local z = 0
	for i = 1, #zzItemTypeList do
		if z == 0 then
			if str == zzItemTypeList[i][2] then str = '^D' .. str .. '^-'; break; end
			if zzItemTypeList[i][3] == 1 then z = 1 end
		else
			if str == zzItemTypeList[i][2] then break; end
			if zzItemTypeList[i][3] == 1 then z = 0 end
		end
	end
	return str
end
function zZcheckDonateAmountTable(gp)
	for k, v in pairs(zZdonateAmountTable) do
		if gp >= v[2] then v[3] = 1 else v[3] = 0 end
	end
end
function zzIsHealingSpellsButtonClickable(tbl)
	local ret = 0
	for k, v in pairs(tbl) do
		if v.highlight == 1 then
			ret = 1
			break
		end
	end
	return ret
end
function zzRemoveHealHighlight(tbl)
	for k, v in pairs(tbl) do
 		v.highlight = 0
 		storeScreen:SelectSpellItem( k - 1,  false)
	end
end
function zZcheckHealHighlight()
	if zZgetHealChar == Infinity_GetSelectedCharacterName() then return end
	zzRemoveHealHighlight(store.healingSpells)
	zZgetHealChar = Infinity_GetSelectedCharacterName()
end
function zZshuffle(arr)
	for i = 1, #arr - 1 do
		local j = math.random(i, #arr)
		arr[i], arr[j] = arr[j], arr[i]
	end
end
function zZshuffled_numbers(n)
	local numbers = {}
	for i = 1, n do
		numbers[i] = i
	end
	zZshuffle(numbers)
	return numbers
end
function zZsetDrinksRandomValue()
	math.randomseed(timer:GetCurrentTime())
	local tbl = {}
	zZdrinksRandomValue = {}
	tbl = zZshuffled_numbers(11)
	for i = 1, #store.drinks do
		if i <= 11 then
			zZdrinksRandomValue[i] = tbl[i] - 1
		else
			zZdrinksRandomValue[i] = math.random(1, 11) - 1
		end
	end
end
function zZgetDrinkFrame(a, b)
	if a == b then return 2 else return 0 end
end













