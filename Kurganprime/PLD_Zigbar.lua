-- Last Updated: 03/31/2015 09:55 AM  --
-- Credit to Bokura for creating the basics of this file --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"}
	ShieldIndex = 1
	ShieldArray = {"Ochain","Aegis","Priwen"} -- 3 Types Of Shields. Default is Ochain --
	IdleIndex = 4
	IdleArray = {"Movement","Regen","Refresh","Hybrid"} -- Default Idle Set Is Hybrid --
	Armor = 'None'
	Twilight = 'None'
	Repulse = 'OFF' -- Set Default Repulse ON or OFF Here --
	Capa = 'OFF' -- Sets Capacity Point+ Mantle --
	target_distance = 6 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	sc_map = {SC1="Flash", SC2="UtsusemiNi", SC3="UtsusemiIchi"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
	EnmityBlueMagic = S{"Jettatura","Sheep Song","Soporific","Blank Gaze","Geist Wall"} -- BlueMagic --
	
	Cities = S{
                        "Ru'lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
                        "Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
                        "Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
                        "Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
                        "Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold",
                        "Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Tavnazia"}

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {
			ammo="Angha Gem",
			head="Baghere Salade",
			neck="Wiglen Gorget",
			ear1="Colossus's Earring",
			ear2="Ethereal Earring",
			body="Ares' Cuirass +1",
			hands="Ogier's Gauntlets",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring",
			back="Scuta Cape",
			waist="Flume Belt +1",
			legs="Crimson Cuisses",
			feet="Ogier's Leggings"}
	sets.Idle.Regen.Ochain = set_combine(sets.Idle.Regen,{
			main="Burtgang",
			sub="Ochain"})
	sets.Idle.Regen.Aegis = set_combine(sets.Idle.Regen,{
			main="Burtgang",
			sub="Aegis"})
	sets.Idle.Regen.Priwen = set_combine(sets.Idle.Regen,{
			main="Burtgang",
			sub="Priwen"})
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{})
	sets.Idle.Movement.Ochain = set_combine(sets.Idle.Movement,{
			main="Burtgang",
			sub="Ochain"})
	sets.Idle.Movement.Aegis = set_combine(sets.Idle.Movement,{
			main="Burtgang",
			sub="Aegis"})
	sets.Idle.Movement.Priwen = set_combine(sets.Idle.Movement,{
			main="Burtgang",
			sub="Priwen"})
	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{
			head="Baghere Salade",
			body="Ares' Cuirass +1",
			hands="Ogier's Gauntlets",
			feet="Ogier's Leggings"})
	sets.Idle.Refresh.Ochain = set_combine(sets.Idle.Refresh,{
			main="Burtgang",
			sub="Ochain"})
	sets.Idle.Refresh.Aegis = set_combine(sets.Idle.Refresh,{
			main="Burtgang",
			sub="Aegis"})
	sets.Idle.Refresh.Priwen = set_combine(sets.Idle.Refresh,{
			main="Burtgang",
			sub="Priwen"})
	sets.Town = set_combine(sets.Idle.Hybrid,{
			head="Cab. Coronet +1",
			body="Chev. Cuirass",
			hands="Chev. Gauntlets",
			ring1="Shadow Ring",
			legs="Crimson Cuisses",
			feet="Chev. Sabatons"})

	sets.Resting = set_combine(sets.Idle.Regen)

	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	
	sets.Idle.Hybrid = set_combine(sets.Idle.Regen,{
			ammo="Angha Gem",
			head="Baghere Salade",
			neck="Creed Collar",
			ear1="Trux Earring",
			ear2="Ethereal Earring",
			body="Ares' Cuirass +1",
			hands="Cizin Mufflers +1",
			ring1="Sheltered Ring",
			ring2="Apeile Ring +1",
			back="Shadow Mantle",
			waist="Flume Belt +1",
			legs="Crimson Cuisses",
			feet="Cab. Leggings +1"})
			
	-- TP Base Set --
	sets.TP = {}

	-- Ochain TP Sets --
	sets.TP.Ochain = {
			main="Burtgang",
			sub="Ochain",
			ammo="Ginsen",
			head="Otomi Helm",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Acro Breeches",
			feet="Acro Leggings"}			
	sets.TP.Ochain.MidACC = set_combine(sets.TP.Ochain,{
			head="Yorium Barbuta",
			ear1="Zennaroi Earring",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			back="Letalis Mantle"})	
	sets.TP.Ochain.HighACC = set_combine(sets.TP.Ochain.MidACC,{
			neck="Iqabi Necklace",
			ear2="Steelflash Earring",
			body="Mes. Haubergeon",
			ring2="Beeline Ring",
			waist="Dynamic Belt +1"})

	-- Aegis TP Sets --
	sets.TP.Aegis = {
			main="Burtgang",
			sub="Aegis",
			ammo="Ginsen",
			head="Otomi Helm",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Acro Breeches",
			feet="Acro Leggings"}	
	sets.TP.Aegis.MidACC = set_combine(sets.TP.Aegis,{
			head="Yorium Barbuta",
			ear1="Zennaroi Earring",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			back="Letalis Mantle"})	
	sets.TP.Aegis.HighACC = set_combine(sets.TP.Aegis.MidACC,{
			neck="Iqabi Necklace",
			ear2="Steelflash Earring",
			body="Mes. Haubergeon",
			ring2="Beeline Ring",
			waist="Dynamic Belt +1"})
			
	-- Priwen TP Sets --
	sets.TP.Priwen = {
			main="Burtgang",
			sub="Priwen",
			ammo="Ginsen",
			head="Otomi Helm",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Acro Breeches",
			feet="Acro Leggings"}			
	sets.TP.Priwen.MidACC = set_combine(sets.TP.Priwen,{
			head="Yorium Barbuta",
			ear1="Zennaroi Earring",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			back="Letalis Mantle"})	
	sets.TP.Priwen.HighACC = set_combine(sets.TP.Priwen.MidACC,{
			neck="Iqabi Necklace",
			ear2="Steelflash Earring",
			body="Mes. Haubergeon",
			ring2="Beeline Ring",
			waist="Dynamic Belt +1"})

	-- Ragnarok TP Sets --
	sets.TP.Ragnarok = {
			main="Ragnarok",
			sub="Duplus Grip",
			ammo="Ginsen",
			head="Otomi Helm",
			neck="Asperity Necklace",
			ear1="Trux Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Acro Breeches",
			feet="Acro Leggings"}
	sets.TP.Ragnarok.MidACC = set_combine(sets.TP.Ragnarok,{
			head="Yorium Barbuta",
			ear1="Zennaroi Earring",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			back="Letalis Mantle"})	
	sets.TP.Ragnarok.HighACC = set_combine(sets.TP.Ragnarok.MidACC,{
			neck="Iqabi Necklace",
			ear2="Steelflash Earring",
			body="Mes. Haubergeon",
			ring2="Beeline Ring",
			waist="Dynamic Belt +1"})

	-- Ragnarok(Ionis) TP Sets --
	sets.TP.Ragnarok.Ionis = set_combine(sets.TP.Ragnarok,{})
	sets.TP.Ragnarok.MidACC.Ionis = set_combine(sets.TP.Ragnarok.Ionis,{})	
	sets.TP.Ragnarok.HighACC.Ionis = set_combine(sets.TP.Ragnarok.MidACC.Ionis,{})

	-- PDT/MDT/DT Sets --												
												
	sets.PDT = {}
	sets.PDT.Ochain = {
			sub="Ochain",
			ammo="Hasty Pinion +1",
			head="Ighwa Cap", -- 4 -- [Upgrade: Yorium Barbuta -3% DT]
			neck="Twilight Torque", -- 5 DT --
			ear1="Zennaroi Earring",
			ear2="Ethereal Earring",
			body="Cab. Surcoat +1", -- 10 DT [Upgrade: Tartarus Platemail -10% DT] --
			hands="Macabre Gaunt. +1", -- 4 -- [Upgrade: Yorium Gauntlets -3% DT]
			ring1="Patricius Ring", -- 5 [Upgrade: Defending Ring -10% DT] --
			ring2="Vocane Ring", -- 7 DT --
			back="Mollusca Mantle", -- 5 DT --
			waist="Nierenschutz", -- 3 DT --
			legs="Chevalier's Cuisses", -- 5 -- [Upgrade: Yorium Cuisses -3% DT]
			feet={name="Yorium Sabatons",augments={"Accuracy+16 Attack+16","Dbl. Atk.+2","Damage taken -2%"}}} -- 2 DT-- [Upgrade: Yorium Sabatons -3% DT]
							-- Total -32% DT + -18% PDT = -50% Reduction [Goal is to have -50% DT(max)] --
												-- Primary ACC 817 --
	sets.PDT.Aegis = {
			sub="Aegis",
			ammo="Hasty Pinion +1",
			head="Ighwa Cap",
			neck="Twilight Torque",
			ear1="Zennaroi Earring",
			ear2="Ethereal Earring",
			body="Cab. Surcoat +1",
			hands="Macabre Gaunt. +1",
			ring1="Patricius Ring",
			ring2="Vocane Ring",
			back="Mollusca Mantle",
			waist="Nierenschutz",
			legs="Chevalier's Cuisses",
			feet={name="Yorium Sabatons",augments={"Accuracy+16 Attack+16","Dbl. Atk.+2","Damage taken -2%"}}}
			
	sets.PDT.Priwen = {
			sub="Priwen",
			ammo="Hasty Pinion +1",
			head="Ighwa Cap",
			neck="Twilight Torque",
			ear1="Zennaroi Earring",
			ear2="Ethereal Earring",
			body="Cab. Surcoat +1",
			hands="Macabre Gaunt. +1",
			ring1="Patricius Ring",
			ring2="Vocane Ring",
			back="Mollusca Mantle",
			waist="Nierenschutz",
			legs="Chevalier's Cuisses",
			feet={name="Yorium Sabatons",augments={"Accuracy+16 Attack+16","Dbl. Atk.+2","Damage taken -2%"}}}

	sets.MDT = {}
	sets.MDT.Ochain = {
			sub="Ochain",
			ammo="Vanir Battery", -- MDB 4 --
			head="Cizin Helm +1", -- MDB 2 / MDT 3 --
			neck="Twilight Torque", -- 5 DT --
			ear1="Merman's Earring", -- MDT 2 --
			ear2="Merman's Earring", -- MDT 2 --
			body="Cab. Surcoat +1", -- 10 DT --
			hands="Rev. Gauntlets +1", -- MDB 1 / MDT 5 --
			ring1="Shadow Ring",
			ring2="Vocane Ring", -- 7 DT --
			back="Mollusca Mantle", -- 5 DT --
			waist="Nierenschutz", -- 3 DT --
			legs={name="Cizin Breeches +1",augments={"Dbl.Atk. +1","Phys. dmg. taken -3%","Magic dmg. taken -3%"}}, -- MDB 3 / MDT 3 --
			feet="Cab. Leggings +1"} -- MDB 2 / MDT 5 --
								-- Total -30% DT + -20% MDT = -50%/50% Reduction / +12 MDB [Goal is to have -43% DT(max w/Shadow Ring)] --

	sets.MDT.Aegis = {
			sub="Aegis",
			ammo="Vanir Battery",
			head="Cizin Helm +1",
			neck="Twilight Torque",
			ear1="Merman's Earring",
			ear2="Merman's Earring",
			body="Cab. Surcoat +1",
			hands="Rev. Gauntlets +1",
			ring1="Shadow Ring",
			ring2="Vocane Ring",
			back="Mollusca Mantle",
			waist="Nierenschutz",
			legs={name="Cizin Breeches +1",augments={"Dbl.Atk. +1","Phys. dmg. taken -3%","Magic dmg. taken -3%"}},
			feet="Cab. Leggings +1"}
								
	sets.MDT.Priwen = {
			sub="Priwen",
			ammo="Vanir Battery",
			head="Cizin Helm +1",
			neck="Twilight Torque",
			ear1="Merman's Earring",
			ear2="Merman's Earring",
			body="Cab. Surcoat +1",
			hands="Rev. Gauntlets +1",
			ring1="Shadow Ring",
			ring2="Vocane Ring",
			back="Mollusca Mantle",
			waist="Nierenschutz",
			legs={name="Cizin Breeches +1",augments={"Dbl.Atk. +1","Phys. dmg. taken -3%","Magic dmg. taken -3%"}},
			feet="Cab. Leggings +1"}

	sets.DT = {}
	sets.DT.Ochain = set_combine(sets.PDT.Ochain,{})
	sets.DT.Aegis = set_combine(sets.PDT.Aegis,{})
	sets.DT.Priwen = set_combine(sets.PDT.Priwen,{})

	-- Weakness/Kiting/Repulse Sets --
	sets.Weakness = {}
	sets.Weakness.Ochain = set_combine(sets.PDT.Ochain,{})
	sets.Weakness.Aegis = set_combine(sets.PDT.Aegis,{})
	sets.Weakness.Priwen = set_combine(sets.PDT.Priwen,{})

	sets.Kiting = {}
	sets.Kiting.Ochain = set_combine(sets.PDT.Ochain,{legs="Crimson Cuisses"})
	sets.Kiting.Aegis = set_combine(sets.PDT.Aegis,{legs="Crimson Cuisses"})
	sets.Kiting.Priwen = set_combine(sets.PDT.Priwen,{legs="Crimson Cuisses"})

	sets.Repulse = {}
	sets.Repulse.Ochain = {sub="Ochain",back="Repulse Mantle"}
	sets.Repulse.Aegis = {sub="Aegis",back="Repulse Mantle"}
	sets.Repulse.Priwen = {sub="Priwen",back="Repulse Mantle"}

	-- Hybrid/Shield Skill Sets --
	sets.TP.Hybrid = {}
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	sets.TP.ShieldSkill = {}

	-- WS Base Set --
	sets.WS = {
			ammo="Cheruski Needle",
			head="Otomi Helm",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Metalsinger Belt",
			legs="Acro Breeches",
			feet="Acro Leggings"}

	-- WS Sets --
	sets.WS["Chant du Cygne"] = {
			ammo="Jukukik Feather",
			head="Quiahuiz Helm",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Mes. Haubergeon",
			hands="Acro Gauntlets",
			ring1="Ramuh Ring",
			ring2="Ramuh Ring",
			back="Rancorous Mantle",
			waist="Chiner's Belt +1",
			legs="Acro Breeches",
			feet="Acro Leggings"}
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"],{
			head="Yaoyotl Helm",
			waist="Fotia Belt"})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{
			back="Letalis Mantle"})
			
	sets.WS["Savage Blade"] = {
			ammo="Cheruski Needle",
			head="Otomi Helm",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Metalsinger Belt",
			legs="Acro Breeches",
			feet="Acro Leggings"}
	sets.WS["Savage Blade"].MidACC = set_combine(sets.WS["Chant du Cygne"],{
			head="Yaoyotl Helm",
			body="Mes. Haubergeon",
			waist="Fotia Belt"})
	sets.WS["Savage Blade"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{
			back="Letalis Mantle"})

	sets.WS.Requiescat = {
			ammo="Quartz Tathlum +1",
			head="Otomi Helm",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="Levia. Ring +1",
			ring2="Levia. Ring +1",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs="Acro Breeches",
			feet="Acro Leggings"}
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{
			head="Yaoyotl Helm",
			body="Mes. Haubergeon"})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{
			back="Letalis Mantle"})

	sets.WS.Resolution = {
			ammo="Cheruski Needle",
			head="Otomi Helm",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Metalsinger Belt",
			legs="Acro Breeches",
			feet="Acro Leggings"}
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{
			head="Yaoyotl Helm",
			body="Mes. Haubergeon"})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{
			back="Letalis Mantle"})

	sets.WS.Atonement = {
			ammo="Paeapua",
			head="Champion's Galea",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Trux Earring",
			body="Phorcys Korazin",
			hands="Yorium Gauntlets",
			ring1="Eihwaz Ring",
			ring2="Apeile Ring +1",
			back="Weard Mantle",
			waist="Fotia Belt",
			legs="Ogier's Breeches",
			feet="Yorium Sabatons"}

	sets.WS["Knights of Round"] = {
			ammo="Cheruski Needle",
			head="Otomi Helm",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Metalsinger Belt",
			legs="Acro Breeches",
			feet="Acro Leggings"}

	sets.WS["Sanguine Blade"] = {
			ammo="Cheruski Needle",
			head="Champion's Galea",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Phorcys Korazin",
			hands="Cab. Gauntlets +1",
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Weard Mantle",
			waist="Fotia Belt",
			legs="Augury Cuisses",
			feet="Ejekamal Boots"}

	sets.WS["Aeolian Edge"] = {
			ammo="Cheruski Needle",
			head="Champion's Galea",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Phorcys Korazin",
			hands="Cab. Gauntlets +1",
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Weard Mantle",
			waist="Fotia Belt",
			legs="Augury Cuisses",
			feet="Ejekamal Boots"}

	sets.Enmity = { -- +18 from Burtgang iLvl 119 --
			ammo="Paeapua", -- 2 --
			head="Cab. Coronet +1", -- 7 --
			neck="Unmoving Collar +1", -- 10 --
			ear1="Trux Earring", -- 5 --
			ear2="Pluto's Pearl", -- 4 --
			body="Chev. Cuirass", -- 10 --
			hands={name="Yorium Gauntlets",augments={"Enmity+6"}}, -- 10 --
			ring1="Eihwaz Ring", -- 5 --
			ring2="Apeile Ring +1", -- 5~9 --
			back="Weard Mantle", -- 5 --
			waist="Creed Baudrier", -- 5 --
			legs="Cab. Breeches +1", -- 7 --
			feet={name="Yorium Sabatons",augments={"Enmity+7"}}} -- 12 --
									-- Total Enmity+ = 105~109/100 --

	-- JA Sets --
	sets.JA = {}
	sets.JA["Shield Bash"] = set_combine(sets.Enmity,{hands="Cab. Gauntlets +1"})
	sets.JA.Sentinel = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
	sets.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
	sets.JA["Divine Emblem"] = set_combine(sets.Enmity,{feet="Chev. Sabatons"})
	sets.JA.Fealty = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
	sets.JA.Invincible = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
	sets.JA.Cover = {head="Rev. Coronet +1",body="Cab. Surcoat +1"}
	sets.JA.Palisade = set_combine(sets.Enmity)
	sets.JA.Provoke = set_combine(sets.Enmity)
	sets.JA.Warcry = set_combine(sets.Enmity)
	sets.JA.Souleater = set_combine(sets.Enmity)
	sets.JA["Last Resort"] = set_combine(sets.Enmity)
	sets.JA.Chivalry = {
			ammo="Quartz Tathlum +1",
			head="Rev. Coronet +1",
			body="Cab. Surcoat +1",
			hands="Umuthi Gloves",
			ring2="Levia. Ring +1",
			legs="Cab. Breeches +1",
			feet="Whirlpool Greaves"}
	sets.JA.Rampart = set_combine(sets.Enmity,{head="Cab. Coronet +1"})

	-- Sublimation --
	sets.Sublimation = {}

	-- Flourish --
	sets.Flourish = {}

	-- Step --
	sets.Step = {}

	-- Waltz --
	sets.Waltz = {}

	sets.Precast = {}
	--Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head="Chevalier's Armet",
			neck="Orunmila's Torque",
			ear1="Enchntr. Earring +1",
			ear2="Loquac. Earring",
			body="Nuevo Coselete",
			hands="Buremte Gloves",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Repulse Mantle",
			waist="Goading Belt",
			legs="Enif Cosciales",
			feet="Ejekamal Boots"}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Cure Precast Set --
	sets.Precast.Cure = set_combine(sets.Precast.FastCast,{})

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Spells Recast --
	sets.Midcast.Recast = {
			ammo="Incantor Stone",
			head="Chevalier's Armet",
			neck="Orunmila's Torque",
			ear1="Enchntr. Earring +1",
			ear2="Loquac. Earring",
			body="Nuevo Coselete",
			hands="Buremte Gloves",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Repulse Mantle",
			waist="Goading Belt",
			legs="Enif Cosciales",
			feet="Ejekamal Boots"}

	-- Divine Magic --
	sets.Midcast['Divine Magic'] = set_combine(sets.Midcast.Recast,{
			neck="Nesanica Torque",
			ear2="Beatific Earring",
			body="Rev. Surcoat +1",
			hands="Paragon Moufles",
			waist="Bishop's Sash",
			feet="Templar Sabatons"})

	-- Cure Set --
	sets.Midcast.Cure = {			
			head="Cab. Coronet +1",
			neck="Unmoving Collar +1",
			ear1="Trux Earring",
			ear2="Pluto's Pearl",
			body="Cab. Surcoat +1",
			hands="Macabre Gaunt. +1",
			ring1="Eihwaz Ring",
			ring2="Apeile Ring +1",
			back="Fierabras's Mantle",
			waist="Creed Baudrier",
			legs="Cab. Breeches +1",
			feet="Cab. Leggings +1"}

	-- Self Cure Set --
	sets.Midcast.SelfCure = set_combine(sets.Midcast.Cure,{
			ammo="Egoist's Tathlum",
			body="Savas Jawshan",
			hands="Buremte Gloves",
			ring2="K'ayres Ring",})

	-- Flash Set --
	sets.Midcast.Flash = {
			ammo="Paeapua", -- 2 --
			head="Cab. Coronet +1", -- 7 --
			neck="Unmoving Collar +1", -- 10 --
			ear1="Trux Earring", -- 5 --
			ear2="Pluto's Pearl", -- 4 --
			body="Rev. Surcoat +1", -- 8 --
			hands={name="Yorium Gauntlets",augments={"Enmity+6"}}, -- 10 --
			ring1="Eihwaz Ring", -- 5 --
			ring2="Apeile Ring +1", -- 5~9 --
			back="Weard Mantle", -- 5 --
			waist="Goading Belt", -- 3 --
			legs="Cab. Breeches +1", -- 7 --
			feet={name="Yorium Sabatons",augments={"Enmity+7"}}} -- 12 --
					-- Total Enmity+ = 101~105/100 --

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = set_combine(sets.Midcast.Recast,{
			neck="Colossus's Torque",
			ear1="Andoaa Earring",
			ear2="Augment. Earring",
			body="Shab. Cuirass +1",
			back="Merciful Cape",
			waist="Olympus Sash",
			legs="Rev. Breeches +1"})

	-- Stoneskin --
	sets.Midcast.Stoneskin =  set_combine(sets.Midcast['Enhancing Magic'],{})

	-- Reprisal --
	sets.Midcast.Reprisal = {
			ammo="Egoist's Tathlum",
			head="Ares' Mask +1",
			neck="Iqabi Necklace",
			ear1="Creed Earring",
			ear2="Ethereal Earring",
			body="Rev. Surcoat +1",
			hands="Cab. Gauntlets +1",
			ring1="Eihwaz Ring",
			ring2="K'ayres Ring",
			back="Fierabras's Mantle",
			waist="Creed Baudrier",
			legs="Ares' Flanchard +1",
			feet="Ejekamal Boots"}
			
	-- Lock Capa Mantle --
	sets.Capa = {
			back="Mecisto. Mantle"}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Cancel Berserk If Berserk Is On --
		send_command('cancel Berserk')
	elseif spell.english == "Defender" and buffactive.Defender then -- Cancel Defender If Defender Is On --
		send_command('cancel Defender')
	elseif spell.english == "Souleater" and buffactive.Souleater then -- Cancel Souleater If Souleater Is On --
		send_command('cancel Souleater')
	elseif spell.english == "Last Resort" and buffactive["Last Resort"] then -- Cancel Last Resort If Last Resort Is On --
		send_command('cancel Last Resort')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
		elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
		elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation <me>')
		elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
		elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		end
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if player.tp > 2999 then
				if spell.english == "Resolution" then -- Equip Kokou's Earring When You Have 3000 TP --
					equipSet = set_combine(equipSet,{ear1="Kokou's Earring"})
				elseif spell.english == "Chant du Cygne" then -- Equip Jupiter's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
				end
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Rune" then
		equip(sets.Enmity)
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Reprisal" then
				if buffactive['Blaze Spikes'] or buffactive['Ice Spikes'] or buffactive['Shock Spikes'] then -- Cancel Blaze Spikes, Ice Spikes or Shock Spikes When You Cast Reprisal --
					cast_delay(0.2)
					send_command('cancel Blaze Spikes,Ice Spikes,Shock Spikes')
				end
				equip(sets.Precast.FastCast)
			elseif string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif string.find(spell.type,'Flourish') then
		if spell.english == "Animated Flourish" then
			equip(sets.Enmity)
		else
			equip(sets.Flourish)
		end
	elseif spell.type == "Step" then
		equip(sets.Step)
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
	if Capa == 'ON' then
		equip(sets.Capa)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif (string.find(spell.english,'Cur') or spell.english == "Wild Carrot" or spell.english == "Healing Breeze") and spell.english ~= "Cursna" then
			if spell.target.name == player.name then
				equipSet = equipSet.SelfCure
			else
				equipSet = equipSet.Cure
			end
		elseif string.find(spell.english,'Protect') or string.find(spell.english,'Shell') then
			if spell.target.name == player.name then
				equipSet = set_combine(equipSet,{ring2="Sheltered Ring"})
			end
		elseif spell.english == "Phalanx" then
			equipSet = set_combine(sets.Midcast['Enhancing Magic'],{back="Weard Mantle"})
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 1.7;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Recast
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet,{ring1=""})
		elseif EnmityBlueMagic:contains(spell.english) or spell.english == "Stun" or string.find(spell.english,'Absorb') or spell.english == 'Aspir' or spell.english == 'Drain' then
			if buffactive.Sentinel then
				equipSet = equipSet.Recast
			else
				equipSet = equipSet.Flash
			end
		elseif string.find(spell.english,'Spikes') then
			equipSet = equipSet.Recast
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Recast
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Recast
		elseif equipSet[spell.skill] then
			equipSet = equipSet[spell.skill]
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
	if Capa == 'ON' then
		equip(sets.Capa)
	end
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Banish II" then -- Banish II Countdown --
			send_command('@wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
		elseif spell.english == "Holy Circle" then -- Holy Circle Countdown --
			send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT[ShieldArray[ShieldIndex]])
	elseif Armor == 'MDT' then
		equip(sets.MDT[ShieldArray[ShieldIndex]])
	elseif Armor == 'Kiting' then
		equip(sets.Kiting[ShieldArray[ShieldIndex]])
	elseif Armor == 'Weakness' then
		equip(sets.Weakness[ShieldArray[ShieldIndex]])
	elseif Armor == 'DT' then
		equip(sets.DT[ShieldArray[ShieldIndex]])
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[player.equipment.main] then
			equipSet = equipSet[player.equipment.main]
		end
		if equipSet[ShieldArray[ShieldIndex]] then
			equipSet = equipSet[ShieldArray[ShieldIndex]]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if Armor == 'ShieldSkill' then
			equipSet = set_combine(equipSet,sets.TP.ShieldSkill)
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[ShieldArray[ShieldIndex]] then
			equipSet = equipSet[ShieldArray[ShieldIndex]]
		end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if Repulse == 'ON' then -- Use Repulse Toggle To Lock Repulse Mantle --
		equip(sets.Repulse[ShieldArray[ShieldIndex]])
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
	if Capa == 'ON' then
		equip(sets.Capa)
	end
	if Cities:contains(world.area) then
		equipSet = equip(sets.Town)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck=""})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

