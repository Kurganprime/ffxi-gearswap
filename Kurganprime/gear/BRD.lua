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

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {head="Nahtirah Hat",ear2="Loquacious Earring",
        hands="Gendewitha Gages",ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {head="Umuthi Hat"})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.BardSong = {main="Felibre's Dague",range="Eminent Flute",
        head="Fili Calot",neck="Aoidos' Matinee",ear1="Aoidos' Earring",ear2="Loquacious Earring",
        body="Sha'ir Manteel",hands="Gendewitha Gages",ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Gendewitha Spats",feet="Bihu Slippers"}

    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
        
    
    -- Precast sets to enhance JAs
    
    sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {range="Eminent Flute",
        head="Nahtirah Hat",
        body="Gendewitha Bliaut",hands="Buremte Gloves",
        back="Kumbira Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {range="Eminent Flute",
        head="Nahtirah Hat",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Bihu Justaucorps",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Caudata Belt",legs="Brioso Cannions",feet="Gendewitha Galoshes"}
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS)

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS)

    sets.precast.WS['Mordant Rime'] = set_combine(sets.precast.WS)
    
    
    -- Midcast Sets

    -- General set for recast times.
    sets.midcast.FastRecast = {range="Angel Lyre",
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
        back="Swith Cape",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
        
    -- Gear to enhance certain classes of songs.  No instruments should be added here if Gjallarhorn is being used.
    sets.midcast.Ballad = {legs="Fili Rhingrave"}
    sets.midcast.Lullaby = {range="Nursemaid's Harp",hands="Brioso Cuffs"}
    sets.midcast.Madrigal = {head="Fili Calot"}
    sets.midcast.March = {hands="Fili Manchettes"}
    sets.midcast.Minuet = {body="Fili Hongreline"}
    sets.midcast.Minne = {range="Syrinx"}
    sets.midcast.Paeon = {range="Oneiros Harp",head="Brioso Roundlet"}
    sets.midcast.Carol = {head="Fili Calot",
        body="Fili Hongreline",hands="Fili Manchettes",
        legs="Fili Rhingrave",feet="Fili Cothurnes"}
    sets.midcast["Sentinel's Scherzo"] = {range="Eminent Flute",feet="Fili Cothurnes"}
    sets.midcast['Magic Finale'] = {range="Eminent Flute",neck="Wind Torque",waist="Corvax Sash",legs="Fili Rhingrave"}

    sets.midcast.Mazurka = {range=info.ExtraSongInstrument}
    

    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.SongEffect = {main="Legato Dagger",range="Eminent Flute",
        head="Fili Calot",neck="Aoidos' Matinee",ear1="Aoidos' Earring",ear2="Loquacious Earring",
        body="Fili Hongreline",hands="Fili Manchettes",ring1="Prolix Ring",
        back="Harmony Cape",waist="Corvax Sash",legs="Fili Rhingrave",feet="Bihu Slippers"}

    -- For song debuffs (duration primary, accuracy secondary)
    sets.midcast.SongDebuff = {main="Lehbrailg +2",sub="Achaq Grip",range="Eminent Flute",
        head="Brioso Roundlet",neck="Aoidos' Matinee",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Fili Hongreline",hands="Fili Manchettes",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Kumbira Cape",waist="Goading Belt",legs="Fili Rhingrave",feet="Bihu Slippers"}

    -- For song debuffs (accuracy primary, duration secondary)
    sets.midcast.ResistantSongDebuff = {main="Lehbrailg +2",sub="Achaq Grip",range="Eminent Flute",
        head="Brioso Roundlet",neck="Wind Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Brioso Justaucorps",hands="Fili Manchettes",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Kumbira Cape",waist="Demonry Sash",legs="Brioso Cannions",feet="Bokwus Boots"}

    -- Song-specific recast reduction
    sets.midcast.SongRecast = {ear2="Loquacious Earring",
        ring1="Prolix Ring",
        back="Harmony Cape",waist="Corvax Sash",legs="Fili Rhingrave"}

    --sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

    -- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {main="Izhiikoh",range=info.ExtraSongInstrument,
        head="Brioso Roundlet",neck="Twilight Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Brioso Justaucorps",hands="Bard's Cuffs",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Swith Cape",waist="Goading Belt",legs="Bard's Cannion's +1",feet="Bard's Slippers"}

    -- Other general spells and classes.
    sets.midcast.Cure = {main="Arka IV",sub='Achaq Grip',
        head="Gendewitha Caubeen",
        body="Gendewitha Bliaut",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
        
    sets.midcast.Curaga = sets.midcast.Cure
        
    sets.midcast.Stoneskin = {
        head="Nahtirah Hat",
        body="Gendewitha Bliaut",hands="Gendewitha Gages",
        waist="Siegel Sash",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
        
    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",ring1="Ephedra Ring"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main=gear.Staff.HMP, 
        body="Gendewitha Bliaut",
        legs="Nares Trews",feet="Chelona Boots +1"}
    
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {main=gear.Staff.PDT, sub="Achaq Grip",range="Oneiros Harp",
        head="Gendewitha Caubeen",neck="Sanctity Necklace",ear1="Aoidos' Earring",ear2="Loquacious Earring",
        body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    sets.idle.PDT = {main=gear.Staff.PDT, sub="Achaq Grip",range="Oneiros Harp",
        head="Fili Calot",neck="Aoidos' Matinee",ear1="Aoidos' Earring",ear2="Loquacious Earring",
        body="Fili Hongreline",hands="Fili Manchettes",ring1="Paguroidea Ring",ring2="Sangoma Ring",
        back="Rhapsode's Cape",waist="Aoidos' Belt",legs="Fili Rhingrave",feet="Fili Cothurnes"}

    sets.idle.Town = {main=gear.Staff.PDT, sub="Achaq Grip",range="Terpander",
        head="Fili Calot",neck="Aoidos' Matinee",ear1="Aoidos' Earring",ear2="Loquacious Earring",
        body="Fili Hongreline",hands="Fili Manchettes",ring1="Carbuncle Ring",ring2="Carbuncle Ring",
        back="Rhapsode's Cape",waist="Aoidos' Belt",legs="Fili Rhingrave",feet="Fili Cothurnes"}
    
    sets.idle.Weak = {main=gear.Staff.PDT, sub="Achaq Grip",range="Oneiros Harp",
        head="Fili Calot",neck="Aoidos' Matinee",ear1="Aoidos' Earring",ear2="Loquacious Earring",
        body="Fili Hongreline",hands="Fili Manchettes",ring1="Paguroidea Ring",ring2="Sangoma Ring",
        back="Rhapsode's Cape",waist="Aoidos' Belt",legs="Fili Rhingrave",feet="Fili Cothurnes"}
    
    
    -- Defense sets

    sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
        head="Gendewitha Caubeen",neck="Twilight Torque",
        body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Flume Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
        head="Nahtirah Hat",neck="Twilight Torque",
        body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Bihu Cannions",feet="Gendewitha Galoshes"}

    sets.Kiting = {feet="Fili Cothurnes"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {range="Angel Lyre",
        head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Bihu Justaucorps",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Goading Belt",legs="Brioso Cannions",feet="Gendewitha Galoshes"}

    -- Sets with weapons defined.
    sets.engaged.Dagger = {range="Angel Lyre",
        head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Bihu Justaucorps",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Goading Belt",legs="Brioso Cannions",feet="Gendewitha Galoshes"}

    -- Set if dual-wielding
    sets.engaged.DW = {range="Angel Lyre",
        head="Nahtirah Hat",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Bihu Justaucorps",hands="Buremte Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Goading Belt",legs="Brioso Cannions",feet="Gendewitha Galoshes"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 10)
end