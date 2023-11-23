-- Setup vars that are user-independent.
function job_setup()

    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Sange = buffactive.sange or false
    state.Buff.Innin = buffactive.innin or false

    include('Mote-TreasureHunter')
    state.TreasureMode:set('Tag')

    state.HasteMode = M{['description']='Haste Mode', 'Normal', 'Hi'}
    state.Runes = M{['description']='Runes', "Ignis", "Gelus", "Flabra", "Tellus", "Sulpor", "Unda", "Lux", "Tenebrae"}
    state.UseRune = M(false, 'Use Rune')
    state.UseWarp = M(false, 'Use Warp')
    state.Adoulin = M(false, 'Adoulin')
    state.Moving  = M(false, "moving")

    run_sj = player.sub_job == 'RUN' or false

    select_ammo()
    LugraWSList = S{'Blade: Shun', 'Blade: Ku', 'Blade: Jin'}
    state.CapacityMode = M(false, 'Capacity Point Mantle')

    gear.RegularAmmo = 'Togakushi Shuriken'
    gear.SangeAmmo = 'Happo Shuriken'

    wsList = S{'Blade: Hi', 'Blade: Kamu', 'Blade: Ten'}

    update_combat_form()

    state.warned = M(false)
    options.ammo_warning_limit = 25
    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}

