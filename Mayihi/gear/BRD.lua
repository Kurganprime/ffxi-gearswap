-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    brd_daggers = S{'Izhiikoh', 'Vanir Knife', 'Atoyac', 'Aphotic Kukri', 'Sabebus'}
    pick_tp_weapon()
    
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Terpander'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
    
    -- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(true, 'Use Custom Timers')
    
    -- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
    send_command('bind !` input /ma "Chocobo Mazurka" <me>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Augmented gear
    --------------------------------------

	Intarabus = {}
	Intarabus.CHR = {name="Intarabus's Cape", augments={'CHR+20','Mag. Acc.+10','"Fast Cast"+10%','Mag. Acc.+20/Mag. Dmg.+20','Damage Taken -5%'}}
    
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {head="Nahtirah Hat",ear2="Loquac. Earring",
        hands="Gendewitha Gages",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {head="Umuthi Hat"})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.BardSong = {main="Felibre's Dague",range="Gjallarhorn",
        head="Fili Calot",neck="Aoidos' Matinee",ear1="Aoidos' Earring",ear2="Loquac. Earring",
        body="Sha'ir Manteel",hands="Gendewitha Gages",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Gendewitha Spats",feet="Bihu Slippers"}

    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
        
    
    -- Precast sets to enhance JAs
    
    sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {range="Gjallarhorn",
        head="Nahtirah Hat",
        body="Gendewitha Bliaut",hands="Buremte Gloves",
        back="Kumbira Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {range="Gjallarhorn",
        head="Nahtirah Hat",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Bihu Justaucorps",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Caudata Belt",legs="Brioso Cannions +2",feet="Gendewitha Galoshes"}
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS)

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS)

    sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS)
    
    
    -- Midcast Sets

    -- General set for recast times.
    sets.midcast.FastRecast = {range="Angel Lyre",
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
        
    -- Gear to enhance certain classes of songs. Remove instruments below if Gjallarhorn is being used.
    sets.midcast.Lullaby = {hands="Brioso Cuffs +2"}
    sets.midcast.Elegy = {range="Syrinx"}
    sets.midcast.Requiem = {range="Requiem Flute"}
    sets.midcast.Ballad = {legs="Fili Rhingrave"}
    sets.midcast.Madrigal = {head="Fili Calot"}
    sets.midcast.March = {hands="Fili Manchettes"}
    sets.midcast.Mambo = {range="Vihuela"}
    sets.midcast.Minuet = {body="Fili Hongreline"}
    sets.midcast.Minne = {range="Syrinx"}
    sets.midcast.Paeon = {range="Oneiros Harp",head="Brioso Roundlet +2"}
    sets.midcast.Carol = {head="Fili Calot",
        body="Fili Hongreline",hands="Fili Manchettes",
        legs="Fili Rhingrave",feet="Fili Cothurnes"}
    sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes"}
    sets.midcast['Magic Finale'] = {neck="Wind Torque",waist="Corvax Sash",legs="Fili Rhingrave"}

    sets.midcast.Mazurka = {range=info.ExtraSongInstrument}
    

    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.SongEffect = {main="Legato Dagger",range="Gjallarhorn",
        head="Fili Calot",neck="Aoidos' Matinee",ear2="Loquacious Earring",
        body="Fili Hongreline",hands="Fili Manchettes",ring1="Prolix Ring",
        back="Harmony Cape",waist="Corvax Sash",legs="Inyanga Shalwar +2",feet="Brioso Slippers +2"}

    -- For song defbuffs (duration primary, accuracy secondary)
    sets.midcast.SongDebuff = {main="Lehbrailg +2",sub="Mephitis Grip",range="Gjallarhorn",
        head="Brioso Roundlet +2",neck="Aoidos' Matinee",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Fili Hongreline",hands="Fili Manchettes",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Intarabus's Cape",waist="Goading Belt",legs="Inyanga Shalwar +2",feet="Brioso Slippers +2"}

    -- For song defbuffs (accuracy primary, duration secondary)
    sets.midcast.ResistantSongDebuff = {main="Lehbrailg +2",sub="Mephitis Grip",range="Gjallarhorn",
        head="Brioso Roundlet +2",neck="Wind Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Brioso Justaucorps +2",hands="Fili Manchettes",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Intarabus's Cape",waist="Demonry Sash",legs="Brioso Cannions +2",feet="Bokwus Boots"}

    -- Song-specific recast reduction
    sets.midcast.SongRecast = {ear2="Loquacious Earring",
        ring1="Prolix Ring",
        back="Harmony Cape",waist="Corvax Sash",legs="Fili Rhingrave"}

    --sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

    -- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {main="Homestead Dagger",range=info.ExtraSongInstrument,
        head="Nahtirah Hat",neck="Wind Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Brioso Justaucorps +2",hands="Fili Manchettes",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Swith Cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Bokwus Boots"}

    -- Other general spells and classes.
    sets.midcast.Cure = {main="Arka IV",sub='Achaq Grip',
        head="Gendewitha Caubeen",
        body="Gendewitha Bliaut",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
        
    sets.midcast.Curaga = sets.midcast.Cure
        
    sets.midcast.Stoneskin = {
        head="Nahtirah Hat",
        body="Gendewitha Bliaut",hands="Gendewitha Gages",
        legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
        
    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",ring1="Ephedra Ring"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main=gear.Staff.HMP, 
        body="Brioso Justaucorps +2",
        legs="Assiduity Pants +1",feet="Chelona Boots +1"}
    
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {main=gear.Staff.PDT, sub="Mephitis Grip",range="Oneiros Harp",
        head="Brioso Roundlet +2",neck="Wiglen Gorget",ear1="Influx Earring",ear2="Moonshade Earring",
        body="Brioso Justaucorps +2",hands="Brioso Cuffs +2",ring1="Shadow Ring",ring2="Ulthalam's Ring",
        back="Intarabus's Cape",waist="Flume Belt",legs="Assiduity Pants +1",feet="Fili Cothurnes"}

    sets.idle.PDT = {main=gear.Staff.PDT, sub="Mephitis Grip",range="Oneiros Harp",
        head="Brioso Roundlet +2",neck="Wiglen Gorget",ear1="Influx Earring",ear2="Moonshade Earring",
        body="Brioso Justaucorps +2",hands="Brioso Cuffs +2",ring1="Shadow Ring",ring2="Ulthalam's Ring",
        back="Umbra Cape",waist="Flume Belt",legs="Assiduity Pants +1",feet="Fili Cothurnes"}

    sets.idle.Town = {main=gear.Staff.PDT, sub="Mephitis Grip",range="Oneiros Harp",
        head="Brioso Roundlet +2",neck="Wiglen Gorget",ear1="Influx Earring",ear2="Moonshade Earring",
        body="Brioso Justaucorps +2",hands="Brioso Cuffs +2",ring1="Shadow Ring",ring2="Ulthalam's Ring",
        back="Intarabus's Cape",waist="Flume Belt",legs="Assiduity Pants +1",feet="Fili Cothurnes"}
    
    sets.idle.Weak = {main=gear.Staff.PDT,sub="Mephitis Grip",range="Oneiros Harp",
        head="Brioso Roundlet +2",neck="Twilight Torque",ear1="Influx Earring",ear2="Moonshade Earring",
        body="Brioso Justaucorps +2",hands="Brioso Cuffs +2",ring1="Shadow Ring",ring2="Ulthalam's Ring",
        back="Intarabus's Cape",waist="Flume Belt",legs="Assiduity Pants +1",feet="Fili Cothurnes"}
    
    sets.Adoulin = {body="Councilor's Garb",}
    
    --sets.MoveSpeed = {feet = "Herald's Gaiters",}
    
    sets.TreasureHunter = {waist="Chaac Belt"}

    -- Defense sets

    sets.defense.PDT = {main=gear.Staff.PDT,sub="Mephitis Grip",
        head="Brioso Roundlet +2",neck="Twilight Torque",
        body="Brioso Justaucorps +2",hands="Brioso Cuffs +2",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Flume Belt",legs="Assiduity Pants +1",feet="Fili Cothurnes"}

    sets.defense.MDT = {main=gear.Staff.PDT,sub="Mephitis Grip",
        head="Nahtirah Hat",neck="Twilight Torque",
        body="Brioso Justaucorps +2",hands="Brioso Cuffs +2",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Assiduity Pants +1",feet="Fili Cothurnes"}

    sets.Kiting = {feet="Fili Cothurnes"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {range="Angel Lyre",
        head="Nahtirah Hat",neck="Sanctity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Bihu Justaucorps",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Goading Belt",legs="Brioso Cannions +2",feet="Gendewitha Galoshes"}

    -- Sets with weapons defined.
    sets.engaged.Dagger = {range="Angel Lyre",
        head="Nahtirah Hat",neck="Sanctity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Bihu Justaucorps",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Goading Belt",legs="Brioso Cannions +2",feet="Gendewitha Galoshes"}

    -- Set if dual-wielding
    sets.engaged.DW = {range="Angel Lyre",
        head="Nahtirah Hat",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Bihu Justaucorps",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Goading Belt",legs="Brioso Cannions +2",feet="Gendewitha Galoshes"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 10)
end