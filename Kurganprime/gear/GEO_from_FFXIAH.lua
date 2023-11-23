function init_gear_sets()
 
    --------------------------------------
    -- Precast sets
    --------------------------------------
 
    -- Precast sets to enhance JAs-
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic +1"}
    sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1"}
    sets.precast.JA['Curative Recantation'] = {hands="Bagua Mitaines +1"}
    sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
     
    -- Fast cast sets for spells
 
    sets.precast.FC = {main="",sub="",ammo="I",
        head="Nahtirah Hat",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
        body="Anhur Robe",ring1="Prolix Ring",ring2="Weatherspoon Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Geomancy Pants +1",feet="Regal Pumps +1"}
 
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Genbu's Shield",back="Pahtli Cape"})
 
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})
 
     
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nahtirah Hat",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Refraction Cape",waist=gear.ElementalBelt,legs="Hagondes Pants",feet="Hagondes Sabots"}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Flash Nova'] = {ammo="Dosis Tathlum",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Acumen Ring",ring2="Strendu Ring",
        back="Toro Cape",waist="Snow Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
 
    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}
 
    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}
 
 
    --------------------------------------
    -- Midcast sets
    --------------------------------------
 
    -- Base fast recast for spells
    sets.midcast.FastRecast = {main="Idris",sub="Genbu Shield",
        head="Nahtirah Hat",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
        body="Hagondes Coat +1",hands="Bokwus Gloves",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Geomancy Pants +1",feet="Regal Pumps +1"}
 
    sets.midcast.Geomancy = {main="Idris",range="Dunna",
    head="Azimuth Hood +1",body="Bagua Tunic +1",hands="Geomancy Mitaines +1",
        back="Lifestream Cape",legs="Bagua Pants +1",feet="Medium's Sabots"}
     
    sets.midcast.Geomancy.Indi = {main="Idris",range="Dunna",
        head="Azimuth Hood +1",body="Bagua Tunic +1",hands="Geomancy Mitaines +1",
        back="Lifestream Cape",legs="Bagua Pants +1",feet="Azimuth Gaiters +1"}
     
    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Haoma Ring",ring2="Sirona's Ring",
        back="Swith Cape +1",legs="Nares Trews",feet="Hagondes Sabots"}
     
    sets.midcast.Curaga = sets.midcast.Cure
 
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
 
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
     
        -- Elemental Magic sets
     
    sets.midcast['Elemental Magic'] = {main="Idris",sub="Genbu Shield",ammo="Dosis Tathlum",
        head="Helios Band",neck="Eddy Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Azimuth Coat +1",hands="Psycloth Manillas",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Seshaw Cape",waist=gear.ElementalObi,legs="Azimuth Tights +1",feet="Helios Boots"}
 
    sets.midcast['Elemental Magic'].Resistant = {main="Idris",sub="Genbu Shield",ammo="Dosis Tathlum",
        head="Helios Band",neck="Eddy Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Azimuth Coat +1",hands="Psycloth Manillas",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Seshaw Cape",waist=gear.ElementalObi,legs="Azimuth Tights +1",feet="Helios Boots"}
 
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
     
    sets.midcast['Dark Magic'] = {main="Apamajas II",sub="mephitis grip",
        head="Artsieq hat",neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Artsieq Jubbah",hands="Lurid mitts",ring1="sangoma ring",ring2="Perception ring",
        back="Ogapepo cape",waist="ovate robe",legs="Artsieq hose",feet="Artsieq boots"}
     
 
 
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
 
    -- Resting sets
    sets.resting = {head="Nefer Khat +1",neck="Wiglen Gorget",
        body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
 
 
    -- Idle sets
 
    sets.idle = {main="Idris",sub="Genbu's Shield",range="Dunna",
        head="Azimuth Hood +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Azimuth Coat +1",hands="Bagua Mitaines +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Assiduity Pants +1",feet="Herald's Gaiters"}
 
    sets.idle.PDT = {main="Idris",sub="Genbu's Shield",range="Dunna",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Azimuth Coat +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Nares Trews",feet="Herald's Gaiters"}
 
    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = {main="Idris",sub="Genbu's Shield",range="Dunna",
        head="Azimuth Hood +1",neck="Twilight Torque",ear1="Handler's Earring +1",ear2="Ethereal Earring",
        body="Azimuth Coat +1",hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Lifestream Cape",waist="Goading Belt",legs="Assiduity Pants +1",feet="Bagua Sandals +1"}
 
    sets.idle.PDT.Pet = {main="Idris",sub="Genbu's Shield",range="Dunna",
        head="Azimuth Hoot +1",neck="Twilight Torque",ear1="Handler's Earring +1",ear2="Ethereal Earring",
        body="Azimuth Coat +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Lifestream Cape",waist="Goading Belt",legs="Assiduity Pants +1",feet="Azimuth Gaiters"}
 
    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {head="Azimuth ",legs="Bagu",feet="Azimu"})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {head="Azi",back="Lifese",legs="Ba",feet="Azim"})
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {head="Azimuth Hood +1",body="Azimuth Coat +1",back="Lifestream Cape",legs="Bagua Pants +1",feet="Azimuth Gaiters"})
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {head="Azimuth Hood +1",body="Azimuth Coat +1",back="Lifestream Cape",legs="Bagua Pants +1",feet="Azimuth Gaiters +1"})
 
    sets.idle.Town = {main="Idris",sub="Genbu's Shield",range="Dunna",
        head="",neck="Wiglen Gorget",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
        body="Respite Cloak",hands="Geomancy Mitaines +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}
 
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",range="Nepote Bell",
        head="Nefer Khat +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Nares Trews",feet="Geomancy Sandals +1"}
 
    -- Defense sets
 
    sets.defense.PDT = {range="Dunna",
        head="Hagondes Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
 
    sets.defense.MDT = {range="Dunna",
        head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}
 
    sets.Kiting = {feet="Herald's Gaiters"}
 
    sets.latent_refresh = {waist="Fucho-no-obi"}
 
 
    --------------------------------------
    -- Engaged sets
    --------------------------------------
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
 
    -- Normal melee group
    sets.engaged = {main="Idris",range="Dunna",
        head="Zelus Tiara",neck="Peacock Charm",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
 
    --------------------------------------
    -- Custom buff sets
    --------------------------------------
 
end