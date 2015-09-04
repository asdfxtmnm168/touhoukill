
--SmartAI:needRetrial(judge) 
function SmartAI:lingqiParse(self,target,use)
	use = use or self.player:getTag("lingqicarduse"):toCardUse()
	--if not use or not use.card  or not use.from then return 3 end
	if not use or not use.card   then return 3 end
	local card=use.card
	local from=use.from
	
	if self.player:objectName() == target:objectName() then
		--simulate standard-ai with a fakeEffect
		local pattern = nil
		if card:isKindOf("Slash") then
			local _data=sgs.QVariant()
		
			local fakeEffect =sgs.SlashEffectStruct()
			fakeEffect.slash = card
			fakeEffect.from = from
			fakeEffect.to = target
			_data:setValue(fakeEffect)
			if sgs.ai_skill_cardask["slash-jink"] (self, _data, pattern, from) == "." then
				return 1
			end
		elseif card:isKindOf("AOE") then
			local _data=sgs.QVariant()
		
			local fakeEffect =sgs.CardEffectStruct()
			fakeEffect.card = card
			fakeEffect.from = from
			fakeEffect.to = target
			_data:setValue(fakeEffect)
			if card:isKindOf("SavageAssault") then
				pattern = "slash"
				if sgs.ai_skill_cardask.aoe(self, _data, pattern, from, "savage_assault") == "." and not self:hasWeiya() then
					--should fix weiya
					return 1
				end
			end
			if card:isKindOf("ArcheryAttack") then
				pattern = "jink"
				if sgs.ai_skill_cardask.aoe(self, _data, pattern, from, "archery_attack") == "." and not self:hasWeiya()  then
					--should fix weiya
					return 1
				end
			end
		end
	end
	if sgs.dynamic_value.damage_card[card:getClassName()] then	
		return 2
	end
	if card:isKindOf("ExNihilo") then
		return 1
	end
	if card:isKindOf("GodSalvation") and target:isWounded() then
		return 1
	end
	if card:isKindOf("IronChain")  then
		if target:isChained() then
			return 1
		else
			return 2
		end
	end
	
	if card:isKindOf("Snatch") or card:isKindOf("Dismantlement") then
		local cards=target:getCards("j")
		local throw_delay=false
		for _,card in sgs.qlist(cards) do
			if card:isKindOf("Indulgence") or card:isKindOf("SupplyShortage") then
				throw_delay=true
			end
		end
		if  throw_delay and not self:isEnemy(from,target) then
			return 1
		else
			return 2
		end
	end
	return 3
end


sgs.ai_skill_invoke.lingqi =function(self,data)
	if not self:invokeTouhouJudge() then return false end
	
	local parse=self:lingqiParse(self,self.player)
	if parse==2 then
		return true
	end
	return false
end
sgs.ai_skillProperty.lingqi = function(self)
	return "cause_judge"
end

sgs.ai_skill_invoke.qixiang =function(self,data)
	local target=self.player:getTag("qixiang_judge"):toJudge().who
	if self:isFriend(target) then
		return true
	end
