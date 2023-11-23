function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main=gear.FastcastStaff,ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Orison Locket",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Orison Pantaloons +2"})

	sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

	sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	-- Precast sets to enhance JAs
	sets.precast.JA.Benediction = {body="Piety Briault"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Nahtirah Hat",ear1="Roundel Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",
		back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
	
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	gear.default.weaponskill_neck = "Asperity Necklace"
	gear.default.weaponskill_waist = ""
	sets.precast.WS = {
		head="Nahtirah Hat",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Refraction Cape",waist=gear.ElementalBelt,legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
	
	sets.precast.WS['Flash Nova'] = {
		head="Nahtirah Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Strendu Ring",
		back="Toro Cape",waist="Thunder Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
	

	-- Midcast Sets
	
	sets.midcast.FastRecast = {
		head="Nahtirah Hat",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Prolix Ring",
		back="Swith Cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
	
	-- Cure sets
	gear.default.obi_waist = "Goading Belt"
	gear.default.obi_back = "Mending Cape"

	sets.midcast.CureSolace = {main="Apollo's Staff",sub="Achaq Grip",
		head="Orison Cap +2",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
		body="Orison Bliaud +2",hands="Theophany Mitts",ring1="Karka Ring",ring2="Bifrost Ring",
		back="Orison Cape",waist="Penitent's Robe",legs="Orison Pantaloons +2",feet="Orison Duckbills +2"}
		--{main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
		--head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
		--body="Orison Bliaud +1",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
		--back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

	sets.midcast.Cure = {main="Apollo's Staff",sub="Achaq Grip",
		head="Orison Cap +2",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
		body="Orison Bliaud +2",hands="Theophany Mitts",ring1="Karka Ring",ring2="Bifrost Ring",
		back="Orison Cape",waist="Penitent's Robe",legs="Orison Pantaloons +2",feet="Orison Duckbills +2"}
		--{main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
		--head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
		--body="Vanir Cotehardie",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
		--back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

	sets.midcast.Curaga = {main="Apollo's Staff",sub="Achaq Grip",
		head="Orison Cap +2",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
		body="Orison Bliaud +2",hands="Theophany Mitts",ring1="Karka Ring",ring2="Bifrost Ring",
		back="Orison Cape",waist="Penitent's Robe",legs="Orison Pantaloons +2",feet="Orison Duckbills +2"}
		--{main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
		--head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
		--body="Vanir Cotehardie",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
		--back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

	sets.midcast.CureMelee = {
		head="Orison Cap +2",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
		body="Orison Bliaud +2",hands="Theophany Mitts",ring1="Karka Ring",ring2="Bifrost Ring",
		back="Tuilha Cape",waist="Penitent's Robe",legs="Orison Pantaloons +2",feet="Orison Duckbills +2"}
		--{ammo="Incantor Stone",
		--head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
		--body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Prolix Ring",ring2="Sirona's Ring",
		--back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

	sets.midcast.Cursna = {main="Apollo's Staff",sub="Achaq Grip",
		head="Orison Cap +2",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
		body="Orison Bliaud +1",hands="Theophany Mitts",ring1="Karka Ring",ring2="Bifrost Ring",
		back="Tuilha Cape",waist="Penitent's Robe",legs="Orison Pantaloons +2",feet="Gendewitha Galoshes"}
		--{main="Beneficus",sub="Genbu's Shield",
		--head="Orison Cap +2",neck="Malison Medallion",
		--body="Orison Bliaud +1",hands="Hieros Mittens",ring1="Ephedra Ring",ring2="Sirona's Ring",
		--back="Mending Cape",waist="Goading Belt",legs="Theophany Pantaloons",feet="Gendewitha Galoshes"}

	sets.midcast.StatusRemoval = {
		head="Orison Cap +2",legs="Orison Pantaloons +2"}

	-- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {
		neck="Enhancing Torque",
		legs="Portent Pants",feet="Orsn. Duckbills +1"}

	sets.midcast.Stoneskin = {
		head="Nahtirah Hat",neck="Orison Locket",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Dynasty Mitts",
		back="Swith Cape +1",waist="Siegel Sash",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

	sets.midcast.Auspice = {hands="Dynasty Mitts",feet="Orison Duckbills +2"}

	sets.midcast.BarElement = {main="Beneficus",sub="Genbu's Shield",
		head="Orison Cap +2",neck="Colossus's Torque",
		body="Orison Bliaud +1",hands="Orison Mitts +2",
		back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}

	sets.midcast.Regen = {main="Bolelabunga",sub="Genbu's Shield",
		body="Piety Briault",hands="Orison Mitts +2",
		legs="Theophany Pantaloons"}

	sets.midcast.Protectra = {ring1="Sheltered Ring",feet="Piety Duckbills +1"}

	sets.midcast.Shellra = {ring1="Sheltered Ring",legs="Piety Pantaloons"}


	sets.midcast['Divine Magic'] = {main="Bolelabunga",sub="Genbu's Shield",
		head="Nahtirah Hat",neck="Colossus's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring2="Sangoma Ring",
		back="Refraction Cape",waist=gear.ElementalObi,legs="Theophany Pantaloons",feet="Gendewitha Galoshes"}

	sets.midcast['Dark Magic'] = {main="Bolelabunga", sub="Genbu's Shield",
		head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

	-- Custom spell classes
	sets.midcast.MndEnfeebles = {
		neck="Spider Torque",
		body="Healer's Briault",hands="Cleric's Mitts +1",ring1="Snow Ring",ring2="Diamond Ring",
		back="Penitent's Rope",legs="Portent Pants"}

	sets.midcast.IntEnfeebles = {
		neck="Spider Torque",
		body="Healer's Briault",hands="Cleric's Mitts +1",ring1="Snow Ring",ring2="Diamond Ring",
		back="Penitent's Rope",legs="Portent Pants"}

	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main=gear.Staff.HMP, 
		body="Gendewitha Bliaut",hands="Serpentes Cuffs",
		waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
	

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Eminent Staff", sub="Achaq Grip",ammo="Incantor Stone",
		head="Orison Cap +2",neck="Twilight Torque",ear1="Lifestorm Earring",ear2="Orison Earring",
		body="Orison Bliaud +2",hands="Gendewitha Gages",ring1="Karka Ring",ring2="Bifrost Ring",
		back="Orison Cape",waist="Cleric's Belt",legs="Orison Pantaloons +2",feet="Gendewitha Galoshes"}

	sets.idle.PDT = {main="Eminent Staff", sub="Achaq Grip",ammo="Incantor Stone",
		head="Orison Cap +2",neck="Twilight Torque",ear1="Lifestorm Earring",ear2="Orison Earring",
		body="Orison Bliaud +2",hands="Gendewitha Gages",ring1="Karka Ring",ring2="Bifrost Ring",
		back="Orison Cape",waist="Cleric's Belt",legs="Orison Pantaloons +2",feet="Gendewitha Galoshes"}

	sets.idle.Town = {main="Eminent Staff", sub="Achaq Grip",ammo="Incantor Stone",
		head="Orison Cap +2",neck="Twilight Torque",ear1="Lifestorm Earring",ear2="Orison Earring",
		body="Orison Bliaud +2",hands="Gendewitha Gages",ring1="Karka Ring",ring2="Bifrost Ring",
		back="Orison Cape",waist="Cleric's Belt",legs="Orison Pantaloons +2",feet="Gendewitha Galoshes"}
	
	sets.idle.Weak = {main="Eminent Staff", sub="Achaq Grip",ammo="Incantor Stone",
		head="Orison Cap +2",neck="Twilight Torque",ear1="Lifestorm Earring",ear2="Orison Earring",
		body="Orison Bliaud +2",hands="Gendewitha Gages",ring1="Karka Ring",ring2="Bifrost Ring",
		back="Orison Cape",waist="Cleric's Belt",legs="Orison Pantaloons +2",feet="Gendewitha Galoshes"}
	
	-- Defense sets

	sets.defense.PDT = {} --{main=gear.Staff.PDT,sub="Achaq Grip",
		--head="Gendewitha Caubeen",neck="Twilight Torque",
		--body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		--back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

	sets.defense.MDT = {} --{main=gear.Staff.PDT,sub="Achaq Grip",
		--head="Nahtirah Hat",neck="Twilight Torque",
		--body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		--back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

	sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Basic set for if no TP weapon is defined.
	sets.engaged = {}
		--{
		--head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		--body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Rajas Ring",ring2="K'ayres Ring",
		--back="Umbra Cape",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 3)
end
