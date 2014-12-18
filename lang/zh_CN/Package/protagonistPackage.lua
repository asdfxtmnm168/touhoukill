
return {

	["protagonist"] = "主角",
	["zhu"] = "主",
	
		["zhu001"] = "博丽灵梦",["#zhu001"] = "乐园的美妙巫女",["!zhu001"] = "博丽灵梦",
	["lord_declaration"]="主公登场",	
	--["$zhu001"] = "我是无节操",
	
		["lingqi"] = "灵气",
		--[":lingqi"] = "当一名角色使用【杀】或非延时类锦囊牌指定目标后，你可以弃置一张牌，令任意数量的（至少一名）是此牌目标的角色依次进行一次判定，此牌对结果为红色的角色无效。",
        [":lingqi"] = "当你成为【杀】或非延时类锦囊牌的目标时，你可以进行一次判定，若结果为<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>，此牌对你无效。",
		--["@lingqi"] ="你可以弃置一张牌，对任意数量的是 <font color=\"#00FF00\"><b>%src </b></font> 使用的【%dest】的目标的角色发动“灵气”。",
		["lingqi:target"] =
        " <font color=\"#00FF00\"><b>%src </b></font> 使用【%dest】指定了你为目标，你可以发动“灵气”。",
		
		["~lingqi"]="选择一张牌→指定任意数量的角色→点击“确定” 或者取消发动",
		["$lingqiAnimate"]="image=image/animate/lingqi.png",
		["#LingqiAvoid"] = "“%arg2”效果被触发，【%arg】 对 %from 无效",

		
        --["hongbai"] = "红白",
        --[":hongbai"] ="<font color=\"blue\"><b>锁定技，</b></font>你的黑色判定牌均视为<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>牌。",
		["bllmqixiang"] = "绮想",
		[":bllmqixiang"] = "当一名角色的判定牌生效后，若该角色的手牌数小于你的体力上限，你可令该角色摸一张牌。",
		["bllmqixiang:target"] = "<font color=\"#00FF00\"><b>%src </b></font> 的 “%dest” 的判定牌已生效，你可以对其发动“绮想”，令其摸一牌。",
        
		["boli"] = "博丽",
		["@boli-retrial"]="你可以响应 <font color=\"#00FF00\"><b>%dest </b></font> 的主公技“博丽”，打出一张<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>手牌，代替 <font color=\"#FF8000\"><b>%src </b></font> 的 “%arg” 判定。",
		["boli:judge"] ="<font color=\"#00FF00\"><b>%src </b></font> 的 “%dest” 判定结果不为<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>，你可以发动主公技“博丽”令其他角色依次选择是否打出一张<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>手牌代替之。",
		[":boli"] =
        "<font color=\"orange\"><b>主公技，</b></font>当判定牌生效前，若此牌不为<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>，你可令其他角色依次选择是否打出一张<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>手牌代替之。",
		["$boliAnimate"]="image=image/animate/boli.png",
 
 
		["zhu002"] = "雾雨魔理沙",["#zhu002"] = "普通的魔法使",["!zhu002"] = "雾雨魔理沙",
        
	--["$zhu002"] = "我是黑白",
	["mofa"] = "魔法",
        [":mofa"] = "出牌阶段，你可以弃置一张手牌，若如此做，你使用的牌造成的伤害+1，直到回合结束。若以此法弃置了<font size=\"5\", color=\"#808080\"><b>♠</b></font>牌，你摸一张牌。<font color=\"green\"><b>每阶段限一次。</b></font>",
	   ["#mofa_notice"]="由于 %arg 的效果，此回合内 %from 使用的牌造成的伤害+1。",
		["#mofa_damage"]="%from 对 %to 的伤害由 %arg2 点增加到 %arg 点。",
		["#TouhouBuff"]="%from 的 %arg 效果被触发。",
		["$mofaAnimate"]="image=image/animate/mofa.png",
		
		--["heibai"] = "黑白",
        --[":heibai"] = "<font color=\"blue\"><b>锁定技，</b></font>你的红色手牌(【杀】除外)均视为<font size=\"5\", color=\"#808080\"><b>♠</b></font>牌",
        
		["wuyu"] = "雾雨",
        [":wuyu"] = "<font color=\"orange\"><b>主公技，</b></font>其他角色的出牌阶段，该角色可以将一张<font size=\"5\", color=\"#808080\"><b>♠</b></font>手牌交给你。<font color=\"green\"><b>每阶段限一次。</b></font>",
		[":wuyuvs"]="出牌阶段，你可以将一张<font size=\"5\", color=\"#808080\"><b>♠</b></font>手牌交给拥有主公技“雾雨”的角色。每阶段限一次。",
		["wuyuvs"]="雾雨送牌",
		["$wuyuAnimate"]="image=image/animate/wuyu.png",
		
		["zhu003"] = "无节操灵梦",--["&zhu003"] = "博丽灵梦",
		["#zhu003"] = "十万巫女",

		["!zhu003"] = "SP无节操灵梦",
 ["saiqian"] = "赛钱",
[":saiqian"] = "其他角色的出牌阶段，该角色可以将一至三张手牌交给你，然后你可以选择一至两项：弃置一张<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>手牌，或失去1点体力。你每选择一项，该角色回复1点体力。<font color=\"green\"><b>每阶段限一次。</b></font>",
 ["saiqianvs"] ="赛钱送牌", 
 [":saiqianvs"] ="你可以将一至三张手牌交给拥有“赛钱”的角色。",
 ["losehp_saiqian"]="失去1点体力，该角色回复1点体力",
 --["discard_saiqian"]="弃置一张<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>手牌，该角色回复1点体力",
  ["discard_saiqian"]="弃置一张红桃手牌，该角色回复1点体力",
 ["cancel_saiqian"]="什么都不做",
 ["#saiqian_lose"]="%from 执行了 “%arg” 的效果",
 ["@saiqian-discard"]="你可以弃置一张<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>手牌，令 <font color=\"#00FF00\"><b>%src </b></font> 回复1点体力。",
 ["$saiqianAnimate"]="image=image/animate/saiqian.png",
 
 
 ["zhu004"] = "大盗魔理沙",--["&zhu004"] = "雾雨魔理沙",
 ["#zhu004"] = "大盗",
["!zhu004"] = "SP大盗魔理沙",
	--["$zhu004"] = "我是黑白二号",
["jiezou"] = "借走",
[":jiezou"] = "出牌阶段，你可以获得其他角色区域里的一张牌，然后选择一项：弃置一张<font size=\"5\", color=\"#808080\"><b>♠</b></font>牌，或失去1点体力并结束此阶段。",
 ["@jiezou_spadecard"]="请弃置一张<font size=\"5\", color=\"#808080\"><b>♠</b></font>牌，否则你将失去1点体力并结束出牌阶段。",
 ["jiezou_skip"]="出牌阶段",
 ["#jiezou_skip"]="由于 %arg2 的效果，%from 被强制结束了 %arg。",
 ["$jiezouAnimate"]="image=image/animate/jiezou.png",
 
["shoucang"] = "收藏",
[":shoucang"] = "弃牌阶段开始时，你可以展示X张花色各不相同的手牌，若如此做，你的手牌上限+X，直到回合结束。",
 ["#shoucang_max"]="本回合，%from的手牌上限+%arg2",
 ["@shoucang"] = "弃牌阶段，你可以发动“收藏”，展示任意数量的花色各不相同的手牌。",
 ["~shoucang"]="选择展示的手牌→点击“确定”。",
 ["$shoucangAnimate"]="image=image/animate/shoucang.png",
 
 ["zhu005"] = "超魔理沙",["#zhu005"] = "超·恋之魔女",
 ["!zhu005"] = "超魔理沙",
["baoyi"] = "爆衣",
--[":baoyi"] = "回合开始阶段开始时，你可以弃置装备区和判定区里的所有牌。每以此法弃置一张牌，你可以选择：视为你对一名其他角色使用一张【杀】。若以此法弃置了不少于一张<font size=\"5\", color=\"#808080\"><b>♠</b></font>牌，则于此阶段结束时，你可以摸两张牌。",
[":baoyi"] ="回合开始阶段开始时，你可以弃置任意数量的装备牌并弃置判定区里的所有牌。每以此法弃置一张牌，你可以选择：视为你对一名其他角色使用一张【杀】。若以此法弃置了不少于一张<font size=\"5\", color=\"#808080\"><b>♠</b></font>牌，此阶段结束时，你可以摸两张牌。",
["@baoyi"] ="你可以发动“爆衣”，弃置任意数量的装备牌并弃置判定区里的所有牌。",
["~baoyi"] ="弃置X张可以视为使用X张【杀】。",
["@@baoyi_chosen"] ="由于“爆衣”的效果，你可以指定一名其他角色，视为对其使用一张【杀】。你还能视为使用 <font color=\"#00FF00\"><b>%src </b></font> 张【杀】。",
 ["baoyi:drawcard"] = "由于你发动“爆衣”时弃置了<font size=\"5\", color=\"#808080\"><b>♠</b></font>牌，你可以摸两张牌。" ,  
 ["$baoyiAnimate"]="image=image/animate/baoyi.png",
 
 ["zhu006"]="妖妖梦sp灵梦",["&zhu006"]="妖妖梦灵梦",["#zhu006"]="春巫女",
      ["!zhu006"]="妖妖梦sp灵梦",
	["zhize"]="职责",
    [":zhize"]="<font color=\"blue\"><b>锁定技，</b></font>摸牌阶段开始时，你须选择一项：失去1点体力并跳过此回合的出牌阶段；或放弃摸牌，改为观看一名有手牌的其他角色的所有手牌，你可以获得其中的一张。",
    ["@@zhize"]="请指定一名其他角色，观看其手牌并获得其中一张，否则你将失去1点体力并跳过此回合的出牌阶段。",
     ["$zhizeAnimate"]="image=image/animate/zhize.png",
	 
	["chunxi"]="春息",
    [":chunxi"]="每当你获得一张<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>牌后，你可以展示此牌，然后获得一名其他角色的一张手牌。",
    ["@@chunxi"]="你可以展示你获得的<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>牌，然后获得一名其他角色的一张手牌。",
 ["$chunxiAnimate"]="image=image/animate/chunxi.png",
	
	["zhu007"] = "神灵庙sp灵梦" ,["#zhu007"] = "五欲的巫女" ,["&zhu007"] = "神灵庙灵梦" ,
       ["!zhu007"] = "神灵庙sp灵梦" ,
		["bllmwuyu"] = "五欲" ,
        [":bllmwuyu"] = "回合开始阶段开始时，你可以将“欲”标记补至X+1枚（X为你已损失的体力值）。你可以弃置一枚“欲”标记或一张<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>牌，发动下列技能中的一个：<font color=\"blue\"><b>“名欲”</b></font>（你可以跳过判定阶段）<font color=\"blue\"><b>“财欲”</b></font>（摸牌阶段摸牌时，你可以多摸一张牌）<font color=\"blue\"><b>“色欲”</b></font>（出牌阶段，你可以额外使用一张【杀】）<font color=\"blue\"><b>“睡欲”</b></font>（弃牌阶段，你的手牌上限视为4）<font color=\"blue\"><b>“食欲”</b></font>（你可以将一张手牌当【酒】使用）" ,
        ["bllmcaiyu"] = "财欲" ,
        ["bllmseyu"] = "色欲" ,
        ["bllmmingyu"] = "名欲" ,
        ["bllmshiyu"] = "食欲" ,
        ["bllmshuiyu"] = "睡欲" ,
        ["@bllm-discard"] = "你可以弃置一张<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>牌，发动“%src”。" ,
        --["bllm_useyu:useyu"] = "你可以弃一个“欲”标记来发动“%src”" ,
		["bllmwuyu:useyu"]= "你可以弃置一枚“欲”标记，发动“%src”。" ,
		["bllmwuyu:dismiss"] = "取消" ,
        ["@bllmshiyu-basics"] = "“食欲”：你可以将一张手牌当【酒】使用。" ,
        ["~bllmwuyu"] = "选择一张手牌→点击“确定”。" ,
        ["@yu"] = "欲" ,
		["$bllmwuyuAnimate"]="image=image/animate/bllmwuyu.png",
		
	["zhu008"] = "神灵庙sp魔理沙",["&zhu008"] = "神灵庙魔理沙",["#zhu008"] = "强欲的魔法使",
["!zhu008"] = "神灵庙sp魔理沙",
["qiangyu"] = "强欲",
[":qiangyu"] = "每当你从牌堆顶摸牌时，你可以多摸两张牌，然后选择一项：弃置两张手牌，或弃置一张<font size=\"5\", color=\"#808080\"><b>♠</b></font>手牌。",
["qiangyu_spadecard"]="请弃置一张<font size=\"5\", color=\"#808080\"><b>♠</b></font>手牌，否则弃置两张手牌",
 ["$qiangyuAnimate"]="image=image/animate/qiangyu.png",
 
["mokai"] = "魔开",
[":mokai"] = "每当你使用一张锦囊牌时，你可以将你装备区里的一张牌横置，此牌视为【天仪】（装备/特殊：<font color=\"blue\"><b>锁定技，</b></font>你使用与【天仪】花色相同的【杀】时无距离限制；与【天仪】花色相同的【杀】对你无效；当你失去装备区里的【天仪】时，你摸两张牌；你可同时装备任意数量的【天仪】，但装备区里最多只能有五张牌）。",
 ["@tianyi_Weapon"]="武器视为天仪",
 ["@tianyi_Armor"]="防具视为天仪",
 ["@tianyi_DefensiveHorse"]="+1坐骑视为天仪",
 ["@tianyi_OffensiveHorse"]="-1坐骑视为天仪",
 ["@tianyi_Treasure"]="宝物视为天仪",
 ["#tianyiEquip"]="%from 失去了装备区里的【天仪】，【天仪】的效果被触发。",
 ["#tianyiEquip1"]="%from 的【天仪】效果被触发，%arg 对其无效。",
 ["#tianyi_set"]="%from 的 %arg 被视为【天仪】。",
 --["tianyi"]="天仪",
 ["$mokaiAnimate"]="image=image/animate/mokai.png",
 }