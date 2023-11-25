function init_gear_sets()
    --------------------------------------
    -- Augmented gear
    --------------------------------------

	Rosmerta = {}
	Rosmerta.STR    = {name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%'}}
	Rosmerta.DEX    = {name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
	Rosmerta.Tizona = Rosmerta.DEX --{name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10'}} --TODO
	-- Rosmerta.MND    = {name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
	-- Rosmerta.INT    = {name="Rosmerta's Cape", augments={'INT+20','Magic Attack Bonus','Magic Damage'}}
	-- Rosmerta.Cure   = {name="Rosmerta's Cape", augments={'MND+20','"Cure" Potency+10%'}}
	-- Rosmerta.FC     = {name="Rosmerta's Cape", augments={'Fast Cast+10%'}}

	TelchineHead = {}
	TelchineBody = {}
	TelchineHands = {}
	TelchineLegs = {}
	TelchineHead.Cure = { name="Telchine Cap", augments={'Mag. Acc.+25','"Cure" potency +6%','INT+5 MND+5',}}
	TelchineBody.Cure = { name="Telchine Chas.", augments={'Mag. Acc.+12','"Cure" potency +6%',}}
	TelchineHands.Cure = { name="Telchine Gloves", augments={'Mag. Acc.+20','"Cure" potency +8%','INT+6 MND+6',}}
	TelchineLegs.Cure = { name="Telchine Braconi", augments={'"Mag.Atk.Bns."+7','"Cure" potency +7%','INT+5 MND+5',}}

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Hashishin Basmak +1"}
	sets.buff['Chain Affinity'] = {head="Hashishin Kavuk +2", feet="Assimilator's Charuqs +2"}
	sets.buff.Convergence = {head="Luhlaza Keffiyeh +2"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +2"}
	sets.buff.Enchainment = {body="Luhlaza Jubbah +2"}
	sets.buff.Efflux = {legs="Hashishin Tayt +1", back=Rosmerta.DEX}

	
	-- Precast Sets

    -- Precast set for calling Trusts at iLVL 119
    sets.precast.Trust = {
		head="Hashishin Kavuk +2",
		body="Hashishin Mintan +2",
		hands="Assimilator's Bazubands +2",
		legs="Hashishin Tayt +2",
		feet="Assimilator's Charuqs +2"
	}
    sets.midcast.Trust = sets.precast.Trust

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luhlaza Bazubands +2"}


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		ammo="Sonia's Plectrum",
		head="Uk'uxkaj Cap",
		body="Vanir Cotehardie",
		hands="Buremte Gloves",
		ring1="Kunaji Ring", --Spiral Ring?
		back="Iximulew Cape",
		waist="Caudata Belt",
		legs="Hagondes Pants +1",
		feet="Iuitl Gaiters"
	}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		-- main="Sakpata's Sword",
		ammo="Impatiens", --TODO: Sapience Orb
		head="Amalric Coif", --TODO: Carmine Mask +1
		neck="Orunmila's Torque", --TODO: Voltsurge Torque
		ear1="Enchanter's Earring +1",
		ear2="Loquacious Earring",
		body="Luhlaza Jubbah +2", --Fast Cast+8%, Haste+4%, TODO: Luhlaza Jubbah +3
		hands="Leyline Gloves",
		ring1="Weatherspoon Ring", --TODO: Kishar Ring (Omen)
		ring2="Prolix Ring",
		back="Ogapepo Cape", --TODO: Rosmerta.FC
		waist="Witful Belt",
		legs="Ayanmo Cosciales +2",
		feet="Amalric Nails" --TODO: Carmine Greaves +1
	} 
		
	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +2"})

	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Carmine Mask",ear2="Loquacious Earring",
		body="Luhlaza Jubbah +2",hands="Hashishin Bazubands +2",ring1="Prolix Ring",
		back="Swith Cape",waist="Hurch'lan Sash",legs="Samnuha Tights",feet="Luhlaza Charuqs +2"}
		--{
		--head="Haruspex Hat",ear2="Loquacious Earring",
		--body="Luhlaza Jubbah +2",hands="Mavi Bazubands +2",ring1="Prolix Ring",
		--back="Swith Cape +1",waist="Hurch'lan Sash",legs="Enif Cosciales",feet="Iuitl Gaiters +1"}
		
	sets.midcast['Blue Magic'] = {head="Hashishin Kavuk +2",body="Hashishin Mintan +2",hands="Hashishin Bazubands +2",legs="Hashishin Tayt +1",feet="Hashishin Basmak +1"}
	
	-- Physical Spells --
	
	sets.midcast['Blue Magic'].Physical = 
		{ammo="Mavi Tathlum",
		head="Carmine Mask",neck="Ej Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Vanir Cotehardie",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Cornflower Cape",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
		--{ammo="Mavi Tathlum",
		--head="Whirlpool Mask",neck="Ej Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
		--body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Spiral Ring",
		--back="Cornflower Cape",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Qaaxo Leggings"}

	sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Jukukik Feather",
		head="Carmine Mask",neck="Ej Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Luhlaza Jubbah +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Patricius Ring",
		back="Cornflower Cape",waist="Hurch'lan Sash",legs="Samnuha Tights",feet="Herculean Boots"}
		--{ammo="Jukukik Feather",
		--head="Whirlpool Mask",neck="Ej Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
		--body="Luhlaza Jubbah +2",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Patricius Ring",
		--back="Letalis Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Qaaxo Leggings"}

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical,
		{})


	-- Magical Spells --
	
	sets.midcast['Blue Magic'].Magical = {
		head="Amalric Coif",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Gyve Doublet",hands="Amalric Gages",ring1="Shiva Ring",ring2="Acumen Ring",
		back="Cornflower Cape",waist="Yamabuki-no-Obi",legs="Amalric Slops",feet="Amalric Nails"}
		--{ammo="Dosis Tathlum",
		--head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		--body="Hagondes Coat",hands="Mavi Bazubands +2",ring1="Icesoul Ring",ring2="Acumen Ring",
		--back="Cornflower Cape",waist="Caudata Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
		{legs="Rawhide Trousers",feet="Hashishin Basmak +1"})
	
	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalStr = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalAgi = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicAccuracy = 
		{ammo="Mavi Tathlum",
		head="Amalric Coif",neck="Sanctity Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Samnuha Coat",hands="Amalric Gages",ring2="Sangoma Ring",
		back="Cornflower Cape",waist="Yamabuki-no-Obi",legs="Amalric Slops",feet="Amalric Nails"}
		--{ammo="Mavi Tathlum",
		--head="Luhlaza Keffiyeh +2",neck="Ej Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		--body="Vanir Cotehardie",hands=gear.macc_hagondes,ring2="Sangoma Ring",
		--back="Cornflower Cape",legs="Iuitl Tights",feet="Iuitl Gaiters +1"}

	-- Breath Spells --
	
	sets.midcast['Blue Magic'].Breath =
		{ammo="Mavi Tathlum",
		head="Luhlaza Keffiyeh +2",neck="Sanctity Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Gyve Doublet",hands="Assimilator's Bazubands +2",ring1="K'ayres Ring",ring2="Beeline Ring",
		back="Cornflower Cape",legs="Hagondes Pants +1",feet="Hashishin Basmak +1"}
		--{ammo="Mavi Tathlum",
		--head="Luhlaza Keffiyeh +2",neck="Ej Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		--body="Vanir Cotehardie",hands="Assimilator's Bazubands +2",ring1="K'ayres Ring",ring2="Beeline Ring",
		--back="Refraction Cape",legs="Enif Cosciales",feet="Iuitl Gaiters +1"}

	-- Other Types --
	
	sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy,
		{})
		
	sets.midcast['Blue Magic']['White Wind'] = {ammo="Hydrocera",
		head="Carmine Mask",neck="Phalaina Locket",ear1="Mendicant's Earring",ear2="Lifestorm Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Leviathan Ring +1",ring2="Kunaji Ring",
		back="Oretan. Cape +1",waist="Gishdubar Sash",legs="Telchine Braconi",feet="Medium's Sabots"}
		--{
		--head="Whirlpool Mask",neck="Lavalier +1",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		--body="Vanir Cotehardie",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Meridian Ring",
		--back="Fravashi Mantle",waist="Hurch'lan Sash",legs="Enif Cosciales",feet="Hagondes Sabots"}

	sets.midcast['Blue Magic'].Healing = {
		ammo="Quartz Tathlum +1", --MND +4
		--head="Carmine Mask", --TODO: Upgrade to +1
		head=TelchineHead.Cure,
		neck="Phalaina Locket", --MND+3, CurePot+4%, CureRcv+4%
		ear1="Mendicant's Earring", --CurePot+5%, CureSpellcastTime-5%
		ear2="Lifestorm Earring", --MND+4
		body="Vrikodara Jupon", --CurePot+13%, FastCast+5%, MND+29
		hands=TelchineHands.Cure,
		ring1="Leviathan Ring +1", --TODO: Buy on AH ~1M
		ring2="Kunaji Ring", --TODO: Get Kunaji Ring from Yumcax // CureRcv+5%
		back="Oretan. Cape +1", --TODO: Augment a new Rosmerta's Cape for healing // Cure Pot+10%
		waist="Gishdubar Sash", --CureRcv+10%
		legs=TelchineLegs.Cure,
		feet="Medium's Sabots" --CurePot+7%
	}
		--{
		--head="Uk'uxkaj Cap",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		--body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Aquasoul Ring",ring2="Sirona's Ring",
		--back="Pahtli Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.midcast['Blue Magic'].SkillBasedBuff = 
		{ammo="Mavi Tathlum",
		head="Luhlaza Keffiyeh +2",
		body="Assimilator's Jubbah +3",
		back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +2"}

	sets.midcast['Blue Magic'].Buff = {}
	
	sets.midcast.Protect = {ring1="Sheltered Ring"}
	sets.midcast.Protectra = {ring1="Sheltered Ring"}
	sets.midcast.Shell = {ring1="Sheltered Ring"}
	sets.midcast.Shellra = {ring1="Sheltered Ring"}
	
	-- Sets to return to when not performing an action.

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = 
		{ammo="Mavi Tathlum",
		head="Luhlaza Keffiyeh +2",
		body="Assimilator's Jubbah +3",hands="Assimilator's Bazubands +2",
		back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +2"}
		--{ammo="Mavi Tathlum",
		--head="Luhlaza Keffiyeh +2",	
		--body="Assimilator's Jubbah +3",hands="Assimilator's Bazubands +2",
		--back="Cornflower Cape",legs="Mavi Tayt +2",feet="Luhlaza Charuqs +2"}

	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Resting sets
	sets.resting = {
		ammo="Aurgelmir Orb",
		head="Rawhide Mask",
		neck="Sanctity Necklace",
		ear1="Infused Earring",
		ear2="Suppanomimi",
		body="Assimilator's Jubbah +3",
		hands="Adhemar Wristbands",
		ring1="Defending Ring",
		ring2="Paguroidea Ring",
		back=Rosmerta.DEX,
		waist="Flume Belt",
		legs="Samnuha Tights",
		feet="Herculean Boots"
	}
	
	-- Idle sets
	sets.idle = {
		ammo="Aurgelmir Orb",
		head="Hashishin Kavuk +2",
		neck="Sanctity Necklace",
		ear1="Infused Earring",
		ear2="Ethereal Earring",
		body="Assimilator's Jubbah +3",
		hands="Assimilator's Bazubands +2",
		ring1="Paguroidea Ring",
		ring2="Sheltered Ring",
		back=Rosmerta.DEX,
		waist="Fucho-no-Obi",
		legs="Carmine Cuisses",
		feet="Assimilator's Charuqs +2"
	}

	sets.idle.PDT = {
		ammo="Aurgelmir Orb",
		head="Ayanmo Zucchetto +1",
		neck="Twilight Torque",
		ear1="Ethereal Earring",
		ear2="Infused Earring",
		body="Hashishin Mintan +2",
		hands="Adhemar Wristbands",
		ring1="Defending Ring",
		ring2="Patricius Ring",
		back="Shadow Mantle",
		waist="Flume Belt",
		legs="Hashishin Tayt +2",
		feet="Ayanmo Gambieras +1"
	}

    sets.Adoulin = {body="Councilor's Garb",}

    sets.MoveSpeed = {legs = "Carmine Cuisses",}
	
	sets.idle.Town = {
		ammo="Aurgelmir Orb",
		head="Hashishin Kavuk +2",
		neck="Sanctity Necklace",
		ear1="Infused Earring",
		ear2="Ethereal Earring",
		body="Assimilator's Jubbah +3",
		hands="Assimilator's Bazubands +2",
		ring1="Paguroidea Ring",
		ring2="Sheltered Ring",
		back=Rosmerta.DEX,
		waist="Fucho-no-Obi",
		legs="Carmine Cuisses",
		feet="Assimilator's Charuqs +2"
	}
		--{ammo="Ginsen",
		--head="Adhemar Bonnet",neck="Sanctity Necklace",ear1="Infused Earring",ear2="Suppanomimi",
		--body="Luhlaza Jubbah +2",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Lupine Cape",waist="Flume Belt",legs="Carmine Cuisses",feet="Herculean Boots"}

	sets.idle.Learning = set_combine(sets.idle, sets.Learning)

    sets.TreasureHunter = {
		ammo="Perfect Lucky Egg", --TH+1
		waist="Chaac Belt"        --TH+1
	}
   
	-- Defense sets
	sets.defense.PDT = {
		ammo="Iron Gobbet",
		head="Adhemar Bonnet",
		neck="Wiglen Gorget",
		ear1="Bloodgem Earring",
		body="Hashishin Mintan +2",
		hands="Adhemar Wristbands",
		ring1="Defending Ring",
		ring2="Succor Ring",
		back="Mollusca Mantle",
		waist="Flume Belt",
		legs="Samnuha Tights",
		feet="Herculean Boots"
	}
		--{ammo="Iron Gobbet",
		--head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Bloodgem Earring",
		--body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		--back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

	sets.defense.MDT = {
		ammo="Demonry Stone",
		head="Adhemar Bonnet",
		neck="Twilight Torque",
		ear1="Bloodgem Earring",
		body="Hashishin Mintan +2",
		hands="Adhemar Wristbands",
		ring1="Defending Ring",
		ring2="Shadow Ring",
		back="Shadow Mantle",
		waist="Flume Belt",
		legs="Samnuha Tights",
		feet="Herculean Boots"
	}
		--{ammo="Demonry Stone",
		--head="Whirlpool Mask",neck="Twilight Torque",ear1="Bloodgem Earring",
		--body="Hagondes Coat",hands="Iuitl Wristbands",ring1="Defending Ring",ring2="Shadow Ring",
		--back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

	sets.Kiting = {legs="Carmine Cuisses"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {
		ammo="Aurgelmir Orb", --TODO: Upgrade to Aurgelmir Orb +1 $$$$
		head="Adhemar Bonnet", --TODO: Upgrade to Adhemar +1
		neck="Asperity Necklace", --TODO: Upgrade to Mirage Stole +1/+2 $$$$$
		ear1="Dedition Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket", --TODO: Upgrade to Adhemar +1 $$
		hands="Adhemar Wristbands", --TODO: Upgrade to Adhemar +1 $$
		ring1="Petrov Ring", --TODO: Get Chirich(+1) rings $$$
		ring2="Epona's Ring",
		back=Rosmerta.DEX,
		waist="Sailfi Belt +1",
		legs="Samnuha Tights",
		feet="Herculean Boots"
	}

	sets.engaged.Acc = {
		ammo="Honed Tathlum",
		head="Assimilator's Keffiyeh +2",
		neck="Subtlety Spectacles",
		ear1="Steelflash Earring",
		ear2="Bladeborn Earring",
		body="Assimilator's Jubbah +3",
		hands="Assimilator's Bazubands +2",
		ring1="Rajas Ring",
		ring2="Epona's Ring",
		back=Rosmerta.DEX,
		waist="Hurch'lan Sash",
		legs="Assimilator's Shalwar +2",
		feet="Assimilator's Charuqs +2"
	}

	sets.engaged.Refresh = {
		head="Rawhide Mask",
		neck="Sanctity Necklace",
		ear1="Cessance Earring",
		ear2="Suppanomimi",
		body="Hashishin Mintan +2",
		hands="Assimilator's Bazubands +2",
		ring1="Rajas Ring",
		ring2="Epona's Ring",
		back=Rosmerta.DEX,
		waist="Fucho-no-Obi",
		legs="Rawhide Trousers",
		feet="Ayanmo Gambieras +1"
	}

	sets.engaged.DW = sets.engaged --{
	-- 	ammo="Aurgelmir Orb", --TODO: Upgrade to Aurgelmir Orb +1 $$$$
	-- 	head="Adhemar Bonnet", --TODO: Upgrade to Adhemar +1
	-- 	neck="Asperity Necklace", --TODO: Upgrade to Mirage Stole +1/+2 $$$$$
	-- 	ear1="Dedition Earring",
	-- 	ear2="Suppanomimi",
	-- 	body="Adhemar Jacket", --TODO: Upgrade to Adhemar +1 $$
	-- 	hands="Adhemar Wristbands", --TODO: Upgrade to Adhemar +1 $$
	-- 	ring1="Petrov Ring", --TODO: Get Chirich(+1) rings $$$
	-- 	ring2="Epona's Ring",
	-- 	back=Rosmerta.DEX,
	-- 	waist="Sailfi Belt +1",
	-- 	legs="Samnuha Tights",
	-- 	feet="Herculean Boots"
	-- }

	sets.engaged.DW.Acc = {
		ammo="Honed Tathlum",
		head="Assimilator's Keffiyeh +2",
		neck="Subtlety Spectacles",
		ear1="Steelflash Earring",
		ear2="Bladeborn Earring",
		body="Assimilator's Jubbah +3",
		hands="Assimilator's Bazubands +2",
		ring1="Rajas Ring",
		ring2="Epona's Ring",
		back=Rosmerta.DEX,
		waist="Hurch'lan Sash",
		legs="Assimilator's Shalwar +2",
		feet="Assimilator's Charuqs +2"
	}

	sets.engaged.DW.Refresh = {
		head="Rawhide Mask",
		neck="Asperity Necklace",
		ear1="Cessance Earring",
		ear2="Suppanomimi",
		body="Hashishin Mintan +2",
		hands="Assimilator's Bazubands +2",
		ring1="Rajas Ring",
		ring2="Epona's Ring",
		back=Rosmerta.DEX,
		waist="Fucho-no-Obi",
		legs="Rawhide Trousers",
		feet="Ayanmo Gambieras +1"
	}

	sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
	sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)

		-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		ammo="Aurgelmir Orb", --TODO: Upgrade to Crepuscular Pebble (Shinryu HTBF) or Oshasha's Treatise (VR)
		head="Hashishin Kavuk +2", --WSDmg +8%, Acc+51, STR+23, MND+30, Sword skill +25
		neck="Fotia Gorget", --WSDmg +10%, WSAcc +10%, TP not depleted 1%
		ear1="Moonshade Earring", --TP Bonus +250, Acc+4
		ear2="Ishvara Earring", --WSDmg +2%
		body="Assimilator's Jubbah +3", --STR+39, MND+33, Acc+50, WSDmg +10%, Set:Acc
		hands="Assimilator's Bazubands +2", --STR+16, MND+35, Acc+38, Set:Acc
		ring1="Karieyh Ring", --WSDmg +3%, WSAcc +5 TODO: Upgrade to Karieyh Ring +1
		ring2="Mujin Band", --Skillchain Bonus +5 TODO: Upgrade to Epaminondas's Ring $$$
		back=Rosmerta.DEX,
		waist="Fotia Belt", --WSDmg +10%, WSAcc +10%, TP not depleted 1%
		legs="Luhlaza Shalwar +2", --WSDmg +5%, STR+36, MND+22, Acc+35
		-- legs="Samnuha Tights", --STR+38, MND+16, Acc+15, Store TP+7, Augs: STR+10, DEX+10
		feet="Assimilator's Charuqs +2", --STR+17, MND+17, Acc+45, Set:Acc
	}
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ammo="Honed Tathlum", --Acc+15
		head="Sukeroku Hachimaki", --WSAcc +30
		hands="Taeon Gloves", --WSAcc +9
	})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ammo="Crepuscular Pebble",
		head="Nyame Helm",
		neck="Mirage Stole +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Gleti's Cuirass",
		hands="Nyame Gauntlets",
		ring1="Karieyh Ring +1",
		ring2="Epaminondas's Ring",
		back=Rosmerta.STR,
		waist="Sailfi Belt +1",
		legs="Gleti's Breeches",
		feet="Nyame Sollerets"
	})

	-- sets.precast.WS['Chant du Cygne'] = {
	-- 	-- main="Zantetsuken",
	-- 	-- sub="Almace",
	-- 	ammo="Aurgelmir Orb",
	-- 	head="Adhemar Bonnet +1",
	-- 	neck="Mirage Stole +2",
	-- 	ear1="Mache Earring +1",
	-- 	ear2="Odr Earring",
	-- 	body="Gleti's Cuirass",
	-- 	hands="Gleti's Gauntlets",
	-- 	ring1="Epona's Ring",
	-- 	ring2="Begrudging Ring",
	-- 	back="Rosmerta's Cape", --MND cape
	-- 	waist="Fotia Belt",
	-- 	legs="Gleti's Breeches",
	-- 	feet="Gleti's Boots"
	-- }

	-- sets.precast.WS['Expiacion'] = {
	-- 	-- main="Thibron", --Thib in main????
	-- 	-- sub="Tizona",
	-- 	ammo="Crepuscular Pebble",
	-- 	head="Nyame Helm",
	-- 	neck="Mirage Stole +2",
	-- 	ear1="Ishvara Earring",
	-- 	ear2="Moonshade Earring",
	-- 	body="Gleti's Cuirass",
	-- 	hands="Nyame Gauntlets",
	-- 	ring1="Karieyh Ring +1",
	-- 	ring2="Epaminondas's Ring",
	-- 	back="Rosmerta's Cape", --STR cape
	-- 	waist="Sailfi Belt +1",
	-- 	legs="Gleti's Breeches",
	-- 	feet="Nyame Sollerets"
	-- }

	-- sets.precast.WS['Requiescat'] = {
	-- 	ammo="Aurgelmir Orb",
	-- 	head="Luhlaza Keffiyeh +3",
	-- 	neck="Fotia Gorget",
	-- 	ear1="Brutal Earring",
	-- 	ear2="Moonshade Earring",
	-- 	body="Luhlaza Jubbah +3",
	-- 	hands="Luhlaza Bazubands +3",
	-- 	ring1="Epaminondas's Ring",
	-- 	ring2="Epona's Ring",
	-- 	back="Rosmerta's Cape", --MND cape
	-- 	waist="Fotia Belt",
	-- 	legs="Gleti's Breeches",
	-- 	feet="Luhlaza Charuqs +3"
	-- }

	-- sets.precast.WS['Sanguine Blade'] = {
	-- 	ammo="Ghastly Tathlum +1",
	-- 	head="Pixie Hairpin +1",
	-- 	neck="Sibyl Scarf",
	-- 	ear1="Friomisi Earring",
	-- 	ear2="Regal Earring",
	-- 	body="Nyame Mail",
	-- 	hands="Jhakri Cuffs +2",
	-- 	ring1="Epaminondas's Ring",
	-- 	ring2="Archon Ring",
	-- 	back="Rosmerta's Cape", --INT cape
	-- 	waist="Yamabuki-no-Obi",
	-- 	legs="Hagondes Pants +1",
	-- 	feet="Herculean Boots"
	-- }

end

function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 16)
    else
        set_macro_page(1, 16)
    end
end