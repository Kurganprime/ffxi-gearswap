function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {ammo="Incantor Stone"}
		--{main=gear.FastcastStaff,ammo="Incantor Stone",
		--head="Nahtirah Hat",neck="Orison Locket",ear2="Loquacious Earring",
		--body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
		--back="Swith Cape +1",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Orison Pantaloons +2"})

	sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

	sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {})

	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	-- Precast sets to enhance JAs
	sets.precast.JA.Benediction = {}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		--{
		--head="Nahtirah Hat",ear1="Roundel Earring",
		--body="Vanir Cotehardie",hands="Yaoyotl Gloves",
		--back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
	
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	gear.default.weaponskill_neck = ""
	gear.default.weaponskill_waist = ""
	sets.precast.WS = {}
		--{
		--head="Nahtirah Hat",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
		--body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
		--back="Refraction Cape",waist=gear.ElementalBelt,legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
	
	sets.precast.WS['Flash Nova'] = {}
		--{
		--head="Nahtirah Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
		--body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Strendu Ring",
		--back="Toro Cape",waist="Thunder Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
	

	-- Midcast Sets
	
	sets.midcast.FastRecast = {}
		--{
		--head="Nahtirah Hat",ear2="Loquacious Earring",
		--body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Prolix Ring",
		--back="Swith Cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
	
	-- Cure sets
	gear.default.obi_waist = ""
	gear.default.obi_back = ""

	sets.midcast.CureSolace = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}
		--{main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
		--head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
		--body="Orison Bliaud +2",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
		--back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

	sets.midcast.Cure = {main="Apollo's Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}
		--{main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
		--head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
		--body="Vanir Cotehardie",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
		--back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

	sets.midcast.Curaga = {main="Apollo's Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}

	sets.midcast.CureMelee = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}

	sets.midcast.Cursna = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}

	sets.midcast.StatusRemoval = {
		head="Orison Cap +2",legs="Orison Pantaloons +2"}

	-- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {feet="Orison Duckbills +2"}
		--{main="Beneficus",sub="Genbu's Shield",
		--head="Umuthi Hat",neck="Colossus's Torque",
		--body="Manasa Chasuble",hands="Dynasty Mitts",
		--back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}

	sets.midcast.Stoneskin = {}
		--{
		--head="Nahtirah Hat",neck="Orison Locket",ear2="Loquacious Earring",
		--body="Vanir Cotehardie",hands="Dynasty Mitts",
		--back="Swith Cape +1",waist="Siegel Sash",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

	sets.midcast.Auspice = {feet="Orison Duckbills +2"}

	sets.midcast.BarElement = {head="Orison's Cap +2",hands="Orison Mitts +2",feet="Orison Duckbills +2"}
		--{main="Beneficus",sub="Genbu's Shield",
		--head="Orison Cap +2",neck="Colossus's Torque",
		--body="Orison Bliaud +2",hands="Orison Mitts +2",
		--back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}

	sets.midcast.Regen = {hands="Orison Mitts +2"}
		--{main="Bolelabunga",sub="Genbu's Shield",
		--body="Piety Briault",hands="Orison Mitts +2",
		--legs="Theophany Pantaloons"}

	sets.midcast.Protectra = {}
		--{ring1="Sheltered Ring",feet="Piety Duckbills +1"}

	sets.midcast.Shellra = {}
		--{ring1="Sheltered Ring",legs="Piety Pantaloons"}


	sets.midcast['Divine Magic'] = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}
		--{main="Bolelabunga",sub="Genbu's Shield",
		--head="Nahtirah Hat",neck="Colossus's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		--body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring2="Sangoma Ring",
		--back="Refraction Cape",waist=gear.ElementalObi,legs="Theophany Pantaloons",feet="Gendewitha Galoshes"}

	sets.midcast['Dark Magic'] = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}
		--{main="Bolelabunga", sub="Genbu's Shield",
		--head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		--body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
		--back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

	-- Custom spell classes
	sets.midcast.MndEnfeebles = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}
		--{main="Lehbrailg +2", sub="Mephitis Grip",
		--head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		--body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Aquasoul Ring",ring2="Sangoma Ring",
		--back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

	sets.midcast.IntEnfeebles = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}
		--{main="Lehbrailg +2", sub="Mephitis Grip",
		--head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		--body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Sangoma Ring",
		--back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Pluto's Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}
	

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}

	sets.idle.PDT = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}

	sets.idle.Town = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}
	
	sets.idle.Weak = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}
	
	-- Defense sets

	sets.defense.PDT = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}

	sets.defense.MDT = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}

	sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Basic set for if no TP weapon is defined.
	sets.engaged = {main="Eminent Staff",sub="Bugard Strap +1",ammo="Incantor Stone",
		head="Wayfarer Circlet",neck="Chrys. Torque",ear1="Antivenom Earring",ear2="Insomnia Earring",
		body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Sirona's Ring",ring2="Ether Ring",
		back="Aurora Mantle",waist="Hierarch Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}


	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Divine Caress'] = {hands="Orison Mitts +2"}
end