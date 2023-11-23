-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
        Custom commands:64

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.
		In-game macro: /console gs c scholar xxx

                                        Light Arts              Dark Arts

        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]
function job_setup()
    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
        "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
    update_active_strategems()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    state.MagicBurst = M(false, 'Magic Burst')
	
    info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder", 
	                   "Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II"}
    info.mid_nukes = S{}
    info.high_nukes = S{"Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
					    "Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
	                    "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    send_command('bind ` input /ma Stun <t>; wait 0.5; input /p Casting STUN on <t>.')
	send_command('bind ^` gs c toggle MagicBurst')
	send_command('bind !` gs c scholar skillchain')
	send_command('bind ^- gs c scholar light')
	send_command('bind ^= gs c scholar dark')
	--send_command('bind delete gs c scholar speed')
	--send_command('bind Home gs c scholar duration')
	--send_command('bind End gs c scholar aoe')

    select_default_macro_book()
end

function user_unload()
	send_command('unbind `')
	send_command('unbind ^`')
	send_command('unbind !`')
	send_command('unbind ^-')
	send_command('unbind ^=')
	--send_command('unbind delete')
	--send_command('unbind end')
	--send_command('unbind home')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Precast sets to enhance JAs

	sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
	sets.precast.JA['Dark Arts'] = {"Academic's Gown +1"}
	sets.precast.JA['Light Arts'] = {"Academic's Pants +1"}
	
	organizer_items = {agown="Academic's Gown +1",
	    zod="Zodiac Ring"}


	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Impatiens",
		head="Welkin Crown",neck="Orunmila's Torque",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring",ring2="Prolix Ring",
		back="Ogapepo Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Pedagogy Loafers +1"}
		--{main="Keraunos",ammo="Impatiens",
		--head=gear.merl_head_FC,neck="Orunmila's Torque",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
		--body="Anhur Robe",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring",ring2="Veneficium Ring",
		--back="Ogapepo Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Pedagogy Loafers +1"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, 
		{head="Gendewitha Caubeen +1",body="Gendewitha Bliaut +1",hands="Gendewitha Gages +1",back="Pahtli Cape"})
		--{head="Paean Mitra",body="Vanya Robe",hands="Gendewitha Gages +1",back="Pahtli Cape"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal",ear1="Barkarole Earring"})

	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	
	-- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {ammo="Ghastly Tathlum",
	    head="Amalric Coif",neck="Sanctity Necklace",ear1="Loquacious Earring",ear2="Mendicant's Earring",
		body="Gyve Doublet",hands="Pedagogy Bracers +1",ring1="Prolix Ring",ring2="Succor Ring",
		back="Pahtli Cape",waist="Shinjutsu-no-obi",legs="Amalric Slops",feet="Arbatel Loafers"}
		--{ammo="Ghastly Tathlum +1",
	    --head="Kaabnax Hat",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Etiolation Earring",
		--body="Amalric Doublet",hands="Otomi Gloves",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		--back="Pahtli Cape",waist="Fucho-no-obi",legs="Amalric Slops",feet="Medium's Sabots"}


	-- Midcast Sets

	sets.midcast.FastRecast = {ammo="Incantor Stone",ring2="Prolix Ring",back="Swith Cape"}
		--{ammo="Incantor Stone",ring2="Prolix Ring",back="Swith Cape +1"}

	-- Cure Sets
	
	sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Savant's Treatise",
		head="Gendewitha Caubeen +1",neck="Imbodla Necklace",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Vanya Robe",hands="Pedagogy Bracers +1",ring1="Ephedra Ring",ring2="Sirona's Ring",
		back="Tempered Cape",waist="Bishop's Sash",legs="Academic's Pants +1",feet="Medium's Sabots"}
		--{main="Serenity",sub="Curatio Grip",ammo="Hydrocera",
		--head="Vanya Hood",neck="Henic Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		--body="Vanya Robe",hands="Pedagogy Bracers +1",ring1="Haoma's Ring",ring2="Sirona's Ring",
		--back="Tempered Cape +1",waist="Bishop's Sash",legs="Academic's Pants +1",feet="Vanya Clogs"}

	sets.midcast.CureWithLightWeather = set_combine(sets.midcast.Cure, 
		{main="Tamaxchi",
		body="Gendewitha Bliaut +1",hands="Telchine Gloves",
		back="Twilight Cape",waist="Korin Obi"})
		--{main="Chatoyant Staff",
		--body="Gendewitha Bliaut +1",hands="Telchine Gloves",
		--back="Twilight Cape",waist="Korin Obi"})

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Regen = {main="Bolelabunga",sub="Genbu's Shield",ammo="Savant's Treatise",
	    head="Arbatel Bonnet +1",neck="Colossus's Torque",ear1="Andoaa Earring",
		body="Telchine Chasuble",hands="Telchine Gloves",
		back="Lugh's Cape",waist="Cascade Belt",legs="Telchine Braconi",feet="Telchine Pigaches"}
		--{main="Bolelabunga",sub="Genbu's Shield",ammo="Savant's Treatise",
	    --head="Arbatel Bonnet +1",neck="Colossus's Torque",ear1="Andoaa Earring",
		--body="Telchine Chasuble",hands="Telchine Gloves",
		--back="Bookworm's Cape",waist="Cascade Belt",legs="Telchine Braconi",feet="Telchine Pigaches"}
	
	-- Enhancing Magic Sets
	
	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Genbu's Shield",ammo="Savant's Treatise",
		head="Telchine Cap",body="Telchine Chasuble",hands="Telchine Gloves",legs="Telchine Braconi",feet="Telchine Pigaches",
		ear1="Andoaa Earring",neck="Colossus's Torque",waist="Cascade Belt"}
		--{main="Gada",sub="Genbu's Shield",ammo="Savant's Treatise",
		--head="Telchine Cap",body="Telchine Chasuble",hands="Telchine Gloves",legs="Telchine Braconi",feet="Telchine Pigaches",
		--ear1="Andoaa Earring",neck="Colossus's Torque",waist="Cascade Belt"}

	sets.midcast.Cursna = {
		neck="Malison Medallion",ring1="Haoma's Ring",ring2="Ephedra Ring",feet="Gendewitha Galoshes +1"}
		--neck="Malison Medallion",ring1="Haoma's Ring",ring2="Ephedra Ring",feet="Gendewitha Galoshes +1"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

	sets.midcast.Protect = {ring1="Sheltered Ring"}
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = {ring1="Sheltered Ring"}
	sets.midcast.Shellra = sets.midcast.Shell
	sets.midcast.Haste = sets.midcast['Enhancing Magic']
	sets.midcast.Storm = sets.midcast['Enhancing Magic']
	sets.midcast.Erase = sets.midcast.FastRecast


	-- Custom spell classes
	sets.midcast.MndEnfeebles = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Savant's Treatise",
		head="Amalric Coif",neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Gwati Earring",
		body="Vanya Robe",hands="Lurid Mitts",ring1="Vertigo Ring",ring2="Globidonta Ring",
		back="Ogapepo Cape",waist="Refoccilation Stone",legs="Psycloth Lappas",feet="Medium's Sabots"}
		--{main="Akademos",sub="Mephitis Grip",ammo="Hydrocera",
		--head="Befouled Crown",neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Gwati Earring",
		--body="Vanya Robe",hands="Lurid Mitts",ring1="Vertigo Ring",ring2="Globidonta Ring",
		--back="Refraction Cape",waist="Tengu-no-Obi",legs="Chironic Hose",feet="Medium's Sabots"}

	sets.midcast.IntEnfeebles = sets.midcast.MndEnfeebles
	sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
	
	sets.midcast.Kaustra = sets.midcast['Elemental Magic']

	sets.midcast['Dark Magic'] = {main="Akademos",sub="Mephitis Grip",ammo="Ghastly Tathlum",
		head=gear.merl_head_MB,neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Gwati Earring",
		body="Vanir Cotehardie",hands="Lurid Mitts",ring1="Weatherspoon Ring",ring2="Acumen Ring",
		back="Bookworm's Cape",waist="Witful Belt",legs="Pedagogy Pants +1",feet="Medium's Sabots"}
		--{main="Rubicundity",sub="Genbu's Shield",ammo="Hydrocera",
		--head=gear.merl_head_MB,neck="Sanctity Necklace",ear1="Barkarole Earring",ear2="Gwati Earring",
		--body="Amalric Doublet",hands="Lurid Mitts",ring1="Weatherspoon Ring",ring2="Evanescence Ring",
		--back="Bookworm's Cape",waist="Witful Belt",legs="Pedagogy Pants",feet="Medium's Sabots"}

	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'],
		{ammo="Incantor Stone",
		head="Pixie Hairpin +1",ear1="Hirudinea Earring",ear2="Loquacious Earring",
		hands="Helios Gloves",
		waist="Fucho-no-obi",feet="Amalric Nails"})
		--{ammo="Incantor Stone",
		--head="Pixie Hairpin +1",ear1="Hirudinea Earring",ear2="Loquacious Earring",
		--hands="Helios Gloves",
		--waist="Fucho-no-obi",feet=gear.merl_feet_MAB})

	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = {main="Akademos",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Pedagogy Mortarboard +1",neck="Orunmila's Torque",ear1="Enchanter Earring +1",ear2="Loquac. Earring",
		body="Vanir Cotehardie",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring",ring2="Prolix Ring",
		back="Swith Cape",waist="Ninurta's Sash",legs="Psycloth Lappas",feet="Academic's Loafers +1"}
		--{main="Akademos",sub="Arbuda Grip",ammo="Incantor Stone",
		--head="Pedagogy Mortarboard +1",neck="Orunmila's Torque",ear1="Enchanter Earring +1",ear2="Loquac. Earring",
		--body="Amalric Doublet",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring",ring2="Prolix Ring",
		--back="Swith Cape +1",waist="Ninurta's Sash",legs="Psycloth Lappas",feet="Academic's Loafers +1"}

	sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {})


	-- Elemental Magic sets are default for handling all-tier nukes.
	 sets.midcast['Elemental Magic'] = {main="Akademos",sub="Willpower Grip",ammo="Ghastly Tathlum",
	    head="Amalric Coif",neck="Sanctity Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
		body="Seidr Cotehardie",hands="Amalric Gages",ring1="Shiva Ring",ring2="Shiva Ring",
		back="Lugh's Cape",waist="Refoccilation Stone",legs="Amalric Slops",feet="Amalric Nails"}
		--{main="Akademos",sub="Niobid Strap",ammo="Ghastly Tathlum +1",
	    --head=gear.merl_head_MB,neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
		--body="Amalric Doublet",hands=gear.chiro_hands_MAB,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		--back="Toro Cape",waist="Refoccilation Stone",legs="Merlinic Shalwar",feet=gear.merl_feet_MAB}
	--  sub="Zuuxowu Grip",head="Buremte Hat",body="Witching Robe",hands="Otomi Gloves",back="Bookworm's Cape",waist="Tengu-no-Obi",feet="Amalric Nails"

	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'],
		{sub="Mephitis Grip",neck="Sanctity Necklace",back="Bookworm's Cape"})
		--{neck="Sanctity Necklace",back="Bookworm's Cape"})

	-- Custom refinements for certain nuke tiers (No longer used as of Jan/2016).
	sets.midcast['Elemental Magic'].HighTierNuke = sets.midcast['Elemental Magic']

	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = sets.midcast['Elemental Magic'].Resistant
	
	sets.midcast.Helix = set_combine(sets.midcast['Elemental Magic'].HighTierNuke, 
		{neck="Sanctity Necklace",back="Bookworm's Cape"})
		--{neck="Sanctity Necklace",back="Bookworm's Cape"})
	sets.midcast.Noctohelix = set_combine(sets.midcast.Helix, {head="Pixie Hairpin +1"})
	sets.midcast.Luminohelix = set_combine(sets.midcast.Helix, {ring1="Weatherspoon Ring"})

	sets.midcast.Impact = {main="Akademos",sub="Mephitis Grip",ammo="Ghastly Tathlum",
		head=empty,neck="Sanctity Necklace",ear1="Barkarole Earring",ear2="Gwati Earring",
		body="Twilight Cloak",hands="Amalric Gages",ring1="Weatherspoon Ring",ring2="Sangoma Ring",
		back="Ogapepo Cape",waist="Refoccilation Stone",legs="Amalric Slops",feet="Medium's Sabots"}
		--{main="Akademos",sub="Mephitis Grip",ammo="Hydrocera",
		--head=empty,neck="Sanctity Necklace",ear1="Barkarole Earring",ear2="Gwati Earring",
		--body="Twilight Cloak",hands=gear.chiro_hands_MAB,ring1="Weatherspoon Ring",ring2="Sangoma Ring",
		--back="Refraction Cape",waist="Refoccilation Stone",legs="Chironic Hose",feet="Medium's Sabots"}


	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {main="Lehbrailg +2",sub="Mephitis Grip",
		neck="Wiglen Gorget",body="Gendewitha Bliaut +1",hands="Serpentes Cuffs",
		ring1="Sheltered Ring",ring2="Paguroidea Ring",legs="Hagondes Pants +1",feet="Serpentes Sabots"}
		--{main="Chatoyant Staff",sub="Mephitis Grip",
		--neck="Wiglen Gorget",body="Witching Robe",hands="Serpentes Cuffs",
		--ring1="Sheltered Ring",ring2="Paguroidea Ring",legs="Assiduity Pants +1",feet="Serpentes Sabots"}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",ammo="Ghastly Tathlum",
		head="Amalric Coif",neck="Wiglen Gorget",ear1="Infused Earring",ear2="Loquacious Earring",
		body="Gendewitha Bliaut +1",hands="Amalric Gages",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Bookworm's Cape",waist="Fucho-no-obi",legs="Amalric Slops",feet="Amalric Nails"}
		--{main="Akademos",sub="Niobid Strap",ammo="Hydrocera",
		--head=gear.merl_head_MB,neck="Orunmila's Torque",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
		--body="Amalric Doublet",hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		--back="Bookworm's Cape",waist="Fucho-no-obi",legs="Merlinic Shalwar",feet="Herald's Gaiters"}

	sets.idle.Field = {main="Bolelabunga",sub="Genbu's Shield",ammo="Ghostly Tathlum",
		head="Amalric Coif",neck="Twilight Torque",ear1="Infused Earring",ear2="Loquacious Earring",
		body="Gendewitha Bliaut +1",hands="Serpentes Cuffs",ring1="Defending Ring",ring2="Patricius Ring",
		back="Cheviot Cape",waist="Witful Belt",legs="Amalric Slops",feet="Serpentes Sabots"}
		--{main="Akademos",sub="Niobid Strap",ammo="Homiliary",
		--head="Befouled Crown",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
		--body="Amalric Doublet",hands="Serpentes Cuffs",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		--back="Umbra Cape",waist="Witful Belt",legs="Assiduity Pants +1",feet="Serpentes Sabots"}
		
	sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		neck="Twilight Torque",ear1="Ethereal Earring",ring1="Defending Ring",ring2="Patricius Ring",
		body="Vanya Robe",hands="Gendewitha Gages +1",back="Cheviot Cape",feet="Pedagogy Loafers +1"}
		--{main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		--neck="Twilight Torque",ear1="Ethereal Earring",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		--body="Vanya Robe",hands="Gendewitha Gages +1",back="Umbra Cape",feet="Pedagogy Loafers +1"}

	sets.idle.Weak = sets.idle.Field
	
	-- Defense sets

	sets.defense.PDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Amalric Coif",neck="Twilight Torque",ear1="Ethereal Earring",
		body="Vanya Robe",hands="Gendewitha Gages +1",ring1="Defending Ring",ring2="Patricius Ring",
		back="Cheviot Cape",legs="Amalric Slops",feet="Amalric Nails"}
		--{main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		--head="Befouled Crown",neck="Twilight Torque",ear1="Ethereal Earring",
		--body="Vanya Robe",hands="Gendewitha Gages +1",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		--back="Umbra Cape",legs="Chironic Hose",feet="Vanya Clogs"}

	sets.defense.MDT = {
		head="Amalric Coif",neck="Twilight Torque",
		body="Pedagogy Gown +1",hands="Amalric Gages",ring1="Defending Ring",ring2="Shadow Ring",
		back="Cheviot Cape",legs="Amalric Slops",feet="Arbatel Loafers +1"}
		--{
		--head=gear.merl_head_MB,neck="Twilight Torque",
		--body="Pedagogy Gown +1",hands=gear.chiro_hands_MAB,ring1="Defending Ring",ring2="Shadow Ring",
		--back="Umbra Cape",legs="Chironic Hose",feet="Arbatel Loafers +1"}

	sets.Kiting = {feet="Herald's Gaiters"}
	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {}


	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Ebullience'] = {}
	sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
	sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
	sets.buff['Immanence'] = {hands="Arbatel Bracers +1",back="Lugh's Cape"}
	sets.buff['Penury'] = {legs="Arbatel Pants +1"}
	sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
	sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
	sets.buff['Alacrity'] = {head="Amalric Coif",feet="Pedagogy Loafers +1"} --{head=gear.merl_head_MB,feet="Pedagogy Loafers +1"}
	sets.buff['Stormsurge'] = {feet="Pedagogy Loafers +1"}
	sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}

	sets.buff.FullSublimation = {
		head="Academic's Mortarboard +1",neck="Wiglen Gorget",ear1="Savant's Earring",
		body="Pedagogy Gown +1",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
		--head="Academic's Mortarboard +1",neck="Wiglen Gorget",ear1="Savant's Earring",
		--body="Pedagogy Gown +1",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
	sets.buff.PDTSublimation = {
		head="Academic's Mortarboard +1",ear1="Savant's Earring",
		body="Pedagogy Gown +1"}
		--head="Academic's Mortarboard +1",ear1="Savant's Earring",
		--body="Pedagogy Gown +1"}
	
	sets.magic_burst = {main="Akademos",sub="Mephitis Grip",
	    head="Amalric Coif",neck="Mizukage-no-Kubikazari",hands="Amalric Gages",
		ring1="Mujin Band",back="Seshaw Cape",feet="Amalric Nails"}
		--{main="Akademos",sub="Niobid Strap",
	    --head=gear.merl_head_MB,neck="Mizukage-no-Kubikazari",hands="Amalric Gages",
		--ring1="Mujin Band",back="Seshaw Cape",feet=gear.merl_feet_MB}
	-- Cap: 40%
    -- Akademos: 10%, Merlinic Hood: 4%, Mizukage: 10%, Seshaw: 5%, Merlinic Boots: 11% = 40%

end