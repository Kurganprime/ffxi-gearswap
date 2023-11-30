function user_setup()
    state.OffenseMode:options('None', 'Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    gear.perp_staff = {name="Gridarvor"}
	gear.Staff.PDT = {name="Terra's Staff"}
    
    select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
    -- Augmented gear
    --------------------------------------
	Keraunos = {}
	Keraunos.Siphon = { name="Keraunos", augments={'Pet: Mag. Acc.+25','"Elemental Siphon"+25',}}
	Keraunos.Perpetuation = { name="Keraunos", augments={'MP+69','Pet: Accuracy+20 Pet: Rng. Acc.+20','"Avatar perpetuation cost" -6',}}
	Keraunos.BPRage = { name="Keraunos", augments={'Pet: "Mag.Atk.Bns."+17','Pet: Crit.hit rate +4',}}

    Conveyance = {}
    Conveyance.BPDelay = {}
    Conveyance.BPDamage = { name="Conveyance Cape", augments={'Summoning magic skill +3','Pet: Enmity+15','Blood Pact Dmg.+4',}}

	Campestres = {}
	Campestres.PetDD = { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}
	Campestres.Magic = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}}

	TelchineHead = {}
	TelchineBody = {}
	TelchineHands = {}
	TelchineLegs = {}

    TelchineHead.Cure = { name="Telchine Cap", augments={'Mag. Acc.+25','"Cure" potency +6%','INT+5 MND+5',}}
	TelchineBody.Cure = { name="Telchine Chas.", augments={'Mag. Acc.+12','"Cure" potency +6%',}}
	TelchineHands.Cure = { name="Telchine Gloves", augments={'Mag. Acc.+20','"Cure" potency +8%','INT+6 MND+6',}}
	TelchineLegs.Cure = { name="Telchine Braconi", augments={'"Mag.Atk.Bns."+7','"Cure" potency +7%','INT+5 MND+5',}}

    HeliosBand = {}
	HeliosJacket = {}
	HeliosGloves = {}
	HeliosSpats = {}
	HeliosBoots = {}

    HeliosBand.PetDD = { name="Helios Band", augments={'Pet: Accuracy+26 Pet: Rng. Acc.+26','Pet: "Dbl. Atk."+8','Pet: Haste+6',}}
    HeliosJacket.PetDD = { name="Helios Jacket", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+8','Pet: Haste+6',}}
    HeliosGloves.PetDD = { name="Helios Gloves", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+8','Pet: Haste+6',}}
    HeliosSpats.PetDD = { name="Helios Spats", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+7','Pet: Haste+6',}}
    HeliosBoots.PetDD = { name="Helios Boots", augments={'Pet: Accuracy+27 Pet: Rng. Acc.+27','Pet: "Dbl. Atk."+7','Pet: Haste+6',}}

	HeliosBand.BPPhysical = { name="Helios Band", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: Crit.hit rate +4','Blood Pact Dmg.+7',}}
    HeliosJacket.BPPhysical = { name="Helios Jacket", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: Crit.hit rate +3','Blood Pact Dmg.+7',}}
    HeliosGloves.BPPhysical = { name="Helios Gloves", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: Crit.hit rate +3','Blood Pact Dmg.+5',}}
    HeliosSpats.BPPhysical = { name="Helios Spats", augments={'Pet: Attack+28 Pet: Rng.Atk.+28','Pet: Crit.hit rate +4','Blood Pact Dmg.+5',}}
    HeliosBoots.BPPhysical = { name="Helios Boots", augments={'Pet: Attack+28 Pet: Rng.Atk.+28','Pet: Crit.hit rate +3','Blood Pact Dmg.+5',}}

	HeliosBand.BPMagic = { name="Helios Band", augments={'Pet: "Mag.Atk.Bns."+29','Pet: Crit.hit rate +4','Blood Pact Dmg.+6',}}
    HeliosJacket.BPMagic = { name="Helios Jacket", augments={'Pet: "Mag.Atk.Bns."+27','Pet: Crit.hit rate +4','Blood Pact Dmg.+7',}}
    HeliosGloves.BPMagic = { name="Helios Gloves", augments={'Pet: "Mag.Atk.Bns."+30','Pet: Crit.hit rate +3','Blood Pact Dmg.+7',}}
    HeliosSpats.BPMagic = { name="Helios Spats", augments={'Pet: "Mag.Atk.Bns."+29','Pet: Crit.hit rate +3','Blood Pact Dmg.+7',}}
    HeliosBoots.BPMagic = { name="Helios Boots", augments={'Pet: "Mag.Atk.Bns."+24','Pet: Crit.hit rate +4','Blood Pact Dmg.+7',}}

	HeliosBand.BPWard = { name="Helios Band", augments={'Pet: Mag. Acc.+30','"Blood Boon"+6','Summoning magic skill +6',}}
    HeliosJacket.BPWard = { name="Helios Jacket", augments={'Pet: Mag. Acc.+30','"Blood Boon"+6','Summoning magic skill +8',}}
    HeliosGloves.BPWard = { name="Helios Gloves", augments={'Pet: Mag. Acc.+23','"Blood Boon"+7','Summoning magic skill +6',}}
    HeliosSpats.BPWard = { name="Helios Spats", augments={'Pet: Mag. Acc.+27','"Blood Boon"+5','Summoning magic skill +6',}}
    HeliosBoots.BPWard = { name="Helios Boots", augments={'Pet: Mag. Acc.+30','"Blood Boon"+6','Summoning magic skill +8',}}

    --------------------------------------
    -- Precast Sets
    --------------------------------------

    -- Precast set for calling Trusts at iLVL 119
    sets.precast.Trust = {
		head="Beckoner's Horn +1",
		body="Beckoner's Doublet +1",
		hands="Beckoner's Bracers +1",
		legs="Beckoner's Spats +1",
		feet="Beckoner's Pigaches +1"
	}
    sets.midcast.Trust = sets.precast.Trust

    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {
        head="Glyphic Horn +1"
    }
    
    sets.precast.JA['Elemental Siphon'] = {
        --Telchine augments:
        --Elemental Siphon +35
        main=Keraunos.Siphon,
        sub="Vox Grip",
        -- ammo="Esper Stone +1",
        head="Convoker's Horn +1", -- TODO: Replace with augmented Telchine Cap
        neck="Incanter's Torque",
        -- ear1="Lodurr Earring",
        -- ear2="Andoaa Earring", -- TODO: replace with Cath Palug Earring
        body="Beckoner's Doublet +1", -- TODO: Replace with augmented Telchine Chasuble
        hands="Lamassu Mitts +1",
        ring1="Evoker's Ring",
        ring2="Fervor Ring", -- TODO: Replace with Zodiac Ring
        back="Conveyance Cape", -- TODO: Replace with augmented Conveyance Cape (SMN skill +5)
        waist="Lucidity Sash", -- TODO: Replace with Kobo Obi (Geas Fete, RuAun, Seiryu)
        legs="Marduk's Shalwar +1", -- TODO: Replace with augmented Telchine Braconi
        feet="Beckoner's Pigaches +1"
    }

    sets.precast.JA['Mana Cede'] = {
        hands="Beckoner's Bracers +1"
    }

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {
        ammo="Sancus Sachet +1", -- BP Delay II -7
		head="Beckoner's Horn +1", 
        ear1="Caller's Earring", -- BP Delay -1
        ear2="Evans Earring", -- BP Delay -2
        body="Glyphic Doublet +1", -- BP Delay II -2
        hands="Glyphic Bracers +1", -- BP Delay -6
        ring1="Evoker's Ring",
        back="Samanisi Cape", -- BP Delay -3   TODO: Augment Conveyance Cape with BP Delay II -2/3
        legs="Glyphic Spats +1", -- BP Delay -6
        feet="Glyphic Pigaches +1" -- BP Delay II -1
    }
    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        ammo="Impatiens",
        head="Amalric Coif",
        neck="Orunmila's Torque",
        ear1="Loquacious Earring",
        ear2="Enchanter's Earring +1",
        body="Inyanga Jubbah +1",
        hands="Telchine Gloves",
        ring1="Lebeche Ring",
        ring2="Prolix Ring",
        back=Campestres.Magic,
        waist="Witful Belt",
        legs="Orvail Pants +1",
        feet="Amalric Nails"
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist="Siegel Sash"
    })

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nahtirah Hat",
        neck="Asperity Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Vanir Cotehardie",
        hands="Yaoyotl Gloves",
        ring1="Rajas Ring",
        ring2="K'ayres Ring",
        back="Pahtli Cape",
        waist="Cascade Belt",
        legs="Hagondes Pants +1",
        feet="Hagondes Sabots"
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {
        head="Nahtirah Hat",
        ear1="Gifted Earring",
        ear2="Loquacious Earring",
        body="Convoker's Doublet +1",
        hands="Beckoner's Bracers +1",
        ring1="Evoker's Ring",
        ring2="Sangoma Ring",
        back="Pahtli Cape",
        waist="Fucho-no-Obi",
        legs="Nares Trews",
        feet="Chelona Boots +1"
    }
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Beckoner's Horn +1",
        neck="Incanter's Torque",
        ear1="Gifted Earring",
        ear2="Loquacious Earring",
        body="Vrikodara Jupon",
        hands="Regimen Mittens",
        ring1="Prolix Ring",
        back=Campestres.Magic,
        waist="Goading Belt",
        legs="Assiduity Pants +1",
        feet="Beckoner's Pigaches +1"
    }

    sets.midcast.Cure = {
        main="Tamaxchi",
        sub="Genbu's Shield",
        ammo="Quartz Tathlum",
        head=TelchineHead.Cure,
        ear1="Medicant's Earring",
        ear2="Lifestorm Earring",
        body="Vrikodara Jupon",
        hands=TelchineHands.Cure,
        ring1="Prolix Ring",
        ring2="Sirona's Ring",
        back="Swith Cape",
        waist="Gishdubar Sash",
        legs=TelchineLegs.Cure,
        feet="Medium's Sabots"
    }

    sets.midcast.Stoneskin = {
        waist="Siegel Sash"
    }

    sets.midcast['Summoning Magic'] = {
        ammo="Sancus Sachet +1", -- Avatar Lv. 119
        main="Nirvana", -- Avatar Lv. +2
        ear1="Beckoner's Earring", -- Avatar Lv. +1
        back="Campestres's Cape", -- Avatar Lv. +1
        feet="Bunzi's Sabots" -- Avatar Lv. +1 
    }

    sets.midcast['Elemental Magic'] = {
        main="Lehbrailg +2",
        sub="Wizzan Grip",
        head="Hagondes Hat +1",
        neck="Stoicheion Medal",
        ear1="Friomisi Earring",
        ear2="Hecate's Earring",
        body="Hagondes Coat +1",
        hands="Yaoyotl Gloves",
        ring1="Icesoul Ring",
        ring2="Acumen Ring",
        back="Toro Cape",
        waist=gear.ElementalBelt,
        legs="Hagondes Pants +1",
        feet="Hagondes Sabots"
    }

    sets.midcast['Dark Magic'] = {
        main="Lehbrailg +2",
        sub="Wizzan Grip",
        head="Nahtirah Hat",
        neck="Aesir Torque",
        ear1="Lifestorm Earring",
        ear2="Psystorm Earring",
        body="Vanir Cotehardie",
        hands="Yaoyotl Gloves",
        ring1="Excelsis Ring",
        ring2="Sangoma Ring",
        waist="Fucho-no-Obi",
        legs="Bokwus Slops",
        feet="Bokwus Boots"
    }

    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = {
        main="Espiritus",
        sub="Vox Grip",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant", -- TODO: Replace earrings with Cath Palug and Lodurr
        ear1="Andoaa Earring",
        ear2="Evans Earring", -- TODO: Replace with Summoning Earring
        body="Beckoner's Doublet +1",
        hands="Lamassu Mitts +1",
        ring1="Fervor Ring", -- TODO: Replace with Stikini/+1 Ring
        ring2="Evoker's Ring",
        back=Conveyance.BPDamage,
        waist="Lucidity Sash", -- TODO: Replace with Kobo Obi
        legs="Beckoner's Spats +1",
        -- feet="Marduk's Crackows +1" -- TODO: Get Baayami Sabots +1 Su3
    }

    sets.midcast.Pet.DebuffBloodPactWard = {
        head=HeliosBand.BPWard,
        neck="Caller's Pendant",
        ear1="Andoaa Earring",
        ear2="Evans Earring", -- TODO: Replace with Summoning Earring
        body=HeliosJacket.BPWard,
        hands=HeliosGloves.BPWard,
        ring1="Evoker's Ring",
        ring2="Fervor Ring", -- TODO: Replace with Globidonta Ring
        back=Conveyance.BPDamage,
        waist="Lucidity Sash",
        legs=HeliosSpats.BPWard,
        feet=HeliosBoots.BPWard
    }
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = {
        main="Gridarvor", -- TODO: Replace with Nirvana
        sub="Vox Grip", -- TODO: Replace with Elan Strap/+1
        ammo="Sancus Sachet +1", -- TODO: Replace with Epitaph
        head=HeliosBand.BPPhysical,
        neck="Caller's Pendant", -- TODO: Replace with Shulmanu Collar (Omen, Fu) > Summoner's Collar +1/+2
        ear1="Gelos Earring",
        ear2="Kyrene's Earring", -- TODO: Replace with Lugalbanda Earring (Omen, Kei)
        body=HeliosJacket.BPPhysical,
        hands=HeliosGloves.BPPhysical,
        ring1="Evoker's Ring", -- TODO: Replace rings with Varar +1 and Cath Palug rings
        ring2="Fervor Ring",
        back=Conveyance.BPDamage,
        waist="Mujin Obi", -- TODO: Replace with Incarnation Sash (Vagary, Plouton)
        legs=HeliosSpats.BPPhysical,
        feet=HeliosBoots.BPPhysical
    }

    sets.midcast.Pet.PhysicalBloodPactRage.Acc = sets.midcast.Pet.PhysicalBloodPactRage

    sets.midcast.Pet.MagicalBloodPactRage = {
        --All Helios Augments:
        --Blood Pact Damage +7
        --Pet: MAB+30, Crit. Hit Rate +4
        main=Keraunos.BPRage, -- TODO: Replace with Grioavolr with augs BP8~10 Mab 17~20+
        sub="Vox Grip", -- TODO: Replace with Elan Strap/+1
        ammo="Sancus Sachet +1", -- TODO: Replace with Epitaph
        head=HeliosBand.BPMagic, -- TODO: Replace with Apogee Crown(A) > Cath Palug Crown
        neck="Eidolon Pendant +1", -- TODO: Replace with Adad Amulet > Summoner's Collar +1/+2
        ear1="Gelos Earring",
        ear2="Evans Earring", -- TODO: Replace with Lugalbanda
        body=HeliosJacket.BPMagic, -- TODO: Replace with Apogee Dalmatica +1
        hands=HeliosGloves.BPMagic,
        ring1="Speaker's Ring", -- TODO: Replace with Varar/+1 rings
        ring2="Evoker's Ring",
        back=Campestres.Magic,
        waist="Caller's Sash", -- TODO: Replace with Regal Belt (Omen, Ou)
        legs=HeliosSpats.BPMagic,
        feet=HeliosBoots.BPMagic
    }

    sets.midcast.Pet.MagicalBloodPactRage.Acc = sets.midcast.Pet.MagicalBloodPactRage

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {legs="Glyphic Spats +1"}
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.BloodPactRage, {
        legs="Glyphic Spats +1"
    })

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
    

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {
        main=gear.Staff.HMP,
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Wiglen Gorget",
        ear1="Gifted Earring",
        ear2="Loquacious Earring",
        body="Hagondes Coat +1",
        hands="Serpentes Cuffs",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring",
        back="Pahtli Cape",
        waist="Shinjutsu-no-Obi",
        legs="Nares Trews",
        feet="Chelona Boots +1"
    }
    
    -- Idle sets
    sets.idle = {
        main="Gridarvor", -- TODO: Nirvana
        sub="Vox Grip", -- TODO: Oneiros Grip
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        ear1="Infused Earring", -- TODO: Cath Palug Earring
        ear2="Evans Earring",
        body="Shomonjijoe +1",
        hands="Asteria Mitts +1",
        ring1="Evoker's Ring",
        ring2="Paguroidea Ring", -- TODO: Replace with Woltaris or Stikini/+1 ring
        back="Umbra Cape",
        waist="Lucidity Sash",
        legs="Assiduity Pants +1",
        feet="Inyanga Crackows +1" -- TODO: Apogee Pumps
    }

    sets.idle.PDT = set_combine(sets.idle, {
        main=gear.Staff.PDT,
        neck="Twilight Torque",
        body="Inyanga Jubbah +1",
        hands="Inyanga Dastanas +1",
        ring1="Defending Ring",
        ring2="Sangoma Ring",
        back="Cheviot Cape",
        legs="Inyanga Shalwar +1",
    })

    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- -perp gear:
    -- Gridarvor: -5
    -- Glyphic Horn: -4
    -- Caller's Doublet +2/Glyphic Doublet: -4
    -- Evoker's Ring: -1
    -- Convoker's Pigaches: -4
    -- total: -18
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {
        main="Gridarvor", -- TODO: Replace with Nirvana
        sub="Achaq Grip", -- TODO: Replace with Oneiros Grip
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        ear1="Gifted Earring", -- TODO: Get a Rimeice Earring
        ear2="Evans Earring",
        body=HeliosJacket.PetDD,
        hands=HeliosGloves.PetDD, -- TODO: Get augmented Helios Gloves
        ring1="Evoker's Ring",
        ring2="Sangoma Ring", -- TODO: Maybe replace with Thurandaut Ring (Adoulin reward)
        back=Campestres.PetDD,
        waist="Fucho-no-Obi", -- TODO: Replace with Moepapa Stone
        legs=HeliosSpats.PetDD,
        feet=HeliosBoots.PetDD -- TODO: Replace with augmented Helios Boots
    }

    sets.idle.PDT.Avatar = {
        main="Gridarvor", -- TODO: Replace with Nirvana
        sub="Achaq Grip", -- TODO: Replace with Oneiros Grip
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1", -- TODO: Replace with Selenian Cap
        neck="Caller's Pendant",
        ear1="Handler's Earring", -- TODO: Replace with Handler's Earring
        ear2="Handler's Earring +1", -- TODO: Replace with Handler's Earring +1
        body="Shomonjijoe +1",
        hands="Regimen Mittens", -- TODO: Replace with augmented Telchine Gloves
        ring1="Evoker's Ring",
        ring2="Defending Ring", -- TODO: Maybe replace with Thurandaut Ring (Adoulin Reward)
        back=Campestres.PetDD,
        waist="Fucho-no-Obi", -- TODO: Replace with Isa Belt
        legs="Beckoner's Spats +1", -- TODO: Replace with augmented Telchine Braconi
        feet="Beckoner's Pigaches +1"
    }

    sets.idle.Spirit = {
        main="Gridarvor",
        sub="Achaq Grip",
        ammo="Sancus Sachet +1",
        head="Convoker's Horn +1",
        neck="Caller's Pendant",
        ear1="Gifted Earring",
        ear2="Loquacious Earring",
        body="Hagondes Coat +1",
        hands="Serpentes Cuffs",
        ring1="Evoker's Ring",
        ring2="Sangoma Ring",
        back=Campestres.PetDD,
        waist="Fucho-no-Obi",
        legs="Glyphic Spats +1",
        feet="Herald's Gaiters"
    }

    sets.idle.Town = {
        main="Bolelabunga",
        sub="Genbu's Shield",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Wiglen Gorget",
        ear1="Gifted Earring",
        ear2="Ethereal Earring",
        body="Shomonjijoe +1",
        hands="Serpentes Cuffs",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring",
        back=Campestres.PetDD,
        waist="Fucho-no-Obi",
        legs="Nares Trews",
        legs="Assiduity Pants +1",
        feet="Herald's Gaiters"
    }

    -- Favor uses Caller's Horn instead of Convoker's Horn for refresh
    sets.idle.Avatar.Favor = {
        body="Beckoner's Doublet +1",
        legs="Beckoner's Spats +1"
    }
    sets.idle.Avatar.Melee = {
        hands="Regimen Mittens",
        back="Samanisi Cape",
        waist="Kuku Stone",
        legs="Enticer's Pants",
        feet="Psycloth Boots"
    }
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {
        body="Hagondes Coat +1",
        hands="Beckoner's Bracers +1"
    }
    sets.perp.Weather = {
        neck="Caller's Pendant",
        body="Hagondes Coat +1",
        hands="Beckoner's Bracers +1"
    }
    -- Carby: Mitts+Conv.feet = 1/tick perp.  Everything else should be +refresh
    sets.perp.Carbuncle = {
        main="Gridarvor",
        sub="Achaq Grip",
        head="Convoker's Horn +1",
        body="Hagondes Coat +1",
        hands="Carbuncle Mitts",
        legs="Nares Trews",
        feet="Convoker's Pigaches +1"
    }
    -- Diabolos's Rope doesn't gain us anything at this time
    --sets.perp.Diabolos = {waist="Diabolos's Rope"}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

    sets.perp.staff_and_grip = {
        main=gear.perp_staff,
        sub="Achaq Grip"
    }
    
    -- Defense sets
    sets.defense.PDT = {
        main=gear.Staff.PDT,
        head="Hagondes Hat +1",
        neck="Wiglen Gorget",
        ear1="Gifted Earring",
        ear2="Loquacious Earring",
        body="Hagondes Coat +1",
        hands="Yaoyotl Gloves",
        ring1="Defending Ring",
        ring2=gear.DarkRing.physical,
        back="Umbra Cape",
        waist="Fucho-no-Obi",
        legs="Hagondes Pants +1",
        feet="Hagondes Sabots"
    }

    sets.defense.MDT = {
        head="Hagondes Hat +1",
        neck="Twilight Torque",
        ear1="Gifted Earring",
        ear2="Loquacious Earring",
        body="Vanir Cotehardie",
        hands="Yaoyotl Gloves",
        ring1="Defending Ring",
        ring2="Shadow Ring",
        back="Umbra Cape",
        waist="Fucho-no-Obi",
        legs="Bokwus Slops",
        feet="Hagondes Sabots"
    }

    sets.Kiting = { feet="Herald's Gaiters" }
    
    sets.latent_refresh = { waist="Fucho-no-obi" }

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = set_combine(sets.idle.Avatar, {
    })
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(1, 15)
end