end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'Low', 'Mid', 'Acc')
    state.HybridMode:options('Normal', 'PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Low', 'Mid', 'Acc')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')

    select_default_macro_book()

    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind ^[ gs c toggle UseWarp')
    send_command('bind ![ input /lockstyle off')
    send_command('bind != gs c toggle CapacityMode')
    send_command('bind @f9 gs c cycle HasteMode')
    send_command('bind @[ gs c cycle Runes')
    send_command('bind ^] gs c toggle UseRune')

end

function init_gear_sets()
    --------------------------------------
    -- Augments
    --------------------------------------
    Andartia = {}
    Andartia.DEX = {name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
    Andartia.AGI = {name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

    --------------------------------------
    -- Job Abilties
    --------------------------------------
    sets.precast.JA['Mijin Gakure'] = { legs="Mochizuki Hakama +1" }
    sets.precast.JA['Futae'] = { hands="Hattori Tekko +1" }
    sets.precast.JA['Sange'] = {body="Mochizuki Chainmail +1"}
    sets.precast.JA['Provoke'] = { 
        ear1="Friomisi Earring",
        ear2="Trux Earring", 
        body="Emet Harness +1",
        ring1="Petrov Ring",
        ring2="Supershear Ring",
        feet="Mochizuki Kyahan +1"
    }
    sets.precast.JA.Sange = { ammo=gear.SangeAmmo, body="Mochizuki Chainmail +1" }

    -- Waltz (chr and vit)
    sets.precast.Waltz = {
        ammo="Sonia's Plectrum",
        head="Mochizuki Hatsuburi +1",
        body="Hachiya Chainmail +1",
        hands="Buremte Gloves",
        ring1="Spiral Ring",
        back="Iximulew Cape",
        waist="Chaac Belt",
        legs="Hachiya Hakama +1",
        feet="Hizamaru Sune-ate +2"
    }
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {
        body="Hattori Ningi +1",
        neck="Defiant Collar",
        ear1="Zennaroi Earring",
        hands="Ryuo Tekko",
        back=Andartia.DEX,
        waist="Olseni Belt",
        legs="Taeon Tights",
        feet="Mochizuki Kyahan +1"
    }
    sets.midcast.Trust =  {
		head="Hizamaru Somen +2",
		body="Hizamaru Haramaki +2",
		hands="Hizamaru Kote +2",
		legs="Hizamaru Hizayoroi +2",
		feet="Hizamaru Sune-Ate +2"
    }
    -- sets.midcast["Apururu (UC)"] = set_combine(sets.midcast.Trust, {
    --     body="Apururu Unity shirt",
    -- })
    sets.Warp = { ring1="Warp Ring" }

    --------------------------------------
    -- Utility Sets for rules below
    --------------------------------------
    sets.TreasureHunter = { waist="Chaac Belt" }
    sets.CapacityMantle = { back="Mecistopins Mantle" }
    sets.WSDayBonus     = { head="Gavialis Helm" }
    sets.WSBack         = { back="Trepidity Mantle" }
    sets.BrutalLugra    = { ear1="Cessance Earring", ear2="Lugra Earring +1" }
    sets.BrutalTrux     = { ear1="Cessance Earring", ear2="Trux Earring" }
    sets.BrutalMoon     = { ear1="Brutal Earring", ear2="Moonshade Earring" }
    sets.Rajas          = { ring1="Haverton Ring" }

    sets.RegularAmmo    = { ammo=gear.RegularAmmo }
    sets.SangeAmmo      = { ammo=gear.SangeAmmo }

    sets.NightAccAmmo   = { ammo="Ginsen" }
    sets.DayAccAmmo     = { ammo="Ginsen" } --TODO: Replace with Tengu-no-Hane

    --------------------------------------
    -- Ranged
    --------------------------------------

    sets.precast.RA = {
        head="Uk'uxkaj Cap",
        hands="Buremte Gloves",
        legs="Nahtirah Trousers",
        ring2="Haverton Ring",
        feet="Wurrukatte Boots"
    }
    sets.midcast.RA = {
        head="Taeon Chapeau",
        neck="Iqabi Necklace",
        body="Mochizuki Chainmail +1",
        hands="Hachiya Tekko +1",
        ring1="Hajduk Ring",
        ring2="Haverton Ring",
        back="Yokaze Mantle",
        legs="Hachiya Hakama +1",
        feet="Taeon Boots"
    }
    sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {
        body="Mochizuki Chainmail +1"
    })
    sets.midcast.RA.TH = set_combine(sets.midcast.RA, set.TreasureHunter)

    -- Fast cast sets for spells
    sets.precast.FC = {
        ammo="Impatiens",
        head="Herculean Helm", --TODO: Get Herculean Helm
        ear1="Loquacious Earring",
        ring1="Prolix Ring",
        hands="Leyline Gloves",
        body="Taeon Tabard", --TODO: Replace with Dread Jupon
        legs="Rawhide Trousers", --TODO: Replace with Quiahuiz Trousers
        back="Mujin Mantle",
        feet="Mochizuki Kyahan +1" -- special enhancement for casting ninjutsu III
    }
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, { neck="Magoraga Beads", body="Mochizuki Chainmail +1", back="Andartia's Mantle" })

    -- Midcast Sets
    sets.midcast.FastRecast = {
        ammo="Impatiens",
        head="Hattori Zukin +1",
        ear1="Loquacious Earring",
        body="Hizamaru Haramaki +2", --TODO: Replace with Dread Jupon
        hands="Leyline Gloves",
        ring1="Prolix Ring",
        back="Andartia's Mantle", --TODO: Replace with Grounded Mantle +1"
        waist="Hurch'lan Sash",
        legs="Hattori Hakama +1",
        feet="Daihanshi Habaki"
    }

    -- skill ++ 
    sets.midcast.Ninjutsu = {
        head="Hachiya Hatsuburi +1",
        ear1="Lifestorm Earring",
        ear2="Psystorm Earring",
        neck="Incanter's Torque",
        body="Samnuha Coat",
        hands="Leyline Gloves",
        ring1="Sangoma Ring",
        -- ring2="Haverton Ring",
        back="Yokaze Mantle",
        waist="Eschan Stone",
        feet="Mochizuki Kyahan +1"
    }
    -- any ninjutsu cast on self
    sets.midcast.SelfNinjutsu = sets.midcast.Ninjutsu
    sets.midcast.Utsusemi = set_combine(sets.midcast.Ninjutsu, {
        hands="Mochizuki Tekko +1", 
        back=Andartia.DEX,
        feet="Hattori Kyahan +1"
    })
    sets.midcast.Migawari = set_combine(sets.midcast.Ninjutsu, {
        body="Hattori Ningi +1", 
        back=Andartia.DEX,
    })

    -- Nuking Ninjutsu (skill & magic attack)
    sets.midcast.ElementalNinjutsu = {
        head="Mochizuki Hatsuburi +1",
        ear1="Friomisi Earring",
        ear2="Crematio Earring", --TODO: Get Crematio Earring
        neck="Sanctity Necklace",
        body="Samnuha Coat",
        hands="Leyline Gloves",
        back="Aput Mantle", --TODO: Get Aput Mantle
        ring1="Shiva Ring",
        -- ring2="Haverton Ring",
        waist="Eschan Stone", --TODO: Get Eschan Stone
        legs="Shneddick Tights +1", --TODO: Get Shneddick Tights +1
        feet="Hachiya Kyahan +1" -- int 10 mab+13 mac+13
    }

    -- Effusions
    sets.precast.Effusion = {}
    sets.precast.Effusion.Lunge = sets.midcast.ElementalNinjutsu
    sets.precast.Effusion.Swipe = sets.midcast.ElementalNinjutsu

    sets.idle = {
        ammo="Togakushi Shuriken",
        head="Hizamaru Somen +2",
        neck="Sanctity Necklace",
        ear1="Infused Earring", --TODO: Get Zennaroi Earring
        ear2="Heartseeker Earring", --TODO: Get Trux Earring
        body="Hizamaru Haramaki +2",
        hands="Adhemar Wristbands",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring",
        back="Shadow Mantle", --TODO: Get Solemnity Cape
        waist="Flume Belt",
        legs="Hachiya Hakama +1",
        feet="Danzo Sune-ate"
    }

    sets.idle.Regen = set_combine(sets.idle, {
        head="Rao Kabuto",
        body="Hizamaru Haramaki +2",
        ring2="Paguroidea Ring"
    })
    sets.Adoulin = {
        body="Councilor's Garb",
    }
    sets.idle.Town = set_combine(sets.idle, {
        head="Hizamaru Somen +2",
        neck="Sanctity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        body="Hizamaru Haramaki +2",
        hands="Hizamaru Kote +2",
        ring1="Rajas Ring",
        ring2="Epona's Ring",
        back="Andartia's Mantle", --TODO: Get a DEX-focused Andartia's Mantle (Andartia.DEX)
        waist="Windbuffet Belt +1",
        legs="Hizamaru Hizayoroi +2",
        feet="Danzo Sune-ate"
    })
    sets.idle.Town.Adoulin = set_combine(sets.idle.Town, {
       body="Councilor's Garb"
    })
    
    sets.idle.Weak = sets.idle

    -- Defense sets
    sets.defense.PDT = {
        head="Lithelimb Cap",
        neck="Twilight Torque",
        body="Emet Harness +1",
        hands="Herculean Gloves",
        ring1="Patricius Ring",
        ring2="Defending Ring",
        back="Solemnity Cape",
        waist="Flume Belt",
        legs="Ryuo Hakama",
        feet="Amm Greaves"
    }

    sets.defense.MDT = set_combine(sets.defense.PDT, {
        head="Ptica Headgear",
        neck="Twilight Torque",
        hands="Ryuo Tekko",
        feet="Amm Greaves"
    })

    sets.DayMovement = {feet="Danzo sune-ate"}
    sets.NightMovement = {feet="Hachiya Kyahan +1"}

    sets.Organizer = {
        main="Kannagi",
        sub="Achiuchikapu",
        neck="Malevolence",
        head="Shigi",
        shihei="Shihei",
        inoshi="Inoshishinofuda",
        shika="Shikanofuda",
        chono="Chonofuda"
    }

    -- Normal melee group without buffs
    sets.engaged = {
        ammo=gear.RegularAmmo,
        head="Adhemar Bonnet",
        neck="Asperity Necklace",
        ear1="Dedition Earring",
        ear2="Suppanomimi",
        body="Adhemar Jacket",
        hands="Adhemar Wristbands",
        ring1="Petrov Ring",
        ring2="Epona's Ring",
        back="Yokaze Mantle", --TODO: Get a DEX-focused Andartia's Mantle (Andartia.DEX)
        waist="Sailfi Belt +1", --TODO: Get a Shetal Stone
        legs="Samnuha Tights",
        feet="Herculean Boots"
    }
    -- assumptions made about targe
    sets.engaged.Low = set_combine(sets.engaged, {
        neck="Lissome Necklace",
        ear1="Cessance Earring",
    })

    sets.engaged.Mid = set_combine(sets.engaged.Low, {
        neck="Yarak Torque",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        waist="Olseni Belt",
        feet="Hizamaru Sune-ate +2"
    })

    sets.engaged.Acc = set_combine(sets.engaged.Mid, {
        ring1="Cacoethic Ring +1",
    })

    -- set for fooling around without dual wield
    sets.NoDW = set_combine(sets.engaged, {
        head="Herculean Helm",
        neck="Lissome Necklace",
        ear2="Cessance Earring",
        body="Rao Togi",
        hands="Herculean Gloves",
        ring1="Petrov Ring",
        waist="Windbuffet Belt +1",
        back=Andartia.DEX,
        legs="Herculean Trousers",
        feet="Herculean Boots"
    })

    sets.engaged.Innin = set_combine(sets.engaged, {
        head="Hattori Zukin +1",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        waist="Windbuffet Belt +1",
    })
    sets.engaged.Innin.Low = sets.engaged.Low
    sets.engaged.Innin.Mid = sets.engaged.Mid
    sets.engaged.Innin.Acc = sets.engaged.Acc

    -- Defenseive sets
    sets.NormalPDT = {
        head="Lithelimb Cap",
        body="Emet Harness +1",
        neck="Agitator's Collar",
        hands="Floral Gauntlets",
        back="Solemnity Cape",
        ring1="Defending Ring",
        legs="Ryuo Hakama",
        feet="Amm greaves"
    }
    sets.AccPDT = {
        head="Rao Kabuto",
        body="Emet Harness +1",
        neck="Agitator's Collar",
        hands="Floral Gauntlets",
        ring1="Patricius Ring",
        ring2="Defending Ring",
        legs="Herculean Trousers",
        feet="Loyalist Sabatons"
    }

    sets.engaged.PDT = set_combine(sets.engaged, sets.NormalPDT)
    sets.engaged.Low.PDT = set_combine(sets.engaged.Low, sets.NormalPDT)
    sets.engaged.Mid.PDT = set_combine(sets.engaged.Mid, sets.NormalPDT)
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.AccPDT)

    sets.engaged.Innin.PDT = set_combine(sets.engaged.Innin, sets.NormalPDT, {head="Hattori Zukin +1"})
    sets.engaged.Innin.Low.PDT = sets.engaged.Low.PDT
    sets.engaged.Innin.Mid.PDT = sets.engaged.Mid.PDT
    sets.engaged.Innin.Acc.PDT = sets.engaged.Acc.PDT

    sets.engaged.HastePDT = {
        neck="Agitator's Collar",
        hands="Herculean Gloves",
        body="Emet Harness +1",
        waist="Flume Belt",
        ring1="Defending Ring",
        back="Solemnity Cape",
        legs="Ryuo Hakama",
        feet="Amm Greaves"
    }

    -- Delay Cap from spell + songs alone
    sets.engaged.MaxHaste = set_combine(sets.engaged, {
        head="Herculean Helm",
        neck="Asperity Necklace",
        ear1="Brutal Earring",
        ear2="Cessance Earring",
        body="Rawhide Vest",
        hands="Herculean Gloves",
        ring1="Petrov Ring",
        ring2="Epona's Ring",
        back=Andartia.DEX,
        waist="Windbuffet Belt +1",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    })
    -- Base set for hard content
    sets.engaged.Low.MaxHaste = set_combine(sets.engaged.MaxHaste, {
        neck="Lissome Necklace",
        ear1="Trux Earring",
        back=Andartia.DEX,
    })
    sets.engaged.Mid.MaxHaste = set_combine(sets.engaged.Low.MaxHaste, {
        head="Herculean Helm",
        ring1="Cacoethic Ring +1",
        body="Rao Togi",
    })
    sets.engaged.Acc.MaxHaste = set_combine(sets.engaged.Mid.MaxHaste, {
        head="Herculean Helm",
        neck="Yarak Torque",
        ear1="Zennaroi Earring",
        hands="Ryuo Tekko",
        ring1="Cacoethic Ring +1",
        ring2="Patricius Ring",
        back=Andartia.DEX,
        waist="Olseni Belt",
        feet="Herculean Boots"
    })
    sets.engaged.Innin.MaxHaste     = set_combine(sets.engaged.MaxHaste, {head="Hattori Zukin +1"})
    sets.engaged.Innin.Low.MaxHaste = sets.engaged.Low.MaxHaste
    sets.engaged.Innin.Mid.MaxHaste = sets.engaged.Mid.MaxHaste
    sets.engaged.Innin.Acc.MaxHaste = sets.engaged.Acc.MaxHaste

    -- Defensive sets
    sets.engaged.PDT.MaxHaste = set_combine(sets.engaged.MaxHaste, sets.engaged.HastePDT)
    sets.engaged.Low.PDT.MaxHaste = set_combine(sets.engaged.Low.MaxHaste, sets.engaged.HastePDT)
    sets.engaged.Mid.PDT.MaxHaste = set_combine(sets.engaged.Mid.MaxHaste, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.MaxHaste = set_combine(sets.engaged.Acc.MaxHaste, sets.AccPDT)

    sets.engaged.Innin.PDT.MaxHaste = set_combine(sets.engaged.Innin.MaxHaste, sets.NormalPDT)
    sets.engaged.Innin.Low.PDT.MaxHaste = sets.engaged.Low.PDT.MaxHaste
    sets.engaged.Innin.Mid.PDT.MaxHaste = sets.engaged.Mid.PDT.MaxHaste
    sets.engaged.Innin.Acc.PDT.MaxHaste = sets.engaged.Acc.PDT.MaxHaste

    -- 35% Haste 
    sets.engaged.Haste_35 = set_combine(sets.engaged.MaxHaste, {
        head="Herculean Helm",
        ear1="Cessance Earring",
        ear2="Suppanomimi",
        ring1="Haverton Ring",
        hands="Herculean Gloves",
    })
    sets.engaged.Low.Haste_35 = set_combine(sets.engaged.Low.MaxHaste, {
        head="Herculean Helm",
        neck="Lissome Necklace",
        ear1="Cessance Earring",
        ear2="Suppanomimi",
        ring1="Haverton Ring",
    })
    sets.engaged.Mid.Haste_35 = set_combine(sets.engaged.Mid.MaxHaste, {
        head="Ryuo Somen",
        ear1="Cessance Earring",
        ear2="Trux Earring",
        ring1="Haverton Ring",
    })
    sets.engaged.Acc.Haste_35 = set_combine(sets.engaged.Acc.MaxHaste, {
        head="Herculean Helm",
        ear1="Cessance Earring",
        ear2="Zennaroi Earring",
        hands="Ryuo Tekko",
        body="Rao Togi",
        legs="Herculean Trousers",
        feet="Taeon Boots"
    })

    sets.engaged.Innin.Haste_35 = set_combine(sets.engaged.Haste_35, {
        head="Hattori Zukin +1",
    })
    sets.engaged.Innin.Low.Haste_35 = sets.engaged.Low.Haste_35
    sets.engaged.Innin.Mid.Haste_35 = sets.engaged.Mid.Haste_35
    sets.engaged.Innin.Acc.Haste_35 = sets.engaged.Acc.Haste_35

    sets.engaged.PDT.Haste_35 = set_combine(sets.engaged.Haste_35, sets.engaged.HastePDT)
    sets.engaged.Low.PDT.Haste_35 = set_combine(sets.engaged.Low.Haste_35, sets.engaged.HastePDT)
    sets.engaged.Mid.PDT.Haste_35 = set_combine(sets.engaged.Mid.Haste_35, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.Haste_35 = set_combine(sets.engaged.Acc.Haste_35, sets.engaged.AccPDT)

    sets.engaged.Innin.PDT.Haste_35 = set_combine(sets.engaged.Innin.Haste_35, sets.engaged.HastePDT)
    sets.engaged.Innin.Low.PDT.Haste_35 = sets.engaged.Low.PDT.Haste_35
    sets.engaged.Innin.Mid.PDT.Haste_35 = sets.engaged.Mid.PDT.Haste_35
    sets.engaged.Innin.Acc.PDT.Haste_35 = sets.engaged.Acc.PDT.Haste_35

    -- 30% Haste 1626 / 798
    sets.engaged.Haste_30 = set_combine(sets.engaged.Haste_35, {
        head="Ryuo Somen",
        neck="Asperity Necklace",
        ear1="Brutal Earring",
        ear2="Cessance Earring",
        body="Mochizuki Chainmail +1",
        hands="Herculean Gloves",
        ring1="Haverton Ring",
        ring2="Epona's Ring",
        back=Andartia.DEX,
        waist="Windbuffet Belt +1",
        legs="Samnuha Tights",
        feet="Herculean Boots"
    })
    -- This can alternatively be used for high-def targets. 
    sets.engaged.Low.Haste_30 = set_combine(sets.engaged.Haste_30, {
        head="Ryuo Somen",
        neck="Lissome Necklace",
        ear1="Trux Earring",
        ear2="Cessance Earring",
        body="Mochizuki Chainmail +1",
        hands="Herculean Gloves",
        ring1="Haverton Ring",
        ring2="Epona's Ring",
        back=Andartia.DEX,
        waist="Windbuffet Belt +1",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    })
    sets.engaged.Mid.Haste_30 = set_combine(sets.engaged.Low.Haste_30, {
        body="Rao Togi",
        feet="Hizamaru Sune-ate +2"
    })
    sets.engaged.Acc.Haste_30 = set_combine(sets.engaged.Mid.Haste_30, {
        head="Herculean Helm",
        neck="Yarak Torque",
        body="Hattori Ningi +1",
        hands="Floral Gauntlets",
        ring2="Cacoethic Ring +1",
        back=Andartia.DEX,
        waist="Olseni Belt",
        legs="Herculean Trousers",
        feet="Hizamaru Sune-ate +2"
    })

    sets.engaged.Innin.Haste_30 = set_combine(sets.engaged.Haste_30, {
        head="Hattori Zukin +1",
        feet="Herculean Boots"
    })
    sets.engaged.Innin.Low.Haste_30 = sets.engaged.Low.Haste_30
    sets.engaged.Innin.Mid.Haste_30 = sets.engaged.Mid.Haste_30
    sets.engaged.Innin.Acc.Haste_30 = sets.engaged.Acc.Haste_30

    sets.engaged.PDT.Haste_30 = set_combine(sets.engaged.Haste_30, sets.engaged.HastePDT)
    sets.engaged.Low.PDT.Haste_30 = set_combine(sets.engaged.Low.Haste_30, sets.engaged.HastePDT)
    sets.engaged.Mid.PDT.Haste_30 = set_combine(sets.engaged.Mid.Haste_30, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.Haste_30 = set_combine(sets.engaged.Acc.Haste_30, sets.engaged.AccPDT)

    sets.engaged.Innin.PDT.Haste_30 = set_combine(sets.engaged.Innin.Haste_30, sets.engaged.HastePDT)
    sets.engaged.Innin.Low.PDT.Haste_30 = sets.engaged.Low.PDT.Haste_30
    sets.engaged.Innin.Mid.PDT.Haste_30 = sets.engaged.Mid.PDT.Haste_30
    sets.engaged.Innin.Acc.PDT.Haste_30 = sets.engaged.Acc.PDT.Haste_30


    -- haste spell - 139 dex | 275 acc | 1150 total acc (with shigi R15)
    sets.engaged.Haste_15 = set_combine(sets.engaged.Haste_30, {
        head="Ryuo Somen",
        neck="Asperity Necklace",
        ear1="Brutal Earring",
        ear2="Suppanomimi",
        body="Mochizuki Chainmail +1",
        hands="Herculean Gloves",
        ring1="Haverton Ring",
        ring2="Epona's Ring",
        back=Andartia.DEX,
        waist="Windbuffet Belt +1",
        legs="Samnuha Tights",
        feet="Hizamaru Sune-ate +2"
    })
    sets.engaged.Low.Haste_15 = set_combine(sets.engaged.Haste_15, {
        neck="Lissome Necklace",
        legs="Herculean Trousers"
    })
    sets.engaged.Mid.Haste_15 = set_combine(sets.engaged.Low.Haste_15, { -- 676
        ear1="Cessance Earring",
        neck="Yarak Torque",
        legs="Herculean Trousers",
        feet="Hizamaru Sune-ate +2"
    })
    sets.engaged.Acc.Haste_15 = set_combine(sets.engaged.Acc.Haste_30, {
        head="Ryuo Somen",
        feet="Hizamaru Sune-ate +2"
    })
    
    sets.engaged.Innin.Haste_15 = set_combine(sets.engaged.Haste_15, {
        head="Hattori Zukin +1",
    })
    sets.engaged.Innin.Low.Haste_15 = sets.engaged.Low.Haste_15
    sets.engaged.Innin.Mid.Haste_15 = sets.engaged.Mid.Haste_15
    sets.engaged.Innin.Acc.Haste_15 = sets.engaged.Acc.Haste_15
    
    sets.engaged.PDT.Haste_15 = set_combine(sets.engaged.Haste_15, sets.engaged.HastePDT)
    sets.engaged.Low.PDT.Haste_15 = set_combine(sets.engaged.Low.Haste_15, sets.engaged.HastePDT)
    sets.engaged.Mid.PDT.Haste_15 = set_combine(sets.engaged.Mid.Haste_15, sets.engaged.HastePDT)
    sets.engaged.Acc.PDT.Haste_15 = set_combine(sets.engaged.Acc.Haste_15, sets.engaged.AccPDT)
    
    sets.engaged.Innin.PDT.Haste_15 = set_combine(sets.engaged.Innin.Haste_15, sets.engaged.HastePDT)
    sets.engaged.Innin.Low.PDT.Haste_15 = sets.engaged.Low.PDT.Haste_15
    sets.engaged.Innin.Mid.PDT.Haste_15 = sets.engaged.Mid.PDT.Haste_15
    sets.engaged.Innin.Acc.PDT.Haste_15 = sets.engaged.Acc.PDT.Haste_15
    
    sets.buff.Migawari = {body="Hattori Ningi +1"}
    
    -- Weaponskills 
    sets.precast.WS = {
        ammo="Aurgelmir Orb",
        head="Hizamaru Somen +2",
        neck="Fotia Gorget",
        ear1="Brutal Earring",
        ear2="Moonshade Earring",
        body="Hizamaru Haramaki +2",
        hands="Hizmaru Kote +2",
        ring1="Rajas Ring", --TODO: Get Apate Ring
        ring2="Epona's Ring",
        back="Andartia's Mantle", --TODO: Get Andartia.DEX mantle
        waist="Fotia Belt",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    }
    
    sets.precast.WS.Mid = set_combine(sets.precast.WS, {
        legs="Herculean Trousers",
    })
    sets.precast.WS.Low = sets.precast.WS.Mid
    
    sets.precast.WS.Acc = set_combine(sets.precast.WS.Mid, {
        body="Rao Togi",
    })
    
    sets.Kamu = {
        ammo="Ginsen",
        neck="Breeze Gorget",
        head="Rao Kabuto",
        back=Andartia.AGI,
        legs="Hizamaru Hizayoroi +2",
        waist="Windbuffet Belt +1",
    }
    sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS, sets.Kamu)
    sets.precast.WS['Blade: Kamu'].Low = set_combine(sets.precast.WS.Low, sets.Kamu)
    sets.precast.WS['Blade: Kamu'].Mid = set_combine(sets.precast.WS.Mid, sets.Kamu)
    sets.precast.WS['Blade: Kamu'].Acc = set_combine(sets.precast.WS.Acc, sets.Kamu, {waist="Caudata Belt"})
    
    -- BLADE: JIN
    sets.Jin = {
        ammo="Yetshila",
        head="Herculean Helm",
        neck="Breeze Gorget",
        body="Hattori Ningi +1",
        hands="Ryuo Tekko",
        waist="Windbuffet Belt +1",
    }
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, sets.Jin)
    sets.precast.WS['Blade: Jin'].Low = set_combine(sets.precast.WS['Blade: Jin'], {
        neck="Breeze Gorget",
        waist="Thunder Belt",
    })
    sets.precast.WS['Blade: Jin'].Mid = set_combine(sets.precast.WS['Blade: Jin'].Low, {
    })
    sets.precast.WS['Blade: Jin'].Acc = set_combine(sets.precast.WS['Blade: Jin'].Mid, {
        legs="Samnuha Tights",
    })
    
    -- BLADE: HI
    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {
        ammo="Aurgelmir Orb",
        head="Herculean Helm",
        neck="Rancor Collar",
        ear1="Ishvara Earring",
        body="Hattori Ningi +1",
        hands="Ryuo Tekko",
        ring1="Garuda Ring",
        back=Andartia.AGI,
        waist="Windbuffet Belt +1",
        legs="Herculean Trousers",
        feet="Herculean Boots"
    })
    
    sets.precast.WS['Blade: Hi'].Low = set_combine(sets.precast.WS['Blade: Hi'], {
        neck="Shadow Gorget",
    })
    sets.precast.WS['Blade: Hi'].Mid = set_combine(sets.precast.WS['Blade: Hi'], {
        neck="Shadow Gorget",
        waist="Caudata Belt",
    })
    
    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS['Blade: Hi'].Mid, {
        ear1="Cessance Earring",
    })
    
    -- BLADE: SHUN
    sets.Shun = {
        head="Herculean Helm",
        neck="Flame Gorget",
        hands="Herculean Gloves",
        ring1="Ramuh Ring",
        back=Andartia.DEX,
        waist="Light Belt",
        legs="Samnuha Tights",
        feet="Herculean Boots"
    }
    
    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, sets.Shun)
    sets.precast.WS['Blade: Shun'].Low = set_combine(sets.precast.WS.Low, sets.Shun)
    sets.precast.WS['Blade: Shun'].Mid = set_combine(sets.precast.WS.Mid, sets.Shun)
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS.Acc, sets.Shun)
    
    -- BLADE: Rin
    sets.Rin = {
        neck="Defiant Collar",
        waist="Windbuffet Belt +1",
        back=Andartia.DEX,
    }
    sets.precast.WS['Blade: Rin'] = set_combine(sets.precast.WS, sets.Rin)
    sets.precast.WS['Blade: Rin'].Low = set_combine(sets.precast.WS.Low, sets.Rin)
    sets.precast.WS['Blade: Rin'].Mid = set_combine(sets.precast.WS.Mid, sets.Rin)
    sets.precast.WS['Blade: Rin'].Acc = set_combine(sets.precast.WS.Acc, sets.Rin, {waist="Light Belt"})
    
    -- BLADE: KU 
    sets.Ku = {
        head="Rao Kabuto",
        ear2="Trux Earring",
        neck="Shadow Gorget",
        back=Andartia.DEX,
    }
    sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS, sets.Ku)
    sets.precast.WS['Blade: Ku'].Low = set_combine(sets.precast.WS['Blade: Ku'], {
        body="Hattori Ningi +1",
        waist="Soil Belt"
    })
    sets.precast.WS['Blade: Ku'].Mid = sets.precast.WS['Blade: Ku'].Low
    sets.precast.WS['Blade: Ku'].Acc = set_combine(sets.precast.WS['Blade: Ku'].Mid, {
        legs="Samnuha Tights",
        feet="Herculean Boots"
    })
    
    sets.Ten = {
        head="Rao Kabuto",
        neck="Shadow Gorget",
        ear1="Lugra Earring +1",
        ear2="Moonshade Earring",
        body="Rao Togi",
        legs="Hizamaru Hizayoroi +2",
        back=Andartia.AGI,
        waist="Metalsinger Belt",
    }
    
    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, sets.Ten)
    sets.precast.WS['Blade: Ten'].Low = set_combine(sets.precast.WS['Blade: Ten'], {
        body="Mes'yohi Haubergeon",
    })
    sets.precast.WS['Blade: Ten'].Mid = set_combine(sets.precast.WS['Blade: Ten'].Low, {
        waist="Caudata Belt"
    })
    sets.precast.WS['Blade: Ten'].Acc = set_combine(sets.precast.WS['Blade: Ten'].Mid, {
        legs="Samnuha Tights",
        feet="Herculean Boots"
    })
    
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {
        head="Mochizuki Hatsuburi +1",
        ear1="Friomisi Earring",
        neck="Sanctity Necklace",
        body="Samnuha Coat",
        hands="Leyline Gloves",
        ring1="Garuda Ring",
        ring2="Acumen Ring",
        legs="Shneddick Tights +1",
        waist="Thunder Belt",
        feet="Herculean Boots"
    })
    sets.precast.WS['Blade: Chi'] = set_combine(sets.precast.WS['Aeolian Edge'], {
        ring1="Shiva Ring",
        ring2="Acumen Ring",
        waist="Caudata Belt",
        legs="Shneddick Tights +1",
        back=Andartia.AGI,
        feet="Herculean Boots"
    })
    sets.precast.WS['Blade: To'] = sets.precast.WS['Blade: Chi']

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 13)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 13)
    elseif player.sub_job == 'THF' then
        set_macro_page(3, 13)
    else
        set_macro_page(1, 13)
    end
end
