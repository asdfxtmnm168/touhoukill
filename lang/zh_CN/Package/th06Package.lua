
return{ ["th06"] = "红魔乡",
	["hmx"] = "红",

["hmx001"] = "蕾米莉亚·斯卡雷特",["&hmx001"] = "蕾米莉亚",["#hmx001"] = "红之恶魔",
        ["!hmx001"] = "蕾米莉亚",
		["skltkexue"] = "渴血",
        [":skltkexue"] = "当你处于濒死状态并向其他角色求【桃】时，若该角色的体力值大于1，该角色可以失去1点体力并摸两张牌，然后令你回复1点体力。",--视为对你使用一张【桃】
        ["skltkexuepeach"]="渴血出桃",
		[":skltkexuepeach"]="当拥有“渴血”的角色处于濒死状态并向你求【桃】时，若你的体力值大于1，你可以失去1点体力并摸两张牌，然后令其回复1点体力。",
		["$skltkexueAnimate"]="image=image/animate/skltkexue.png",
		
		["mingyun"] = "命运",
        [":mingyun"] = "当判定开始前，你可以观看牌堆顶的两张牌并获得其中的一张，将另一张置于牌堆顶。",
        ["mingyun:judge"] = "<font color=\"#00FF00\"><b>%src </b></font> 将要进行 “%dest” 的判定，你可以发动“命运”。",
        ["$mingyunAnimate"]="image=image/animate/mingyun.png",
		
		["skltxueyi"] = "血裔",
        [":skltxueyi"] = "<font color=\"orange\"><b>主公技，</b></font>每当其他红势力角色回复一次体力后，该角色可令你摸一张牌。",
        ["@@skltxueyi"]="指定拥有主公技“血裔”的角色，该角色摸一张牌。",
		["$skltxueyiAnimate"]="image=image/animate/skltxueyi.png",
		


["hmx002"] = "芙兰朵露·斯卡雷特",["&hmx002"] = "芙兰朵露",["#hmx002"] = "恶魔之妹",
    ["!hmx002"] = "芙兰朵露",
	["pohuai"] = "破坏",
        [":pohuai"] = "<font color=\"blue\"><b>锁定技，</b></font>回合开始阶段开始时，你须进行一次判定，若结果为【杀】，你指定距离为1以内的所有角色，并对这些角色依次造成1点伤害。",
	["$pohuaiAnimate"]="image=image/animate/pohuai.png",
	
	["yuxue"] = "浴血",
        [":yuxue"] = "每当你受到一次伤害后，你可以使用一张【杀】。此【杀】不计入每阶段的使用限制，无距离限制，且造成的伤害+1。",
        ["@yuxue"] = "你可以发动“浴血”，使用一张【杀】。",
		["#yuxue_damage"]="%from的“%arg”效果被触发,%from对%to的伤害+1",
	["$yuxueAnimate"]="image=image/animate/yuxue.png",
	
	["shengyan"] = "盛宴",
        [":shengyan"] = "每当你造成1点伤害后，你可以摸一张牌。",
		["$shengyanAnimate"]="image=image/animate/shengyan.png",



["hmx003"] = "十六夜咲夜",["#hmx003"] = "完美潇洒的从者",
["!hmx003"] = "十六夜咲夜",
["suoding"] = "锁定",
[":suoding"] = "出牌阶段，你可以依次将一至三名角色的共计一至三张手牌面朝下置于该角色旁，直到此回合结束或你死亡。<font color=\"green\"><b>每阶段限一次。</b></font>",
["suoding_cards"] ="锁定",
["suoding_exchange"] ="你对你发动了“锁定”，请选择锁定牌 %src 张。",
["#suoding_Trigger"]="%from 的 “%arg” 被触发， %to 收回了 %arg2 张锁定牌。",
 ["$suodingAnimate"]="image=image/animate/suoding.png",
 
["huisu"] = "回溯",
--[":huisu"] = "每当你受到1点伤害后或失去1点体力后，你可以进行一次判定，若结果为红色2-9，你回复1点体力。",
[":huisu"] = "每当你受到一次伤害后，你可以进行一次判定，若结果为红色2-9，你回复1点体力。每当你失去一次体力后，你可以进行一次判定，若结果为<font size=\"5\", color=\"#FF0000\"><b>♥</b></font>2-9，你回复1点体力。",
["huisu1"] = "回溯（伤害）",
["huisu2"] = "回溯（体力流失）",
["$huisuAnimate"]="image=image/animate/huisu.png",

	

["hmx004"] = "帕秋莉·诺蕾姬",["#hmx004"] = "不动的大图书馆",["&hmx004"] = "帕秋莉",
["!hmx004"] = "帕秋莉",
	["bolan"] = "博览",
	[":bolan"] = "若其他角色使用的非延时类锦囊牌（【无懈可击】除外）在结算后置入弃牌堆，你可以将其置于你的人物牌上，称为“曜”。此回合结束时，你须将所有“曜”加入手牌，然后将手牌弃至体力上限的张数。",
	["#bolan_Invoke"]="%from的“%arg”被触发，%from获得了%arg2张“曜”。",
	["yao_mark"] = "曜",
	["bolan:obtain"] = "你可以发动“博览”，将【%src】作为“曜”置于你的人物牌上。",
	["bolan_discard"]="“博览”：收回“曜”后，请弃置%src张手牌。",
	["$bolanAnimate"]="image=image/animate/bolan.png",
	
	["qiyaodummy"]="七曜",
	["qiyao"] = "七曜",
	[":qiyao"] = "你的回合外，你可以将一张手牌当【桃】使用，若此牌不是非延时类锦囊牌，你须先将一张“曜”置入弃牌堆。",



["hmx005"] = "红美铃",["#hmx005"] = "华人小姑娘",
["!hmx005"] = "红美铃",       
		["douhun"] = "斗魂",
        [":douhun"] = "<font color=\"blue\"><b>锁定技，</b></font>你使用的【杀】结算时或指定了你为目标的【杀】对你结算时，此【杀】不可被【闪】响应，并改为按照【决斗】的规则进行结算（但不视为【决斗】，且伤害来源为此【杀】的使用者）。",
        ["#douhun_invoke1"]="%from的“%arg”被触发,%from 对%to 使用的【杀】的结算改为按【决斗】规则进行。",
		["#douhun_invoke2"]="%from的“%arg”被触发,%to 对 %from 使用的【杀】的结算改为按【决斗】规则进行。",
		["$douhunAnimate"]="image=image/animate/douhun.png",
		
		["zhanyi"] = "战意",
        [":zhanyi"] = "你可以将一张手牌当【杀】打出。每当你以此法打出一张红色【杀】，你须摸一张牌。",
		["douhun-slash"]="<font color=\"#00FF00\"><b>%src </b></font>的【斗魂】被触发，请按【决斗】的规则打出【杀】。",		



["hmx006"] = "琪露诺",["#hmx006"] = "湖上的冰精",
    ["!hmx006"] = "琪露诺",   
	["dongjie"] = "冻结",
    [":dongjie"] = "每当你使用【杀】对目标角色造成一次伤害时，你可以防止此伤害并摸一张牌，然后该角色将其人物牌翻面并摸一张牌。",
    ["$dongjieAnimate"]="image=image/animate/dongjie.png",
	["#Dongjie"] = "%from 发动了“%arg”，防止了对 %to 的伤害",

	["bingpo"] = "冰魄",
    [":bingpo"] = "<font color=\"blue\"><b>锁定技，</b></font>每当你受到一次火焰伤害以外的伤害时，若此伤害多于1点或你的体力值为1，防止此伤害。",
    ["#bingpolog"] =
        "%from的“%arg”被触发, %from 防止了%arg2点伤害.",
	
	["bendan"] = "笨蛋",
    [":bendan"] =
        "<font color=\"blue\"><b>锁定技，</b></font>你的牌的点数均视为9。",
        


	


["hmx007"] = "露米娅",["#hmx007"] = "宵暗的妖怪",
   ["!hmx007"] = "露米娅",  
["zhenye"] = "真夜",
[":zhenye"] = "回合结束阶段开始时，你可以将你的人物牌翻面，然后将一名其他角色的人物牌翻面。",
["@zhenye-select"]="你可以指定一名其他角色，你和该角色依次将人物牌翻面。",
 ["$zhenyeAnimate"]="image=image/animate/zhenye.png",
 

["anyu"] = "暗域",
[":anyu"] = "<font color=\"blue\"><b>锁定技，</b></font>当你成为黑色【杀】或黑色非延时类锦囊牌的目标时，你须选择一项：摸一张牌，或将你的人物牌翻面。",
["anyu:turnover"] = "将你的人物牌翻面",
        ["anyu:draw"] = "摸一张牌" ,


["hmx008"] = "小恶魔",["#hmx008"] = "图书馆中的使魔",
       ["!hmx008"] = "小恶魔",     
		["qiyue"] = "契约",
        [":qiyue"] = "其他角色的回合开始阶段开始时，你可以摸一张牌，然后失去1点体力或体力上限，并令该角色跳过此回合的判定阶段和摸牌阶段。",
        ["maxhp_moxue"]="失去1点体力上限",
		["hp_moxue"]="失去1点体力",
		["qiyue:target"] = "你可以发动“契约”，令<font color=\"#00FF00\"><b>%src </b></font>跳过此回合的判定阶段和摸牌阶段。",
		
		["moxue"] = "魔血",
        [":moxue"] = "<font color=\"blue\"><b>锁定技，</b></font>当你的体力上限扣减至1时，你须摸X张牌（X为你当前的手牌数且最少为1）。",
		["$moxueAnimate"]="image=image/animate/moxue.png",


["hmx009"]="大妖精",["#hmx009"]="雾之湖畔的妖精",
    ["!hmx009"]="大妖精",                 
	["juxian"]="具现",
        [":juxian"]="当你进入濒死状态时，若你的人物牌正面朝上，你可以将你的人物牌翻面，展示牌堆顶的三张牌，然后选择一种花色并获得与所选花色不同的牌，将其余的牌置入弃牌堆并回复等量的体力。",
    ["$juxianAnimate"]="image=image/animate/juxian.png",
    
	["banyue"]="半月",
        [":banyue"]= "出牌阶段，你可以失去1点体力，令一至三名角色依次摸一张牌。<font color=\"green\"><b>每阶段限一次。</b></font>",
}



