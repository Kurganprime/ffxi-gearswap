function init_gear_sets()

    --------------------------------------
    -- Augmented gear
    --------------------------------------

	Rawhide_Hands_Acc = {name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20'}}
	Rawhide_Feet_Acc  = {name="Rawhide Boots", augments={'HP+50','Accuracy+15','Evasion+20'}}

    --------------------------------------
    -- Trust summoning gear
    --------------------------------------
    sets.midcast.Trust = {
		head="Pillager's Bonnet +1",
		body="Pillager's Vest +1",
		hands="Plunderer's Armlets +1",
		legs="Pillager's Culottes +1",
		feet="Pillager's Poulaines +1"
	}

    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = {
        hands="Plunderer's Armlets +1",
        waist="Chaac Belt",
        feet="Skulker's Poulaines +1"
    }
    sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
    sets.Kiting = {feet="Skadi's Jambeaux +1"}
    sets.Adoulin = {body="Councilor's Garb"}
    sets.MoveSpeed = {feet="Skadi's Jambeaux +1"}
	

    sets.buff['Sneak Attack'] = {
        ammo="Qirmiz Tathlum",
        head="Pillager's Bonnet +1",
        neck="Asperity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Pillager's Vest +1",
        hands="Skulker's Armlets +1",
        ring1="Rajas Ring",
        ring2="Epona's Ring",
        back="Bleating Mantle",
        waist="Patentia Sash",
        legs="Pillager's Culottes +1",
        feet="Plunderer's Poulaines +1"
    }

    sets.buff['Trick Attack'] = {
        ammo="Qirmiz Tathlum",
        head="Pillager's Bonnet +1",
        neck="Asperity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Pillager's Vest +1",
        hands="Pillager's Armlets +1",
        ring1="Stormsoul Ring",
        ring2="Epona's Ring",
        back="Bleating Mantle",
        waist="Patentia Sash",
        legs="Pillager's Culottes +1",
        feet="Plunderer's Poulaines +1"
    }

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {
        head="Skulker's Bonnet +1"
    }
    sets.precast.JA['Accomplice'] = {
        head="Skulker's Bonnet +1"
    }
    sets.precast.JA['Flee'] = {
        feet="Pillager's Poulaines +1"
    }
    sets.precast.JA['Hide'] = {
        body="Pillager's Vest +1"
    }
    sets.precast.JA['Conspirator'] = {
        body="Skulker's Vest +1"
    }
    sets.precast.JA['Steal'] = {
        head="Plunderer's Bonnet",
        hands="Pillager's Armlets +1",
        legs="Pillager's Culottes +1",
        feet="Pillager's Poulaines +1"
    }
    sets.precast.JA['Despoil'] = {
        legs="Skulker's Culottes +1",
        feet="Skulker's Poulaines +1"
    }
    sets.precast.JA['Perfect Dodge'] = {
        hands="Plunderer's Armlets +1"
    }
    sets.precast.JA['Feint'] = {
        legs="Plunderer's Culottes"
    }

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        ammo="Sonia's Plectrum",
        head="Whirlpool Mask",
        body="Pillager's Vest +1",
        hands="Pillager's Armlets +1",
        ring1="Asklepian Ring",
        back="Iximulew Cape",
        waist="Caudata Belt",
        legs="Pillager's Culottes +1",
        feet="Plunderer's Poulaines +1"
    }

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {
		head="Haruspex Hat",
        ear2="Loquacious Earring",
		hands="Thaumas Gloves",
        ring1="Prolix Ring",
		legs="Enif Cosciales"
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        neck="Magoraga Beads"
    })
	
    -- Ranged snapshot gear
    sets.precast.RA = {head="Aurore Beret",hands="Iuitl Wristbands",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Jukukik Feather",
        head="Whirlpool Mask",
        neck="Fotia Gorget",
        ear1="Moonshade Earring",
        ear2="Ishvara Earring",
        body="Adhemar Jacket",
        hands="Adhemar Wristbands",
        ring1="Karieyh Ring",
        ring2="Mujin Band",
        back="Toutatis's Cape",
        waist="Fotia Belt",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    }
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ammo="Honed Tathlum",
        -- back="Letalis Mantle"
    })
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
		ring1="Stormsoul Ring",
        legs="Nahtirah Trousers"
    })
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {
		ammo="Honed Tathlum",
        -- back="Letalis Mantle"
    })
    sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {
		head="Felistris Mask",
        -- waist=gear.ElementalBelt
    })
    sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {
		ammo="Qirmiz Tathlum"
    })
    sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mod, {
		ammo="Qirmiz Tathlum"
    })
    sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].Mod, {
		ammo="Qirmiz Tathlum"
    })

    sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {
    })
    sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {
		ammo="Honed Tathlum",
        -- back="Letalis Mantle"
    })
    sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'], {
        -- waist=gear.ElementalBelt
    })
    sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {
		ammo="Qirmiz Tathlum"
    })
    sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {
		ammo="Qirmiz Tathlum"
    })
    sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {
		ammo="Qirmiz Tathlum"
    })

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
		ammo="Qirmiz Tathlum",
        -- head="Uk'uxkaj Cap",
        neck="Rancor Collar",
        ear1="Brutal Earring",
        ear2="Moonshade Earring"
    })
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {
		ammo="Honed Tathlum",
        -- back="Letalis Mantle"
    })
    sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'], {
		back="Kayapa Cape",
        -- waist=gear.ElementalBelt
    })
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Mod, {
	})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Mod, {
	})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Mod, {
	})

    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
		head="Pillager's Bonnet +1",
        ear1="Brutal Earring",
        ear2="Moonshade Earring"
    })
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {
		ammo="Honed Tathlum",
        -- back="Letalis Mantle"
    })
    sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"], {
		back="Kayapa Cape",
        -- waist=gear.ElementalBelt
    })
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {
		ammo="Qirmiz Tathlum",
        body="Pillager's Vest +1",
        legs="Pillager's Culottes +1"
    })
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {
		ammo="Qirmiz Tathlum",
        body="Pillager's Vest +1",
        legs="Pillager's Culottes +1"
    })
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {
		ammo="Qirmiz Tathlum",
        body="Pillager's Vest +1",
        legs="Pillager's Culottes +1"
    })

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {
		head="Pillager's Bonnet +1",
        ear1="Brutal Earring",
        ear2="Moonshade Earring"
    })
    sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {
		ammo="Honed Tathlum",
        -- back="Letalis Mantle"
    })
    sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {
		-- back="Kayapa Cape",
        -- waist=gear.ElementalBelt
    })
    sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {
        ammo="Qirmiz Tathlum",
        body="Pillager's Vest +1",
        legs="Pillager's Culottes +1"
    })
    sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {
		ammo="Qirmiz Tathlum",
        body="Pillager's Vest +1",
        legs="Pillager's Culottes +1"
    })
    sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {
		ammo="Qirmiz Tathlum",
        body="Pillager's Vest +1",
        legs="Pillager's Culottes +1"
    })
    sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS, {
		head="Pillager's Bonnet +1",
        ear1="Brutal Earring",
        ear2="Moonshade Earring"
    })
    sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'], {
		ammo="Honed Tathlum",
        -- back="Letalis Mantle"
    })
    sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'], {
		-- back="Kayapa Cape",
        -- waist=gear.ElementalBelt
    })
    sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {
		ammo="Qirmiz Tathlum",
        body="Pillager's Vest +1",
        legs="Pillager's Culottes +1"
    })
    sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {
		ammo="Qirmiz Tathlum",
        body="Pillager's Vest +1",
        legs="Pillager's Culottes +1"
    })
    sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {
		ammo="Qirmiz Tathlum",
        body="Pillager's Vest +1",
        legs="Pillager's Culottes +1"
    })

    sets.precast.WS['Aeolian Edge'] = {
        ammo="Jukukik Feather",
        head="Wayfarer Circlet",
        neck="Stoicheion Medal",
        ear1="Friomisi Earring",
        ear2="Moonshade Earring",
        body="Wayfarer Robe",
        hands="Pillager's Armlets +1",
        ring1="Acumen Ring",
        ring2="Demon's Ring",
        back="Toro Cape",
        -- waist=gear.ElementalBelt,
        legs="Shneddick Tights +1",
        feet="Wayfarer Clogs"
    }
    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Whirlpool Mask",
        ear2="Loquacious Earring",
        body="Pillager's Vest +1",
        hands="Pillager's Armlets +1",
        back="Canny Cape",
        feet="Iuitl Gaiters"}

    -- Specific spells
    sets.midcast.Utsusemi = {
        head="Whirlpool Mask",
        neck="Ej Necklace",
        ear2="Loquacious Earring",
        body="Pillager's Vest +1",
        hands="illager's Armlets +1",
        ring1="Beeline Ring",
        back="Canny Cape",
        feet="Iuitl Gaiters"
    }

    -- Ranged gear
    sets.midcast.RA = {
        head="Whirlpool Mask",
        neck="Ej Necklace",
        ear1="Clearview Earring",
        ear2="Volley Earring",
        body="Iuitl Vest",
        hands="Iuitl Wristbands",
        ring1="Beeline Ring",
        ring2="Hajduk Ring",
        back="Libeccio Mantle",
        waist="Aquiline Belt",
        legs="Nahtirah Trousers",
        feet="Iuitl Gaiters"
    }

    sets.midcast.RA.Acc = {
        head="Pillager's Bonnet +1",
        neck="Ej Necklace",
        ear1="Clearview Earring",
        ear2="Volley Earring",
        body="Iuitl Vest",
        hands="Buremte Gloves",
        ring1="Beeline Ring",
        ring2="Hajduk Ring",
        back="Libeccio Mantle",
        waist="Aquiline Belt",
        legs="Thurandaut Tights +1",
        feet="Pillager's Poulaines +1"
    }

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
        head="Ocelomeh Headpiece +1",
        neck="Sanctity Necklace",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring"
    }

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
        ammo="Aurgelmir Orb",
        head="Pillager's Bonnet +1",
        neck="Sanctity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Pillager's Vest +1",
        hands="Pillager's Armlets +1",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring",
        back="Toutatis's Cape",
        waist="Flume Belt",
        legs="Pillager's Culottes +1",
        feet="Pillager's Poulaines +1"
    }
		--{ammo="Thew Bomblet",
        --head="Pillager's Bonnet +1",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Shadow Mantle",waist="Flume Belt",legs="Pillager's Culottes +1",feet="Skadi's Jambeaux +1"}

    sets.idle.Town = {
        ammo="Aurgelmir Orb",
        head="Pillager's Bonnet +1",
        neck="Sanctity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Pillager's Vest +1",
        hands="Pillager's Armlets +1",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring",
        back="Toutatis's Cape",
        waist="Flume Belt",
        legs="Pillager's Culottes +1",
        feet="Pillager's Poulaines +1"
    }
		--{main="Izhiikoh", sub="Sabebus",ammo="Thew Bomblet",
        --head="Pillager's Bonnet +1",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Pillager's Vest +1",hands="Pill. Armlets +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Shadow Mantle",waist="Patentia Sash",legs="Pillager's Culottes +1",feet="Skadi's Jambeaux +1"}

    sets.idle.Weak = {
        ammo="Aurgelmir Orb",
        head="Lithelimb Cap",
        neck="Sanctity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Pillager's Vest +1",
        hands="Buremte Gloves",
        ring1="Rajas Ring",
        ring2="Epona's Ring",
        back="Toutatis's Cape",
        waist="Flume Belt",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    }
		--{ammo="Thew Bomblet",
        --head="Pillager's Bonnet +1",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Shadow Mantle",waist="Flume Belt",legs="Pillager's Culottes +1",feet="Skadi's Jambeaux +1"}

    -- Defense sets

    sets.defense.Evasion = {
        head="Pillager's Bonnet +1",
        neck="Ej Necklace",
        ear1="Infused Earring",
        ear2="Phawaylla Earring",
        body="Adhemar Jacket",
        hands="Adhemar Wristbands",
        ring1="Defending Ring",
        ring2="Beeline Ring",
        back="Toutatis's Cape",
        waist="Flume Belt",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    }
		--{
        --head="Pillager's Bonnet +1",neck="Ej Necklace",
        --body="Adhemar Jacket",hands="Pillager's Armlets +1",ring1="Defending Ring",ring2="Beeline Ring",
        --back="Canny Cape",waist="Flume Belt",legs="Taeon Tights",feet="Iuitl Gaiters +1"}

    sets.defense.PDT = {
        ammo="Iron Gobbet",
        head="Pillager's Bonnet +1",
        neck="Twilight Torque",
        body="Iuitl Vest",
        hands="Pillager's Armlets +1",
        ring1="Defending Ring",
        ring2=gear.DarkRing.physical,
        back="Iximulew Cape",
        waist="Flume Belt",
        legs="Pillager's Culottes +1",
        feet="Herculean Boots"
    }
		--{ammo="Iron Gobbet",
        --head="Pillager's Bonnet +1",neck="Twilight Torque",
        --body="Iuitl Vest",hands="Pillager's Armlets +1",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        --back="Iximulew Cape",waist="Flume Belt",legs="Pillager's Culottes +1",feet="Iuitl Gaiters +1"}

    sets.defense.MDT = {
        ammo="Demonry Stone",
        head="Pillager's Bonnet +1",
        neck="Twilight Torque",
        body="Pillager's Vest +1",
        hands="Pillager's Armlets +1",
        ring1="Defending Ring",
        ring2="Shadow Ring",
        back="Engulfer Cape",
        waist="Flume Belt",
        legs="Pillager's Culottes +1",
        feet="Herculean Boots"
    }
		--{ammo="Demonry Stone",
        --head="Pillager's Bonnet +1",neck="Twilight Torque",
        --body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Defending Ring",ring2="Shadow Ring",
        --back="Engulfer Cape",waist="Flume Belt",legs="Pillager's Culottes +1",feet="Iuitl Gaiters +1"}


    --------------------------------------
    -- Melee sets
    --------------------------------------

    -- Normal melee group
    sets.engaged = {
        ammo="Ginsen",
        head="Adhemar Bonnet",
        neck="Asperity Necklace",
        ear1="Dedition Earring",
        ear2="Suppanomimi",
        body="Adhemar Jacket",
        hands="Adhemar Wristbands",
        ring1="Petrov Ring",
        ring2="Epona's Ring",
        back="Toutatis's Cape",
        waist="Sailfi Belt +1",
        legs="Samnuha Tights",
        feet="Herculean Boots"
    }
		--{ammo="Thew Bomblet",
        --head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Adhemar Jacket",hands="Pillager's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Bleating Mantle",waist="Patentia Sash",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}
    sets.engaged.Acc = {
        ammo="Honed Tathlum",
        head="Whirlpool Mask",
        neck="Ej Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Adhemar Jacket",
        hands="Adhemar Wristbands",
        ring1="Rajas Ring",
        ring2="Epona's Ring",
        back="Toutatis's Cape",
        waist="Hurch'lan Sash",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    }
		--{ammo="Honed Tathlum",
        --head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Letalis Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Qaaxo Leggings"}
        
    -- Mod set for trivial mobs (Skadi+1)
    sets.engaged.Mod = {
        ammo="Thew Bomblet",
        head="Felistris Mask",
        neck="Asperity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Skadi's Cuirie +1",
        hands="Adhemar Wristbands",
        ring1="Rajas Ring",
        ring2="Epona's Ring",
        back="Toutatis's Cape",
        waist="Windbuffet Belt +1",
        legs=gear.AugQuiahuiz,
        feet="Herculean Boots"
    }
		--{ammo="Thew Bomblet",
        --head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Skadi's Cuirie +1",hands="Pillager's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Bleating Mantle",waist="Patentia Sash",legs=gear.AugQuiahuiz,feet="Plunderer's Poulaines +1"}

    -- Mod set for trivial mobs (Thaumas)
    sets.engaged.Mod2 = {
        ammo="Thew Bomblet",
        head="Felistris Mask",
        neck="Asperity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Thaumas Coat",
        hands="Adhemar Wristbands",
        ring1="Rajas Ring",
        ring2="Epona's Ring",
        back="Toutatis's Cape",
        waist="Windbuffet Belt +1",
        legs="Pillager's Culottes +1",
        feet="Herculean Boots"
    }
		--{ammo="Thew Bomblet",
        --head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Thaumas Coat",hands="Pillager's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Bleating Mantle",waist="Patentia Sash",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}

    sets.engaged.Evasion = {
        ammo="Thew Bomblet",
        head="Pillager's Bonnet +1",
        neck="Ej Necklace",
        ear1="Infused Earring",
        ear2="Phawaylla Earring",
        body="Adhemar Jacket",
        hands="Leyline Gloves",
        ring1="Beeline Ring",
        ring2="Epona's Ring",
        back="Canny Cape",
        waist="Patentia Sash",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    }
		--{ammo="Thew Bomblet",
        --head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Adhemar Jacket",hands="Pillager's Armlets +1",ring1="Beeline Ring",ring2="Epona's Ring",
        --back="Canny Cape",waist="Patentia Sash",legs="Taeon Tights",feet="Qaaxo Leggings"}
    sets.engaged.Acc.Evasion = {
        ammo="Honed Tathlum",
        head="Whirlpool Mask",
        neck="Ej Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Pillager's Vest +1",
        hands="Adhemar Wristbands",
        ring1="Beeline Ring",
        ring2="Epona's Ring",
        back="Canny Cape",
        waist="Hurch'lan Sash",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    }
		--{ammo="Honed Tathlum",
        --head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Beeline Ring",ring2="Epona's Ring",
        --back="Canny Cape",waist="Hurch'lan Sash",legs="Taeon Tights",feet="Qaaxo Leggings"}

    sets.engaged.PDT = {
        ammo="Thew Bomblet",
        head="Felistris Mask",
        neck="Twilight Torque",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Iuitl Vest",
        hands="Adhemar Wristbands",
        ring1="Defending Ring",
        ring2="Epona's Ring",
        back="Iximulew Cape",
        waist="Patentia Sash",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    }
		--{ammo="Thew Bomblet",
        --head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Iuitl Vest",hands="Pillager's Armlets +1",ring1="Defending Ring",ring2="Epona's Ring",
        --back="Iximulew Cape",waist="Patentia Sash",legs="Iuitl Tights",feet="Qaaxo Leggings"}
    sets.engaged.Acc.PDT = {
        ammo="Honed Tathlum",
        head="Whirlpool Mask",
        neck="Twilight Torque",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Iuitl Vest",
        hands="Adhemar Wristbands",
        ring1="Defending Ring",
        ring2="Epona's Ring",
        back="Toutatis's Cape",
        waist="Hurch'lan Sash",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    }
		--{ammo="Honed Tathlum",
        --head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Iuitl Vest",hands="Pillager's Armlets +1",ring1="Defending Ring",ring2="Epona's Ring",
        --back="Canny Cape",waist="Hurch'lan Sash",legs="Iuitl Tights",feet="Qaaxo Leggings"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 6)
    elseif player.sub_job == 'WAR' then
        set_macro_page(3, 6)
    elseif player.sub_job == 'NIN' then
        set_macro_page(4, 6)
    else
        set_macro_page(1, 6)
    end
end
