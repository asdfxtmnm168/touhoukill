return{
    ["thndj"] = "年代记SP",
    
    --ndj001  势力：主 4血
    ["ndj001"] = "年代记sp妹红" ,
    ["&ndj001"] = "年代记妹红" ,
    ["#ndj001"] = "炎杀姬" ,
    ["!ndj001"] = "年代记sp妹红" ,
    ["rexue"]="热血",
    [":rexue"]="<font color=\"blue\"><b>锁定技，</b></font>你的回合（额外回合除外）结束后，若你的体力为1且此回合内没有角色死亡，你须回复1点体力，摸一张牌，并进行一个额外的回合。",
        
    ["sidou"] = "死斗",
    [":sidou"] = "回合开始阶段开始时，你可以弃置场上的一张非武器牌，摸一张牌，然后对你造成1点火焰伤害。",
    ["@sidou_target"]="你可以指定一名角色，弃置其装备区或判定区里的一张非武器牌。",

    ["tymhwuyu"]="物语",
    [":tymhwuyu"]="<font color=\"orange\"><b>主公技，</b></font><font color=\"blue\"><b>锁定技，</b></font>其他角色死亡时，该角色视为由你杀死。",
    
    --ndj002  势力：主 3血
    ["ndj002"] = "年代记sp辉夜" ,
    ["&ndj002"] = "年代记辉夜" ,
    ["#ndj002"] = "贤月公主" ,
    ["!ndj002"] = "年代记sp辉夜" ,
    ["huanyue"]="幻月",
	[":huanyue"]="每当其他角色受到非延时类锦囊牌造成的一次伤害时，你可令该角色弃置你的一张手牌，若为黑色，此伤害+1。",
    ["#huanyue_log"]="%from 对 %to 的伤害由 %arg 点增加到 %arg2 点。",
	["huanyue:target"]="<font color=\"#00FF00\"><b>%src </b></font> 受到 <font color=\"#00FF00\"><b>【%dest】 </b></font>的伤害， 你是否发动“幻月”。",
    
	--["#huanyue_damage"]="幻月",
    --[":huanyue"]="出牌阶段开始时，你可以令一名其他角色获得一枚“幻月”标记，并于你的下个出牌阶段开始时弃置。每当有“幻月”标记的角色受到非延时类锦囊牌造成的一次伤害时，你可弃置一张黑色手牌，令此伤害+1。",
    --["@huanyue"]="幻月",
    --["@huanyuechosen"]="指定获得“幻月”标记的角色。",
	--["@huanyue-discard"]="你可以弃置一张黑色手牌，令 <font color=\"#00FF00\"><b>%src </b></font> 受到的伤害+1。",

    ["sizhai"] = "死宅",
    [":sizhai"] = "一名角色的回合结束阶段开始时，若该角色于此回合内没有使用或打出过非装备牌，你可以摸一张牌。 ",
    ["sizhai:draw"] ="此回合 %src 没有使用或打出过非装备牌，你可以发动“死宅”，摸一张牌。",
        
        
    --ndj004  势力：妖 3血    
    ["ndj004"] = "年代记sp妖梦" ,
    ["&ndj004"] = "年代记妖梦" ,
    ["#ndj004"] = "修行的庭师" ,
    ["!ndj004"] = "年代记sp妖梦" ,
    ["youming"]="幽冥",
    [":youming"]="出牌阶段，若你的体力上限小于4，你可以弃置一张牌，增加1点体力上限。",
        
    ["fanji"] = "反击",
    [":fanji"] = "每当你受到其他角色对你造成的一次伤害后，你可以对伤害来源造成1点伤害。每当你攻击范围内的角色受到另一名角色对其造成的一次伤害后，若伤害来源不是你且你的体力上限大于1，你可以失去1点体力上限，对伤害来源造成1点伤害。",
    ["fanji:target"] = "<font color=\"#FF8000\"><b>%src </b></font> 对 <font color=\"#00FF00\"><b>%dest </b></font> 造成了伤害，你可以对 <font color=\"#FF8000\"><b>%src </b></font> 发动“反击”。",

    
    ["ndj010"] = "年代记sp玛艾露贝莉" ,
    ["&ndj010"] = "年代记梅莉" ,
    ["#ndj010"] = "境界探访者" ,
    ["!ndj010"] = "年代记SP梅莉" ,     
        --[[["mengwei"]="梦违",
        [":mengwei"]="<font color=\"blue\"><b>(必须配合东方卡牌包使用)</b></font><font color=\"blue\"><b>锁定技，</b></font>分发起始手牌时，共发给你七张牌。选四张做手牌。将其余的牌面朝下置于你的装备区，称为“？”。回合结束阶段开始时，若你的装备区里的牌少于四张，你须摸一张牌，然后将一张手牌作为“？”面朝下置于装备区。每当你受到一次伤害时，若你的装备区有“？”，防止该伤害，将一张“？”收入手牌。",
        
        ["liexi"] = "裂隙",
        [":liexi"] = "出牌阶段，你可以弃置两张“？”，将一名其他角色的人物牌翻面，每阶段限一次。",
        ["meng_list"]="?",
        ["meng0"]="?进入武器区",
        ["meng1"]="?进入防具区",
        ["meng2"]="?进入+1马区",
        ["meng3"]="?进入-1马区",
        ["meng_equip0"]="?进入武器区",
        ["meng_equip1"]="?进入防具区",
        ["meng_equip2"]="?进入+1马区",
        ["meng_equip3"]="?进入-1马区",]]
        
    --ndj011  势力：外 3血    
    ["ndj011"] = "年代记sp莲子" ,
    ["&ndj011"] = "年代记莲子",
    ["#ndj011"] = "科学少女" ,
    ["!ndj011"] = "年代记sp莲子" ,    
    ["liangzi"]="量子",
    [":liangzi"]="<font color=\"blue\"><b>锁定技，</b></font>每当你使用或打出一张基本牌后，你须改变你的人物牌的摆放方式（横置或重置）。",
    
    ["kexue"] = "科学",
    [":kexue"] = "出牌阶段，若你的人物牌横置，你使用【杀】时没有距离限制，且可以额外指定任意数量的其他角色为目标。",
}