--Macros--
send_command('bind f9 gs c C7') --PDT--
send_command('bind f8 gs c C15') --MDT--
send_command('bind f7 gs c C2') --Ochain/Aegis/Priwen--
send_command('bind f6 gs c C1') --ACC Level--
send_command('bind f5 gs c C3') --Twilight--
send_command('bind f10 gs c C4') --Capa Mantle--

function file_unload()
    if binds_on_unload then
        binds_on_unload()
    end

	send_command('unbind f10')
    send_command('unbind f9')
    send_command('unbind f8')
	send_command('unbind f7')
	send_command('unbind f6')
	send_command('unbind f5')
end


-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Shield Type Toggle --
		ShieldIndex = (ShieldIndex % #ShieldArray) + 1
		status_change(player.status)
		add_to_chat(158,'Shield Type: '..ShieldArray[ShieldIndex])
	elseif command == 'C9' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C12' then -- Kiting Toggle --
		if Armor == 'Kiting' then
			Armor = 'None'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Armor = 'Kiting'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C4' then -- Capa Back Toggle --
		if Capa == 'ON' then
			Capa = 'OFF'
			add_to_chat(123,'Capacity Mantle: [Unlocked]')
		else
			Capa = 'ON'
			add_to_chat(158,'Capacity Mantle: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Weakness Set Toggle --
		if Armor == 'Weakness' then
			Armor = 'None'
			add_to_chat(123,'Weakness Set: [Unlocked]')
		else
			Armor = 'Weakness'
			add_to_chat(158,'Weakness Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C17' then -- DT Toggle --
		if Armor == 'DT' then
			Armor = 'None'
			add_to_chat(123,'DT Set: [Unlocked]')
		else
			Armor = 'DT'
			add_to_chat(158,'DT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C16' then -- Repulse Mantle Toggle --
		if Repulse == 'ON' then
			Repulse = 'OFF'
			add_to_chat(123,'Repulse Mantle: [Unlocked]')
		else
			Repulse = 'ON'
			add_to_chat(158,'Repulse Mantle: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C11' then -- Shield Skill Toggle --
		if Armor == 'ShieldSkill' then
			Armor = 'None'
			add_to_chat(123,'Shield Skill Set: [Unlocked]')
		else
			Armor = 'ShieldSkill'
			add_to_chat(158,'Shield Skill Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Twilight Toggle --
		if Twilight == 'Twilight' then
			Twilight = 'None'
			add_to_chat(123,'Twilight Set: [Unlocked]')
		else
			Twilight = 'Twilight'
			add_to_chat(158,'Twilight Set: [locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] then
		return originalCost*.9
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index>1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end

	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" or spell.name == "Divine Waltz II" then
		return
	end

	local newWaltz = spell.english
	local waltzID

	local missingHP

	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end

	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50, ['Curing Waltz IV'] = 65, ['Curing Waltz V'] = 80}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		elseif player.tp < 65 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 80 then
			newWaltz = 'Curing Waltz IV'
		end

		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(158, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(158,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book(13)
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 13)
	else
		set_macro_page(1, 13)
	end
end