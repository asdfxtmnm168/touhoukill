return{

	["th13"] = "神灵庙",
	["slm"] = "灵",

	--slm001  势力：灵 4血
	["miko"] = "丰聪耳神子",
	["#miko"] = "圣德道士",
	["designer:miko"] = "星野梦美☆",

	["illustrator:miko"] = "NAbyssor",
	["origin:miko"] = "p号：21176402，个人ID：467511",
	["illustrator:miko_1"] = "カズ",
	["origin:miko_1"] = "p号：36122574，个人ID：137496",
	["illustrator:miko_2"] = "泉水茜",
	["origin:miko_2"] = "p号：21607040，个人ID：786736",
	["illustrator:miko_3"] = "詩韻",
	["origin:miko_3"] = "p号：21141746，个人ID：44784",
	["illustrator:miko_4"] = "七瀬尚",
	["origin:miko_4"] = "p号：23917375，个人ID：312852",

	["shengge"] = "圣格",
	[":shengge"] = "<font color=\"purple\"><b>觉醒技，</b></font>准备阶段开始时，若你没有手牌，你失去1点体力上限，摸三张牌，改变技能“倾听”。",
	["$shenggeAnimate"]= "skill=miko:shengge",
	["#ShenggeWake"] = "%from 没有手牌，触发“%arg”觉醒",
	["qingting"] = "倾听",
	[":qingting"] = "<font color=\"green\"><b>出牌阶段限一次，</b></font>你可令有手牌的所有其他角色（至少一名）依次交给你一张手牌（技能“圣格”发动后，改为你依次获得这些角色的一张手牌），然后你依次将一张手牌交给这些角色。",
	["qingtingGive"]= "<font color=\"#00FF00\"><b>%src </b></font> 发动了“倾听”，请将一张手牌交给 <font color=\"#00FF00\"><b>%src </b></font>。",
	["qingtingReturn"]= "请将一张手牌交给“倾听”对象 <font color=\"#00FF00\"><b>%src </b></font>。",
	["chiling"] = "敕令",
	[":chiling"] = "<font color=\"orange\"><b>主公技，</b></font>当其他灵势力角色获得你的手牌后，你可令其展示这些牌。若其中有【杀】，其可以使用【杀】。",
	["chiling:showcard"] = "<font color=\"#00FF00\"><b>%src </b></font> 获得了你的手牌，你可以发动“敕令”，令其展示这些牌。",
	["@chiling"] = "你从 <font color=\"#00FF00\"><b>%src </b></font> 处获得了【杀】，你可以使用【杀】。",

--*********************************************
	--slm002  势力：灵 4血
	["mamizou"] = "二岩猯藏",
	["#mamizou"] = "狸猫怪十变化",
	["designer:mamizou"] = "星野梦美☆",

	["illustrator:mamizou"] = "ideolo",
	["origin:mamizou"] = "p号：27366760，个人ID：61513",
	["illustrator:mamizou_1"] = "ふーえん",
	["origin:mamizou_1"] = "p号：36315798，个人ID：131669",
	["illustrator:mamizou_2"] = "まくわうに",
	["origin:mamizou_2"] = "p号：33687206，个人ID：941624",
	["illustrator:mamizou_3"] = "茹でピー",
	["origin:mamizou_3"] = "p号：33663902，个人ID：264281",
	["illustrator:mamizou_4"] = "7",
	["origin:mamizou_4"] = "p号：46198301，个人ID：547647",

	["xihua"] = "戏画",
	[":xihua"] = "当你需要使用或打出基本牌或普通锦囊牌时，你可以声明之（不能声明于此回合内以此法声明过的牌），并令一名其他角色展示你的一张手牌：若此牌与你声明的牌类别相同或此牌的点数为J-K，你将此牌当你声明的牌使用或打出。否则，弃置之。",
	["#Xihua_failed"] = "%from 发动 “%arg” 声明【%arg2】失败。",
	["~xihua"]= "选择戏画牌的使用目标",
	["@xihua_chosen"]= "为戏画牌 “%src” 指定一名展示者。",
	["xihua_vs"]= "戏画",
	["xihua_skill_slash"]= "戏画",
	["xihua_skill_saveself"]= "戏画",
	["#Xihua"] = "%from 发动了“%arg2”，声明此牌为 【%arg】，指定的目标为 %to",
	["#XihuaNoTarget"] = "%from 发动了“%arg2”，声明此牌为 【%arg】",
    ["#xihua_clear"]= "戏画(后续)",
--*********************************************
	--slm003  势力：灵 3血
	["futo"] = "物部布都",
	["#futo"] = "古代日本的尸解仙",
	["designer:futo"] = "星野梦美☆",

	["illustrator:futo"] = "とりのあくあ",
	["origin:futo"] = "p号：22092678，个人ID：1960050",
	["illustrator:futo_1"] = "Mik-cis",
	["origin:futo_1"] = "p号：33480707，个人ID：1006311",
	["illustrator:futo_2"] = "ななしな",
	["origin:futo_2"] = "p号：23798022，个人ID：274594",
	["illustrator:futo_3"] = "キタユキ",
	["origin:futo_3"] = "p号：32655390，个人ID：199411",
	["illustrator:futo_4"] = "まくわうに",
	["origin:futo_4"] = "p号：33451843，个人ID：941624",

	["shijie"] = "尸解",
	[":shijie"] = "当一名角色向你求【桃】时，你可以弃置一张手牌，令其判定。然后你可以弃置场上一张与结果的花色相同的装备牌，令其回复1点体力。",
	["@@shijie_chosen"] = "你需要选择“尸解”装备，请指定一名有装备的对象",
	["fengshui"] = "风水",
	[":fengshui"] = "当判定牌生效前，你可观看牌堆顶的两张牌并改变其中任意数量的牌的顺序，将其余的牌以任意顺序置于牌堆底。然后你可用牌堆顶的一张牌代替判定牌。",
	["fengshui_retrial"]= "风水改判",
	["#fengshuiResult"] = "%from 的“<font color=\"yellow\"><b>风水</b></font>”结果：%arg 上，%arg2 下。",

--*********************************************
	--slm004  势力：灵 4血
	["toziko"] = "苏我屠自古",
	["#toziko"] = "神明后裔的亡灵",
	["designer:toziko"] = "星野梦美☆",

	["illustrator:toziko"] = "まぐろいど",
	["origin:toziko"] = "p号：22946343，个人ID：2096991",
	["illustrator:toziko_1"] = "遠坂あさぎ",
	["origin:toziko_1"] = "p号：26376620，个人ID：3302692",
	["illustrator:toziko_2"] = "ぬぬっこ",
	["origin:toziko_2"] = "p号：22618790，个人ID：1030312",

	["leishi"] = "雷矢",
	[":leishi"] = "<font color=\"green\"><b>出牌阶段限一次，</b></font>你可以视为对一名有手牌的角色使用雷【杀】，此【杀】不计入次数限制。当此【杀】被【闪】抵消时，你失去1点体力。",
	["fenyuan"] = "愤怨",
	[":fenyuan"] = "当你于其他角色的回合内进入濒死状态时，你可以死亡，若如此做，其受到无来源的2点雷电伤害。",
	["fenyuan:invoke"] = "你可以发动“愤怨”立即死亡（无来源），然后当前回合的角色 <font color=\"#00FF00\"><b>%src </b></font> 会受到无来源的2点雷电伤害。",

--*********************************************
	--slm005  势力：灵 3血
	["seiga"]= "霍青娥",
	["#seiga"]= "穿壁之邪仙人",
	["designer:seiga"] = "星野梦美☆",

	["illustrator:seiga"] = "桐葉",
	["origin:seiga"] = "p号：24756353，个人ID：260108",
	["illustrator:seiga_1"] = "ぬぬっこ",
	["origin:seiga_1"] = "p号：22465190，个人ID：1030312",
	["illustrator:seiga_2"] = "みぃこ",
	["origin:seiga_2"] = "p号：42397248，个人ID：5044827",
	["illustrator:seiga_3"] = "まぐろいど",
	["origin:seiga_3"] = "p号：22021510，个人ID：2096991",
	["illustrator:seiga_4"] = "みゅーと",
	["origin:seiga_4"] = "p号：27261606，个人ID：1203504",

	["xiefa"]= "邪法",
	[":xiefa"]= "<font color=\"green\"><b>出牌阶段限一次，</b></font>你可以将一张手牌交给一名其他角色，令其视为对其攻击范围内的你指定的一名角色使用【杀】。当此【杀】被【闪】抵消时，其失去1点体力。当目标角色受到此【杀】造成的伤害后，你摸一张牌。",
	["chuanbi"]= "穿壁",
	[":chuanbi"]= "当你需要使用或打出【闪】时，若当前回合的角色的装备区里没有武器牌，你可以视为使用或打出【闪】。",

--*********************************************
	--slm006  势力：灵 4血
	["yoshika"]= "宫古芳香",
	["#yoshika"]= "忠诚的尸体",
	["designer:yoshika"] = "星野梦美☆",

	["illustrator:yoshika"] = "ハシコ",
	["origin:yoshika"] = "p号：18277982，个人ID：74348",
	["illustrator:yoshika_1"] = "KS",
	["origin:yoshika_1"] = "p号：18416435，个人ID：649747",
	["illustrator:yoshika_2"] = "Cetera",
	["origin:yoshika_2"] = "p号：35882272，个人ID：192311",
	["illustrator:yoshika_3"] = "tucana",
	["origin:yoshika_3"] = "p号：18499354，个人ID：1593245",
	["illustrator:yoshika_4"] = " 二酸化炭素 ",
	["origin:yoshika_4"] = "p号：56385422",

	["duzhua"]= "毒爪",
	[":duzhua"]= "<font color=\"green\"><b>出牌阶段限一次，</b></font>你可以将一张红色手牌当【杀】使用，此【杀】不计入次数限制。",
	["#duzhuaTargetMod"]= "毒爪",
	["taotie"]= "饕餮",
	[":taotie"]= "当其他角色使用【闪】时，若你已受伤，你可以判定，若结果为黑色，你回复1点体力。",

--*********************************************
	--slm007  势力：灵 3血
	["kyouko"] = "幽谷响子",
	["#kyouko"] = "念经的山灵",
	["designer:kyouko"] = "星野梦美☆",

	["illustrator:kyouko"] = "砂雲",
	["origin:kyouko"] = "p号：19958781，个人ID：295604",
	["illustrator:kyouko_1"] = "潜男",
	["origin:kyouko_1"] = "p号：18253434，个人ID：1220170",
	["illustrator:kyouko_2"] = "ideolo",
	["origin:kyouko_2"] = "个人ID：61513",

	--["huisheng"] = "回声",
	--[":huisheng"] = "当其他角色使用的基本牌或普通锦囊牌结算后，若你为此牌的唯一目标，你可以视为对其使用一张与此牌名称相同且属性相同的牌。",
	--[":huisheng"] = "当其他角色使用的基本牌或普通锦囊牌结算后，若你为唯一目标，你可以视为对其使用同名同属性的牌。",
	--["~huisheng"] = "回声",
	--["@huisheng-use"] = "你可以发动“回声”，对 <font color=\"#00FF00\"><b>%src </b></font> 使用一张【%dest】。",
	["songjing"] = "诵经",
	[":songjing"] = "当一名角色使用延时锦囊牌时，你可以摸两张牌。",
	["songjing:use"] = "<font color=\"#00FF00\"><b>%src </b></font>使用了延时锦囊【%dest】，你可以发动“诵经”",
	["gongzhen"] = "共振",
	[":gongzhen"] = "你攻击范围内的一名角色受到【杀】造成的伤害后，你可以弃置一张花色相同的手牌，对其造成一点伤害。",
	["@gongzhen"] = "你可以发动 “共振” 弃置一张%arg 花色的 手牌，对 %src 造成1点伤害",
--*********************************************
	--slm008  势力：灵 3血
	["yuyuko_slm"] = "神灵庙SP幽幽子" ,
	["&yuyuko_slm"] = "神灵庙幽幽子" ,
	["#yuyuko_slm"] = "不再彷徨的亡灵" ,
	["designer:yuyuko_slm"] = "星野梦美☆",

	["illustrator:yuyuko_slm"] = "meola",
	["origin:yuyuko_slm"] = "p号：11911124，个人ID：31990",
	["illustrator:yuyuko_slm_1"] = "みや",
	["origin:yuyuko_slm_1"] = "p号：22766094，个人ID：41977",
	["illustrator:yuyuko_slm_2"] = "一葉モカ",
	["origin:yuyuko_slm_2"] = "p号：17232914，个人ID：464525",
	["illustrator:yuyuko_slm_3"] = "はいばね",
	["origin:yuyuko_slm_3"] = "p号：22145913",


	["chuixue"] = "吹雪" ,
	[":chuixue"] = "弃牌阶段结束时，若此阶段内你弃置了不少于一张手牌，你可令一名其他角色选择一项：弃置一张手牌，此牌的花色不能与此阶段内你弃置的任一张手牌相同；或失去1点体力。" ,
	["@chuixue-select"] = "请指定“吹雪”的目标。" ,
	["@chuixue-discard"] = "请弃置一张手牌，且花色不能与此阶段内 <font color=\"#00FF00\"><b>%src </b></font> 弃置的任一张牌相同，否则失去1点体力。" ,
	["wushou"] = "无寿" ,
	[":wushou"] = "当你成为【杀】或【决斗】的目标后，你可以摸体力上限张数的牌，然后弃置X张手牌（X为你的体力值）。" ,
	["wushou_discard"]= "“无寿”：请弃置 %src 张手牌。",

--*********************************************
	--slm009  势力：灵 3血
	["nue_slm"] = "神灵庙SP鵺",
	["&nue_slm"] = "神灵庙鵺",
	["#nue_slm"] = "古代妖怪之一",
	["designer:nue_slm"] = "星野梦美☆",

	["illustrator:nue_slm"] = "赤シオ",
	["origin:nue_slm"] = "p号：6203096，个人ID：341747",
	["illustrator:nue_slm_1"] = "赤シオ",
	["origin:nue_slm_1"] = "p号：9055771，个人ID：341747",
	["illustrator:nue_slm_2"] = "なまもななせ",
	["origin:nue_slm_2"] = "p号：9785493，个人ID：1167548",
	["illustrator:nue_slm_3"] = "赤シオ",
	["origin:nue_slm_3"] = "p号：26650042，个人ID：341747",

	["buming"] = "不明",
	[":buming"] = "<font color=\"green\"><b>出牌阶段限一次，</b></font>你可弃置一张牌，令你攻击范围内的一名角色选择一项：令你视为对其使用【杀】，或令你视为对其使用【决斗】。",
	["slash_buming"] = "视为你被使用【杀】",
	["duel_buming"] = "视为你被使用【决斗】",
	["#buming_choose"]= "%from 选择了 “%arg”。",
	["zhengti"] = "正体",
	[":zhengti"] = "<font color=\"blue\"><b>锁定技，</b></font>其他角色的回合结束时，若你于此回合受到过其造成的伤害，其横置装备区内的所有牌。当你受到伤害时，若其他角色装备区有横置的牌，你重置其中一名角色的装备区的所有牌，将此伤害转移给其。",
	["@zhengti"] = "正体",
	["@zhengti-choose"]= "指定一名有“正体”标记的其他角色，转移伤害。",
	["zhengti_extra"] = "正体",
	[":zhengti_extra"] = "“正体”目标会代替你承受伤害。",

--*********************************************
	--slm010  势力：灵 3血
	["kogasa_slm"] = "神灵庙SP小伞" ,
	["&kogasa_slm"] = "神灵庙小伞" ,
	["#kogasa_slm"] = "为难的遗忘之物" ,
	["designer:kogasa_slm"] = "星野梦美☆",

	["illustrator:kogasa_slm"] = "にろ",
	["origin:kogasa_slm"] = "p号：26300308，个人ID：194231",
	["illustrator:kogasa_slm_1"] = "竜",
	["origin:kogasa_slm_1"] = "p号：11868952，个人ID：612224",
	["illustrator:kogasa_slm_2"] = "村上４時",
	["origin:kogasa_slm_2"] = "p号：27202944，个人ID：309850",
	["illustrator:kogasa_slm_3"] = "プリンプリン",
	["origin:kogasa_slm_3"] = "p号：9172954，个人ID：4179",

	["qingyu"] = "晴雨",
	[":qingyu"] = "当你受到伤害后，你可以将一张手牌当【兵粮寸断】置入你的判定区，若如此做，你指定所有体力值不小于你的其他角色，这些角色依次选择一项：弃置一张牌，或令你摸一张牌。" ,
	["@qingyu"] = "你可以发动“晴雨”，将一张手牌当做【兵粮寸断】置入你的判定区",
	["@qingyu-discard"] = "请弃置一张牌，否则 <font color=\"#00FF00\"><b>%src </b></font> 将摸一张牌。" ,
	["guoke"] = "过客",
	[":guoke"] = "当一张牌离开你的判定区时，你可以选择一项：摸一张牌，或回复1点体力。" ,
	["guoke:recover"] = "回复1点体力" ,
	["guoke:draw"] = "摸一张牌" ,
}
