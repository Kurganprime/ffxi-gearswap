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
    -- Precast Sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn +1"}
    
    sets.precast.JA['Elemental Siphon'] = {
        --Telchine augments:
        --Elemental Siphon +35
        main="Soulscourge", --Replace with augmented Keraunos
        -- sub="Vox Grip",
        -- ammo="Esper Stone +1",
        head="Convoker's Horn +1", --TODO: Replace with augmented Telchine Cap
        neck="Caller's Pendant",
        -- ear1="Andoaa Earring",
        -- ear2="Summoning Earring",
        body="Beckoner's Doublet +1", --TODO: Replace with augmented Telchine Chasuble
        hands="Glyphic Bracers +1", --TODO: Replace with augmented Telchine Gloves
        ring1="Fervor Ring", --TODO: Replace with Globidonta Ring
        ring2="Evoker's Ring",
        back="Conveyance Cape", --TODO: Replace with augmented Conveyance Cape (SMN skill +5)
        -- waist="Cimmerian Sash",
        legs="Marduk's Shalwar +1", --TODO: Replace with augmented Telchine Braconi
        feet="Beckoner's Pigaches +1"
    }
		--{main="Keraunos",sub="Vox Grip",ammo="Esper Stone +1",
		--head="Telchine Cap",neck="Caller's Pendant",ear1="Summoning Earring",ear2="Andoaa Earring",
		--body="Telchine Chasuble",hands="Telchine Gloves",ring1="Globidonta Ring",ring2="Evoker's Ring",
		--back="Conveyance Cape",waist="Cimmerian Sash",legs="Telchine Braconi",feet="Beckoner's Pigaches +1"}

    sets.precast.JA['Mana Cede'] = {hands="Beckoner's Bracers +1"}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {
        ammo="Seraphicaller",
		head="Glyphic Horn +1",
        body="Glyphic Doublet +1",
        hands="Glyphic Bracers +1",
        back="Conveyance Cape", --TODO: Augment Conveyance Cape with BP Delay II -2/3
        feet="Glyphic Pigaches +1"
    }
    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Vanir Cotehardie",ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}
		--{ammo="Impatiens",
		--head="Nahtirah Hat",neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter's Earring +1",
		--body="Marduk's Jubbah +1",hands="Telchine Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		--back="Swith Cape +1",waist="Witful Belt",legs="Artsieq Hose",feet="Regal Pumps +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Pahtli Cape",waist="Cascade Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {
        head="Nahtirah Hat",ear1="Gifted Earring",ear2="Loquacious Earring",
        body="Convoker's Doublet +1",hands="Beckoner's Bracers +1",ring1="Evoker's Ring",ring2="Sangoma Ring",
        back="Pahtli Cape",waist="Fucho-no-Obi",legs="Nares Trews",feet="Chelona Boots +1"}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Prolix Ring",ring2="Sirona's Ring",
        back="Swith Cape",waist="Witful Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    sets.midcast.Stoneskin = {waist="Siegel Sash"}

    sets.midcast['Elemental Magic'] = {main="Lehbrailg +2",sub="Wizzan Grip",
        head="Hagondes Hat +1",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist=gear.ElementalBelt,legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    sets.midcast['Dark Magic'] = {main="Lehbrailg +2",sub="Wizzan Grip",
        head="Nahtirah Hat",neck="Aesir Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Excelsis Ring",ring2="Sangoma Ring",
        waist="Fucho-no-Obi",legs="Bokwus Slops",feet="Bokwus Boots"}


    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = {
        head="Convoker's Horn +1",
        neck="Caller's Pendant",
        --ear1="Andoaa Earring",
        ear2="Evans Earring", --TODO: Replace with Summoning Earring
        body="Beckoner's Doublet +1",
        hands="Glyphic Bracers +1",
        ring1="Evoker's Ring",
        ring2="Fervor Ring", --TODO: Replace with Globidonta Ring
        back="Conveyance Cape", --TODO: Replace with augmented Conveyance Cape (SMN skill +5)
        -- waist="Cimmerian Sash",
        legs="Beckoner's Spats +1",
        -- feet="Marduk's Crackows +1"
    }
		--{head="Convoker's Horn +1",neck="Caller's Pendant",ear1="Andoaa Earring",ear2="Summoning Earring",
		--body="Beckoner's Doublet +1",hands="Glyphic Bracers +1",ring1="Evoker's Ring",ring2="Globidonta Ring",
		--back="Conveyance Cape",waist="Cimmerian Sash",legs="Beckoner's Spats +1",feet="Marduk's Crackows +1"}

    sets.midcast.Pet.DebuffBloodPactWard = {
        head="Convoker's Horn +1", --TODO: Replace with augmented Helios Band
        neck="Caller's Pendant",
        -- ear1="Andoaa Earring",
        ear2="Evans Earring", --TODO: Replace with Summoning Earring
        body="Beckoner's Doublet +1", --TODO: Replace with augmented Helios Jacket
        hands="Glyphic Bracers +1", --TODO: Replace with augmented Helios Gloves
        ring1="Evoker's Ring",
        ring2="Fervor Ring", --TODO: Replace with Globidonta Ring
        back="Conveyance Cape", --TODO: Replace with augmented Conveyance Cape
        -- waist="Cimmerian Sash",
        -- legs="Helios Spats", --TODO: Replace with augmented Helios Spats
        -- feet="Helios Boots" --TODO: Replace with augmented Helios Boots
    }
		--{head="Helios Band",neck="Caller's Pendant",ear1="Andoaa Earring",ear2="Summoning Earring",
		--body="Helios Jacket",hands="Helios Gloves",ring1="Evoker's Ring",ring2="Globidonta Ring",
		--back="Conveyance Cape",waist="Cimmerian Sash",legs="Helios Spats",feet="Helios Boots"}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = {
        main="Espiritus", --TODO: Replace with Nirvana
        --sub="Vox Grip",
        ammo="Seraphicaller",
        head="Convoker's Horn +1", --TODO: Replace with Augmented Helios Band
        neck="Caller's Pendant", --TODO: Replace with Sacrifice Torque
        --ear1="Esper Earring",
        ear2="Evans Earring", --TODO: Replace with Domesticator's Earring (Ouryu HTBF)
        body="Convoker's Doublet +1",
        hands="Glyphic Bracers +1", --TODO: Replace with augmented Helios Gloves
        ring1="Evoker's Ring",
        ring2="Fervor Ring", --TODO: Maybe replace with Thurandaut Ring
        back="Samanisi Cape", --TODO: Replace with augmented Conveyance Cape
        -- waist="Mujin Obi",
        legs="Enticer's Pants", --TODO: Replace with augmented Helios Spats
        feet="Psycloth Boots" --TODO: Replace with augmented Helios Boots
    }

    sets.midcast.Pet.PhysicalBloodPactRage.Acc = sets.midcast.Pet.PhysicalBloodPactRage

    sets.midcast.Pet.MagicalBloodPactRage = {
        --All Helios Augments:
        --Blood Pact Damage +7
        --Pet: MAB+30, Crit. Hit Rate +4
        main="Espiritus", --TODO: Replace with augmented Keraunos or Nirvana
        --sub="Vox Grip",
        ammo="Seraphicaller",
        head="Glyphic Horn +1", --TODO: Replace with augmented Helios Band
        neck="Caller's Pendant", --TODO: Replace with Eidolon Pendant +1
        --ear1="Esper Earring",
        ear2="Evans Earring", --TODO: Replace with augmented Diamond Earring
        body="Convoker's Doublet +1", --TODO: Replace with augmented Helios Jacket
        hands="Psycloth Manillas", --TODO: Replace with augmented Helios Gloves
        ring1="Speaker's Ring", --TODO: Maybe replace with Thurandaut Ring? (Adoulin reward)
        ring2="Evoker's Ring",
        back="Samanisi Cape", --TODO: Replace with augmented Conveyance Cape (BP Damage +5)
        waist="Caller's Sash",
        legs="Enticer's Pants", --TODO: Replace with augmented Helios Spats
        feet="Hagondes Sabots" --TODO: Replace with augmented Helios Boots
    }

    sets.midcast.Pet.MagicalBloodPactRage.Acc = sets.midcast.Pet.MagicalBloodPactRage


    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {legs="Glyphic Spats +1"}
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.BloodPactRage, {legs="Glyphic Spats +1"})

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
    

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main=gear.Staff.HMP,ammo="Seraphicaller",
        head="Beckoner's Horn +1",neck="Wiglen Gorget",ear1="Gifted Earring",ear2="Loquacious Earring",
        body="Hagondes Coat +1",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Pahtli Cape",waist="Shinjutsu-no-Obi",legs="Nares Trews",feet="Chelona Boots +1"}
    
    -- Idle sets
    sets.idle = {
        main="Bolelabunga",
        sub="Genbu's Shield",
        ammo="Seraphicaller",
        head="Beckoner's Horn +1",
        neck="Wiglen Gorget",
        ear1="Gifted Earring",
        ear2="Ethereal Earring",
        body="Shomonjijoe +1",
        hands="Serpentes Cuffs",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring",
        back="Umbra Cape",
        waist="Fucho-no-Obi",
        legs="Nares Trews",
        --legs="Assiduity Pants +1",
        feet="Serpentes Sabots"
    }

    sets.idle.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Seraphicaller",
        head="Convoker's Horn +1",neck="Twilight Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
        body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Sangoma Ring",
        back="Umbra Cape",waist="Fucho-no-Obi",legs="Hagondes Pants +1",feet="Herald's Gaiters"}

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
        main="Gridarvor", --TODO: Replace with Nirvana
        sub="Achaq Grip", --TODO: Replace with Oneiros Grip
        ammo="Seraphicaller",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        ear1="Gifted Earring", --TODO: Get a Rimeice Earring
        ear2="Evans Earring",
        body="Shomonjijoe +1",
        hands="Serpentes Cuffs", --TODO: Get augmented Helios Gloves
        ring1="Evoker's Ring",
        ring2="Sangoma Ring", --TODO: Maybe replace with Thurandaut Ring (Adoulin reward)
        back="Lucidity Sash", --TODO: Replace with augmented Conveyance Cape
        waist="Fucho-no-Obi", --TODO: Replace with Moepapa Stone
        legs="Enticer's Pants", --TODO: Replace with Assid. Pants +1
        feet="Psycloth Boots" --TODO: Replace with augmented Helios Boots
    }

    sets.idle.PDT.Avatar = {
        main="Gridarvor", --TODO: Replace with Nirvana
        sub="Achaq Grip", --TODO: Replace with Oneiros Grip
        ammo="Seraphicaller",
        head="Beckoner's Horn +1", --TODO: Replace with Selenian Cap
        neck="Caller's Pendant",
        ear1="Gifted Earring", --TODO: Replace with Handler's Earring
        ear2="Evans Earring", --TODO: Replace with Handler's Earring +1
        body="Shomonjijoe +1",
        hands="Regimen Mittens", --TODO: Replace with augmented Telchine Gloves
        ring1="Evoker's Ring",
        ring2="Defending Ring", --TODO: Maybe replace with Thurandaut Ring (Adoulin Reward)
        back="Conveyance Cape", --TODO: Augment Conveyance Cape
        waist="Fucho-no-Obi", --TODO: Replace with Isa Belt
        legs="Beckoner's Spats +1", --TODO: Replace with augmented Telchine Braconi
        feet="Beckoner's Pigaches +1"
    }

    sets.idle.Spirit = {main="Gridarvor",sub="Achaq Grip",ammo="Seraphicaller",
        head="Convoker's Horn +1",neck="Caller's Pendant",ear1="Gifted Earring",ear2="Loquacious Earring",
        body="Hagondes Coat +1",hands="Serpentes Cuffs",ring1="Evoker's Ring",ring2="Sangoma Ring",
        back="Samanisi Cape",waist="Fucho-no-Obi",legs="Glyphic Spats +1",feet="Herald's Gaiters"}

    sets.idle.Town = {
        main="Bolelabunga",
        sub="Genbu's Shield",
        ammo="Seraphicaller",
        head="Beckoner's Horn +1",
        neck="Wiglen Gorget",
        ear1="Gifted Earring",
        ear2="Ethereal Earring",
        body="Shomonjijoe +1",
        hands="Serpentes Cuffs",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring",
        back="Umbra Cape",
        waist="Fucho-no-Obi",
        legs="Nares Trews",
        --legs="Assiduity Pants +1",
        feet="Herald's Gaiters"
    }

    -- Favor uses Caller's Horn instead of Convoker's Horn for refresh
    sets.idle.Avatar.Favor = {body="Beckoner's Doublet +1",legs="Beckoner's Spats +1"}
    sets.idle.Avatar.Melee = {hands="Regimen Mittens",back="Samanisi Cape",waist="Kuku Stone",legs="Enticer's Pants",feet="Psycloth Boots"}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {body="Hagondes Coat +1",hands="Beckoner's Bracers +1"}
    sets.perp.Weather = {neck="Caller's Pendant",body="Hagondes Coat +1",hands="Beckoner's Bracers +1"}
    -- Carby: Mitts+Conv.feet = 1/tick perp.  Everything else should be +refresh
    sets.perp.Carbuncle = {main="Gridarvor",sub="Achaq Grip",
        head="Convoker's Horn +1",body="Hagondes Coat +1",hands="Carbuncle Mitts",legs="Nares Trews",feet="Convoker's Pigaches +1"}
    -- Diabolos's Rope doesn't gain us anything at this time
    --sets.perp.Diabolos = {waist="Diabolos's Rope"}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

    sets.perp.staff_and_grip = {main=gear.perp_staff,sub="Achaq Grip"}
    
    -- Defense sets
    sets.defense.PDT = {main=gear.Staff.PDT,
        head="Hagondes Hat +1",neck="Wiglen Gorget",ear1="Gifted Earring",ear2="Loquacious Earring",
        body="Hagondes Coat +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Fucho-no-Obi",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    sets.defense.MDT = {
        head="Hagondes Hat +1",neck="Twilight Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Umbra Cape",waist="Fucho-no-Obi",legs="Bokwus Slops",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Herald's Gaiters"}
    
    sets.latent_refresh = {waist="Fucho-no-obi"}
    

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {ammo="Seraphicaller",
        head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(1, 15)
end