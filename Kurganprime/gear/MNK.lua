function init_gear_sets()
    --------------------------------------
    -- Augmented gear
    --------------------------------------

	Rawhide_Hands_Acc = {name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20'}}
	Rawhide_Feet_Acc  = {name="Rawhide Boots", augments={'HP+50','Accuracy+15','Evasion+20'}}

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs on use
    sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose"}
    sets.precast.JA['Boost'] = {hands="Anchorite's Gloves +1"}
    sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +1"}
    sets.precast.JA['Focus'] = {head="Anchorite's Crown +1"}
    sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters +1"}
    sets.precast.JA['Footwork'] = {feet="Bhikku Gaiters"}
    sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}
    sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters +1"}

    sets.precast.JA['Chi Blast'] = {
        head="Hesychast's Crown",
        body="Otronif Harness",hands="Hesychast's Gloves +1",
        back="Tuilha Cape",legs="Hesychast's Hose",feet="Anchorite's Gaiters +1"}

    sets.precast.JA['Chakra'] = {ammo="Iron Gobbet",
        head="Lithelimb Cap",
        body="Anchorite's Cyclas +1",hands="Hesychast's Gloves +1",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Qaaxo Tights",feet="Thurandaut Boots +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Lithelimb Cap",
        body="Otronif Harness",hands="Hesychast's Gloves +1",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Qaaxo Tights",feet="Otronif Boots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}


    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",head="Haruspex hat",ear2="Loquacious Earring",hands="Thaumas Gloves"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Thew Bomblet",
        head="Lithelimb Cap",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Taeon Tabard",hands="Hesychast's Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Fotia Belt",legs="Quiahuiz Trousers",feet="Manibozho Boots"}
    sets.precast.WSAcc = {ammo="Honed Tathlum",body="Manibozho Jerkin",back="Belenos' Mantle",feet="Qaaxo Leggings"}
    sets.precast.WSMod = {ammo="Tantra Tathlum",head="Lithelimb Cap",legs="Hesychast's Hose",feet="Daihanshi Habaki"}
    sets.precast.MaxTP = {ear1="Bladeborn Earring",ear2="Steelflash Earring"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
    sets.precast.WS.Mod = set_combine(sets.precast.WS, sets.precast.WSMod)

    -- Specific weaponskill sets.
    
    -- legs={name="Quiahuiz Trousers", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','STR+8'}}}

    sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {})
    sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {legs="Manibozho Brais",feet="Daihanshi Habaki"})
    sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {
        ear1="Bladeborn Earring",ear2="Moonshade Earring",ring2="Spiral Ring",back="Buquwik Cape"})
    sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {
        ammo="Tantra Tathlum",ring1="Spiral Ring",back="Buquwik Cape",feet="Qaaxo Leggings"})
    sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {neck="Rancor Collar",back="Buquwik Cape",feet="Qaaxo Leggings"})
    sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {ear1="Bladeborn Earring",ear2="Steelflash Earring",
        legs="Manibozho Brais",feet="Daihanshi Habaki"})
    sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {feet="Daihanshi Habaki"})
    sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {ammo="Tantra Tathlum",ring1="Spiral Ring"})
    sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {
        head="Lithelimb Cap",ear1="Bladeborn Earring",ear2="Steelflash Earring"})

    sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
    sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
    sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
    sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc)
    sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc)
    sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
    sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
    sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

    sets.precast.WS["Raging Fists"].Mod = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSMod)
    sets.precast.WS["Howling Fist"].Mod = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSMod)
    sets.precast.WS["Asuran Fists"].Mod = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSMod)
    sets.precast.WS["Ascetic's Fury"].Mod = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSMod)
    sets.precast.WS["Victory Smite"].Mod = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSMod)
    sets.precast.WS["Shijin Spiral"].Mod = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSMod)
    sets.precast.WS["Dragon Kick"].Mod = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSMod)
    sets.precast.WS["Tornado Kick"].Mod = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSMod)


    sets.precast.WS['Cataclysm'] = {
        head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Wayfarer Robe",hands="Otronif Gloves",ring1="Acumen Ring",ring2="Demon's Ring",
        back="Toro Cape",waist="Thunder Belt",legs="Nahtirah Trousers",feet="Qaaxo Leggings"}
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Lithelimb Cap",ear2="Loquacious Earring",
        body="Otronif Harness",hands="Thaumas Gloves",
        waist="Black Belt",feet="Otronif Boots"}
        
    -- Specific spells
    sets.midcast.Utsusemi = {
        head="Lithelimb Cap",ear2="Loquacious Earring",
        body="Otronif Harness",hands="Thaumas Gloves",
        waist="Black Belt",legs="Qaaxo Tights",feet="Otronif Boots"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {head="Ocelomeh Headpiece +1",neck="Sanctity Necklace",
        body="Taeon Tabard",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    

    -- Idle sets
    sets.idle = {ammo="Thew Bomblet",
        head="Hizamaru Somen +1",neck="Sanctity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Anchoret's Mantle",waist="Windbuffet Belt +1",legs="Herculean Trousers",feet="Herald's Gaiters"}

    sets.idle.Town = {main="Oatixur",ammo="Thew Bomblet",
        head="Hizamaru Somen +1",neck="Sanctity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Anchoret's Mantle",waist="Windbuffet Belt +1",legs="Herculean Trousers",feet="Herald's Gaiters"}
    
    sets.Adoulin = {body="Councilor's Garb",}

    sets.MoveSpeed = {feet = "Herald's Gaiters",}
	
    sets.idle.Weak = {ammo="Thew Bomblet",
        head="Lithelimb Cap",neck="Twilight Torque",ear1="Infused Earring",ear2="Bloodgem Earring",
        body="Hizamaru Haramaki +1",hands="Anchorite's Gloves +1",ring1="Defending Ring",ring2="Patricius Ring",
        back="Anchoret's Mantle",waist="Moonbow Belt +1",legs="Herculean Trousers",feet="Herculean Boots"}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Lithelimb Cap",neck="Twilight Torque",
        body="Otronif Harness",hands="Otronif Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Mollusca Mantle",waist="Moonbow Belt +1",legs="Herculean Trousers",feet="Herculean Boots"}

    sets.defense.HP = {ammo="Iron Gobbet",
        head="Uk'uxkaj Cap",neck="Lavalier +1",ear1="Brutal Earring",ear2="Bloodgem Earring",
        body="Hesychast's Cyclas",hands="Hesychast's Gloves +1",ring1="K'ayres Ring",ring2="Meridian Ring",
        back="Shadow Mantle",waist="Black Belt",legs="Hesychast's Hose",feet="Hesychast's Gaiters +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Naga Somen",neck="Twilight Torque",
        body="Wayfarere Robe",hands="Adhemar Wristbands",ring1="Defending Ring",ring2="Shadow Ring",
        back="Mollusca Mantle",waist="Black Belt",legs="Taeon Tights",feet="Daihanshi Habaki"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee sets
    sets.engaged = {ammo="Thew Bomblet",
        head="Hizamaru Somen +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
    sets.engaged.SomeAcc = {ammo="Honed Tathlum",
        head="Hizamaru Somen +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Hizamaru Hizayoroi +1",feet="Herculean Boots"}
    sets.engaged.Acc = {ammo="Honed Tathlum",
        head="Hizamaru Somen +1",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Anchoret's Mantle",waist="Hurch'lan Sash",legs="Hizamaru Hizayoroi +1",feet="Herculean Boots"}
    sets.engaged.Mod = {ammo="Thew Bomblet",
        head="Hizamaru Somen +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Herculean Trousers",feet="Herculean Boots"}

    -- Defensive melee hybrid sets
    sets.engaged.PDT = {ammo="Thew Bomblet",
        head="Uk'uxkaj Cap",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness",hands="Otronif Gloves",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Shadow Mantle",waist="Windbuffet Belt +1",legs="Taeon Tights",feet="Otronif Boots"}
    sets.engaged.SomeAcc.PDT = {ammo="Honed Tathlum",
        head="Lithelimb Cap",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Taeon Tabard",hands="Hesychast's Gloves +1",ring1="Defending Ring",ring2="Epona's Ring",
        back="Shadow Mantle",waist="Hurch'lan Sash",legs="Taeon Tights",feet="Anchorite's Gaiters +1"}
    sets.engaged.Acc.PDT = {ammo="Honed Tathlum",
        head="Lithelimb Cap",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Taeon Tabard",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Belenos' Mantle",waist="Hurch'lan Sash",legs="Taeon Tights",feet="Qaaxo Leggings"}
    sets.engaged.Counter = {ammo="Thew Bomblet",
        head="Naga Somen",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness",hands="Otronif Gloves",ring1="K'ayres Ring",ring2="Epona's Ring",
        back="Ultion Mantle",waist="Windbuffet Belt +1",legs="Anchorite's Hose +1",feet="Otronif Boots"}
    sets.engaged.Acc.Counter = {ammo="Honed Tathlum",
        head="Naga Somen",neck="Backlash Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness",hands="Hesychast's Gloves +1",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Belenos' Mantle",waist="Hurch'lan Sash",legs="Anchorite's Hose +1",feet="Otronif Boots"}


    -- Hundred Fists/Impetus melee set mods
    sets.engaged.HF = set_combine(sets.engaged)
    sets.engaged.HF.Impetus = set_combine(sets.engaged, {body="Bhikku Cyclas"})
    sets.engaged.Acc.HF = set_combine(sets.engaged.Acc)
    sets.engaged.Acc.HF.Impetus = set_combine(sets.engaged.Acc, {body="Bhikku Cyclas"})
    sets.engaged.Counter.HF = set_combine(sets.engaged.Counter)
    sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {body="Bhikku Cyclas"})
    sets.engaged.Acc.Counter.HF = set_combine(sets.engaged.Acc.Counter)
    sets.engaged.Acc.Counter.HF.Impetus = set_combine(sets.engaged.Acc.Counter, {body="Bhikku Cyclas"})


    -- Footwork combat form
    sets.engaged.Footwork = {ammo="Thew Bomblet",
        head="Naga Somen",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Taeon Tabard",hands="Anchorite's Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Hesychast's Hose",feet="Anchorite's Gaiters +1"}
    sets.engaged.Footwork.Acc = {ammo="Honed Tathlum",
        head="Naga Somen",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness",hands="Anchorite's Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Belenos' Mantle",waist="Hurch'lan Sash",legs="Hesychast's Hose",feet="Anchorite's Gaiters +1"}
        
    -- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
    sets.impetus_body = {body="Bhikku Cyclas"}
    sets.footwork_kick_feet = {feet="Anchorite's Gaiters +1"}
end

function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'THF' then
        set_macro_page(4, 2)
    elseif player.sub_job == 'RUN' then
        set_macro_page(3, 2)
    else
        set_macro_page(1, 2)
    end
end
