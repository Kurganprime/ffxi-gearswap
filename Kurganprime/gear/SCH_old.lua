--[[
        Custom commands:

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.

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

function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')


    info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
    info.mid_nukes = S{"Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II",
                       "Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
                       "Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",}
    info.high_nukes = S{"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}

    send_command('bind ^` input /ma Stun <t>')

    select_default_macro_book()
end

function user_unload()
    send_command('unbind ^`')
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Precast sets to enhance JAs

	sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}


	-- Fast cast sets for spells

	sets.precast.FC = {sub="Vivid Strap",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Orunmia's Torque",ear1="Moonshade Earring",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Weatherspoon Ring",ring2="Lebeche Ring",
		back="Ogapepo Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Academic's Loafers +1"}
		--{main="Atar I",sub="Vivid Strap",ammo="Impatiens",
		--head="Nahtirah Hat",neck="Orunmila's Torque",ear1="Moonshade Earring",ear2="Loquacious Earring",
		--body="Zendik Robe",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring",ring2="Lebeche Ring",
		--back="Ogapepo Cape +1",waist="Witful Belt",legs="Artsieq Hose",feet="Academic's Loafers"}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris",back="Pahtli Cape"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})


	-- Midcast Sets

	sets.midcast.FastRecast = {ammo="Incantor Stone",
		head="Nahtirah Hat",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
		back="Swith Cape",waist="Goading Belt",legs="",feet="Academic's Loafers +1"}

	sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Gendewitha Caubeen",neck="Colossus's Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Pedagogy Gown",hands="Pedagogy Bracers",ring1="Prolix Ring",ring2="Sirona's Ring",
		back="Swith Cape",waist="Pahtli Cape",legs="Orvail Pants +1",feet="Academic's Loafers +1"}
		--{main="Tamaxchi",sub="Genbu's Shield",ammo="Esper Stone +1",
		--head="Gendewitha Caubeen +1",neck="Lasaia Pendant",ear1="Novia Earring",ear2="Domesticator's Earring",
		--body="Pedagogy Gown +1",hands="Pedagogy Bracers +1",ring1="Lebeche Ring",ring2="Sirona's Ring",
		--back="Tempered Cape +1",waist="Bishop's Sash",legs="Academic's Pants +1",feet="Pedagogy Loafers +1"}
		
	sets.midcast.CureWithLightWeather = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Incantor Stone",
		head="Gendewitha Caubeen",neck="Colossus's Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Prolix Ring",ring2="Sirona's Ring",
		back="Twilight Cape",waist="Korin Obi",legs="Nares Trews",feet="Academic's Loafers +1"}
		--{main="Chatoyant Staff",sub="Achaq Grip",ammo="Esper Stone +1",
		--head="Gendewitha Caubeen +1",neck="Lasaia Pendant",ear1="Novia Earring",ear2="Domesticator's Earring",
		--body="Gendewitha Bliaut +1",hands="Telchine Gloves",ring1="Lebeche Ring",ring2="Sirona's Ring",
		--back="Twilight Cape",waist="Korin Obi",legs="Academic's Pants +1",feet="Pedagogy Loafers +1"}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Regen = {main="Bolelabunga",head="Savant's Bonnet +2"}

	sets.midcast.Cursna = {
		neck="Malison Medallion",
		hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Ephedra Ring",
		back="Oretan. Cape +1",waist="Gishdubar Sash",feet="Gendewitha Galoshes"}

	sets.midcast['Enhancing Magic'] = {ammo="Savant's Treatise",
		head="Savant's Bonnet +2",neck="Colossus's Torque",
		body="Manasa Chasuble",hands="Ayao's Gages",
		waist="Olympus Sash",legs="Portent Pants"}
		--{main="Akademos",ammo="Savant's Treatise",
		--head="Telchine Cap",neck="Colossus's Torque",ear1="Andoaa Earring",
		--body="Telchine Chasuble",hands="Arbatel Bracers +1",
		--back="Fi Follet Cape +1",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

	sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers"})

	sets.midcast.Protect = {ring1="Sheltered Ring"}
	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = {ring1="Sheltered Ring"}
	sets.midcast.Shellra = sets.midcast.Shell


	-- Custom spell classes
	sets.midcast.MndEnfeebles = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
		head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Manasa Chasuble",hands="Yaoyotl Gloves",ring1="Aquasoul Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Bokwus Boots"}
		--{main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
		--head="Merlinic Hood",neck="Imbodla Necklace",ear1="Dignitary's Earring",ear2="Barkaro. Earring",
		--body="Vanya Robe",hands="Lurid Mitts",ring1="Metamorph Ring",ring2="Weatherspoon Ring",
		--back="Lugh's Cape",waist="Porous Rope",legs="Psycloth Lappas",feet="Amalric Nails"}

	sets.midcast.IntEnfeebles = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
		head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Manasa Chasuble",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Bokwus Boots"}
		--{main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",
		--head="Merlinic Hood",neck="Imbodla Necklace",ear1="Dignitary's Earring",ear2="Barkaro. Earring",
		--body="Vanya Robe",hands="Lurid Mitts",ring1="Metamorph Ring",ring2="Weatherspoon Ring",
		--back="Lugh's Cape",waist="Porous Rope",legs="Psycloth Lappas",feet="Amalric Nails"}

	sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

	sets.midcast['Dark Magic'] = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Goading Belt",legs="Bokwus Slops",feet="Bokwus Boots"}

	sets.midcast.Kaustra = {main="Lehbrailg +2",sub="Wizzan Grip",ammo="Witchstone",
		head="Hagondes Hat",neck="Eddy Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Strendu Ring",
		back="Toro Cape",waist="Cognition Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.midcast.Drain = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Excelsis Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Goading Belt",legs="Pedagogy Pants",feet="Academic's Loafers +1"}

	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = {main="Apamajas II",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Witful Belt",legs="Pedagogy Pants",feet="Academic's Loafers +1"}
		--{main="Tupsimati",sub="Arbuda Grip",ammo="Incantor Stone",
		--head="Nahtirah Hat",neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter's Earring +1",
		--body="Vanir Cotehardie",hands="Gendewitha Gages +1",ring1="Prolix Ring",ring2="Sangoma Ring",
		--back="Swith Cape +1",waist="Ninurta's Sash",legs="Artsieq Hose",feet="Pedagogy Loafers +1"}

	sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Lehbrailg +2"})


	-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast['Elemental Magic'] = {main="Lehbrailg +2",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Hagondes Hat",neck="Eddy Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
		back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}
		--{sub="Elder's Grip",ammo="Ghastly Tathlum +1",
		--head="Hagondes Hat +1",neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Crematio Earring",
		--body="Seidr Cotehardie",hands="Helios Gloves",ring1="Shiva Ring +1,ring2="Shiva Ring +1",
		--back="Toro Cape",waist="Yamabuki-no-Obi",legs="Hagondes Pants +1",feet="Helios Boots"}

	sets.midcast['Elemental Magic'].Resistant = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Dosis Tathlum",
		head="Hagondes Hat",neck="Eddy Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Vanir Cotehardie",hands=gear.macc_hagondes,ring1="Icesoul Ring",ring2="Acumen Ring",
		back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Bokwus Boots"}
		--{sub="Elder's Grip",ammo="Ombre Tathlum +1",
		--head="Helios Band",neck="Eddy Necklace",ear1="Barkaro. Earring",ear2="Friomisi Earring",
		--body="Helios Jacket",hands="Helios Gloves",ring1="Shiva Ring +1,ring2="Shiva Ring +1",
		--back="Bookworm's Cape",waist="Yamabuki-no-Obi",legs="Telchine Braconi",feet="Helios Boots"}
		
	-- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})

	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {sub="Wizzan Grip"})

	sets.midcast.Impact = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Dosis Tathlum",
		head=empty,neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Twilight Cloak",hands=gear.macc_hagondes,ring1="Icesoul Ring",ring2="Sangoma Ring",
		back="Toro Cape",waist="Demonry Sash",legs="Hagondes Pants",feet="Bokwus Boots"}


	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Mephitis Grip",
		head="Nefer Khat +1",neck="Wiglen Gorget",
		body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		waist="Austerity Belt",legs="Nares Trews",feet="Serpentes Sabots"}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Savant's Bonnet +2",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Savant's Gown +2",hands="Savant's Bracers +2",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Cheviot Cape",waist="Fucho-no-Obi",legs="Savant's Pants +2",feet="Savant's Loafers +2"}

	sets.idle.Field = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Nefer Khat +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Cheviot Cape",waist="Fucho-no-Obi",legs="Nares Trews",feet="Serpentes Sabots"}

	sets.idle.Field.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
		back="Cheviot Cape",waist="Fucho-no-Obi",legs="Nares Trews",feet="Serpentes Sabots"}

	sets.idle.Field.Stun = {main="Apamajas II",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Sangoma Ring",
		back="Swith Cape",waist="Goading Belt",legs="Bokwus Slops",feet="Academic's Loafers +1"}

	sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Sheltered Ring",ring2="Meridian Ring",
		back="Cheviot Cape",waist="Fucho-no-Obi",legs="Nares Trews",feet="Serpentes Sabots"}

	-- Defense sets

	sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		back="Cheviot Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

	sets.Kiting = {feet="Herald's Gaiters"}

	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
		head="Zelus Tiara",
		body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Rajas Ring",
		waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}



	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Ebullience'] = {head="Savant's Bonnet +2"}
	sets.buff['Rapture'] = {head="Savant's Bonnet +2"}
	sets.buff['Perpetuance'] = {hands="Savant's Bracers +2"}
	sets.buff['Immanence'] = {hands="Savant's Bracers +2"}
	sets.buff['Penury'] = {legs="Savant's Pants +2"}
	sets.buff['Parsimony'] = {legs="Savant's Pants +2"}
	sets.buff['Celerity'] = {feet="Pedagogy Loafers"}
	sets.buff['Alacrity'] = {feet="Pedagogy Loafers"}

	sets.buff['Klimaform'] = {feet="Savant's Loafers +2"}

	sets.buff.FullSublimation = {head="Academic's Mortarboard +1",ear1="Savant's Earring",body="Pedagogy Gown"}
	sets.buff.PDTSublimation = {head="Academic's Mortarboard +1",ear1="Savant's Earring"}

	--sets.buff['Sandstorm'] = {feet="Desert Boots"}
end

function select_default_macro_book()
    set_macro_page(1, 20)
end
