function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant', 'Proc')
    state.IdleMode:options('Normal', 'PDT')
    
    state.MagicBurst = M(false, 'Magic Burst')

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}
    
    -- Additional local binds
    send_command('bind ^` input /ma Stun <t>')
    send_command('bind @` gs c activate MagicBurst')

    select_default_macro_book()
end

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {feet="Wicce Sabots"}

    sets.precast.JA.Manafont = {body="Archmage's Coat"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {ammo="Impatiens",
        head="Welkin Crown",ear1="Loquacious Earring",ear2="Barkarole Earring",
        body="Vanir Cotehardie",ring1="Weatherspoon Ring",ring2="Prolix Ring",
        back="Ogapepo Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Amalric Nails"}
		--{ammo="Sapience Orb",
        --head="Merlinic Hood",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Enchanter Earring +1",
        --body="Zendik Robe",hands="Merlinic Dastanas",ring1="Weatherspoon Ring",ring2="Rahab Ring",
        --back="Perimede Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Merlinic Crackows"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, 
		{waist="Siegel Sash"})
		--{waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC,
		{head="Wicce Petasos",ear1="Barkarole Earring",neck="Stoicheion Medal"})
		--{neck="Stoicheion Medal"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, 
		{head="Telchine Cap",body="Vanir Cotehardie",back="Pahtli Cape",feet="Telchine Pigaches"})
		--{body="Heka's Kalasiris", back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Hagondes Hat +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Enlivened Ring",
        back="Goetia Mantle",waist="Cognition Belt",legs="Hagondes Pants +1",feet="Amalric Nails"}
		--{
        --head="Hagondes Hat +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Icesoul Ring",
        --back="Refraction Cape",waist="Cognition Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {ammo="Ghastly Tathlum",
        head="Amalric Coif",neck="Eddy Necklace",ear1="Moonshade Earring",ear2="Hecate's Earring",
        body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist="Shinjutsu-no-Obi",legs="Amalric Slops",feet="Amalric Nails"}
		--{ammo="Ghastly Tathlum +1",
        --head="Amalric Coif +1",neck="Orunmila's Torque",ear1="Moonshade Earring",ear2="Etiolation Earring",
        --body="Amalric Doublet +1",hands="Otomi Gloves",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
        --back="Bane Cape",waist="Shinjutsu-no-Obi +1",legs="Amalric Slops +1",feet="Amalric Nails +1"}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {
        head="Hagondes Hat +1",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Amalric Gages",ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}
		--{
        --head="Nahtirah Hat",ear2="Loquacious Earring",
        --body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Prolix Ring",
        --back="Swith Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        head="Hagondes Hat +1",neck="Colossus's Torque",ear2="Loquacious Earring",
        body="Telchine Chasuble",hands="Telchine Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",waist=gear.ElementalObi,legs="Hagondes Pants +1",feet="Medium's Sabots"}
		--{main="Tamaxchi",sub="Genbu's Shield",
        --head="Nahtirah Hat",neck="Colossus's Torque",ear2="Loquacious Earring",
        --body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        --back="Pahtli Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
		head="Befouled Crown",neck="Colossus's Torque",
        body="Manasa Chasuble",hands="Ayao's Gages",
        legs="Portent Pants"}
		--{
        --neck="Colossus's Torque",
        --body="Manasa Chasuble",hands="Ayao's Gages",
        --legs="Portent Pants"}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], 
		{waist="Siegel Sash"})
		--{waist="Siegel Sash"})

    sets.midcast['Enfeebling Magic'] = {main="Venabulum",sub="Elder's Grip +1",ammo="Kalboron Stone",
        head="Befouled Crown",neck="Imbodla Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanya Robe",hands="Lurid Mitts",ring1="Globidonta Ring",ring2="Weatherspoon Ring",
        back="Refraction Cape",waist="Luminary Sash",legs="Psycloth Lappas",feet="Medium's Sabots"}
		--{main="Lathi",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        --head="Merlinic Hood",neck="Imbodla Necklace",ear1="Barkarole Earring",ear2="Dignitary's Earring",
        --body="Vanya Robe",hands="Lurid Mitts",ring1="Globidonta Ring",ring2="Weatherspoon Ring",
        --back="Taranus's Cape",waist="Luminary Sash",legs="Psycloth Lappas",feet="Medium's Sabots"}
        
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = {main="Venabulum",sub="Mephitis Grip",ammo="Sturm's Report",
        head="Hagondes Hat +1",neck="Incanter's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Archmage's Gloves",ring1="Evanescence Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Yamabuki-no-Obi",legs="Spaekona's Tonban +1",feet="Wicce Sabots"}
		--{main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
        --head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        --body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        --back="Refraction Cape",waist="Goading Belt",legs="Bokwus Slops",feet="Bokwus Boots"}

    sets.midcast.Drain = {main="Venabulum",sub="Mephitis Grip",ammo="Sturm's Report",
        head="Hagondes Hat +1",neck="Incanter's Torque",ear1="Hirudinea Earring",ear2="Barkarole Earring",
        body="Vanir Cotehardie",hands="Archmage's Gloves",ring1="Evanescence Ring",ring2="Sangoma Ring",
        back="Bane Cape",waist="Fucho-no-Obi",legs="Bokwus Slops",feet="Wicce Sabots"}
		--{main="Lathi",sub="Niobid Grip",ammo="Pemphredo Tathlum",
        --head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Hirudinea Earring",ear2="Barkarole Earring",
        --body="Merlinic Jubbah",hands="Merlinic Dastanas",ring1="Archon Ring",ring2="Evanescence Ring",
        --back="Bane Cape",waist="Fucho-no-Obi",legs="Merlinic Shalwar",feet="Merlinic Crackows"}
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {main="Venabulum",sub="Mephitis Grip",ammo="Sturm's Report",
        head="Hagondes Hat +1",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Bokwus Boots"}
		--{main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
        --head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        --body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        --back="Refraction Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Bokwus Boots"}

    sets.midcast.BardSong = {main="Venabulum",sub="Mephitis Grip",ammo="Sturm's Report",
        head="Hagondes Hat +1",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",legs="Bokwus Slops",feet="Bokwus Boots"}
		--{main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
        --head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        --body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        --back="Refraction Cape",legs="Bokwus Slops",feet="Bokwus Boots"}

		-- Death Magic sets

    sets.precast.Death = {main="Venabulum",sub="Mephitis Grip",ammo="Ghastly Tathlum",
        head="Amalric Coif",neck="Sanctity Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Spaekona's Coat +1",hands="Amalric Gages",ring1="Acumen Ring",ring2="Shiva Ring",
        back="Toro Cape",waist="Refoccilation Stone",legs="Amalric Slops",feet="Amalric Nails"}
		--{main="Lathi",sub="Niobid Strap",ammo="Psilomene",
        --head="Amalric Coif +1",neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Etiolation Earring",
        --body="Merlinic Jubbah",hands="Otomi Gloves",ring1="Mephitas's Ring +1",ring2="Weatherspoon Ring",
        --back="Bane Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Merlinic Crackows"}

	sets.midcast.Death = {main="Venabulum",sub="Mephitis Grip",ammo="Ghastly Tathlum",
        head="Amalric Coif",neck="Mizukage-no-Kubikazari",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Spaekona's Coat +1",hands="Amalric Gages",ring1="Acumen Ring",ring2="Shiva Ring",
        back="Toro Cape",waist="Refoccilation Stone",legs="Amalric Slops",feet="Amalric Nails"}
		--{main="Grioavoir",sub="Niobid Strap",ammo="Psilomene",
        --head="Pixie Hairpin +1",neck="Mizukage-no-Kubikazari",ear1="Barkarole Earring",ear2="Static Earring",
        --body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Mephitas's Ring +1",ring2="Archon Ring",
        --back="Taranus's Cape",waist="Hachirin-no-Obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}

		-- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {main="Venabulum",sub="Willpower Grip",ammo="Ghastly Tathlum",
        head="Amalric Coif",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Spaekona's Coat +1",hands="Amalric Gages",ring1="Acumen Ring",ring2="Shiva Ring",
        back="Toro Cape",waist="Refoccilation Stone",legs="Amalric Slops",feet="Amalric Nails"}
		--{main="Lathi",sub="Alber Strap",ammo="Pemphredo Tathlum",
        --head="Merlinic Hood",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        --body="Merlinic Jubbah",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        --back="Taranus's Cape",waist="Refoccilation Stone",legs="Amalric Slops +1",feet="Merlinic Crackows"}

    sets.midcast['Elemental Magic'].Resistant = {main="Venabulum",sub="Mephitis Grip",ammo="Ghastly Tathlum",
        head="Amalric Coif",neck="S-anctity Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Spaekona's Coat +1",hands="Amalric Gages",ring1="Acumen Ring",ring2="Shiva Ring",
        back="Toro Cape",waist="Refoccilation Stone",legs="Amalric Slops",feet="Amalric Nails"}
		--{main="Lathi",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        --head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
        --body="Merlinic Jubbah",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        --back="Taranus's Cape",waist="Eschan Stone",legs="Merlinic Shalwar",feet="Merlinic Crackows"}

    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], 
		{sub="Willpower Grip"})
		--{sub="Wizzan Grip"})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], 
		{sub="Mephitis Grip"})
		--{sub="Wizzan Grip"})

    -- Minimal damage gear for procs.
    sets.midcast['Elemental Magic'].Proc = {main="Terra's Staff", sub="Mephitis Grip",ammo="Impatiens",
        head="Hagondes Hat +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Manasa Chasuble",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Swith Cape",waist="Witful Belt",legs="Nares Trews",feet="Serpentes Sabots"}
		--{main="Earth Staff", sub="Mephitis Grip",ammo="Impatiens",
        --head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        --body="Manasa Chasuble",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Swith Cape",waist="Witful Belt",legs="Nares Trews",feet="Chelona Boots +1"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Pluto's Staff",ammo="Clarus Stone",
        head="Hagondes Hat +1",neck="Grandiose Chain",
        body="Hagondes Coat +1",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Shinjutsu-no-Obi",legs="Hagondes Pants +1",feet="Serpentes Sabots"}
		--{main="Chatoyant Staff",ammo="Clarus Stone",
        --head="Nefer Khat +1",neck="Grandiose Chain",
        --body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --waist="Austerity Belt",legs="Nares Trews",feet="Serpentes Sabots"}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {main="Venabulum", sub="Mephitis Grip",ammo="Ghastly Tathlum",
        head="Befouled Crown",neck="Wiglen Gorget",ear1="Infused Earring",ear2="Loquacious Earring",
        body="Hagondes Coat +1",hands="Serpentes Cuffs",ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Fucho-no-obi",legs="Hagondes Pants +1",feet="Serpentes Sabots"}
		--{main="Lehbrailg +2", sub="Zuuxowu Grip",ammo="Impatiens",
        --head="Nefer Khat +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        --body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Herald's Gaiters"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main="Terra's Staff", sub="Zuuxowu Grip",ammo="Ghastly Tathlum",
        head="Befouled Crown",neck="Twilight Torque",ear1="Infused Earring",ear2="Loquacious Earring",
        body="Hagondes Coat +1",hands="Amalric Gages",ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Fucho-no-obi",legs="Hagondes Pants +1",feet="Amalric Nails"}
		--{main="Earth Staff", sub="Zuuxowu Grip",ammo="Impatiens",
        --head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        --body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        --back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Herald's Gaiters"}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Ghastly Tathlum",
        head="Befouled Crown",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat +1",hands="Serpentes Cuffs",ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Fucho-no-obi",legs="Hagondes Pants +1",feet="Serpentes Sabots"}
		--{main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
        --head="Hagondes Hat +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        --body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        --back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Hagondes Sabots"}
    
    -- Town gear.
    sets.idle.Town = {main="Venabulum",sub="Mephitis Grip",ammo="Ghastly Tathlum",
        head="Befouled Crown",neck="Wiglen Gorget",ear1="Infused Earring",ear2="Loquacious Earring",
        body="Hagondes Coat +1",hands="Serpentes Cuffs",ring1="Succor Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Yamabuki-no-obi",legs="Hagondes Pants +1",feet="Serpentes Sabots"}
		--{main="Lehbrailg +2", sub="Zuuxowu Grip",ammo="Impatiens",
        --head="Hagondes Hat +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        --body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Herald's Gaiters"}
        
    -- Defense sets

    sets.defense.PDT = {main="Terra's Staff",sub="Zuuxowu Grip",
        head="Hagondes Hat +1",neck="Twilight Torque",
        body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Bane Cape",waist="Yamabuki-no-obi",legs="Hagondes Pants +1",feet="Hagondes Sabots"}
		--{main="Earth Staff",sub="Zuuxowu Grip",
        --head="Nahtirah Hat",neck="Twilight Torque",
        --body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        --back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Hagondes Hat +1",neck="Twilight Torque",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Tuilha Cape",waist="Yamabuki-no-obi",legs="Bokwus Slops",feet="Hagondes Sabots"}
		--{ammo="Demonry Stone",
        --head="Nahtirah Hat",neck="Twilight Torque",
        --body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        --back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {feet="Wicce Sabots"}

    sets.magic_burst = {neck="Mizukage-no-Kubikazari",ring1="Locus Ring",ring2="Mujin Band"} --{neck="Mizukage-no-Kubikazari"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat +1",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Bane Cape",waist="Goading Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}
		--{
        --head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Hagondes Coat +1",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        --back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
end

function select_default_macro_book()
    set_macro_page(1, 4)
end