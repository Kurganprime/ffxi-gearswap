function init_gear_sets()
    --------------------------------------
    -- Augmented gear
    --------------------------------------

--	Rawhide_Hands_Acc = {name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20'}}

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Mavi Basmak +2"}
	sets.buff['Chain Affinity'] = {head="Mavi Kavuk +2",feet="Assim. Charuqs"}
	sets.buff.Convergence = {head="Mirage Keffiyeh"}
	sets.buff.Diffusion = {feet="Mirage Charuqs"}
	sets.buff.Enchainment = {body="Mirage Jubbah"}
	sets.buff.Efflux = {legs="Mavi Tayt +2"}

	
	-- Precast Sets

	-- Precast and midcast set for calling Trusts at iLVL 119
    sets.precast.Trust = {
		head="Ayanmo Zucchetto +1",
		body="Ayanmo Corazza +1",
		hands="Ayanmo Manopolas +1",
		legs="Ayanmo Cosciales +1",
		feet="Ayanmo Gambieras +1"
	}
    sets.midcast.Trust = sets.precast.Trust
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Mirage Bazubands"}


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {ammo="Sonia's Plectrum",
		head="Uk'uxkaj Cap",
		body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Kunaji Ring",
		back="Iximulew Cape",waist="Caudata Belt",legs="Hagondes Pants +1",feet="Iuitl Gaiters"}
		--{ammo="Sonia's Plectrum",
		--head="Uk'uxkaj Cap",
		--body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Spiral Ring",
		--back="Iximulew Cape",waist="Caudata Belt",legs="Hagondes Pants",feet="Iuitl Gaiters +1"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask",ear2="Loquacious Earring",
		body="Mavi Mintan +2",hands="Leyline Gloves",ring1="Prolix Ring",
		back="Swith Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}
		--{ammo="Impatiens",
		--head="Haruspex Hat",ear2="Loquacious Earring",
		--body="Mirage Jubbah",hands="Thaumas Gloves",ring1="Prolix Ring",
		--back="Swith Cape +1",waist="Witful Belt",legs="Enif Cosciales",feet="Chelona Boots +1"}
		
	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Mavi Mintan +2"})

	   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Jukukik Feather",
		head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Taeon Tabard",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Bleating Mantle",waist="Fotia Belt",legs="Ayanmo Cosciales +1",feet="Herculean Boots"}
		--{
		--head="Whirlpool Mask",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
		--body="Qaaxo Harness",hands="Assim. Bazu.",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist=gear.ElementalBelt,legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
	
	sets.precast.WS.acc = set_combine(sets.precast.WS, {head="Sukeroku Hachimaki"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Carmine Mask"})

	sets.precast.WS['Chant du Cygne'] = {ammo="Jukukik Feather",
		head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Cornflower Cape",waist="Fotia Belt",legs="Ayanmo Cosciales +1",feet="Herculean Boots"}

	sets.precast.WS['Sanguine Blade'] = {
		head="Hagondes Hat +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Hagondes Coat +1",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Cornflower Cape",waist="Yamabuki-no-Obi",legs="Hagondes Pants +1",feet="Herculean Boots"}
		--{
		--head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		--body="Hagondes Coat",hands="Mavi Bazubands +2",ring1="Acumen Ring",ring2="Strendu Ring",
		--back="Toro Cape",legs="Hagondes Pants",feet="Iuitl Gaiters +1"}
	
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Carmine Mask",ear2="Loquacious Earring",
		body="Mirage Jubbah",hands="Mavi Bazubands +2",ring1="Prolix Ring",
		back="Swith Cape",waist="Hurch'lan Sash",legs="Ayanmo Cosciales +1",feet="Mirage Charuqs"}
		--{
		--head="Haruspex Hat",ear2="Loquacious Earring",
		--body="Mirage Jubbah",hands="Mavi Bazubands +2",ring1="Prolix Ring",
		--back="Swith Cape +1",waist="Hurch'lan Sash",legs="Enif Cosciales",feet="Iuitl Gaiters +1"}
		
	sets.midcast['Blue Magic'] = {}
	
	-- Physical Spells --
	
	sets.midcast['Blue Magic'].Physical = 
		{ammo="Mavi Tathlum",
		head="Carmine Mask",neck="Ej Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Vanir Cotehardie",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Cornflower Cape",waist="Windbuffet Belt",legs="Ayanmo Cosciales +1",feet="Herculean Boots"}
		--{ammo="Mavi Tathlum",
		--head="Whirlpool Mask",neck="Ej Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
		--body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Spiral Ring",
		--back="Cornflower Cape",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Qaaxo Leggings"}

	sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Jukukik Feather",
		head="Carmine Mask",neck="Ej Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Mirage Jubbah",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Patricius Ring",
		back="Cornflower Cape",waist="Hurch'lan Sash",legs="Ayanmo Cosciales +1",feet="Herculean Boots"}
		--{ammo="Jukukik Feather",
		--head="Whirlpool Mask",neck="Ej Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
		--body="Mirage Jubbah",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Patricius Ring",
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
		{legs="Rawhide Trousers",feet="Mavi Basmak +2"})
	
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
		--head="Mirage Keffiyeh",neck="Ej Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		--body="Vanir Cotehardie",hands=gear.macc_hagondes,ring2="Sangoma Ring",
		--back="Cornflower Cape",legs="Iuitl Tights",feet="Iuitl Gaiters +1"}

	-- Breath Spells --
	
	sets.midcast['Blue Magic'].Breath =
		{ammo="Mavi Tathlum",
		head="Mirage Keffiyeh",neck="Sanctity Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Gyve Doublet",hands="Assim. Bazu.",ring1="K'ayres Ring",ring2="Beeline Ring",
		back="Cornflower Cape",legs="Hagondes Pants +1",feet="Mavi Basmak +2"}
		--{ammo="Mavi Tathlum",
		--head="Mirage Keffiyeh",neck="Ej Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		--body="Vanir Cotehardie",hands="Assim. Bazu.",ring1="K'ayres Ring",ring2="Beeline Ring",
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

	sets.midcast['Blue Magic'].Healing = {ammo="Quartz Tathlum +1",
		head="Carmine Mask",neck="Phalaina Locket",ear1="Mendicant's Earring",ear2="Lifestorm Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Leviathan Ring +1",ring2="Kunaji Ring",
		back="Oretan. Cape +1",waist="Gishdubar Sash",legs="Telchine Braconi",feet="Medium's Sabots"}
		--{
		--head="Uk'uxkaj Cap",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		--body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Aquasoul Ring",ring2="Sirona's Ring",
		--back="Pahtli Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.midcast['Blue Magic'].SkillBasedBuff = 
		{ammo="Mavi Tathlum",
		head="Mirage Keffiyeh",
		body="Assim. Jubbah",
		back="Cornflower Cape",legs="Mavi Tayt +2",feet="Mirage Charuqs"}
		--{ammo="Mavi Tathlum",
		--head="Mirage Keffiyeh",
		--body="Assimilator's Jubbah",
		--back="Cornflower Cape",legs="Mavi Tayt +2",feet="Mirage Charuqs"}

	sets.midcast['Blue Magic'].Buff = {}
	
	sets.midcast.Protect = {ring1="Sheltered Ring"}
	sets.midcast.Protectra = {ring1="Sheltered Ring"}
	sets.midcast.Shell = {ring1="Sheltered Ring"}
	sets.midcast.Shellra = {ring1="Sheltered Ring"}
	

	
	
	-- Sets to return to when not performing an action.

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = 
		{ammo="Mavi Tathlum",
		head="Mirage Keffiyeh",
		body="Assim. Jubbah",hands="Assim. Bazu.",
		back="Cornflower Cape",legs="Mavi Tayt +2",feet="Mirage Charuqs"}
		--{ammo="Mavi Tathlum",
		--head="Mirage Keffiyeh",	
		--body="Assimilator's Jubbah",hands="Assim. Bazu.",
		--back="Cornflower Cape",legs="Mavi Tayt +2",feet="Mirage Charuqs"}


	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Resting sets
	sets.resting = {ammo="Ginsen",
		head="Rawhide Mask",neck="Sanctity Necklace",ear1="Infused Earring",ear2="Suppanomimi",
		body="Mirage Jubbah",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Paguroidea Ring",
		back="Rosmerta's Cape",waist="Flume Belt",legs="Ayanmo Cosciales +1",feet="Herculean Boots"}
	
	-- Idle sets
	sets.idle = {ammo="Ginsen",
		head="Ayanmo Zucchetto +1",neck="Sanctity Necklace",ear1="Infused Earring",ear2="Ethereal Earring",
		body="Ayanmo Corazza +1",hands="Ayanmo Manopolas +1",ring1="Paguroidea Ring",ring2="Sheltered Ring",
		back="Rosmerta's Cape",waist="Fucho-no-Obi",legs="Crimson Cuisses",feet="Ayanmo Gambieras +1"}

	sets.idle.PDT = {ammo="Ginsen",
		head="Lithelimb Cap",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Infused Earring",
		body="Mirage Jubbah",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Patricius Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Ayanmo Cosciales +1",feet="Herculean Boots"}

    sets.Adoulin = {body="Councilor's Garb",}

    sets.MoveSpeed = {legs = "Crimson Cuisses",}
	
	sets.idle.Town = {ammo="Ginsen",
		head="Ayanmo Zucchetto +1",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +1",hands="Ayanmo Manopolas +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Rosmerta's Cape",waist="Windbuffet Belt",legs="Crimson Cuisses",feet="Ayanmo Gambieras +1"}
		--{ammo="Ginsen",
		--head="Adhemar Bonnet",neck="Sanctity Necklace",ear1="Infused Earring",ear2="Suppanomimi",
		--body="Mirage Jubbah",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Lupine Cape",waist="Flume Belt",legs="Carmine Cuisses",feet="Herculean Boots"}

	sets.idle.Learning = set_combine(sets.idle, sets.Learning)

    sets.TreasureHunter = {waist="Chaac Belt"}
   
	-- Defense sets
	sets.defense.PDT = {ammo="Iron Gobbet",
		head="Adhemar Bonnet",neck="Wiglen Gorget",ear1="Bloodgem Earring",
		body="Taeon Tabard",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Succor Ring",
		back="Mollusca Mantle",waist="Flume Belt",legs="Ayanmo Cosciales +1",feet="Herculean Boots"}
		--{ammo="Iron Gobbet",
		--head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Bloodgem Earring",
		--body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		--back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

	sets.defense.MDT = {ammo="Demonry Stone",
		head="Adhemar Bonnet",neck="Twilight Torque",ear1="Bloodgem Earring",
		body="Taeon Tabard",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Ayanmo Cosciales +1",feet="Herculean Boots"}
		--{ammo="Demonry Stone",
		--head="Whirlpool Mask",neck="Twilight Torque",ear1="Bloodgem Earring",
		--body="Hagondes Coat",hands="Iuitl Wristbands",ring1="Defending Ring",ring2="Shadow Ring",
		--back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

	sets.Kiting = {legs="Crimson Cuisses"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {ammo="Ginsen",
		head="Ayanmo Zucchetto +1",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Ayanmo Corazza +1",hands="Ayanmo Manopolas +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Ayanmo Cosciales +1",feet="Ayanmo Gambieras +1"}

	sets.engaged.Acc = {ammo="Ginsen",
		head="Adhemar Bonnet",neck="Subtlety Spectacles",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Rosmerta's Cape",waist="Hurch'lan Sash",legs="Ayanmo Cosciales +1",feet="Herculean Boots"}

	sets.engaged.Refresh = {
		head="Adhemar Bonnet",neck="Sanctity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Mirage Jubbah",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Rosmerta's Cape",waist="Windbuffet Belt",legs="Hagondes Pants +1",feet="Herculean Boots"}

	sets.engaged.DW = {ammo="Ginsen",
		head="Ayanmo Zucchetto +1",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Ayanmo Corazza +1",hands="Ayanmo Manopolas +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Ayanmo Cosciales +1",feet="Ayanmo Gambieras +1"}

	sets.engaged.DW.Acc = {
		head="Adhemar Bonnet",neck="Subtlety Spectacles",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Rosmerta's Cape",waist="Hurch'lan Sash",legs="Ayanmo Cosciales +1",feet="Herculean Boots"}

	sets.engaged.DW.Refresh = {
		head="Assim. Keffiyeh",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Mirage Jubbah",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Rosmerta's Cape",waist="Windbuffet Belt",legs="Hagondes Pants +1",feet="Herculean Boots"}

	sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
	sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)


end

function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 16)
    else
        set_macro_page(1, 16)
    end
end