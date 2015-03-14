return{

    ["th14"] = "辉针城",
    ["hzc"] = "辉",
    
    --hzc001  势力：辉 3血
    ["hzc001"] = "少名针妙丸",
    ["#hzc001"] = "小人的末裔",
    ["!hzc001"] = "少名针妙丸",
    ["baochui"] = "宝槌",
    [":baochui"] = "一名角色的回合开始阶段开始时，若该角色的手牌数小于三，你可以弃置一张牌，令该角色将手牌摸至三张。此回合的弃牌阶段开始时，若该角色的手牌数小于三，该角色失去1点体力。",
    ["@baochui"] = "你可以弃置一张牌，对 <font color=\"#FF8000\"><b>%src </b></font> 发动“宝槌”。",
	["#BaochuiBuff"] = "%from 手牌数小于 3 ， “%arg”效果被触发，",
	
    ["yicun"] = "一寸",
    [":yicun"] = "<font color=\"blue\"><b>锁定技，</b></font>当你成为【杀】或【决斗】的目标时，若此牌的使用者的手牌数不小于你，此牌对你无效。",
    
    ["moyi"] = "末裔",
    [":moyi"] = "<font color=\"orange\"><b>主公技，</b></font>其他辉势力角色的弃牌阶段结束时，该角色可将一张于此阶段置入弃牌堆的基本牌加入你的手牌。",
    ["@moyi-select"]="你可以指定拥有主公技“末裔”的角色，将一张本阶段置入弃牌堆的基本牌加入其手牌。",
	
    --hzc002  势力：辉 4血
    ["hzc002"] = "堀川雷鼓",
    ["#hzc002"] = "梦幻的打击乐手",
    ["!hzc002"] = "堀川雷鼓",
    ["leiting"] = "雷霆",
    [":leiting"] = "出牌阶段，你可以指定一名其他角色，然后你摸两张牌，弃置一张手牌。若以此法弃置了<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>牌，该角色须摸一张牌，然后受到1点无来源的雷电伤害。若以此法弃置了<font size=\"5\", color=\"#808080\"><b>♠</b></font>牌，视为该角色对其攻击范围内的由该角色指定的一名角色使用一张具雷电伤害的【杀】。<font color=\"green\"><b>每阶段限一次。</b></font>",
    ["@leiting"] ="你发动“雷霆”指定了 <font color=\"#00FF00\"><b>%src </b></font>，请选择要弃置的牌。",
    ["@leiting_chosen"] ="<font color=\"#00FF00\"><b>%src </b></font> 对你发动了“雷霆”，请选择【杀】的目标。",
 
 --hzc003  势力：辉 3血
    ["hzc003"] = "鬼人正邪",
    ["#hzc003"] = "逆袭的天邪鬼",
    ["!hzc003"] = "鬼人正邪",
    ["nizhuan"] = "逆转",
    [":nizhuan"] ="当一名角色成为【杀】的目标后，若此【杀】只指定了该角色为目标且该角色已损失的体力值大于此【杀】的使用者，你可以弃置该角色的一张手牌，令此【杀】无效，并视为该角色对此【杀】的使用者使用一张【杀】。",
    ["nizhuan:target"] = "<font color=\"#00FF00\"><b>%src </b></font>使用【杀】指定了<font color=\"#FF8000\"><b>%dest </b></font>，你是否发动“逆转”" ,
    
    ["guizha"]="诡诈", 
    [":guizha"] = "<font color=\"blue\"><b>锁定技，</b></font>当你处于濒死状态并向其他角色求【桃】时，该角色须展示所有手牌，若其中有【桃】，该角色须对你使用之。",
    ["@guizha"] ="由于“诡诈”的效果，你必须对 <font color=\"#00FF00\"><b>%src </b></font> 使用一张【桃】。",    
  
    --["dianfu"] = "颠覆",
    --[":dianfu"] ="出牌阶段，你可以指定两名其他角色交换位置。<font color=\"green\"><b>每阶段限一次。</b></font>",
    --["#DianfuSwap"]="由于%arg 的效果， %from 和 %to 交换了座位",
    --["nixi"] = "逆袭",
    --[":nixi"] ="每当你受到一次伤害后，你可以和伤害来源交换手牌。<font color=\"green\"><b>每回合限一次</b></font>",
    --["nizhuan"] = "逆转",
    -- [":nizhuan"] ="<font color=\"red\"><b>限定技，</b></font>出牌阶段，你可以选择一个0到5之间的数值X。所有体力大于X的角色必须失去1点体力，所有体力小于X的角色必须回复一点体力。",
    --    ["@nizhuan"] = "逆转",
 
    --hzc004  势力：辉 3血
    ["hzc004"] = "九十九八桥",
    ["#hzc004"] = "古旧的琴的付丧神",
    ["!hzc004"] = "九十九八桥",
    ["canxiang"] = "残响",
    [":canxiang"] ="每当你造成一次伤害后，你可以获得一名体力值大于你的角色的一张牌。",
    ["@canxiang"] = "你可以发动“残响”，指定一名体力值大于你的角色，获得其一张牌。",
  
    ["juwang"] = "俱亡",
    [":juwang"] ="每当你需要使用或打出一张【闪】时，你可令当前回合的角色选择一项：弃置一张红色手牌，或受到你对其造成的1点伤害。",
    ["juwang:throw"] ="你可以对 <font color=\"#00FF00\"><b>%src </b></font> 发动“俱亡”。";
    ["@juwang"]="<font color=\"#00FF00\"><b>%src </b></font>对你发动了“俱亡”，请弃置一张红色手牌，否则其对你造成的1点伤害。",
 
    --hzc005  势力：辉 3血
    ["hzc005"] = "九十九弁弁", 
    ["#hzc005"] = "古旧琵琶的付丧神",
    ["!hzc005"] = "九十九弁弁",
    ["yuyin"] = "余音",
    [":yuyin"] = "每当你受到一次伤害后，你可以获得一名体力值大于你的角色的一张牌。",
    ["@yuyin"] = "你可以发动“余音”，指定一名体力值大于你的角色，获得其一张牌。",
   
    ["wuchang"] = "无常",
    [":wuchang"] = "其他角色的弃牌阶段结束时，若此阶段内该角色没有弃置红色手牌，你可令该角色弃置一张手牌。",
    ["wuchang_discard"]="由于“无常”的效果，请弃置一张手牌。",
    ["wuchang:target"] ="你是否对 <font color=\"#00FF00\"><b>%src </b></font> 发动“无常” ";
 
  --hzc006  势力：辉 4血
    ["hzc006"] = "今泉影狼",
    ["#hzc006"] = "竹林的人狼",
    ["!hzc006"] = "今泉影狼",
    ["langying"] = "狼影",
    [":langying"] ="每当你需要使用或打出一张【闪】时，你可以将你装备区里的所有牌（至少一张）返回手牌，视为你使用或打出了一张【闪】。",
    ["yuanfei"] = "远吠",
    [":yuanfei"] ="出牌阶段，你可以指定一名其他角色。该角色不能使用或打出牌，直到回合结束。若该角色在你攻击范围内，你须先弃置一张手牌。<font color=\"green\"><b>每阶段限一次。</b></font>",
    ["#yuanfei"] ="因为 %arg 的效果，此回合 %from 不能使用或打出牌。",
    ["yuanfeinear"] = "远吠",

    --hzc007  势力：辉 4血
    ["hzc007"] = "赤蛮奇",
    ["#hzc007"] = "辘轳首的怪奇",
    ["!hzc007"] = "赤蛮奇",
    ["feitou"] = "飞头",
    ["#feitou_slash"]= "飞头",
    ["feitou:extra_slash"] = "你可以对 <font color=\"#00FF00\"><b>%src </b></font> 发动“飞头”。",
    ["addfeitou"] = "你可以将一张手牌作为“飞头”置于人物牌上。",
    [":feitou"] ="回合结束阶段开始时，你可以将一张牌置于你的人物牌上，称为“飞头”。你可以将一张“飞头”当【杀】使用或打出，此【杀】不计入每阶段的使用限制，无距离限制。",
    ["@feitou-twoCards"]="选择一张“飞头”当【杀】使用。",
    ["~feitou"]="选择牌→指定目标→点击“确定”。",
 
    --hzc008  势力：辉 3血
    ["hzc008"] = "若鹭姬",
    ["#hzc008"] = "栖息于淡水的人鱼",
    ["!hzc008"] = "若鹭姬",
     ["shizhu"] = "拾珠",
    [":shizhu"] ="其他角色的回合结束阶段开始时，你可以选择一张于此回合置入弃牌堆的【桃】并展示所有手牌，若其中没有【桃】，你获得你选择的牌。",

    ["liange"] = "恋歌",
    [":liange"]="出牌阶段，你可以将一张牌置于牌堆顶，然后令一名其他角色观看牌堆顶的两张牌并获得其中的一张，将另一张置入弃牌堆。<font color=\"green\"><b>每阶段限一次。</b></font>",


 --[[["jingtao"] = "惊涛",
  --[":jingtao"] ="出牌阶段，若你已经受伤， 可以指定一个其他角色，视为对其使用【水淹七军】。<font color=\"green\"><b>每阶段限一次。</b></font>",
   [":jingtao"] ="当你使用【杀】指定其他角色为目标后，你可以弃置该角色装备区里的一张牌。",
   ["jingtao:discard"] = "你可以发动发动“惊涛”，弃置 <font color=\"#00FF00\"><b>%src </b></font> 装备区里的一张牌。",]]
        
  --["shuixing"] = "水性",
  --[":shuixing"] ="<font color=\"blue\"><b>锁定技，</b></font>你受到的火焰伤害-x,x为你已损失的体力。",
  --[":shuixing"] ="<font color=\"blue\"><b>锁定技，</b></font>每当你受到一次火焰伤害时，此伤害-1。",
  --["#shuixing"] = "%from的技能“%arg”被触发, %from 防止了 %arg2 点火焰属性伤害.",
      --["aige"] = "哀歌",
  --[":aige"] ="每当一张牌离开其他角色的判定区时，你可以弃置该角色的一张手牌。",

}