end
sgs.ai_choicemade_filter.skillInvoke.qixiang = function(self, player, promptlist)
	local target=player:getTag("qixiang_judge"):toJudge().who
	if target then
		if promptlist[#promptlist] == "yes" then
			sgs.updateIntention(player, target, -50)
		elseif promptlist[#promptlist] == "no" and sgs.ai_role[target:objectName()] ~= "netural" then
			if target:isLord() then
				sgs.updateIntention(player, target, 10)
			elseif sgs.ai_role[target:objectName()] == "loyalist" and not self:cautionRenegade() then
				sgs.updateIntention(player, target, 10)
			elseif sgs.ai_role[target:objectName()] == "rebel" then
				sgs.updateIntention(player, target, 10)
			end
		end	
	end
end

sgs.ai_skill_invoke.boli = function(self,data) 
	local judge=self.player:getTag("boli_judge"):toJudge()
	return self:needRetrial(judge)
end
sgs.ai_skill_cardask["@boli-retrial"] = function(self, data)
        local lord = getLord(self.player)
		if not self:isFriend(lord) then return "." end
		local cards = sgs.QList2Table(self.player:getCards("h"))
		local cards1={}
		for _,card in pairs(cards) do
			if card:getSuit()==sgs.Card_Heart then
				table.insert(cards1,card)
			end
		end
        local judge = data:toJudge()

		if #cards1==0 then return "." end
        return "$" .. self:getRetrialCardId(cards1, judge) or judge.card:getEffectiveId()  --tostring()
end
sgs.ai_skillProperty.boli = function(self)
	return "noKingdom"
end

--function SmartAI:hasHeavySlashDamage(from, slash, to, getValue)
local mofa_skill = {}
mofa_skill.name = "mofa"
table.insert(sgs.ai_skills, mofa_skill)
function mofa_skill.getTurnUseCard(self)

	if self.player:hasFlag("mofa_invoked") then return nil end
	if self.player:isKongcheng() then return nil end
	if #self.enemies==0 then return false end
	

	local cards = self.player:getCards("h")
	local key_names={"Duel","SavageAssault","ArcheryAttack"}
	local key_ids={}
	local slashes={}
	local slashe_ids={}
	for _,name in pairs (key_names) do
		for _,c in sgs.qlist(cards) do
			if c:isKindOf(name) and  c:isAvailable(self.player) then
				table.insert(key_ids,c:getId())
			elseif c:isKindOf("Slash") and  c:isAvailable(self.player) then
				table.insert(slashe_ids,c:getId())
				table.insert(slashes,c)
			end
		end
	end
	

	local temp_slash
	for _,p in pairs (self.enemies) do
		for _,s in pairs (slashes) do
			if self.player:canSlash(p,s,true) then
				if temp_slash and temp_slash:getSuit() ~=sgs.Card_Spade then
					break
				else
					temp_slash=s
				end
			end
		end
		if temp_slash and temp_slash:getSuit() ~=sgs.Card_Spade then
			break
		end
	end

	if #key_ids==0 and not temp_slash  then 
		return nil
	end
	
	
	

	local scards={}
	local scards_without_key={}
	local others_without_key={}
	local keycard_func = function(card)
		return   table.contains(key_ids,card:getId()) 
			or (temp_slash and card:getId() == temp_slash:getId()) 
	end
	for _,card in sgs.qlist(cards) do
		if  card:getSuit()==sgs.Card_Spade and not keycard_func(card) then
				table.insert(scards_without_key,card)
		end
		if card:getSuit()==sgs.Card_Spade then
				table.insert(scards,card)
		end
		if  card:getSuit() ~=sgs.Card_Spade and not keycard_func(card)  then
				table.insert(others_without_key,card)
		end
	end
	
	

	if #scards_without_key>0 then 
		self:sortByCardNeed(scards_without_key)
		return sgs.Card_Parse("@mofaCard="..scards_without_key[1]:getEffectiveId())
	elseif #others_without_key>0 then
		self:sortByCardNeed(others_without_key)
		return sgs.Card_Parse("@mofaCard="..others_without_key[1]:getEffectiveId())
	elseif #scards>0 and (#key_ids>1 or (#key_ids>0 and temp_slash)) then
			self:sortByUseValue(scards)
			return sgs.Card_Parse("@mofaCard="..scards[1]:getEffectiveId())
	end
	return false
end
sgs.ai_skill_use_func.mofaCard = function(card, use, self)
	use.card=card
end

sgs.ai_use_value.mofaCard = 4
sgs.ai_use_priority.mofaCard = 4
sgs.ai_cardneed.mofa = function(to, card, self)
	return card:getSuit()==sgs.Card_Spade
end



local wuyuvs_skill = {}
wuyuvs_skill.name = "wuyuvs"
table.insert(sgs.ai_skills, wuyuvs_skill)
wuyuvs_skill.getTurnUseCard = function(self)

	if self.player:hasFlag("Forbidwuyu") then return nil end


	local cards = self.player:getCards("h")
	cards = sgs.QList2Table(cards)
	local card
	self:sortByUseValue(cards,true)
	for _,acard in ipairs(cards)  do
		if acard:getSuit()==sgs.Card_Spade then
			card = acard
			break
		end
	end
	if not card then return nil end
	
	local card_id = card:getEffectiveId()
	local card_str ="@wuyuCard="..card_id
	local skillcard = sgs.Card_Parse(card_str)
	
	assert(skillcard)
	
	return skillcard
end

sgs.ai_skill_use_func.wuyuCard = function(card, use, self)

	local targets = {}
	for _,friend in ipairs(self.friends_noself) do
		if friend:hasLordSkill("wuyu") then
			if not friend:hasFlag("wuyuInvoked") then
				table.insert(targets, friend)
			end
		end
	end

	if #targets > 0 then 
		use.card = card
		if use.to then
			use.to:append(targets[1])
			if use.to:length()>=1 then return end
		end
	end

end

sgs.ai_card_intention.wuyuCard = -40
sgs.ai_skillProperty.wuyu = function(self)
	return "noKingdom"
end

function SmartAI:hasSkillsForSaiqian(player)
	player = player or self.player
	if player:hasSkills("xisan|yongheng|kongpiao") then
		return true
	end
	if player:hasSkills("zaozu+qiuwen") then
		return true
	end
	return false
end
local saiqianvs_skill = {}
saiqianvs_skill.name = "saiqianvs"
table.insert(sgs.ai_skills, saiqianvs_skill)
function saiqianvs_skill.getTurnUseCard(self)
		if self.player:isKongcheng() then return nil end
        if self.player:hasFlag("ForbidSaiqian") then return nil end
        local handcards = sgs.QList2Table(self.player:getHandcards())
		local saiqian_cards={}
		self:sortByUseValue(handcards)
		if self.player:isWounded()then			
			for _,c in pairs(handcards)do
				if c:getSuit()==sgs.Card_Heart then
					table.insert(saiqian_cards,c:getId())
					break
				end
			end
		end
       if self:getOverflow() >0 or self:hasSkillsForSaiqian(self.player)  then
			local overflow=math.min(3,self:getOverflow())
			if self:hasSkillsForSaiqian() then
				overflow= math.min(3,self.player:getHandcardNum())
			end
			for var=1, overflow, 1 do
				if #saiqian_cards<overflow   
					and not table.contains(saiqian_cards,handcards[var]:getId()) then
					table.insert(saiqian_cards,handcards[var]:getId())
				end
			end
	   end
		if #saiqian_cards>0 then
			local card_str= "@saiqianCard=" .. table.concat(saiqian_cards, "+")
			return sgs.Card_Parse(card_str)		
		end
		return nil
end
sgs.ai_skill_use_func.saiqianCard = function(card, use, self)
    local targets = {}
	for _,friend in ipairs(self.friends_noself) do
		if friend:hasSkill("saiqian") then
			if not friend:hasFlag("saiqianInvoked") then
				table.insert(targets, friend)
			end
		end
	end
	
	if #targets > 0 then
		use.card = card
		if use.to then
			use.to:append(targets[1])
			return
		end
	end
end
sgs.ai_card_intention.saiqianCard = -60

sgs.ai_skill_choice.saiqian= function(self, choices, data)	
	local source=self.player:getTag("saiqian_source"):toPlayer()
	if not source or not source:isWounded() or not self:isFriend(source) then return "cancel_saiqian" end
	if choices:match("discard_saiqian") then
		for _,c in sgs.qlist(self.player:getHandcards())do
			if c:getSuit()==sgs.Card_Heart  then
				return "discard_saiqian"
			end
		end
	end
	if self.player:getHp()>3 and choices:match("losehp_saiqian") then
		return "losehp_saiqian"
	end
	return "cancel_saiqian"
end
sgs.ai_choicemade_filter.skillChoice.saiqian = function(self, player, promptlist)
	local choice = promptlist[#promptlist]
	local target =player:getTag("saiqian_source"):toPlayer()
	
	if not target or not target:isWounded() then return end
	if  choice == "losehp_saiqian" then 
		sgs.updateIntention(player, target, -80) 
	end
end

sgs.ai_skill_cardask["@saiqian-discard"] = function(self,data)
        local cards = sgs.QList2Table(self.player:getCards("h"))
        if #cards==0 then return "." end
		self:sortByCardNeed(cards)
		for _,card in pairs (cards) do
			if card:getSuit()==sgs.Card_Heart then
				return "$" .. card:getId()
			end
		end
		return "."
end
sgs.ai_choicemade_filter.cardResponded["@saiqian-discard"] = function(self, player, promptlist)
	if promptlist[#promptlist] ~= "_nil_" then
		local target =player:getTag("saiqian_source"):toPlayer()
		if not target or not target:isWounded() then return end	
		sgs.updateIntention(player, target, -80)
	end
end

sgs.saiqian_suit_value = {
	heart = 4.9
}

--find cost for jiezou
function jiezouSpade(self,player)
	local cards
	if player:objectName() == self.player:objectName() then
		cards =self.player:getCards("he")
	else
		cards=player:getCards("e")
	end
	for _,card in sgs.qlist(cards) do
		if card:getSuit()==sgs.Card_Spade then
			return true
		end
	end
	return false
end
local jiezou_skill = {}
jiezou_skill.name = "jiezou"
table.insert(sgs.ai_skills, jiezou_skill)
jiezou_skill.getTurnUseCard = function(self)
	local targets=self:getEnemies(self.player)
	local can_use= jiezouSpade(self,self.player)
	if not can_use then
		for _,target in pairs(targets) do
			can_use = jiezouSpade(self,target)
			if can_use then
				break
			end
		end
	end
	if can_use then
		return sgs.Card_Parse("@jiezouCard=.")
	end
	return nil
end
sgs.ai_skill_use_func.jiezouCard = function(card, use, self)        
		local friends={}
		local enemies_spade={}
		local enemies ={}
		
		for _, p in sgs.qlist(self.room:getOtherPlayers(self.player)) do
            if p:isAllNude() then continue end
			if self:isFriend(p) then
				local jcards=p:getCards("j")
				for _,card in sgs.qlist(jcards) do
					if card:getSuit()==sgs.Card_Spade and not card:isKindOf("Lightning") then
						table.insert(friends,p)
					end
				end
			end
			if self:isEnemy(p) then
				if jiezouSpade(self,p) then
					table.insert(enemies_spade,p)
				elseif not p:isNude() then
					table.insert(enemies,p)
				end
			end
        end
        if #friends>0 then
			use.card = card
            if use.to then
                self:sort(friends,"value")
				use.to:append(friends[1])
				if use.to:length() >= 1 then return end
            end
		elseif #enemies_spade>0 then
			use.card = card
            if use.to then
                self:sort(enemies_spade,"value")
				use.to:append(enemies_spade[1])
				if use.to:length() >= 1 then return end
            end
		elseif #enemies>0 and jiezouSpade(self,self.player) then
			use.card = card
            if use.to then
                self:sort(enemies,"value")
				use.to:append(enemies[1])
				if use.to:length() >= 1 then return end
            end
		end
end
sgs.ai_skill_cardchosen.jiezou = function(self, who, flags)
	if self:isFriend(who) then
		local jcards=who:getCards("j")
		for _,card in sgs.qlist(jcards) do
			if card:getSuit()==sgs.Card_Spade and not card:isKindOf("Lightning") then
				return card
			end
		end
	else
		local ecards=who:getCards("e")
		for _,card in sgs.qlist(ecards) do
			if card:getSuit()==sgs.Card_Spade then
				return card
			end
		end
		local id = self:askForCardChosen(who, "he", "snatch", sgs.Card_MethodNone) 
		return sgs.Sanguosha:getCard(id)
	end
end
sgs.ai_skill_cardask["@jiezou_spadecard"] = function(self, data)
		local cards = sgs.QList2Table(self.player:getCards("he"))
        if #cards==0 then return "." end
		self:sortByKeepValue(cards)
		for _,card in pairs (cards) do
			if card:getSuit()==sgs.Card_Spade then
				return "$" .. card:getId()
			end
		end
		return "."
end


sgs.ai_choicemade_filter.cardChosen.jiezou = sgs.ai_choicemade_filter.cardChosen.snatch 
sgs.ai_use_value.jiezouCard = 8
sgs.ai_use_priority.jiezouCard =6 
sgs.dynamic_value.control_card.jiezouCard = true
sgs.ai_cardneed.jiezou = function(to, card, self)
	return card:getSuit()==sgs.Card_Spade
end
sgs.jiezou_suit_value = {
	spade = 4.9
}


function keycard_shoucang(card)
	if card:isKindOf("Peach") or card:isKindOf("SavageAssault")  
	or card:isKindOf("ArcheryAttack") or card:isKindOf("ExNihilo") then
		return true
	end
	return false
end
sgs.ai_skill_use["@@shoucang"] = function(self, prompt)
	if self:getOverflow() <= 0 then
		return "."
	end
	local needNum=math.min(4,self:getOverflow())
	local cards = sgs.QList2Table(self.player:getHandcards())				
	self:sortByKeepValue(cards)
	local suits = {}
	local show={}
	for _,c in pairs(cards)do
		local suit = c:getSuitString()
        if not suits[suit] then 
			suits[suit] = 1
			table.insert(show, tostring(c:getId()))
		end
		if #show>=needNum then
			break
		end
	end
	if #show>0 then
		return "@shoucangCard=" ..table.concat(show, "+").."->."
	end
	return "."
end	




sgs.ai_need_bear.baoyi = function(self, card,from,tos) 
	from = from or self.player
	local Overflow = self:getOverflow(from) >1
	if not card:isKindOf("EquipCard") then return false end
	if self:getSameEquip(card,from) and not Overflow then
		return true
	end
	return false
end
function SmartAI:needBaoyiEquip(card,player)
	player = player or self.player
	if not player:hasSkill("baoyi") then return false end
	t =false
	Overflow = self:getOverflow() <2
	if not card:isKindOf("EquipCard") then return false end
	if self:getSameEquip(card) and Overflow then
		return true
	end
	return false
end


sgs.ai_skill_use["@@baoyi"] = function(self, prompt)
	local target_table = self:getEnemies(self.player)
	if #target_table==0 then return "." end
	
	local delay_num= self.player:getCards("j"):length()
	local delay_ids=self.player:getJudgingAreaID()
	delay_ids = sgs.QList2Table(delay_ids)
	local has_spade=false
	for _,c in sgs.qlist(self.player:getCards("j")) do
		if c:getSuit()== sgs.Card_Spade then
			has_spade=true
		end
	end
	if has_spade then
		return "@baoyiCard=" .. table.concat(delay_ids, "+")
	end
	local target = sgs.ai_skill_playerchosen.zero_card_as_slash(self, self.room:getOtherPlayers(self.player))
	if not  target then 
		return "@baoyiCard="..table.concat(delay_ids, "+")
	end
	local equips={}
	for _,c in sgs.qlist(self.player:getCards("he")) do
		if c:isKindOf("EquipCard") then 
			if c:getSuit()== sgs.Card_Spade then
				if delay_num>0 then
					return "@baoyiCard="..c:getEffectiveId().."+"..table.concat(delay_ids, "+")
				else
					return "@baoyiCard="..c:getEffectiveId()
				end
			end
			table.insert(equips,c)
		end
	end
	if delay_num==0 then 
		if #equips>0  then
			self:sortByKeepValue(equips)
			return "@baoyiCard="..equips[1]:getEffectiveId()
		end
	else
		return "@baoyiCard="..table.concat(delay_ids, "+")
	end
	return "."
end

sgs.ai_skill_playerchosen.baoyi = function(self, targets)
	local target = sgs.ai_skill_playerchosen.zero_card_as_slash(self, targets)
	if target then
		return target
	end
	return nil
	--[[local target_table = sgs.QList2Table(targets)
	self:sort(target_table, "hp")
	local baoyi_target
	local slash= sgs.cloneCard("slash", sgs.Card_NoSuit, 0)
	for _,target in pairs(target_table) do 
		if  self:isEnemy(target) and self:slashIsEffective(slash, target, self.player)  then
			if not baoyi_target  then
				baoyi_target=target
			else
				if self:isWeak(target) and not self:isWeak(baoyi_target) then
					baoyi_target=target
					break
				end
			end
		end
	end
	
	if baoyi_target then
		return baoyi_target
	end
	return nil]]
end

sgs.ai_cardneed.baoyi = function(to, card, self)
	return  card:isKindOf("EquipCard")
end
sgs.baoyi_suit_value = {
	spade = 4.9
}
sgs.ai_trick_prohibit.baoyi = function(self, from, to, card)
	if not card:isKindOf("DelayedTrick")  then return false end
	if self:isFriend(from,to) then return false end
	if self.room:alivePlayerCount()==2 then
		return not from:hasArmorEffect("Vine")
	else
		return true
	end
	return true
end



function SmartAI:zhizeValue(player)
	if self:touhouHandCardsFix(player) or player:hasSkill("heibai") then
		return 0
	end
	local value=0
	for _, card in sgs.qlist(player:getHandcards()) do
		local flag = string.format("%s_%s_%s", "visible", global_room:getCurrent():objectName(), player:objectName())
		if  card:hasFlag("visible") or card:hasFlag(flag) then
			if card:isKindOf("Peach") then
				value=value+20
			end
			if card:getSuit()==sgs.Card_Heart then
				value=value+10
			end
		end
	end
	return value
end
sgs.ai_skill_playerchosen.zhize = function(self, targets)
	
	local pre_zhize=self.player:getTag("pre_zhize"):toPlayer()
	local target_table = sgs.QList2Table(targets)
	local zhize_target
	local targets={}
	local badtargets={}
	local ftargets={}
	for _,target in pairs(target_table) do 
		if  self:isEnemy(target)  then
			if target:hasSkills("yongheng|kongpiao") then
				table.insert(badtargets,target)
			else
				table.insert(targets,target)
			end
		else
			if target:hasSkills("yongheng|kongpiao") then
				table.insert(ftargets,target)
			end
		end
	end
	if #targets==0 then
		for _,target in pairs(target_table) do 
			if  not self:isFriend(target)  then
				table.insert(targets,target)
			end
		end
	end
	
	local compare_func = function(a, b)
		return self:zhizeValue(a) > self:zhizeValue(b)
	end
	
	local tt
	if #targets>0  then
		table.sort(targets, compare_func)
		tt= targets[1]
	elseif #badtargets>0 then
		tt= badtargets[1]
	elseif #ftargets>0 then
		tt=ftargets[1]
	else
		tt=target_table[1]
	end
	local _data = sgs.QVariant()
     _data:setValue(tt)
	self.player:setTag("pre_zhize",_data)
	return tt
end

sgs.ai_playerchosen_intention.zhize =function(self, from, to)
	local intention = 30
	if self:isFriend(from,to)   then
		local t=true
		for _,p in pairs (self:getEnemies(from)) do
			if not p:isKongcheng() then
				t=false
				break
			end
		end
		if t then intention = 0 end
	end
	sgs.updateIntention(from, to, intention)
end
sgs.ai_skill_cardchosen.zhize = function(self, who, flags)
	local hearts={}
	local others={}
	for _,c in sgs.qlist(who:getCards("h")) do
		if self.player:hasSkill("chunxi") and c:getSuit() ==sgs.Card_Heatrt then
			table.insert(hearts,c)
		else
			table.insert(others,c)
		end
	end
	local inverse = not self:isFriend(who)
	if #hearts>0 then
		self:sortByKeepValue(hearts, inverse)
		return hearts[1]
	else
		self:sortByKeepValue(others, inverse)
		return others[1]
	end
end



sgs.ai_skill_playerchosen.chunxi = function(self, targets)
	local preheart=false
	local pre_zhize
	if self.player:getPhase()==sgs.Player_Draw then
		if self.player:getTag("pre_heart") and self.player:getTag("pre_heart"):toBool() then
			preheart=true
		end
		if preheart then
			pre_zhize=self.player:getTag("pre_zhize"):toPlayer()
		end
	end
	if pre_zhize then 
		self.player:setTag("pre_heart",sgs.QVariant(false))
		return pre_zhize 
	end
	local target_table = self:getEnemies(self.player)
	if #target_table == 0 then return false end
	local chunxi_target
	self:sort(target_table, "value")
	for _,target in pairs(target_table) do	
		if not chunxi_target and (not target:isKongcheng()) then
			chunxi_target=target
		else
			if (not target:isKongcheng()) and (self:isWeak(target) or target:getHandcardNum()<2) then
				chunxi_target=target
				break
			end
		end
	end
	if chunxi_target  then
		return chunxi_target
	end
end
sgs.ai_playerchosen_intention.chunxi = 30
sgs.ai_cardneed.chunxi = function(to, card, self)
 return card:getSuit()==sgs.Card_Heart	
end
sgs.chunxi_suit_value = {
	heart = 4.0
}



function bllmwuyu_discard(player)
	local cards = sgs.QList2Table(player:getCards("he"))
    local all_hearts={}
	for _,c in pairs(cards) do
		if c:getSuit()==sgs.Card_Heart 
		and not (c:isKindOf("Peach") or c:isKindOf("Slash") or c:isKindOf("DefensiveHorse"))then
			table.insert(all_hearts,c:getId())
		end
	end
	return all_hearts
end
function needSkipJudgePhase(self,player)
	if (player:containsTrick("supply_shortage") or player:containsTrick("indulgence")) then
		return true
	elseif player:containsTrick("lightning") then
		return not self:invokeTouhouJudge() 
	end
	return false
end
sgs.ai_skill_cardask["@bllm-discard"] = function(self, data)
    local prompt=self.player:getTag("wuyu_prompt"):toString() 
	local all_hearts=bllmwuyu_discard(self.player)
	if #all_hearts==0 then return "." end
	
	
	if prompt=="bllmcaiyu" then
        return "$" .. all_hearts[1]
	elseif prompt=="bllmmingyu" then
		if not needSkipJudgePhase(self,self.player) then return "." end
		return "$" .. all_hearts[1]
	elseif prompt=="bllmshuiyu" then
		if self:getOverflow() >0 and self.player:getMaxCards()<4 then
			local num=self.player:getHandcardNum()-self.player:getMaxCards()
			if num<2 then return "." end
			return "$" .. all_hearts[1]	
		end
	elseif prompt=="bllmseyu" then
		return "$" .. all_hearts[1]	
	elseif prompt=="bllmshiyu" then
		local mustuse=false
		--who= self.room:getCurrentDyingPlayer()
		if self.player:hasFlag("Global_Dying") then
			mustuse=true
		elseif sgs.Slash_IsAvailable(self.player) and getCardsNum("Slash", self.player, self.player) > 0 then
			mustuse=true
		end	
		if not mustuse then return "." end
		
		return "$" .. all_hearts[1]	
	end
	return "."
end

sgs.ai_skill_invoke.bllmwuyu = function(self,data)
	local prompt=self.player:getTag("wuyu_prompt"):toString() 
	
	if prompt=="bllmcaiyu" or prompt=="bllmwuyu" then 
		return true
	elseif prompt=="bllmmingyu" then
		return  needSkipJudgePhase(self,self.player) 
	elseif prompt=="bllmshuiyu" then
		if self:getOverflow() >0 then
			if  self.player:getMark("@yu")>1 or self:isWeak(self.player) then
				return true
			end
		end
		return false
	elseif prompt=="bllmshiyu" then
		local who=self.room:getCurrentDyingPlayer()
		if who and who:objectName()==self.player:objectName() then
			return true
		else
			return sgs.Slash_IsAvailable(self.player) and getCardsNum("Slash", self.player, self.player) > 0
		end
	elseif prompt=="bllmseyu" then
		return  getCardsNum("Slash", self.player, self.player) > 0  and not sgs.Slash_IsAvailable(self.player)
	end
end

function sgs.ai_cardsview_valuable.bllmwuyu(self, class_name, player)
	if class_name == "Analeptic"  then
		if player:isKongcheng() then return nil end
		if player:getMark("@yu")==0 then
			local hearts_e={}
			local hearts_h={}
			local no_hearts={}
			for _,c in sgs.qlist(player:getCards("e")) do
				if c:getSuit()==sgs.Card_Heart then
					table.insert(hearts_e,c)
				end
			end
			for _,c in sgs.qlist(player:getCards("h")) do
				if c:getSuit()==sgs.Card_Heart then
					table.insert(hearts_h,c)
				else
					table.insert(no_hearts,c)
				end
			end
			if #hearts_e+#hearts_h==0 then
				return nil
			elseif #hearts_e+#hearts_h==1 and #no_hearts==0 then
				return nil
			end
		end
		return "@bllmshiyuCard=." 
	end
end
 
local bllmwuyu_skill = {}
bllmwuyu_skill.name = "bllmwuyu"
table.insert(sgs.ai_skills, bllmwuyu_skill)
function bllmwuyu_skill.getTurnUseCard(self)
	local hearts=bllmwuyu_discard(self.player)
	if #hearts==0 and self.player:getMark("@yu")==0 then return nil end
	local can_shiyu=true
	local slash_num=getCardsNum("Slash", self.player, self.player)

	if  slash_num< 2 then return nil end
	if not sgs.Analeptic_IsAvailable(self.player) then 
		can_shiyu=false
	end

	if can_shiyu then 
		local dummy_use = { isDummy = true, to = sgs.SPlayerList() }
		local card=sgs.cloneCard("Slash", sgs.Card_NoSuit, 0)
		self:useBasicCard(card, dummy_use)
		if  dummy_use.card and not dummy_use.to:isEmpty()  then
			if not self:shouldUseAnaleptic(dummy_use.to:first(), dummy_use.card) then
				can_shiyu=false
			end
		end
	end

	if not can_shiyu then
		if slash_num>= 2 and not sgs.Slash_IsAvailable(self.player) then
			self.player:setTag("wuyu_choose",sgs.QVariant(1))
			return sgs.Card_Parse("@bllmwuyuCard=.")
		end
	else
		self.player:setTag("wuyu_choose",sgs.QVariant(2))
		return sgs.Card_Parse("@bllmwuyuCard=.")
	end
	self.player:setTag("wuyu_choose",sgs.QVariant(3))
	return nil
end
sgs.ai_skill_use_func.bllmwuyuCard = function(card, use, self)
	use.card=card
end

sgs.ai_skill_choice.bllmwuyu= function(self, choices, data)
	local id =self.player:getTag("wuyu_choose"):toInt()
	if id==1 then
		return "bllmseyu"
	elseif id ==2 then
		return "bllmshiyu"
	end
	return "dismiss"	
end
sgs.ai_skill_cardask["@bllmshiyu-basics"] = function(self, data)
	local cards = self.player:getHandcards()
	cards=self:touhouAppendExpandPileToList(self.player,cards)
	cards = sgs.QList2Table(cards)
	if #cards==0 then return "." end
	self:sortByKeepValue(cards)
	return "$" .. cards[1]:getId()
end
sgs.ai_cardneed.bllmwuyu = function(to, card, self)
 return card:getSuit()==sgs.Card_Heart	
end
sgs.bllmwuyu_suit_value = {
	heart = 4.9
}
sgs.ai_use_priority.bllmwuyuCard =sgs.ai_use_priority.Slash +0.2


sgs.ai_skill_invoke.qiangyu = true
--[[sgs.ai_skill_cardask["qiangyu_spadecard"] = function(self, data)
	--主动下天仪增加爆发
	if self.player:getMark("@tianyi_Weapon")>0 then
		if self.player:getEquip(0):getSuit()==sgs.Card_Spade then
			return "$" ..self.player:getEquip(0):getId()
		end
	end
	if self.player:getMark("@tianyi_Armor")>0 then
		if self.player:getEquip(1):getSuit()==sgs.Card_Spade then
			return "$" ..self.player:getEquip(1):getId()
		end
	end
	if self.player:getMark("@tianyi_DefensiveHorse")>0 then
		if self.player:getEquip(2):getSuit()==sgs.Card_Spade then
			return "$" ..self.player:getEquip(2):getId()
		end
	end
	if self.player:getMark("@tianyi_OffensiveHorse")>0 then
		if self.player:getEquip(3):getSuit()==sgs.Card_Spade then
			return "$" ..self.player:getEquip(3):getId()
		end
	end
	
	--手牌里的情况
	--暂时没考虑太多。。。强欲弃牌策略要怎么写呢？
	for _, card in sgs.qlist(self.player:getHandcards()) do
		if card:getSuit()==sgs.Card_Spade  and (card:isKindOf("BasicCard"))  then
			return "$" ..card:getId()
		end
	end
	return "."
end]]
sgs.ai_skill_discard.qiangyu = sgs.ai_skill_discard.gamerule
sgs.ai_cardneed.qiangyu = function(to, card, self)
	if not self:willSkipPlayPhase(to) then
		return  card:getSuit()==sgs.Card_Spade
	end
end
sgs.qiangyu_suit_value = {
	spade = 4.9
}

sgs.ai_skill_invoke.mokai = true
sgs.ai_skill_cardask["@mokai"] = function(self, data)
	local cards = {}
	for _,c in sgs.qlist(self.player:getCards("he")) do
		if c:isKindOf("EquipCard") then
			table.insert(cards,c)
		end
	end
	if #cards == 0 then
		return "." 
	end
	if self.player:getPhase() == sgs.Player_NotActive then
		self:sortByCardNeed(cards)
	else
		self:sortByUseValue(cards)
	end
	return "$" .. cards[1]:getId()
end

--[[sgs.ai_skill_cardchosen.mokai = function(self, who, flags)
	local equips = {}
	for _,equip in sgs.qlist(self.player:getEquips()) do
		if (equip:isKindOf("Weapon") and self.player:getMark("@tianyi_Weapon") ==0) then
			table.insert(equips,equip)
		elseif (equip:isKindOf("Armor")and  self.player:getMark("@tianyi_Armor") ==0) then
			table.insert(equips,equip)
		elseif (equip:isKindOf("DefensiveHorse") and  self.player:getMark("@tianyi_DefensiveHorse") ==0) then
			table.insert(equips,equip)
		elseif (equip:isKindOf("OffensiveHorse") and self.player:getMark("@tianyi_OffensiveHorse") ==0) then
			table.insert(equips,equip)
		elseif (equip:isKindOf("Treasure") and  self.player:getMark("@tianyi_Treasure") ==0) then
			table.insert(equips,equip)
		end
	end
	self:sortByKeepValue(equips)
	return equips[1]

end
]]
sgs.ai_cardneed.mokai = function(to, card, self)
	if not self:willSkipPlayPhase(to) then
		return card:isKindOf("TrickCard") or card:isKindOf("EquipCard")
	end
end


sgs.ai_skill_invoke.guangji =function(self,data)
   local use = self.player:getTag("guangji_use"):toCardUse()
   if self:touhouCardEffectNullify(use.card,self.player) then return false end --此杀已经无效
   --check whether player need providing jink
 
	local pattern = nil
	local _data=sgs.QVariant()
		
	local fakeEffect =sgs.SlashEffectStruct()
	fakeEffect.slash = use.card
	fakeEffect.from = use.from
	fakeEffect.to = self.player
	_data:setValue(fakeEffect)
	if sgs.ai_skill_cardask["slash-jink"] (self, _data, pattern, use.from) ~= "." then
		return true
	end
	return false
end
sgs.ai_skill_invoke.xinghui = true


--[[sgs.ai_slash_prohibit.mokai = function(self, from, to, card)
	local suit=card:getSuit()
	if to:getMark("@tianyi_Weapon")>0 and to:getEquip(0):getSuit()==suit then
		return self:isEnemy(to)
	end
	if to:getMark("@tianyi_Armor")>0 and to:getEquip(1):getSuit()==suit then
		return self:isEnemy(to)
	end
	if to:getMark("@tianyi_DefensiveHorse")>0 and to:getEquip(2):getSuit()==suit then
		return self:isEnemy(to)
	end
	if to:getMark("@tianyi_OffensiveHorse")>0 and to:getEquip(3):getSuit()==suit then
		return self:isEnemy(to)
	end
	if to:getMark("@tianyi_Treasure")>0 and to:getEquip(4):getSuit()==suit then
		return self:isEnemy(to)
	end
	return false
end
]]

