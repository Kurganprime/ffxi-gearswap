function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Hachiya Kyahan +1"
    
    select_default_macro_book()
end

function init_gear_sets()
    --------------------------------------
    -- Augmented gear
    --------------------------------------
--	Example:
--	Rawhide_Boots_B  = {name="Rawhide Boots", augments={'HP+50','Accuracy+15','Evasion+20'}}

    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = {ring1="Gorney Ring",waist="Chaac Belt"}
    sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
    sets.Kiting = {feet=gear.MovementFeet}

    sets.buff['Sneak Attack'] = {}

    sets.buff['Trick Attack'] = {}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Custom buff duration sets
    --------------------------------------

    sets.buff.Migawari = {body="Iga Ningi +2"}
    sets.buff.Doom = {ring2="Saida Ring"}
    sets.buff.Yonin = {}
    sets.buff.Innin = {}

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast and midcast set for calling Trusts at iLVL 119
    sets.precast.Trust = {
		head="Hizamaru Somen +1",
		body="Hizamaru Haramaki +2",
		hands="Hizamaru Kote +1",
		legs="Hizamaru Hizayoroi +1",
		feet="Hizamaru Sune-Ate +2"
	}
    sets.midcast.Trust = sets.precast.Trust

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama"}
    sets.precast.JA['Futae'] = {hands="Iga Tekko +2"}
    sets.precast.JA['Sange'] = {body="Mochizuki Chainmail"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Mochizuki Hatsuburi",
        body="Hachiya Chainmail +1",hands="Buremte Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Chaac Belt",legs="Hachiya Hakama +1",feet="Mochizuki Kyahan"}
		--{ammo="Sonia's Plectrum",
        --head="Felistris Mask",
        --body="Hachiya Chainmail +1",hands="Buremte Gloves",ring1="Spiral Ring",
        --back="Iximulew Cape",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}
        -- Uk'uxkaj Cap, Daihanshi Habaki
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Choreia Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Patricius Ring",
        back="Yokaze Mantle",waist="Chaac Belt",legs="Taeon Tights",feet="Herculean Boots"}
		--{
        --head="Whirlpool Mask",neck="Ej Necklace",
        --body="Otronif Harness +1",hands="Buremte Gloves",ring1="Patricius Ring",
        --back="Yokaze Mantle",waist="Chaac Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}

    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",ear2="Loquacious Earring",body="Taeon Tabard",hands="Leyline Gloves",ring1="Prolix Ring",legs="Rawhide Trousers"}
		--{ammo="Impatiens",ear2="Loquacious Earring",hands="Thaumas Gloves",ring1="Prolix Ring"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, 
		{neck="Magoraga Beads",body="Mochizuki Chainmail",back="Andartia's Mantle"})
	sets.precast.FC.ElementalNinjutsu = set_combine(sets.precast.FC, {feet="Mochizuki Kyahan"})

    -- Snapshot for ranged
    sets.precast.RA = {hands="Manibozho Gloves",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}
		--{hands="Manibozho Gloves",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Whirlpool Mask",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Steelflash Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Andartia's Mantle",waist="Fotia Belt",legs="Taeon Tights",feet="Herculean Boots"}
		-- head="Whirlpool Mask",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Steelflash Earring",
        -- body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        -- back="Andartia's Mantle",waist="Fotia Belt",legs="Herculean Trousers",feet="Herculean Boots"}

    sets.precast.WS.Acc = set_combine(sets.precast.WS, 
		{head="Sukeroku Hachimaki",neck="Fotia Gorget",ear1="Assuage Earring",ear2="Cessance Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Enlivened Ring",ring2="Patricius Ring",
		back="Yokaze Mantle",waist="Fotia Belt",legs="Taeon Tights",feet="Herculean Boots"})
		--{ammo="Jukukik Feather",hands="Buremte Gloves",back="Yokaze Mantle"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS,
        {neck="Rancor Collar",ear1="Brutal Earring",ear2="Moonshade Earring",feet="Daihanshi Habaki"})
		--{neck="Rancor Collar",ear1="Brutal Earring",ear2="Moonshade Earring",feet="Daihanshi Habaki"})

	-- Blade: Hi is AGI 80% modifier, so stack on the AGI, but maintain accuracy.	
    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS,
        {head="Adhemar Bonnet",ear2="Moonshade Earring",hands="Hachiya Tekko +1",feet="Hattori Kyahan"})
		--{head="Felistris Mask",hands="Hachiya Tekko +1",ring1="Stormsoul Ring",legs="Nahtirah Trousers"})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, 
		{feet="Daihanshi Habaki"})

	-- Blade: Metsu is DEX 80% modifier, so stack on the DEX, but maintain accuracy.	
    sets.precast.WS['Blade: Metsu'] = set_combine(sets.precast.WS, 
		{head="Adhemar Bonnet",ear1="Moonshade Earring",back="Andartia's Mantle",feet="Daihanshi Habaki"})

	sets.precast.WS['Aeolian Edge'] = {
    head="Wayfarer Circlet",neck="Fotia Gorget",ear1="Friomisi Earring",ear2="Moonshade Earring",
    body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Acumen Ring",ring2="Demon's Ring",
    back="Toro Cape",waist="Fotia Belt",legs="Shneddick Tights +1",feet="Daihanshi Habaki"}
	--{
    --head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
    --body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Acumen Ring",ring2="Demon's Ring",
    --back="Toro Cape",waist="Thunder Belt",legs="Shneddick Tights +1",feet="Daihanshi Habaki"}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Iga Zukin +2",ear2="Loquacious Earring",
        body="Hachiya Chainmail +1",hands="Mochizuki Tekko +1",ring1="Prolix Ring",
        waist="Hurch'lan Sash",legs="Iga Hakama +2",feet="Daihanshi Habaki"}
		--{
        --head="Felistris Mask",ear2="Loquacious Earring",
        --body="Hachiya Chainmail +1",hands="Mochizuki Tekko +1",ring1="Prolix Ring",
        --legs="Hachiya Hakama +1",feet="Qaaxo Leggings"}
        
    sets.midcast.Utsusemi = set_combine(sets.midcast.SelfNinjutsu, 
		{feet="Hattori Kyahan",back="Andartia's Mantle"})

    sets.midcast.ElementalNinjutsu = {
        head="Ryuo Somen",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hachiya Chainmail +1",hands="Leyline Gloves",ring1="Etana Ring",ring2="Sangoma Ring",
        back="Yokaze Mantle",waist="Eschan Stone",legs="Rawhide Trousers",feet="Hachiya Kyahan +1"}
		--{
        --head="Hachiya Hatsuburi",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        --body="Hachiya Chainmail +1",hands="Iga Tekko +2",ring1="Icesoul Ring",ring2="Acumen Ring",
        --back="Toro Cape",waist=gear.ElementalObi,legs="Nahtirah Trousers",feet="Hachiya Kyahan +1"}

    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.Ninjutsu, 
		{ear1="Lifestorm Earring",ear2="Psystorm Earring",back="Yokaze Mantle"})
		--{ear1="Lifestorm Earring",ear2="Psystorm Earring",back="Yokaze Mantle"})

    sets.midcast.NinjutsuDebuff = {
        head="Hachiya Hatsuburi",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        hands="Leyline Gloves",ring2="Sangoma Ring",
        back="Yokaze Mantle",feet="Hachiya Kyahan +1"}
		--{
        --head="Hachiya Hatsuburi",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        --hands="Mochizuki Tekko +1",ring2="Sangoma Ring",
        --back="Yokaze Mantle",feet="Hachiya Kyahan +1"}

    sets.midcast.NinjutsuBuff = {head="Mochizuki Hatsuburi",neck="Ej Necklace",back="Yokaze Mantle"}
		--{head="Hachiya Hatsuburi",neck="Ej Necklace",back="Yokaze Mantle"}

    sets.midcast.RA = {
        head="Felistris Mask",neck="Ej Necklace",
        body="Hachiya Chainmail +1",hands="Hachiya Tekko +1",ring1="Beeline Ring",
        back="Yokaze Mantle",legs="Nahtirah Trousers",feet="Qaaxo Leggings"}
		--{
        --head="Felistris Mask",neck="Ej Necklace",
        --body="Hachiya Chainmail +1",hands="Hachiya Tekko +1",ring1="Beeline Ring",
        --back="Yokaze Mantle",legs="Nahtirah Trousers",feet="Qaaxo Leggings"}
    -- Hachiya Hakama/Thurandaut Tights +1

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {
		head="Ocelomeh Headpiece +1",neck="Sanctity Necklace",ear1="Infused Earring",
        back="Shadow Mantle",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    
    -- Idle sets
    sets.idle = {ammo="Hachiya Shuriken",
        head="Hizamaru Somen +1",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hizamaru Haramaki +2",hands="Hizamaru Kote +1",ring1="Rajas Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Anguinus Belt",legs="Hizamaru Hizayoroi +1",feet="Hizamaru Sune-Ate +2"}
		--{
        --head="Whirlpool Mask",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Shadow Mantle",waist="Flume Belt",legs="Hachiya Hakama +1",feet=gear.MovementFeet}
		
	sets.idle.Town = {main="Izuna",sub="Senkutanto",ammo="Hachiya Shuriken",
        head="Hizamaru Somen +1",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hizamaru Haramaki +2",hands="Hizamaru Kote +1",ring1="Rajas Ring",ring2="Paguroidea Ring",
        back="Andartia's Mantle",waist="Anguinus Belt",legs="Hizamaru Hizayoroi +1",feet="Hizamaru Sune-Ate +2"}
		--{main="Raimitsukane",sub="Kaitsuburi",ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Atheling Mantle",waist="Patentia Sash",legs="Hachiya Hakama +1",feet=gear.MovementFeet}
    
    sets.idle.Weak = {
        head="Hizamaru Somen +1",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hizamaru Haramaki +2",hands="Hizamaru Kote +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Hizamaru Hizayoroi +1",feet="Hizamaru Sune-Ate +2"}
		--{
        --head="Whirlpool Mask",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Shadow Mantle",waist="Flume Belt",legs="Hachiya Hakama +1",feet=gear.MovementFeet}
    
    sets.Adoulin = {body="Councilor's Garb",}

    sets.DayMovement = {feet = gear.DayFeet,}
    sets.NightMovement = {feet = gear.NightFeet,}
	
    -- Defense sets
    sets.defense.Evasion = {
        head="Mochizuki Hatsuburi",neck="Ej Necklace",ear1="Infused Earring",ear2="Phawaylla Earring",
        body="Taeon Tabard",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Flume Belt",legs="Mochizuki Hakama",feet="Hizamaru Sune-Ate +2"}
		--{
        --head="Felistris Mask",neck="Ej Necklace",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Beeline Ring",
        --back="Yokaze Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Hachiya Hatsuburi",neck="Twilight Torque",
        body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Mochizuki Hakama",feet="Hizamaru Sune-Ate +2"}
		--{ammo="Iron Gobbet",
        --head="Whirlpool Mask",neck="Twilight Torque",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        --back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

    sets.defense.MDT = {
        head="Mochizuki Hatsuburi",neck="Twilight Torque",
        body="Taeon Tabard",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Yokaze Mantle",waist="Flume Belt",legs="Mochizuki Hakama",feet="Hizamaru Sune-Ate +2"}
		--{ammo="Demonry Stone",
        --head="Whirlpool Mask",neck="Twilight Torque",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        --back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

    sets.Kiting = {feet=gear.MovementFeet}

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Hachiya Shuriken",
        head="Hizamaru Somen +1",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hizamaru Haramaki +2",hands="Hizamaru Kote +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Andartia's Mantle",waist="Windbuffet Belt",legs="Hizamaru Hizayoroi +1",feet="Hizamaru Sune-Ate +2"}
		--{ammo="Qirmiz Tathlum",
        --head="Iga Zukin +2",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Atheling Mantle",waist="Patentia Sash",legs="Mochizuki Hakama",feet="Otronif Boots +1"}
    sets.engaged.Acc = set_combine(sets.engaged,
		{head="Whirlpool Mask",neck="Ej Necklace",
        ring1="Hizamaru Ring",ring2="Mummu Ring",
        back="Andartia's Mantle",waist="Anguinus Belt"})
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Mochizuki Chainmail +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Manibozho Boots"}

	sets.engaged.Evasion = set_combine(sets.engaged,
		{head="Felistris Mask",hands="Otronif Gloves",ring1="Beeline Ring",feet="Otronif Boots +1"})
		--{ammo="Qirmiz Tathlum",
        --head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}
    sets.engaged.Acc.Evasion = set_combine(sets.engaged.Acc,
		{head="Felistris Mask",hands="Otronif Gloves",ring1="Beeline Ring",feet="Otronif Boots +1"})
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}
    sets.engaged.PDT = set_combine(sets.engaged,
		{neck="Twilight Torque",ring1="Defending Ring",ring2="Patricius Ring",back="Shadow Mantle"})
		--{ammo="Qirmiz Tathlum",
        --head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT = {ammo="Togakushi Shuriken",
        head="Mochizuki Hatsuburi",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Mochizuki Chainmail",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}

    -- Custom melee group: High Haste (~20% DW)
    sets.engaged.HighHaste = {ammo="Togakushi Shuriken",
        head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Patentia Sash",legs="Samnuha Tights",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Atheling Mantle",waist="Patentia Sash",legs="Hachiya Hakama +1",feet="Manibozho Boots"}
    sets.engaged.Acc.HighHaste = {ammo="Togakushi Shuriken",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Taeon Tights",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Mochizuki Chainmail +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Manibozho Boots"}
    sets.engaged.Evasion.HighHaste = {ammo="Togakushi Shuriken",
        head="Mochizuki Hatsuburi",neck="Ej Necklace",ear1="Infused Earring",ear2="Phawaylla Earring",
        body="Hachiya Chainmail +1",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Patentia Sash",legs="Mochizuki Hakama",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}
    sets.engaged.Acc.Evasion.HighHaste = {ammo="Togakushi Shuriken",
        head="Ryuo Somen",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Taeon Tabard",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}
    sets.engaged.PDT.HighHaste = {ammo="Togakushi Shuriken",
        head="Hachiya Hatsuburi",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hachiya Chainmail +1",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama +1",feet="Mochizuki Kyahan"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT.HighHaste = {ammo="Togakushi Shuriken",
        head="Mochizuki Hatsuburi",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Mochizuki Chainmail",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}

    -- Custom melee group: Embrava Haste (7% DW)
    sets.engaged.EmbravaHaste = {ammo="Togakushi Shuriken",
        head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Patentia Sash",legs="Samnuha Tights",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Taeon Tabard",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Atheling Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Acc.EmbravaHaste = {ammo="Togakushi Shuriken",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Taeon Tights",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Mochizuki Chainmail +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Evasion.EmbravaHaste = {ammo="Togakushi Shuriken",
        head="Mochizuki Hatsuburi",neck="Ej Necklace",ear1="Infused Earring",ear2="Phawaylla Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama +1",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}
    sets.engaged.Acc.Evasion.EmbravaHaste = {ammo="Togakushi Shuriken",
        head="Ryuo Somen",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}
    sets.engaged.PDT.EmbravaHaste = {ammo="Togakushi Shuriken",
        head="Hachiya Hatsuburi",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hachiya Chainmail +1",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama +1",feet="Mochizuki Kyahan"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT.EmbravaHaste = {ammo="Togakushi Shuriken",
        head="Mochizuki Hatsuburi",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Mochizuki Chainmail",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Otronif Boots +1"}

    -- Custom melee group: Max Haste (0% DW)
    sets.engaged.MaxHaste = {ammo="Togakushi Shuriken",
        head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Patentia Sash",legs="Samnuha Tights",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Taeon Tabard",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Atheling Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Acc.MaxHaste = {ammo="Togakushi Shuriken",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Taeon Tights",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Evasion.MaxHaste = {ammo="Togakushi Shuriken",
        head="Mochizuki Hatsuburi",neck="Ej Necklace",ear1="Infused Earring",ear2="Phawaylla Earring",
        body="Taeon Tabard",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama +1",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}
    sets.engaged.Acc.Evasion.MaxHaste = {ammo="Togakushi Shuriken",
        head="Ryuo Somen",neck="Ej Necklace",ear1="Steelflash Earring",ear2="Heartseeker Earring",
        body="Taeon Tabard",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Otronif Boots +1"}
    sets.engaged.PDT.MaxHaste = {ammo="Togakushi Shuriken",
        head="Hachiya Hatsuburi",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hachiya Chainmail +1",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama +1",feet="Mochizuki Kyahan"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT.MaxHaste = {ammo="Togakushi Shuriken",
        head="Mochizuki Hatsuburi",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hachiya Chainmail +1",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama +1",feet="Herculean Boots"}
		--{ammo="Qirmiz Tathlum",
        --head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        --back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Otronif Boots +1"}


end

function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 13)
    elseif player.sub_job == 'THF' then
        set_macro_page(3, 13)
    else
        set_macro_page(1, 13)
    end
end