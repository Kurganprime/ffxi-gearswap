-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
     
    ---- Precast Sets ----
     
    -- Precast set for calling Trusts at iLVL 119
    sets.precast.Trust = {
		head="Jhakri Coronal +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +1"}
    sets.midcast.Trust = sets.precast.Trust

	-- Precast sets to enhance JAs
	
    sets.precast.JA['Mana Wall'] = {back="Taranus's cape",feet="Wicce Sabots +1"}
 
    sets.precast.JA.Manafont = {body="Sorcerer's Coat +2"}
     
    -- Can put HP/MP set here for convert
	
    sets.precast.JA.Convert = {}
 
 
    -- Base precast Fast Cast set, this set will have to show up many times in the function section of the lua
	-- So dont forget to do that.
 
    sets.precast.FC = {
		main="Marin Staff",
		ammo="Sapience Orb",
        head="Nahtirah hat",
		neck="Orunmila's Torque",
		ear2="Loquacious Earring",
        body="Anhur Robe",
		hands="Helios gloves",
		ring1="Prolix Ring",
		ring2="Weatherspoon Ring",
        back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
		waist="Witful Belt",
		legs="Psycloth Lappas",
		feet="Regal pumps +1"}
		

	sets.precast['Impact'] = {
		main="Marin Staff",
		ammo="Sapience Orb",
        head=empty,
		neck="Orunmila's Torque",
		ear2="Loquacious Earring",
        body="Twilight Cloak",
		hands="Helios gloves",
		ring1="Prolix Ring",
		ring2="Weatherspoon Ring",
        back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
		waist="Witful Belt",
		legs="Psycloth Lappas",
		feet="Regal pumps +1"}

		
	
	sets.precast.FC.HighMP = {
		main="Lathi",ammo="Pemphredo Tathlum",
        head="Nahtirah hat",
		neck="Orunmila's Torque",
		ear2="Loquacious Earring",
		ear1="Evans Earring",
        body="Helios Jacket",
		hands="Helios gloves",
		ring1="Sangoma Ring",
		ring2="Mephitas's Ring +1",
        back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
		waist="Eschan Stone",
		legs="Psycloth Lappas",
		feet="Regal pumps +1"}
		
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC['Enfeebling Magic'] = sets.precast.FC
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkarole earring"})
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {body="Heka's Kalasiris",legs="Doyen pants", back="Pahtli Cape"})
 
    -- Midcast set for Death, Might as well only have one set, unless you plan on free-nuking death for some unexplainable reason.

    sets.midcast['Death'] = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body="Ea Houppelande",
		hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic burst dmg.+10%','Mag. Acc.+10','"Mag.Atk.Bns."+14',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+8%','Mag. Acc.+11',}},
		neck="Mizukage-no-Kubikazari",
		waist="Eschan Stone",
		left_ear="Barkaro. Earring",
		right_ear="Static Earring",
		left_ring="Archon Ring",
		right_ring="Mujin Band",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}
 
    -- Sets for WS, Feel free to add one for Vidohunir if you have Laevateinn

    sets.precast.WS['Myrkr'] = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
		hands="Amalric Gages",
		legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		feet="Psycloth Boots",
		neck="Sanctity Necklace",
		waist="Yamabuki-no-Obi",
		left_ear="Evans Earring",
		right_ear="Moonshade Earring",
		left_ring="Mephitas's Ring +1",
		right_ring="Sangoma Ring",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}
 
    ---- Midcast Sets ----
    sets.midcast.FastRecast = {}
 
    sets.midcast['Healing Magic'] = {}

    sets.midcast['Enhancing Magic'] = {
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
		feet="Telchine Pigaches",
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		left_ear="Hearty Earring",
		right_ear="Dominance Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back="Solemnity Cape",}
	
	sets.midcast.Mana_Wall_No_Swap = {
		main="Terra's Staff",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head="Kaabnax Hat",
		body="Merlinic Jubbah",
		hands="Hagondes Cuffs +1",
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%',}},
		feet="Wicce Sabots +1",
		neck="Loricate Torque +1",
		waist="Slipor Sash",
		left_ear="Merman's Earring",
		right_ear="Merman's Earring",
		left_ring="Dark Ring",
		right_ring="Defending Ring",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}
	
	-- I personally do not have gear to alter these abilities as of the time of disseminating this file, but 
	-- definitely add them here if you have them.
 
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {feet="Inspirited Boots",waist="Gishdubar Sash"})
	
    sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'], {})
	
    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {})
	
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		waist="Siegel Sash",
		neck="Stone Gorget",
		hands="Telchine Gloves",
		legs="Haven hose",
		ear2="Earthcry Earring"})
 
    sets.midcast['Enfeebling Magic'] = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body="Merlinic Jubbah",
		hands="Jhakri Cuffs +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Mag. crit. hit dmg. +4%','MND+4','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
		feet="Jhakri Pigaches +2",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Barkaro. Earring",
		right_ear="Dignitary's Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}   

    sets.midcast['Enfeebling Magic'].Effect = set_combine(sets.midcast['Enfeebling Magic'],{
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+8%','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
		body="Vanya Robe",
		hands="Lurid Mitts",
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},
		neck="Henic Torque",
		waist="Eschan Stone",
		left_ear="Barkaro. Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}})

	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Enfeebling Magic'],{
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+8%','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
		body="Vanya Robe",
		hands="Lurid Mitts",
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},
		neck="Henic Torque",
		waist="Eschan Stone",
		left_ear="Barkaro. Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}})
	
	sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']
 
    sets.midcast['Dark Magic'] = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+8%','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
		body="Merlinic Jubbah",
		hands="Jhakri cuffs +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Mag. crit. hit dmg. +4%','MND+4','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+8%','Mag. Acc.+11',}},
		neck="Sanctity Necklace",
		waist="Fucho-no-Obi",
		left_ear="Barkaro. Earring",
		right_ear="Dignitary's Earring",
		left_ring="Evanescence Ring",
		right_ring="Sangoma Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}
 
    -- Elemental Magic sets
     
    sets.midcast['Elemental Magic'] = {
		main={ name="Lathi", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head="Ea Hat",
		body="Ea Houppelande",
		hands="Ea Cuffs",
		legs="Ea Slops",
		feet="Ea Pigaches",
		neck="Mizu. Kubikazari",
		waist="Eschan Stone",
		left_ear="Barkaro. Earring",
		right_ear="Friomisi Earring",
		left_ring="Mujin Band",
		right_ring="Shiva Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}

    sets.midcast['Elemental Magic'].FreeNuke = set_combine(sets.midcast['Elemental Magic'], {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+8%','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
		body="Merlinic Jubbah",
		hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Mag. crit. hit dmg. +4%','MND+4','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+8%','Mag. Acc.+11',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Barkaro. Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}})
		
    sets.midcast['Elemental Magic'].OccultAcumen = set_combine(sets.midcast['Elemental Magic'].HighTierNuke, {
		ammo="Seraphic Ampulla",
		body="Spaekona's Coat +2", 
		right_ear="Regal Earring",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+24','"Occult Acumen"+10','INT+9',}},
		hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+20','"Occult Acumen"+11',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','"Occult Acumen"+9','INT+10','"Mag.Atk.Bns."+8',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+8%','Mag. Acc.+11',}}})
		
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	
    sets.midcast['Elemental Magic'].HighTierNuke.FreeNuke = set_combine(sets.midcast['Elemental Magic'].HighTierNuke, {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+8%','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
		body="Merlinic Jubbah",
		hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Mag. crit. hit dmg. +4%','MND+4','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+8%','Mag. Acc.+11',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Barkaro. Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}})
		
    sets.midcast['Elemental Magic'].HighTierNuke.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].HighTierNuke, {
		ammo="Seraphic Ampulla",
		body="Spaekona's Coat +2", 
		right_ear="Regal Earring",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+24','"Occult Acumen"+10','INT+9',}},
		hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+20','"Occult Acumen"+11',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','"Occult Acumen"+9','INT+10','"Mag.Atk.Bns."+8',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+8%','Mag. Acc.+11',}},})
 
    sets.midcast['Impact'] = {
		head=empty,body="Twilight Cloak",
		hands="Jhakri cuffs +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Mag. crit. hit dmg. +4%','MND+4','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+8%','Mag. Acc.+11',}},
		neck="Sanctity Necklace",
		waist="Hachirin-no-Obi",
		left_ear="Dignitary's Earring",
		right_ear="Barkaro. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}
	
	sets.midcast['Comet'] = set_combine(sets.midcast['Elemental Magic'], {
		sub="Niobid Strap",
		ammo="Seraphic Ampulla",
		head="Pixie Hairpin +1",
		body="Merlinic Jubbah",
		hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic burst dmg.+10%','Mag. Acc.+10','"Mag.Atk.Bns."+14',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+8%','Mag. Acc.+11',}},
		neck="Mizu. Kubikazari",
		waist="Eschan Stone",
		left_ear="Static Earring",
		right_ear="Barkaro. Earring",
		left_ring="Archon Ring",
		right_ring="Mujin Band",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}})
 
	sets.midcast['Comet'].FreeNuke = set_combine(sets.midcast['Elemental Magic'], {
		sub="Niobid Strap",
		ammo="Seraphic Ampulla",
		head="Pixie Hairpin +1",
		body="Merlinic Jubbah",
		hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic burst dmg.+10%','Mag. Acc.+10','"Mag.Atk.Bns."+14',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+8%','Mag. Acc.+11',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Barkaro. Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}})
	
	sets.midcast.Klimaform = {main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+8%','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
		body="Vanya Robe",
		hands="Lurid Mitts",
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},
		neck="Henic Torque",
		waist="Eschan Stone",
		left_ear="Barkaro. Earring",
		right_ear="Digni. Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}}
	
	sets.midcast.Flash = {
		main="Ungeri Staff",
		sub="Alber Strap",
		ammo="Sapience Orb",
		head={ name="Kaabnax Hat", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','Phys. dmg. taken -2%',}},
		body="Mallquis Saio +1",
		hands="Jhakri Cuffs +2",
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%',}},
		feet="Mallquis Clogs +1",
		neck="Unmoving Collar",
		waist="Goading Belt",
		left_ear="Friomisi Earring",
		right_ear="Merman's Earring",
		left_ring="Petrov Ring",
		right_ring="Begrudging Ring",
		back={ name="Taranus's Cape", augments={'Enmity+10',}},}
	
-- These next two sets are used later in the functions to determine what gear will be used in High MP and Low MP situations
-- SPECIFICALLY for Aspir spells.  In the LowMP set, put your best Aspir+ gear, in the other set put your best Max MP gear.
-- Find out how much your maximum MP is in each set, and adjust the MP values in the function area accordingly
-- (CTRL+F: Aspir Handling)

	sets.midcast.HighMP = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
		hands="Amalric Gages",
		legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		feet="Psycloth Boots",
		neck="Erra Pendant",
		waist="Yamabuki-no-Obi",
		left_ear="Barkarole Earring",
		right_ear="Evans Earring",
		left_ring="Mephitas's Ring +1",
		right_ring="Sangoma Ring",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}
 
	sets.midcast.LowMP = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+8%','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
		body="Merlinic Jubbah",
		hands="Jhakri Cuffs +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Mag. crit. hit dmg. +4%','MND+4','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+8%','Mag. Acc.+11',}},
		neck="Erra Pendant",
		waist="Fucho-no-Obi",
		left_ear="Barkaro. Earring",
		right_ear="Gwati Earring",
		left_ring="Evanescence Ring",
		right_ring="Sangoma Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}
		
	
		
    --Set to be equipped when Day/Weather match current spell element

	sets.Obi = {waist="Hachirin-no-Obi",}
	
	-- I actually have two references to equip this item, just in case your globals are out of date.
 
    -- Resting sets
	
    sets.resting = {}
 
    -- Idle sets: Make general idle set a max MP set, later hooks will handle the rest of your refresh sets, but
	-- remember to alter the refresh sets (Ctrl+F to find them)

    sets.idle = {
		main="Keraunos",
		sub="Achaq Grip",
		ammo="Clarus Stone",
		head="Jhakri Coronal +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +1",
		neck="Sanctity Necklace",
		waist="Witful Belt",
		left_ear="Barkarole Earring",
		right_ear="Loquac. Earring",
		left_ring="Ether Ring",
		right_ring="Weatherspoon Ring",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}

	-- sets.idle = {
	-- 	main="Grioavolr",
	-- 	sub="Irenic Strap",
	-- 	ammo="Pemphredo Tathlum",
	-- 	head="Befouled Crown",
	-- 	body={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
	-- 	hands="Amalric Gages",
	-- 	legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	-- 	feet="Psycloth boots",
	-- 	neck="Sanctity Necklace",
	-- 	waist="Yamabuki-no-Obi",
	-- 	left_ear="Evans Earring",
	-- 	right_ear="Loquac. Earring",
	-- 	left_ring="Mephitas's Ring +1",
	-- 	right_ring="Weatherspoon Ring",
	-- 	back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}
 
    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {
		main="Keraunos",
		sub="Achaq Grip",
		ammo="Clarus Stone",
		head="Jhakri Coronal +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +1",
		neck="Sanctity Necklace",
		waist="Witful Belt",
		left_ear="Barkarole Earring",
		right_ear="Loquac. Earring",
		left_ring="Ether Ring",
		right_ring="Weatherspoon Ring",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}

    -- sets.idle.PDT = {
	-- 	main="Terra's Staff",
	-- 	sub="Irenic Strap",
	-- 	ammo="Pemphredo Tathlum",
	-- 	head="Kaabnax Hat",
	-- 	body="Mallquis Saio +1",
	-- 	hands="Hagondes Cuffs +1",
	-- 	legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%',}},
	-- 	feet="Mallquis Clogs +1",
	-- 	neck="Loricate Torque +1",
	-- 	waist="Slipor Sash",
	-- 	left_ear="Merman's Earring",
	-- 	right_ear="Merman's Earring",
	-- 	left_ring="Dark Ring",
	-- 	right_ring="Defending Ring",
	-- 	back="Solemnity Cape"}

    sets.Adoulin = {body="Councilor's Garb",}

    sets.MoveSpeed = {feet = "Herald's Gaiters",}
    
    sets.TreasureHunter = {waist="Chaac Belt"}
 
    -- Set for Conserve MP toggle, convert damage to MP body.
	
    sets.AFBody = {body="Spaekona's Coat +1", right_ear="Regal Earring"}
 
    --- PDT set is designed to be used for MP total set, MDT can be used for whatever you like but in MDT mode
	--- the player.mp arguments will likely stop working properly
	
    sets.defense.PDT = {
		main="Terra's Staff",
		sub="Irenic Strap",
		ammo="Pemphredo Tathlum",
		head="Kaabnax Hat",
		body="Mallquis Saio +1",
		hands="Hagondes Cuffs +1",
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%',}},
		feet="Mallquis Clogs +1",
		neck="Loricate Torque +1",
		waist="Slipor Sash",
		left_ear="Merman's Earring",
		right_ear="Merman's Earring",
		left_ring="Dark Ring",
		right_ring="Defending Ring",
		back="Solemnity Cape"}
 
    sets.defense.MDT = {
		main="Grioavolr",
		sub="Irenic Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+8%','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
		body="Merlinic Jubbah",
		hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Mag. crit. hit dmg. +4%','MND+4','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
		feet="Merlinic Crackows",
		neck="Mizu. Kubikazari",
		waist="Hachirin-no-Obi",
		left_ear="Static Earring",
		right_ear="Barkaro. Earring",
		left_ring="Mujin Band",
		right_ring="Locus Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}
 
    sets.Kiting = {feet="Herald's Gaiters"}
	
	sets.latent_refresh = {waist="Fucho-no-Obi"}
	
	sets.auto_refresh = {
		main="Keraunos",
		sub="Achaq Grip",
		ammo="Clarus Stone",
		head="Jhakri Coronal +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +1",
		neck="Sanctity Necklace",
		waist="Witful Belt",
		left_ear="Barkarole Earring",
		right_ear="Loquac. Earring",
		left_ring="Ether Ring",
		right_ring="Weatherspoon Ring",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}

	-- sets.auto_refresh = {
	-- 	main="Grioavolr",
	-- 	sub="Niobid Strap",
	-- 	ammo="Pemphredo Tathlum",
	-- 	head="Befouled Crown",
	-- 	body={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
	-- 	hands={ name="Merlinic Dastanas", augments={'Pet: DEX+3','AGI+5','"Refresh"+1','Accuracy+16 Attack+16',}},
	-- 	legs="Assid. Pants +1",
	-- 	feet={ name="Merlinic Crackows", augments={'Accuracy+1 Attack+1','"Cure" spellcasting time -2%','"Refresh"+1',}},
	-- 	neck="Sanctity Necklace",
	-- 	waist="Yamabuki-no-Obi",
	-- 	left_ear="Evans Earring",
	-- 	right_ear="Loquac. Earring",
	-- 	left_ring="Mephitas's Ring +1",
	-- 	right_ring="Weatherspoon Ring",
	-- 	back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}

    -- Mana Wall idle set

    sets.buff['Mana Wall'] = {
		main="Terra's Staff",
		sub="Irenic Strap",
		ammo="Staunch Tathlum",
		head="Kaabnax Hat",
		body="Mallquis Saio +1",
		hands="Hagondes Cuffs +1",
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%',}},
		feet="Wicce Sabots +1",
		neck="Loricate Torque +1",
		waist="Slipor Sash",
		left_ear="Merman's Earring",
		right_ear="Merman's Earring",
		left_ring="Dark Ring",
		right_ring="Defending Ring",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}
	
	sets.midcast.Cure = {
		main="Tamaxchi",
		sub="Genbu's Shield",
		ammo="Vanir Battery",
		head={ name="Kaabnax Hat", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','Phys. dmg. taken -2%',}},
		body={ name="Vanya Robe", augments={'MP+49','"Cure" potency +7%','Enmity-5',}},
		hands="Telchine Gloves",
		legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%',}},
		feet="Battlecast Gaiters",
		neck="Loricate Torque +1",
		waist="Slipor Sash",
		left_ear="Merman's Earring",
		right_ear="Mendicant's Earring",
		left_ring="Defending Ring",
		right_ring="Kunaji Ring",
		back="Solemnity Cape",}
	
	sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {waist="Gishdubar Sash"})
    
	-- Engaged sets
 
    -- Set is designed for engaging a monster before pop to ensure you are at maximum MP value when Geas Fete triggers an MP refill.
	-- This is mostly used in this lua in situations where a fight is about to be initiated and you arent above whatever the maximum
	-- value for your idle set is.  Another simple way around this is to simply make a macro to equip the gear before the fight starts.
	
	sets.engaged = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
		hands="Amalric Gages",
		legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		feet="Psycloth Boots",
		neck="Sanctity Necklace",
		feet="Psycloth boots",
		waist="Yamabuki-no-Obi",
		left_ear="Evans Earring",
		right_ear="Loquac. Earring",
		left_ring="Mephitas's Ring +1",
		right_ring="Sangoma Ring",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(3, 5)
	-- Do not remove below argument or the file WILL NOT WORK PROPERLY when reloaded in an escha area--
	if buffactive['Vorseal'] and state.VorsealMode.value == 'Normal' then
	send_command('gs c cycle VorsealMode')
	end
end

--{{Emulator Backend: log_filter=*:Info}}
