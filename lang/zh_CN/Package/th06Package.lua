
return{ ["th06"] = "红魔乡",
	["hmx"] = "红",

["hmx001"] = "蕾米莉亚·斯卡雷特",["&hmx001"] = "蕾米莉亚",["#hmx001"] = "红之恶魔",
        
		["skltkexue"] = "渴血",
        [":skltkexue"] = "当你处于濒死状态并向其他角色求【桃】时,若该角色的体力值大于1,该角色可以失去1点体力并摸两张牌,视为对你使用一张【桃】",
        ["skltkexuepeach"]="渴血出桃",
		[":skltkexuepeach"]="“渴血”技能持有者濒死向你求桃时，若你体力不小于2，你可以失去一点体力，摸两张牌，视为对其出桃",
		
		["skltmingyun"] = "命运",
        [":skltmingyun"] = "在一次判定开始前，你可以摸两张牌，然后将一张手牌置于牌堆顶。",
        ["skltmingyun:judge"] = "<font color=\"#00FF00\"><b>%src </b></font> 将要进行“%dest”的判定，你是否发动技能“命运”",
		["@skltmingyun"] = "你须将一张牌放回牌堆顶" ,
        
		["skltxueyi"] = "血裔",
        [":skltxueyi"] = "<font color=\"orange\"><b>主公技，</b></font>你的回合外,每当你需要使用或打出一张【杀】或【闪】时,你可以请求其他红势力角色打出一张【杀】或【闪】(视为由你打出或使用)",
        ["skltxueyi:pattern"] = "你是否发动主公技“血裔”，要求其他红势力角色替你出【%src】",
		["@skltxueyi-slash"] = "你可以响应<font color=\"#00FF00\"><b>%src </b></font>的主公技“血裔”，打出一张【杀】，视为由<font color=\"#00FF00\"><b>%src </b></font> 使用或打出" ,
        ["@skltxueyi-jink"] = "你可以响应<font color=\"#00FF00\"><b>%src </b></font>的主公技“血裔”，打出一张【闪】，视为由<font color=\"#00FF00\"><b>%src </b></font> 使用或打出" ,
 	


["hmx002"] = "芙兰朵露·斯卡雷特",["&hmx002"] = "芙兰朵露",["#hmx002"] = "恶魔之妹",
    
	["pohuai"] = "破坏",
        [":pohuai"] = "<font color=\"blue\"><b>锁定技，</b></font>回合开始阶段开始时，你须进行一次判定，若结果为【杀】，你须指定距离为1以内的所有角色，你对你指定的角色依次造成1点伤害。",
  
	["yuxue"] = "浴血",
        [":yuxue"] = "每当你受到一次伤害后，你可以使用一张【杀】。此【杀】不计入每阶段的使用限制，无距离限制，且对目标角色造成的伤害+1。",
        ["@yuxue"] = "是否使用技能“浴血”:使用一张无视距离，对目标伤害+1的【杀】",
		["#yuxue_damage"]="%from的“%arg”效果被触发,%from对%to的伤害+1",

	["shengyan"] = "盛宴",
        [":shengyan"] = "每当你造成1点伤害后，你可以摸一张牌。",
		



["hmx003"] = "十六夜咲夜",["#hmx003"] = "完美潇洒的从者",

["suoding"] = "锁定",
[":suoding"] = "出牌阶段，你可以依次将一至三名角色的共计一至三张手牌面朝下置于该角色旁。<font color=\"green\"><b>每阶段限一次</b></font>一名角色的回合结束阶段结束时或当你死亡时，将所有以此法置于一名角色旁的牌加入该角色的手牌。",
["suoding_cards"] ="锁定牌",
["@@suoding"] ="你还可以使用 %src 次“锁定”",
["#suoding_Trigger"]="%from 的 “%arg” 被触发， %to 收回了 %arg2 张锁定牌",
 
["huisu"] = "回溯",
[":huisu"] = "每当你受到1点伤害或失去1点体力后，你可以进行一次判定，若结果为红色2-9，你回复1点体力",


	

["hmx004"] = "帕秋莉·诺蕾姬",["#hmx004"] = "不动的大图书馆",["&hmx004"] = "帕秋莉",

	["bolan"] = "博览",
	[":bolan"] = "若其他角色使用的非延时类锦囊牌（【无懈可击】除外）在结算后置入弃牌堆，你可以将其置于你的武将牌上，称为“曜”。一名角色的回合结束阶段开始时，若你的武将牌上有不少于一张“曜”，你须将所有“曜”加入手牌，然后将手牌弃至三张。",
	["#bolan_Invoke"]="%from的“%arg”被触发，%from获得了%arg2张七曜牌",
	["yao_mark"] = "曜",
	["bolan:obtain"] = "你可以发动“博览”，将【%src】作为“曜”置于你的武将牌上",
	["bolan_discard"]="“博览”：收回“曜”之后，你需要弃置%src张手牌",
	
	["qiyaodummy"]="七曜",
	["qiyao"] = "七曜",
	["@qiyao"] = "你可以发动“七曜”,对<font color=\"#00FF00\"><b>%src </b></font>使用【桃】",
	["~qiyao"] = "选择“曜”和非延时锦囊-->确定",
	[":qiyao"] = "你的回合外，你可以将一张手牌当【桃】使用，若此牌不是非延时类锦囊牌，你须先将一张“曜”置入弃牌堆。",



["hmx005"] = "红美铃",["#hmx005"] = "华人小姑娘",
       
		["douhun"] = "斗魂",
        [":douhun"] = "<font color=\"blue\"><b>锁定技，</b></font>当你使用或被使用【杀】，且此【杀】有效时，此【杀】不可被【闪】响应，并改为按照【决斗】的规则进行结算（但不视为【决斗】）。结算时，首先不出【杀】的一方受到此【杀】造成的伤害（来源为此【杀】的使用者）。 ",
        ["#douhun_invoke1"]="%from的“%arg”被触发,%from 对%to 使用的【杀】的结算改为按【决斗】规则进行",
		["#douhun_invoke2"]="%from的“%arg”被触发,%to 对 %from 使用的【杀】的结算改为按【决斗】规则进行",
		
		["hmlzhanyi"] = "战意",
        [":hmlzhanyi"] = "你可以将一张手牌当【杀】打出.每以此法打出一张红色【杀】，你摸一张牌。",
		["douhun-slash"]="<font color=\"#00FF00\"><b>%src </b></font>的【斗魂】被触发，请按【决斗】的规则打出【杀】",		



["hmx006"] = "琪露诺",["#hmx006"] = "湖上的冰精",
       
	["dongjie"] = "冻结",
    [":dongjie"] = "每当你使用【杀】对目标角色造成一次伤害时，你可以防止此伤害，并将该角色的武将牌翻面。",
    
	["bingpo"] = "冰魄",
    [":bingpo"] = "<font color=\"blue\"><b>锁定技，</b></font>每当你受到一次火焰伤害以外的伤害时，若此伤害多于1点或你的体力值为1，防止此伤害",
    ["#bingpolog"] =
        "%from的“%arg”被触发, %from 防止了%arg2点伤害.",
	
	["bendan"] = "笨蛋",
    [":bendan"] =
        "<font color=\"blue\"><b>锁定技，</b></font>你所有牌的点数均视为9",
        


	


["hmx007"] = "露米娅",["#hmx007"] = "宵暗的妖怪",
     
["zhenye"] = "真夜",
[":zhenye"] = "回合结束阶段开始时，你可以将你的武将牌翻面，然后将一名其他角色的武将牌翻面。",
["@zhenye-select"]="你可以选择一名其他角色，你和该角色依次翻面。",

["anyu:turnover"] = "<font color=\"#00FF00\"><b>%dest </b></font>对你使用了【%src】。你可以发动“暗域”将你的武将牌翻面。",
["anyu"] = "暗域",
[":anyu"] = "<font color=\"blue\"><b>锁定技，</b></font>当你成为【杀】或【决斗】的目标时，若你的武将牌背面朝上，你须选择一项：将你的武将牌翻面，或令此牌对你无效。",



["hmx008"] = "小恶魔",["#hmx008"] = "图书馆中的使魔",
            
		["qiyue"] = "契约",
        [":qiyue"] = "其他角色的回合开始阶段开始时,你可以摸一张牌,然后失去一点体力或体力上限,若如此做,该角色须跳过判定阶段和摸牌阶段",
        ["maxhp_moxue"]="失去1点体力上限",
		["hp_moxue"]="失去1点体力",
		["qiyue:target"] = "你可以发动“契约”，令<font color=\"#00FF00\"><b>%src </b></font>跳过判定阶段和摸牌阶段",
		
		["moxue"] = "魔血",
        [":moxue"] = "<font color=\"blue\"><b>锁定技，</b></font>当你的体力上限扣减至1时,你须摸x张牌(x为你当前手牌数且最少为1)",



["hmx009"]="大妖精",["#hmx009"]="雾之湖畔的妖精",
                     
	["juxian"]="具现",
        [":juxian"]="当你进入濒死状态时，若你的武将牌正面朝上，你可以将你的武将牌翻面，展示牌堆顶的3张牌，然后选择一种花色并获得与所选花色不同的牌，将其余的牌置入弃牌堆并回复X点体力（X为你以此法置入弃牌堆的牌的数量）。",
        
	["banyue"]="半月",
        [":banyue"]= "出牌阶段，你可以失去1点体力，令一至三名角色一次摸一张牌。<font color=\"green\"><b>每阶段限一次</b></font>",
}




