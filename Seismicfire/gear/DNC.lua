function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
    --------------------------------------
    -- Augmented gear
    --------------------------------------

	Rawhide_Hands_Acc = {name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20'}}
	Rawhide_Feet_Acc  = {name="Rawhide Boots", augments={'HP+50','Accuracy+15','Evasion+20'}}

	-- Precast Sets
	
	-- Precast sets to enhance JAs

	sets.precast.JA['No Foot Rise'] = {} --{body="Horos Casaque"}

	sets.precast.JA['Trance'] = {} --{head="Horos Tiara"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {ammo="Sonia's Plectrum",
		head="Etoile Tiara",
		body="Maxixi Casaque",hands="Buremte Gloves",ring1="Kunaji Ring",
		back="Toetapper Mantle"}
		--{ammo="Sonia's Plectrum",
		--head="Horos Tiara",ear1="Roundel Earring",
		--body="Maxixi Casaque",hands="Buremte Gloves",ring1="Asklepian Ring",
		--back="Toetapper Mantle",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Maxixi Toe Shoes"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.Samba = {head="Maxixi Tiara"} --{head="Maxixi Tiara"}

	sets.precast.Jig = {legs="Etoile Tights", feet="Maxixi Toe Shoes"} --{legs="Horos Tights", feet="Maxixi Toe Shoes"}

	sets.precast.Step = {hands="Maxixi Bangles",waist="Chaac Belt"}
	sets.precast.Step['Feather Step'] = {feet="Maculele Toe Shoes"}

	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Violent Flourish'] = {
		ear1="Psystorm Earring",ear2="Liftstorm Earring",
		body="Etoile Casaque",hands="Buremte Gloves",ring2="Sangoma Ring",
		waist="Chaac Belt",legs="Iuitl Tights",feet="Iuitl Gaiters"}
		--{ear1="Psystorm Earring",ear2="Lifestorm Earring",
		--body="Horos Casaque",hands="Buremte Gloves",ring2="Sangoma Ring",
		--waist="Chaac Belt",legs="Iuitl Tights",feet="Iuitl Gaiters +1"} -- magic accuracy
	sets.precast.Flourish1['Desperate Flourish'] =
		{ammo="Charis Feather",
		head="Whirlpool Mask",neck="Ej Necklace",
		body="Etoile Casaque",hands="Buremte Gloves",ring1="Beeline Ring",
		back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters"}
		--{ammo="Charis Feather",
		--head="Whirlpool Mask",neck="Ej Necklace",
		--body="Horos Casaque",hands="Buremte Gloves",ring1="Beeline Ring",
		--back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"} -- acc gear

	sets.precast.Flourish2 = {}
	sets.precast.Flourish2['Reverse Flourish'] = {hands="Maculele Bangles"}

	sets.precast.Flourish3 = {}
	sets.precast.Flourish3['Striking Flourish'] = {body="Maculele Casaque"}
	sets.precast.Flourish3['Climactic Flourish'] = {head="Maculele Tiara"}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ear2="Loquacious Earring"}
		--{ammo="Impatiens",head="Haruspex Hat",ear2="Loquacious Earring",hands="Thaumas Gloves",ring1="Prolix Ring"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Qirmiz Tathlum",
		head="Whirlpool Mask",neck="Fotia Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Fotia Belt",legs="Herculean Trousers",feet="Iuitl Gaiters"}
		--{ammo="Qirmiz Tathlum",
		--head="Whirlpool Mask",neck=gear.ElementalGorget,ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist=gear.ElementalBelt,legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {legs="Taeon Tights"})
	--sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Honed Tathlum", back="Toetapper Mantle"})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS,
		{}
		--{neck="Houyi's Gorget",
		--hands="Iuitl Wristbands",ring1="Stormsoul Ring",
		--waist="Caudata Belt",legs="Nahtirah Trousers"}
		)
	sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {})
	sets.precast.WS['Exenterator'].Fodder = set_combine(sets.precast.WS['Exenterator'], {})
	--sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {ammo="Honed Tathlum", back="Toetapper Mantle"})
	--sets.precast.WS['Exenterator'].Fodder = set_combine(sets.precast.WS['Exenterator'], {waist=gear.ElementalBelt})

	sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {})
	--sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {hands="Iuitl Wristbands"})
	--sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {hands="Iuitl Wristbands"})

	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Charis Feather",head="Uk'uxkaj Cap",neck="Rancor Collar"})
	sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {})
	--sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Honed Tathlum", back="Toetapper Mantle"})

	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Charis Feather",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {})
	--sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Honed Tathlum", back="Toetapper Mantle"})

	sets.precast.WS['Aeolian Edge'] = {ammo="Charis Feather",
		head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Acumen Ring",ring2="Demon's Ring",
		back="Toro Cape",waist="Chaac Belt",legs="Shneddick Tights +1",feet="Wayfarer Clogs"}
	
	sets.precast.Skillchain = {hands="Maculele Bangles"}
	
	
	-- Midcast Sets
	
	sets.midcast.FastRecast = {
		ear2="Loquacious Earring",
		legs="Kaabnax Trousers",feet="Iuitl Gaiters"}
		--{
		--head="Felistris Mask",ear2="Loquacious Earring",
		--body="Iuitl Vest",hands="Iuitl Wristbands",
		--legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}
		
	-- Specific spells
	sets.midcast.Utsusemi = {
		ear2="Loquacious Earring",
		legs="Kaabnax Trousers",feet="Iuitl Gaiters"}
		--{
		--head="Felistris Mask",neck="Ej Necklace",ear2="Loquacious Earring",
		--body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Beeline Ring",
		--back="Toetapper Mantle",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
		--{head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		--ring1="Sheltered Ring",ring2="Paguroidea Ring"}
	sets.ExtraRegen = {} --{head="Ocelomeh Headpiece +1"}
	

	-- Idle sets

	sets.idle = {
		head="Mummu Bonnet +1",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Mummu Jacket +1",hands="Mummu Wrists +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Flume Belt",legs="Mummu Kecks +1",feet="Mummu Gamashes +1"}
		--{
		--head="Adhemar Bonnet",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Shadow Mantle",waist="Flume Belt",legs="Herculean Trousers",feet="Skadi's Jambeaux +1"}

	sets.idle.Town = {main="Homestead Dagger",sub="Eminent Dagger",ammo="Charis Feather",
		head="Mummu Bonnet +1",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Mummu Jacket +1",hands="Mummu Wrists +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Mummu Kecks +1",feet="Mummu Gamashes +1"}
		--{main="Taming Sari",sub="Atoyac",ammo="Charis Feather",
		--head="Adhemar Bonnet",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Herculean Trousers",feet="Skadi's Jambeaux +1"}
	
	sets.idle.Weak = {
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Kaabnax Trousers",feet="Tandava Crackows"}
		--{ammo="Iron Gobbet",
		--head="Felistris Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Buremte Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		--back="Shadow Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Skadi's Jambeaux +1"}
	
	sets.Adoulin = {body="Councilor's Garb",}
    sets.Movement = {feet = "Tandava Crackows",}

	-- Defense sets

	sets.defense.Evasion = {
		head="Ejekamal Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Toetapper Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{
		--head="Felistris Mask",neck="Ej Necklace",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2=gear.DarkRing.physical,
		--back="Toetapper Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

	sets.defense.PDT = {
		head="Ejekamal Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Patricius Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Iron Gobbet",
		--head="Felistris Mask",neck="Twilight Torque",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		--back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

	sets.defense.MDT = {
		head="Ejekamal Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Shadow Ring",
		back="Atheling Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Demonry Stone",
		--head="Wayfarer Circlet",neck="Twilight Torque",
		--body="Qaaxo Harness",hands="Wayfarer Cuffs",ring1="Defending Ring",ring2="Shadow Ring",
		--back="Engulfer Cape",waist="Flume Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}

	sets.Kiting = {feet="Tandava Crackows"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {ammo="Charis Feather",
		head="Mummu Bonnet +1",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Mummu Jacket +1",hands="Mummu Wrists +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Mummu Kecks +1",feet="Mummu Gamashes +1"}
		--{ammo="Charis Feather",
		--head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		--body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}

	sets.engaged.Fodder = {ammo="Charis Feather",
		head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Samnuha Tights",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		--body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}

	sets.engaged.Fodder.Evasion = {ammo="Charis Feather",
		head="Ejekamal Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist="Patentia Sash",legs=gear.AugQuiahuiz,feet="Horos Toe Shoes"}

	sets.engaged.Acc = {ammo="Honed Tathlum",
		head="Whirlpool Mask",neck="Ej Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Toetapper Mantle",waist="Hurch'lan Belt",legs="Herculean Trousers",feet="Herculean Boots"}
		--{ammo="Honed Tathlum",
		--head="Whirlpool Mask",neck="Ej Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		--body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Hurch'lan Belt",legs="Herculean Trousers",feet="Herculean Boots"}

	sets.engaged.Evasion = {ammo="Charis Feather",
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

	sets.engaged.PDT = {ammo="Charis Feather",
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
		--back="Shadow Mantle",waist="Patentia Sash",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}

	sets.engaged.Acc.Evasion = {
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Honed Tathlum",
		--head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

	sets.engaged.Acc.PDT = {
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Honed Tathlum",
		--head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

	-- Custom melee group: High Haste (2x March or Haste)
	sets.engaged.HighHaste = {ammo="Charis Feather",
		head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Samnuha Tights",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Manibozho Boots"}

	sets.engaged.Fodder.HighHaste = {ammo="Charis Feather",
		head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Samnuha Tights",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Maculele Casaque",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist="Patentia Sash",legs=gear.AugQuiahuiz,feet="Horos Toe Shoes"}

	sets.engaged.Fodder.Evasion.HighHaste = {ammo="Charis Feather",
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

	sets.engaged.Acc.HighHaste = {ammo="Honed Tathlum",
		head="Whirlpool Mask",neck="Ej Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Toetapper Mantle",waist="Hurch'lan Belt",legs="Taeon Tights",feet="Herculean Boots"}
		--{ammo="Honed Tathlum",
		--head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

	sets.engaged.Evasion.HighHaste = {ammo="Charis Feather",
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

	sets.engaged.Acc.Evasion.HighHaste = {
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Honed Tathlum",
		--head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

	sets.engaged.PDT.HighHaste = {ammo="Charis Feather",
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
		--back="Shadow Mantle",waist="Patentia Sash",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}

	sets.engaged.Acc.PDT.HighHaste = {
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Honed Tathlum",
		--head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}


	-- Custom melee group: Max Haste (2x March + Haste)
	sets.engaged.MaxHaste = {ammo="Charis Feather",
		head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Samnuha Tights",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist="Windbuffet Belt",legs=gear.AugQuiahuiz,feet="Manibozho Boots"}

	-- Getting Marches+Haste from Trust NPCs, doesn't cap delay.
	sets.engaged.Fodder.MaxHaste = {ammo="Charis Feather",
		head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Samnuha Tights",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Thaumas Coat",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist="Patentia Sash",legs=gear.AugQuiahuiz,feet="Horos Toe Shoes"}

	sets.engaged.Fodder.Evasion.MaxHaste = {ammo="Charis Feather",
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Manibozho Boots"}

	sets.engaged.Acc.MaxHaste = {ammo="Honed Tathlum",
		head="Whirlpool Mask",neck="Ej Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Toetapper Mantle",waist="Hurch'lan Belt",legs="Taeon Tights",feet="Herculean Boots"}
		--{ammo="Honed Tathlum",
		--head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

	sets.engaged.Evasion.MaxHaste = {ammo="Charis Feather",
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Windbuffet Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

	sets.engaged.Acc.Evasion.MaxHaste = {
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Honed Tathlum",
		--head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Kaabnax Trousers",feet="Qaaxo Leggings"}

	sets.engaged.PDT.MaxHaste = {ammo="Charis Feather",
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Charis Feather",
		--head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
		--back="Shadow Mantle",waist="Windbuffet Belt",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}
		
	sets.engaged.Acc.PDT.MaxHaste = {
		head="Ejekamal Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}
		--{ammo="Honed Tathlum",
		--head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
		--back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}



	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Saber Dance'] = {} --{legs="Horos Tights"}
	sets.buff['Climactic Flourish'] = {head="Maculele Tiara"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 19)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 19)
    else
        set_macro_page(10, 19)
    end
end
