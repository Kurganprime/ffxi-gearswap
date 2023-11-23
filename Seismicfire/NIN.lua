-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false

    state.Moving  = M(false, "moving")

    include('Mote-TreasureHunter')

    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Hachiya Kyahan +1"
    
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = {ring1="Gorney Ring",waist="Chaac Belt"}
    sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
    sets.Kiting = {feet=gear.MovementFeet}

    sets.buff['Sneak Attack'] = {}

    sets.buff['Trick Attack'] = {}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Custom buff duration sets
    --------------------------------------

    sets.buff.Migawari = {body="Iga Ningi +2"}
    sets.buff.Doom = {ring2="Saida Ring"}
    sets.buff.Yonin = {}
    sets.buff.Innin = {}

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +1"}
    sets.precast.JA['Futae'] = {legs="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Felistris Mask",
        body="Hachiya Chainmail +1",hands="Buremte Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}
        -- Uk'uxkaj Cap, Daihanshi Habaki
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {
        head="Whirlpool Mask",neck="Ej Necklace",
        body="Otronif Harness +1",hands="Buremte Gloves",ring1="Patricius Ring",
        back="Yokaze Mantle",waist="Chaac Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}

    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",ear2="Loquacious Earring",hands="Thaumas Gloves",ring1="Prolix Ring"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochizuki Chainmail"})

    -- Snapshot for ranged
    sets.precast.RA = {hands="Manibozho Gloves",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Qaaxo Harness",hands="Mochizuki Tekko +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist=gear.ElementalBelt,legs="Manibozho Brais",feet="Otronif Boots +1"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Jukukik Feather",hands="Buremte Gloves",
        back="Yokaze Mantle"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS,
        {neck="Rancor Collar",ear1="Brutal Earring",ear2="Moonshade Earring",feet="Daihanshi Habaki"})

    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS,
        {head="Felistris Mask",hands="Hachiya Tekko +1",ring1="Stormsoul Ring",legs="Nahtirah Trousers"})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {feet="Daihanshi Habaki"})


    sets.precast.WS['Aeolian Edge'] = {
        head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Acumen Ring",ring2="Demon's Ring",
        back="Toro Cape",waist="Thunder Belt",legs="Shneddick Tights +1",feet="Daihanshi Habaki"}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Felistris Mask",ear2="Loquacious Earring",
        body="Hachiya Chainmail +1",hands="Mochizuki Tekko +1",ring1="Prolix Ring",
        legs="Hachiya Hakama +1",feet="Qaaxo Leggings"}
        
    sets.midcast.Utsusemi = set_combine(sets.midcast.SelfNinjutsu, {feet="Hattori Kyahan +1"})

    sets.midcast.ElementalNinjutsu = {
        head="Hachiya Hatsuburi +1",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hachiya Chainmail +1",hands="Hattori Tekko +1",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist=gear.ElementalObi,legs="Nahtirah Trousers",feet="Hachiya Kyahan +1"}

    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.Ninjutsu, {ear1="Lifestorm Earring",ear2="Psystorm Earring",
        back="Yokaze Mantle"})

    sets.midcast.NinjutsuDebuff = {
        head="Hachiya Hatsuburi +1",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        hands="Mochizuki Tekko +1",ring2="Sangoma Ring",
        back="Yokaze Mantle",feet="Hachiya Kyahan +1"}

    sets.midcast.NinjutsuBuff = {head="Hachiya Hatsuburi +1",neck="Ej Necklace",back="Yokaze Mantle"}

    sets.midcast.RA = {
        head="Felistris Mask",neck="Ej Necklace",
        body="Hachiya Chainmail +1",hands="Hachiya Tekko +1",ring1="Beeline Ring",
        back="Yokaze Mantle",legs="Nahtirah Trousers",feet="Qaaxo Leggings"}
    -- Hachiya Hakama/Thurandaut Tights +1

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
        ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    
    -- Idle sets
    sets.idle = {
        head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Hachiya Hakama +1",feet=gear.MovementFeet}

    sets.idle.Town = {main="Raimitsukane",sub="Kaitsuburi",ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Atheling Mantle",waist="Patentia Sash",legs="Hachiya Hakama +1",feet=gear.MovementFeet}
    
    sets.idle.Weak = {
        head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Hachiya Hakama +1",feet=gear.MovementFeet}
    
    sets.Adoulin = {body="Councilor's Garb",}

    sets.DayMovement = {feet = gear.DayFeet,}
    sets.NightMovement = {feet = gear.NightFeet,}
	
    -- Defense sets
    sets.defense.Evasion = {
        head="Felistris Mask",neck="Ej Necklace",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Beeline Ring",
        back="Yokaze Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Whirlpool Mask",neck="Twilight Torque",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Whirlpool Mask",neck="Twilight Torque",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

    sets.Kiting = {feet="Danzo Sune-Ate",}

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Qirmiz Tathlum",
        head="Iga Zukin +2",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Patentia Sash",legs="Mochizuki Hakama",feet="Otronif Boots +1"}
    sets.engaged.Acc = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Mochizuki Chainmail",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Manibozho Boots"}
    sets.engaged.Evasion = {ammo="Qirmiz Tathlum",
        head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.Acc.Evasion = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.PDT = {ammo="Qirmiz Tathlum",
        head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

    -- Custom melee group: High Haste (~20% DW)
    sets.engaged.HighHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Manibozho Boots"}
    sets.engaged.Acc.HighHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Mochizuki Chainmail",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Manibozho Boots"}
    sets.engaged.Evasion.HighHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.Acc.Evasion.HighHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.PDT.HighHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT.HighHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

    -- Custom melee group: Embrava Haste (7% DW)
    sets.engaged.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Acc.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Mochizuki Chainmail",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Evasion.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.Acc.Evasion.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.PDT.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Otronif Boots +1"}

    -- Custom melee group: Max Haste (0% DW)
    sets.engaged.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Qaaxo Harness",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Acc.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Evasion.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.Acc.Evasion.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.PDT.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Otronif Boots +1"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
        equip(sets.TreasureHunter)
    elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
end

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
        equip(sets.TreasureHunter)
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Weaponskills wipe SATA/Feint.  Turn those state vars off before default gearing is attempted.
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
end

function select_movement()
    -- world.time is given in minutes into each day
    -- 7:00 AM would be 420 minutes
    -- 17:00 PM would be 1020 minutes
    if world.time >= (17*60) or world.time <= (7*60) then
        return sets.NightMovement
    else
        return sets.DayMovement
    end
end

-- mov = {counter=0}
-- if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
--     mov.x = windower.ffxi.get_mob_by_index(player.index).x
--     mov.y = windower.ffxi.get_mob_by_index(player.index).y
--     mov.z = windower.ffxi.get_mob_by_index(player.index).z
-- end

-- moving = false
-- windower.raw_register_event('prerender',function()
--     mov.counter = mov.counter + 1;
-- 	if buffactive['Mana Wall'] then
-- 		moving = false
--     elseif mov.counter>15 then
--         local pl = windower.ffxi.get_mob_by_index(player.index)
--         if pl and pl.x and mov.x then
--             dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
--             if dist > 1 and not moving then
--                 state.Moving.value = true
--                 send_command('gs c update')
-- 				if world.area:contains("Adoulin") then
--                 send_command('gs equip sets.Adoulin')
-- 				elseif world.time >= 7*60 and world.time < 17*60 then
--                 send_command('gs equip sets.MoveSpeedDay')
-- 				else
-- 				send_command('gs equip sets.MoveSpeedNight')
--                 end

--         moving = true

--             elseif dist < 1 and moving then
--                 state.Moving.value = false
--                 send_command('gs c update')
--                 moving = false
--             end
--         end
--         if pl and pl.x then
--             mov.x = pl.x
--             mov.y = pl.y
--             mov.z = pl.z
--         end
--         mov.counter = 0
--     end
-- end)

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)    	
    if player.equipment.back == 'Nexus Cape' 
	or player.equipment.back == 'Mecisto. Mantle' 
	or player.equipment.back == 'Aptitude Mantle' 
	or player.equipment.back == 'Aptitude Mantle +1' 
	then
        disable('back')
    else
        enable('back')
    end

	if player.equipment.ring1 == 'Warp Ring' 
	or player.equipment.ring1 == 'Vocation Ring' 
	or player.equipment.ring1 == 'Capacity Ring' 
	or player.equipment.ring1 == 'Echad Ring'
	or player.equipment.ring1 == 'Trizek Ring'
	or player.equipment.ring1 == 'Facility Ring' 
	or player.equipment.ring1 == 'Caliber Ring'
	or player.equipment.ring1 == 'Resolution Ring'
	then
        disable('ring1')
    else
        enable('ring1')
    end
	
    if player.equipment.ring2 == 'Warp Ring' 
	or player.equipment.ring2 == 'Vocation Ring' 
	or player.equipment.ring2 == 'Capacity Ring' 
	or player.equipment.ring2 == 'Echad Ring'
	or player.equipment.ring2 == 'Trizek Ring'
	or player.equipment.ring2 == 'Facility Ring' 
	or player.equipment.ring2 == 'Caliber Ring'
	or player.equipment.ring2 == 'Resolution Ring'
	then
        disable('ring2')
    else
        enable('ring2')
    end

    if player.equipment.ear1 == 'Reraise Earring' 
	then
        disable('ear1')
    else
        enable('ear1')
    end

    if player.equipment.ear2 == 'Reraise Earring' 
	then
        disable('ear2')
    else
        enable('ear2')
    end

    if player.equipment.neck == "Adoulin's Refuge"
    or player.equipment.neck == "Adoulin's Refuge +1"
    or player.equipment.neck == "Arciela's Grace"
    or player.equipment.neck == "Arciela's Grace +1"
    or player.equipment.neck == "Ygnas's Resolve"
    or player.equipment.neck == "Ygnas's Resolve +1"
	then
        disable('neck')
    else
        enable('neck')
    end
	
    if player.equipment.sub == 'Senkutanto' 
	then
        disable('sub')
    else
        enable('sub')
    end
	
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Get custom spell maps
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == "Ninjutsu" then
        if not default_spell_map then
            if spell.target.type == 'SELF' then
                return 'NinjutsuBuff'
            else
                return 'NinjutsuDebuff'
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    -- Regen set if HP percentage is <80%
    if player.hpp < 80 then
        idleSet = set_combine(idleSet, sets.idle.Regen)
    end
    -- Use Migawari gear if Migawari effect is active
    if state.Buff.Migawari then
        idleSet = set_combine(idleSet, sets.buff.Migawari)
    end
    -- Use Doom enhancing gear if Doom effect is active
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    -- Use PDT set if in PDT mode
    if state.HybridMode.value == 'PDT' then
        idleSet = set_combine(idleSet, sets.defense.PDT)
    else
    -- otherwise, we set movement speed gear in the idle set
        idleSet = set_combine(idleSet, select_movement())
    end

    return idleSet
end


-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    return meleeSet
end

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end

function determine_haste_group()
    -- We have three groups of DW in gear: Hachiya body/legs, Iga head + Patentia Sash, and DW earrings
    
    -- Standard gear set reaches near capped delay with just Haste (77%-78%, depending on HQs)

    -- For high haste, we want to be able to drop one of the 10% groups.
    -- Basic gear hits capped delay (roughly) with:
    -- 1 March + Haste
    -- 2 March
    -- Haste + Haste Samba
    -- 1 March + Haste Samba
    -- Embrava
    
    -- High haste buffs:
    -- 2x Marches + Haste Samba == 19% DW in gear
    -- 1x March + Haste + Haste Samba == 22% DW in gear
    -- Embrava + Haste or 1x March == 7% DW in gear
    
    -- For max haste (capped magic haste + 25% gear haste), we can drop all DW gear.
    -- Max haste buffs:
    -- Embrava + Haste+March or 2x March
    -- 2x Marches + Haste
    
    -- So we want four tiers:
    -- Normal DW
    -- 20% DW -- High Haste
    -- 7% DW (earrings) - Embrava Haste (specialized situation with embrava and haste, but no marches)
    -- 0 DW - Max Haste
    
    classes.CustomMeleeGroups:clear()
    
    if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 and buffactive.haste then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
        classes.CustomMeleeGroups:append('EmbravaHaste')
    elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.march == 2 then
        classes.CustomMeleeGroups:append('HighHaste')
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(4, 3)
    elseif player.sub_job == 'THF' then
        set_macro_page(5, 3)
    else
        set_macro_page(1, 3)
    end
end
