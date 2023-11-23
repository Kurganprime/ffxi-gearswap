-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    gear.default.weaponskill_waist = "Windbuffet Belt"
end

-- Define sets and vars used by this job file.
function init_gear_sets()
 
    --------------------------------------
    -- Precast sets
    --------------------------------------
 
    -- Precast set for calling Trusts at iLVL 119
    sets.precast.Trust = {
		head="Geomancy Galero +2",
		body="Geomancy Tunic +2",
		hands="Geomancy Mitaines +2",
		legs="Geomancy Pants +2",
		feet="Geomancy Sandals +2"}
    sets.midcast.Trust = sets.precast.Trust

    -- Precast sets to enhance JAs-
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic +2"}
    sets.precast.JA['Full Circle'] = {head="Azimuth Hood"}
    sets.precast.JA['Curative Recantation'] = {hands="Bagua Mitaines +1"}
    sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
     
    -- Fast cast sets for spells
 
    sets.precast.FC = {ammo="Impatiens",
        head="Amalric Coif",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
        body="Vanir Cotehardie",ring1="Prolix Ring",ring2="Weatherspoon Ring",
        back="Ogapepo Cape",waist="Witful Belt",legs="Geomancy Pants +2",feet="Amalric Nails"}
 
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Genbu's Shield",back="Pahtli Cape"})
 
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})
 
     
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nahtirah Hat",neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Refraction Cape",waist="Fotia Belt",legs="Hagondes Pants +1",feet="Amalric Nails"}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Flash Nova'] = {ammo="Dosis Tathlum",
        head="Hagondes Hat +1",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Acumen Ring",ring2="Strendu Ring",
        back="Toro Cape",waist="Fotia Belt",legs="Hagondes Pants +1",feet="Amalric Nails"}
 
    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}
 
    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}
 
 
    --------------------------------------
    -- Midcast sets
    --------------------------------------
 
    -- Base fast recast for spells
    sets.midcast.FastRecast = {main="Bolelabunga",sub="Genbu's Shield",
        head="Nahtirah Hat",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
        body="Hagondes Coat +1",hands="Bokwus Gloves",ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Geomancy Pants +2",feet="Regal Pumps +1"}
 
    sets.midcast.Geomancy = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
		head="Azimuth Hood",neck="Incanter's Torque",
		body="Bagua Tunic +1",hands="Geomancy Mitaines +2",
        back="Lifestream Cape",waist="Kobo Obi",legs="Bagua Pants +1",feet="Medium's Sabots"}
     
    sets.midcast.Geomancy.Indi = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Azimuth Hood",neck="Incanter's Torque",
		body="Bagua Tunic +1",hands="Geomancy Mitaines +2",
        back="Lifestream Cape",waist="Kobo Obi",legs="Bagua Pants +1",feet="Azimuth Gaiters"}
     
    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Haoma Ring",ring2="Sirona's Ring",
        back="Swith Cape",legs="Nares Trews",feet="Amalric Nails"}
     
    sets.midcast.Curaga = sets.midcast.Cure
 
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
 
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
     
        -- Elemental Magic sets
     
    sets.midcast['Elemental Magic'] = {main="Bolelabunga",sub="Genbu's Shield",ammo="Dosis Tathlum",
        head="Helios Band",neck="Eddy Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Azimuth Coat",hands="Psycloth Manillas",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Seshaw Cape",waist="Hachirin-no-Obi",legs="Azimuth Tights",feet="Helios Boots"}
 
    sets.midcast['Elemental Magic'].Resistant = {main="Bolelabunga",sub="Genbu's Shield",ammo="Dosis Tathlum",
        head="Helios Band",neck="Eddy Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Azimuth Coat",hands="Psycloth Manillas",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Seshaw Cape",waist="Hachirin-no-Obi",legs="Azimuth Tights",feet="Helios Boots"}
 
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
     
    sets.midcast['Dark Magic'] = {main="Apamajas II",sub="Mephitis grip",
        head="Artsieq Hat",neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Artsieq Jubbah",hands="Lurid Mitts",ring1="Sangoma Ring",ring2="Perception Ring",
        back="Ogapepo Cape",waist="Ovate Robe",legs="Artsieq Hose",feet="Artsieq Boots"}
     
 
 
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
 
    -- Resting sets
    sets.resting = {head="Nefer Khat +1",neck="Sanctity Necklace",
        body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
 
 
    -- Idle sets
 
    sets.idle = {main="Nehushtan",sub="Genbu's Shield",range="Dunna",
        head="Geomancy Galero +2",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Influx Earring",
        body="Jhakri Robe +2",hands="Geomancy Mitaines +2",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Nantosuelta's Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet="Geomancy Sandals +2"}

    -- HQ set
    -- sets.idle = {main="Bhima",sub="Ammurapi Shield",range="Dunna",
    --     head="Merlinic Hood",neck="Bathy Choker +1",ear1="Moonshade Earring",ear2="Infused Earring",
    --     body="Jhakri Robe +2",hands="Bagua Mitaines +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
    --     back="Nantosuelta's Cape",waist="Fucho-no-Obi",legs="Merlinic Shalwar",feet="Merlinic Crackows"}
    -- NQ set
    -- sets.idle = {main="Solstice",sub="Genmei Shield",range="Dunna",
    --     head="Befouled Crown",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Infused Earring",
    --     body="Jhakri Robe +1",hands="Bagua Mitaines +1",ring1="Paguroidea Ring",ring2="Sheltered Ring",
    --     back="Nantosuelta's Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Coalrake Sabots"}
		
    sets.Adoulin = {body="Councilor's Garb",}

    sets.MoveSpeed = {feet = "Geomancy Sandals +2",}

    sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Cheviot Cape",waist="Goading Belt",legs="Nares Trews",feet="Geomancy Sandals +2"}
 
    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Azimuth Hood",neck="Twilight Torque",ear1="Handler's Earring +1",ear2="Ethereal Earring",
        body="Azimuth Coat",hands="Geomancy Mitaines +2",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Nantosuelta's Cape",waist="Goading Belt",legs="Assiduity Pants +1",feet="Bagua Sandals +1"}
 
    sets.idle.PDT.Pet = {main="Bolelabunga",sub="Genbu's Shield",range="Dunna",
        head="Azimuth Hood",neck="Twilight Torque",ear1="Handler's Earring +1",ear2="Ethereal Earring",
        body="Azimuth Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Nantosuelta's Cape",waist="Goading Belt",legs="Assiduity Pants +1",feet="Azimuth Gaiters"}
 
    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {head="Azimuth Hood",legs="Bagua Pants +1",feet="Azimuth Gaiters"})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {head="Azimuth Hood",back="Lifestream Cape",legs="Bagua Pants +1",feet="Azimuth Gaiters"})
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {head="Azimuth Hood",body="Azimuth Coat",back="Lifestream Cape",legs="Bagua Pants +1",feet="Azimuth Gaiters"})
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {head="Azimuth Hood",body="Azimuth Coat",back="Lifestream Cape",legs="Bagua Pants +1",feet="Azimuth Gaiters"})
 
    sets.idle.Town = {main="Nehushtan",sub="Genbu's Shield",range="Dunna",
        head="Geomancy Galero +2",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Influx Earring",
        body="Jhakri Robe +2",hands="Geomancy Mitaines +2",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Nantosuelta's Cape",waist="Slipor Sash",legs="Geomancy Pants +2",feet="Geomancy Sandals +2"}
 
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",range="Nepote Bell",
        head="Nefer Khat +1",neck="Sanctity Necklace",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Cheviot Cape",waist="Goading Belt",legs="Nares Trews",feet="Geomancy Sandals +2"}
 
    -- Defense sets
 
    sets.defense.PDT = {range="Dunna",
        head="Hagondes Hat +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Cheviot Cape",waist="Goading Belt",legs="Hagondes Pants +1",feet="Amalric Nails"}
 
    sets.defense.MDT = {range="Dunna",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Cheviot Cape",waist="Goading Belt",legs="Bokwus Slops",feet="Amalric Nails"}
 
    sets.Kiting = {feet="Geomancy Sandals +2"}
 
    sets.latent_refresh = {waist="Fucho-no-obi"}
 
 
    --------------------------------------
    -- Engaged sets
    --------------------------------------
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
 
    -- Normal melee group
    sets.engaged = {main="Nehushtan",sub="Genbu's Shield",range="Dunna",
    head="Geomancy Galero +2",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Influx Earring",
    body="Geomancy Tunic +2",hands="Geomancy Mitaines +2",ring1="Sheltered Ring",ring2="Paguroidea Ring",
    back="Nantosuelta's Cape",waist="Slipor Sash",legs="Geomancy Pants +2",feet="Geomancy Sandals +2"}
 
    --------------------------------------
    -- Custom buff sets
    --------------------------------------
 
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(10, 3)
end
 
