sgs.ai_skill_playerchosen.sidou = function(self, targets)	if self.player:getHp()== 1 then		return nil	end	local wizzard=self:invokeTouhouJudge()	for _,p in sgs.qlist(targets) do		if not wizzard and p:containsTrick("lightning") then			return p		end		if self:isFriend(p) then			if p:containsTrick("indulgence") or p:containsTrick("supply_shortage") then				return p			end		end	end	for _,p in sgs.qlist(targets) do		if self:isEnemy(p) and (p:getEquip(1) or p:getEquip(2) or p:getEquip(3) or p:getEquip(4)) then			return p		end	end	return nilendsgs.ai_skill_cardchosen.sidou = function(self, who, flags)	local wizzard=self:invokeTouhouJudge()	if self:isFriend(who) then		cards=who:getCards("j")		cards = sgs.QList2Table(cards)		if #cards>0 then			return cards[1]		end	end	if self:isEnemy(who) then		cards=who:getCards("e")		cards = sgs.QList2Table(cards)		ecards={}		for _,c in pairs (cards) do			if not c:isKindOf("Weapon") then				table.insert(ecards,c)			end		end		if #ecards>0 then			return ecards[1]		end	endendsgs.ai_choicemade_filter.cardChosen.sidou = sgs.ai_choicemade_filter.cardChosen.dismantlementfunction SmartAI:findRealKiller(victim,damage)	local mouko = self.room:getLord()	if mouko and mouko:isAlive() and mouko:hasLordSkill("tymhwuyu") then		return mouko	end	if damage then		return damage.from	else		return nil	endendsgs.ai_skillProperty.tymhwuyu = function(self)	return "noKingdom"end--[[sgs.ai_skill_playerchosen.huanyue = function(self, targets)	if #self.enemies==0 then return nil end	self:sort(self.enemies,"hp")		return self.enemies[1]endsgs.ai_skill_cardask["@huanyue-discard"] = function(self,data)	local damage=data:toDamage()	local cards = self.player:getHandcards()	cards = sgs.QList2Table(cards)	if #cards==0 then return "." end	local ecards={}	for _,c in pairs (cards) do		if c:isBlack() then			table.insert(ecards,c)		end	end	if #ecards==0 then return "." end	if self:isEnemy(damage.to) then		self:sortByKeepValue(cards)		return "$" .. ecards[1]:getId()	end		return "." endsgs.ai_playerchosen_intention.huanyue = 30]]sgs.ai_skill_invoke.huanyue = function(self,data)	local damage = self.player:getTag("huanyue_damage"):toDamage()	if not self:isEnemy(damage.to) then return false end	local tempDamage = damage.damage	damage.damage = damage.damage+1	local realDamage = self:touhouDamage(damage,damage.from,damage.to)	if realDamage.damage <= tempDamage then return false end		local canDamage = self:touhouNeedAvoidAttack(damage,damage.from,damage.to)	if canDamage then		local blacknum = getKnownCard(self.player, self.player, "black", false, "h")		if (blacknum >= self.player:getHandcardNum()) then return true end		if damage.to:hasSkill("duxin") then return false end		local rate= blacknum / self.player:getHandcardNum()		return rate > 1/2 	end	return falseendsgs.ai_cardneed.huanyue = function(to, card, self)	return  card:isBlack()endsgs.ai_choicemade_filter.skillInvoke.huanyue = function(self, player, promptlist)	local damage = player:getTag("huanyue_damage"):toDamage()	if damage.to and promptlist[#promptlist] == "yes" then		sgs.updateIntention(player, damage.to, 50)		endendsgs.ai_skill_invoke.sizhai = truelocal hunpo_skill = {}hunpo_skill.name = "hunpo"table.insert(sgs.ai_skills, hunpo_skill)function hunpo_skill.getTurnUseCard(self)    if self.player:getMaxHp()>= 4 then return nil end	if self.player:isNude() then return nil end	local cards={}	if self:getOverflow() >0 then		cards= sgs.QList2Table(self.player:getHandcards())	else		cards= sgs.QList2Table(self.player:getCards("he"))	end	self:sortByKeepValue(cards)	if #cards>0 then		return sgs.Card_Parse("@hunpoCard="..cards[1]:getId())	end	return nilendsgs.ai_skill_use_func.hunpoCard = function(card, use, self)	use.card=cardendsgs.ai_skill_invoke.fanji = function(self,data)	local target=self.player:getTag("fanji_damage"):toDamage().from	local buff =self.player:getTag("fanji_damage"):toDamage().to	if target and buff then		if self:isEnemy(target) then			if buff:objectName()==self.player:objectName() then				return true			else				if self.player:getMaxHp()>=self.player:getHp() then					return true				end			end		end	end	return falseend--[[sgs.ai_choicemade_filter.skillInvoke.fanji = function(self, player, promptlist)	local damage = player:getTag("fanji_damage"):toDamage()	local to=damage.to	local from=damage.from	if from and to and from:objectName()~= to:objectName() then		if promptlist[#promptlist] == "yes" then		sgs.updateIntention(player, to, -50)		sgs.updateIntention(player, from, 50)		else		sgs.updateIntention(player, from, -10)		sgs.updateIntention(player, to, 20)		end	end	end]]--嘲讽值设定--[[sgs.ai_chaofeng.ndj001 = 1sgs.ai_chaofeng.ndj002 = 3sgs.ai_chaofeng.ndj004 = -1sgs.ai_chaofeng.ndj010 = -1sgs.ai_chaofeng.ndj011 = 1]]