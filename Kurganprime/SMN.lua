-- Summoner Gearswap Lua by Pergatory - http://pastebin.com/u/pergatory
-- IdleMode determines the set used after casting. You change it with "/console gs c <IdleMode>"
-- The out-of-the-box modes are:
-- Refresh: Uses the most refresh available.
-- DT: A mix of refresh, PDT, and MDT to help when you can't avoid AOE.
-- PetDT: Sacrifice refresh to reduce avatar's damage taken. WARNING: Selenian Cap drops you below 119, use with caution!
-- DD: When melee mode is on and you're engaged, uses TP gear. Otherwise, avatar melee gear.
-- Favor: Uses Beckoner's Horn and max smn skill to boost the favor effect.
-- Zendik: Favor build with the Zendik Robe added in, for Shiva's Favor in manaburn parties. (Shut up, it sounded like a good idea at the time)

-- You can add your own modes in the IdleModes list, just make sure to add corresponding sets as well.

-- Additional Bindings:
-- F9 - Toggles between a subset of IdleModes (Refresh > DT > PetDT)
-- F10 - Toggles WeaponLock (When enabled, equips Nirvana and Elan+1, then disables those 2 slots from swapping)
--       NOTE: If you don't already have the Nirvana & Elan+1 equipped, YOU WILL LOSE TP

-- Additional Commands:
-- /console gs c AccMode - Toggles high-accuracy sets to be used where appropriate.
-- /console gs c ImpactMode - Toggles between using normal magic BP set for Fenrir's Impact or a custom high-skill set for debuffs.
-- /console gs c ForceIlvl - I have this set up to override a few specific slots where I normally use non-ilvl pieces.
-- /console gs c TH - Treasure Hunter toggle. By default, this is only used for Dia, Dia II, and Diaga.
-- /console gs c LagMode - Used to help BPs land in the right gear in high-lag situations.
--							Sets a timer to swap gear 0.5s after the BP is used rather than waiting for server response.

function file_unload()
	send_command('unbind f9')
	send_command('unbind f11')
	send_command('unbind ^f9')
	send_command('unbind ^f10')
	enable("main","sub","range","ammo","head","neck","ear1","ear2","body","hands","ring1","ring2","back","waist","legs","feet")
end

function get_sets()
	send_command('bind f9 gs c ToggleIdle') -- F9 = Cycle through commonly used idle modes
	send_command('bind f11 gs c ForceIlvl') -- Ctrl+F9 = Toggle ForceIlvl
	send_command('bind ^f9 gs c WeaponLock') -- F10 = Toggle Melee Mode
	send_command('bind ^f10 gs c TH') -- Ctrl+F10 = Treasure Hunter toggle

	-- Set your merits here. This is used in deciding between Enticer's Pants or Apogee Slacks +1.
	-- To change in-game, "/console gs c MeteorStrike3" will change Meteor Strike to 3/5 merits.
	-- The damage difference is very minor unless you're over 2400 TP.
	-- It's ok to just always use Enticer's Pants and ignore this section.
	MeteorStrike = 1
	HeavenlyStrike = 1
	WindBlade = 1
	Geocrush = 1
	Thunderstorm = 5
	GrandFall = 1

	StartLockStyle = '14'
	IdleMode = 'Refresh'
	AccMode = false
	ImpactDebuff = false
	WeaponLock = false
	TreasureHunter = false
	THSpells = S{"Dia","Dia II","Diaga"} -- If you want Treasure Hunter gear to swap for a spell/ability, add it here.
	ForceIlvl = false
	LagMode = false -- Default LagMode. If you have a lot of lag issues, change to "true".
		-- Warning: LagMode can cause problems if you spam BPs during Conduit because it doesn't trust server packets to say whether the BP is readying or not.
	SacTorque = true -- If you have Sacrifice Torque, this will auto-equip it when slept in order to wake up.
	AutoRemedy = false -- Auto Remedy when using an ability while Paralyzed.
	AutoEcho = false -- Auto Echo Drop when using an ability while Silenced.

	-- Add idle modes here if you need more options for your sets
	IdleModes = {'Refresh','DT','DD','PetDT','PetDD','Favor','Zendik','MEva'}

	-- ===================================================================================================================
	--		Sets
	-- ===================================================================================================================

	--------------------------------------
    -- Augmented gear
    --------------------------------------

	Keraunos = {}
	Keraunos.Siphon = { name="Keraunos", augments={'Pet: Mag. Acc.+25','"Elemental Siphon"+25',}}
	Keraunos.Perpetuation = { name="Keraunos", augments={'Pet: Accuracy+13 Pet: Rng. Acc.+13','"Avatar perpetuation cost" -6',}}
	Keraunos.BPRage = { name="Keraunos", augments={'Pet: "Mag.Atk.Bns."+17','Pet: Crit.hit rate +4',}}

	Campestres = {}
	Campestres.PetDD = { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}
	Campestres.Magic = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}}

	HeliosBand = {}
	HeliosJacket = {}
	HeliosGloves = {}
	HeliosSpats = {}
	HeliosBoots = {}

    HeliosBand.PetDD = { name="Helios Band", augments={'Pet: Accuracy+26 Pet: Rng. Acc.+26','Pet: "Dbl. Atk."+8','Pet: Haste+6',}}
    HeliosJacket.PetDD = { name="Helios Jacket", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4','Pet: Haste+3',}}
    HeliosGloves.PetDD = { name="Helios Gloves", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+8','Pet: Haste+6',}}
    HeliosSpats.PetDD = { name="Helios Spats", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+5','Pet: Haste+6',}}
    HeliosBoots.PetDD = { name="Helios Boots", augments={'Pet: Accuracy+27 Pet: Rng. Acc.+27','Pet: "Dbl. Atk."+7','Pet: Haste+6',}}

	HeliosBand.BPPhysical = { name="Helios Band", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: Crit.hit rate +4','Blood Pact Dmg.+7',}}
    HeliosJacket.BPPhysical = { name="Helios Jacket", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: Crit.hit rate +3','Blood Pact Dmg.+7',}}
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

	-- Base Damage Taken Set - Mainly used when IdleMode is "DT"
	sets.DT_Base = {
		main="Nirvana", -- Mythic weapon quest
		sub="Oneiros Grip", -- Dynamis Jeuno, Arch Goblin Golem
		ammo="Epitaph", -- Odyssey, Sgili
		head="Beckoner's Horn +3",
		neck="Summoner's Collar +2", -- Crafted, purchased $$$$
		ear1="Cath Palug Earring", -- Cait Sith HTBF
		ear2="Beckoner's Earring +1",
		body="Beckoner's Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Crit.hit rate +2','"Mag.Atk.Bns."+25','"Refresh"+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}, -- 800 DI points or Geas Fete, Reisenjima, Kabandha
		ring1="Inyanga Ring", --Ambuscade
		ring2="Defending Ring", -- King Behemoth
		back={ name="Campestres's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}, --Ambuscade
		waist="Carrier's Sash", -- Legion, Hall of Im or Hall of Mul
		legs="Inyanga Shalwar +2", -- Ambuscade
		feet="Baayami Sabots +1" -- Crafted, purchased Su3
	}

	-- Treasure Hunter set. Don't put anything in here except TH+ gear.
	-- It overwrites slots in other sets when TH toggle is on (Ctrl+F10).
	sets.TH = {
		-- ammo="Perfect Lucky Egg",
		head="Volte Cap", -- Dyna D Jeuno, Commander Goblins or Obstatrix
		waist="Chaac Belt", -- Delve Fracture, Marjami Ravine, Cailimh or Forri-Porri 250k plasm
		body="Nyame Mail", -- Because otherwise Cohort Cloak and such mess up the swap
		hands="Volte Bracers", -- Dyna D Jeuno, Commander Goblins or Obstatrix
		feet="Volte Boots" -- Dyna D Jeuno, Commander Goblins or Obstatrix
	}
	
	-- This gets equipped automatically when you have Sneak/Invis or Quickening such as from Fleet Wind.
	sets.Movement = {
		feet="Herald's Gaiters" -- Ouryu HTBF
	}

	sets.precast = {}

	-- Fast Cast
	sets.precast.FC = {
		main={ name="Grioavolr", augments={'"Fast Cast"+6','INT+2','"Mag.Atk.Bns."+17',}}, -- +10  800 DI points or Geas Fete, Reisenjima, Bashmu
		sub="Clerisy Strap +1", -- +3  Crafted, purchased (~3M)
		--ammo="Sapience Orb",
		-- head="Amalric Coif +1", -- +11  Venerian Abj. Head + Jinxed Coif (~10M)
		head="Amalric Coif",
		neck="Orunmila's Torque", -- +5  Meeble Burrows, Umagrhk
		ear1="Malignance Earring", -- +4  Lilith HTBF
		ear2="Loquacious Earring", -- +2  Sagheera, Ancient Beastcoin Purchase
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}, -- Alluvion Skirmish, Yorcia Weald
		-- body="Inyanga Jubbah +2", -- +14  Ambuscade
		body="Inyanga Jubbah +1",
		ring1="Lebeche Ring", -- Garuda HTBF
		ring2="Kishar Ring", -- +4  Omen, Glassy Gorger
		-- back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}}, -- Ambuscade
		back=Campestres.Magic,
		waist="Witful Belt", -- +3  Voidwatch NM, East Sarutabaruta, Rw Nw Prt M Hrw
		-- legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+6','CHR+6','Mag. Acc.+14','"Mag.Atk.Bns."+14',}}, -- 800 DI points or Geas Fete, Reisenjima, Crom Dubh
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		-- feet="Regal Pumps +1" -- +5~7  Unity, Valkurm Dunes, Valkurm Imperator
		feet="Amalric Nails"
	}

	sets.precast["Dispelga"] = set_combine(sets.precast.FC, {
		main="Daybreak", -- Lilith HTBF
		sub="Ammurapi Shield" -- Omen, Kei
	})

    sets.midcast = {}

	-- BP Timer Gear
	-- Use BP Recast Reduction here, along with Avatar's Favor gear.
	-- Avatar's Favor skill tiers are 512 / 575 / 670.
    sets.midcast.BP = {
		-- main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}}, -- 200 DI points or Geas Fete, Escha Ru'Aun, Hanbi; Path B
		main=Keraunos.BPRage,
		sub="Vox Grip", -- Abyssea Vunkerl, Khalkotaur
		ammo="Sancus Sachet +1", -- Crafted, purchased Su2 (~1.8M HQ, 20k NQ)
		-- head="Beckoner's Horn +3", -- Always use Beckoner's Horn here.
		head=HeliosBand.BPMagic,
		neck="Incanter's Torque", -- Crafted only, synergy
		ear1="Cath Palug Earring", -- Cait Sith HTBF
		ear2="Lodurr Earring", -- 600 DI points
		-- body="Baayami Robe +1", -- Crafted, purchased Su3
		body=HeliosJacket.BPMagic,
		-- hands="Baayami Cuffs +1", -- Crafted, purchased Su3
		hands=HeliosGloves.BPMagic,
		ring1={name="Stikini Ring +1", bag="wardrobe2"}, -- Crafted, purchased (~37M HQ, ~910k NQ)
		ring2="Evoker's Ring", -- Quest, reward items from every Avatar prime
		back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+12','Blood Pact Dmg.+2',}}, -- Reive JSE cape
		waist="Kobo Obi", -- Geas Fete, Escha Ru'Aun, Seiryu
		-- legs="Baayami Slops +1", -- Crafted, purchased Su3
		legs=HeliosSpats.BPMagic,
		-- feet="Baayami Sabots +1" -- Crafted, purchased Su3
		feet=HeliosBoots.BPMagic
	}

	-- Elemental Siphon sets. Zodiac Ring is affected by day, Chatoyant Staff by weather, and Twilight Cape by both.
    sets.midcast.Siphon = {
		-- main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}}, -- 200 DI points or Geas Fete, Escha Ru'Aun, Hanbi; Path B
		main=Keraunos.Siphon,
		sub="Vox Grip", -- Abyssea Vunkerl, Khalkotaur
		ammo="Esper Stone +1", -- Walk of Echoes, Eighth Walk Surged, Purchased (~20k)
		head="Baayami Hat +1", -- Crafted, purchased Su3 (~30M+ HQ, ~50k NQ)
		neck="Incanter's Torque",
		ear1="Cath Palug Earring", -- Cait Sith HTBF
		ear2="Lodurr Earring", -- 600 DI points
		body="Baayami Robe +1", -- Crafted, purchased Su3 (~43.5M HQ, ~700k NQ)
		hands="Baayami Cuffs +1", -- Crafted, purchased Su3 (~35M HQ, ~900k NQ)
		ring1={name="Stikini Ring +1", bag="wardrobe2"},
		ring2="Evoker's Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+12','Blood Pact Dmg.+2',}},
		waist="Kobo Obi", -- Geas Fete, Escha Ru'Aun, Seiryu
		legs="Baayami Slops +1", -- Crafted, purchased Su3 (~40M HQ, ~600k NQ)
		feet="Beckoner's Pigaches +3"
	}

	sets.midcast.SiphonZodiac = set_combine(sets.midcast.Siphon, { ring1="Zodiac Ring" }) -- Zodiac Ring from Windurst[S] quests

	sets.midcast.SiphonWeather = set_combine(sets.midcast.Siphon, { main="Chatoyant Staff" })
	
	sets.midcast.SiphonWeatherZodiac = set_combine(sets.midcast.SiphonZodiac, { main="Chatoyant Staff" })

	-- Summoning Midcast, cap spell interruption if possible (Baayami Robe gives 100, need 2 more)
	-- PDT isn't a bad idea either, so don't overwrite a lot from the DT set it inherits from.
	sets.midcast.Summon = set_combine(sets.DT_Base, {
		body="Baayami Robe +1", -- Crafted, purchased Su3
		waist="Rumination Sash" -- Vagary, Putraxia (or five key items reward during campaign)
	})

	-- If you ever lock your weapon, keep that in mind when building cure potency set.
	sets.midcast.Cure = {
		main="Nirvana",
		sub="Clerisy Strap +1", -- Crafted, purchased
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}, -- Geas Fete, Escha Zi'Tah, Angrboda
		neck="Orunmila's Torque",
		ear1="Meili Earring", -- 600 DI points
		ear2="Novia Earring", -- Jailer of Love reward
		body="Zendik Robe", -- Geas Fete, Escha Ru'Aun, Warder of Courage
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
		ring1="Lebeche Ring", -- Garuda HTBF
		ring2="Menelaus's Ring", -- AMAN Trove
		back="Tempered Cape +1", -- Walk of Echoes, purchased
		waist="Luminary Sash", -- Geas Fete, Reisenjima, Neak T3
		legs="Convoker's Spats +3",
		feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}} -- Geas Fete, Escha Zi'Tah, Gulltop
	}

	sets.midcast.Cursna = set_combine(sets.precast.FC, {
		neck="Debilis Medallion", -- Crafted, purchased (~2.9M)
		ear1="Meili Earring", -- 600 DI points
		ear2="Beatific Earring", -- Meeble Burrows 20k research marks
		ring1="Menelaus's Ring", -- AMAN Trove
		ring2="Haoma's Ring", -- Crafted, purchased (~1.5M)
		back="Tempered Cape +1", -- Walk of Echoes, purchased
		waist="Bishop's Sash", -- HKCNM 30, Boneyard Gully, purchased (~50k)
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}} -- Geas Fete, Escha Zi'Tah, Gulltop
	})
	
	-- Just a standard set for spells that have no set
	sets.midcast.EnmityRecast = set_combine(sets.precast.FC, {
		main="Nirvana",
		ear1="Novia Earring", -- Jailer of Love Sea reward
		body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}} -- Abyssal Abj. Body + Voodoo Dalmatica, Path D Augments
	})

	-- Strong alternatives: Daybreak and Ammurapi Shield, Cath Crown, Gwati Earring
	sets.midcast.Enfeeble = {
		main="Contemplator +1", -- Unity, Aydeewa, Tumult Creator
		sub="Enki Strap", -- Omen, Glassy Gorger
		head=empty,
		neck="Erra Pendant", -- Omen, Glassy Gorger
		ear1="Malignance Earring", -- Lilith HTBF
		ear2="Dignitary's Earring", -- Geas Fete, Reisenjima, Strophadia
		body="Cohort Cloak +1", -- Unity, Quicksand Caves, Centurio XX-I
		hands="Inyanga Dastanas +2", -- Ambuscade
		ring1={name="Stikini Ring +1", bag="wardrobe2"}, -- Crafted, purchased
		ring2={name="Stikini Ring +1", bag="wardrobe4"}, -- Crafted, purchased
		back="Aurist's Cape +1", -- Unity, Misareaux, Volatile Cluster
		waist="Luminary Sash", -- Geas Fete, Reisenjima, Neak T3
		legs="Inyanga Shalwar +2", -- Ambuscade
		feet="Skaoi Boots" -- Geas Fete, Reisenjima, Albumen
	}
	sets.midcast.Enfeeble.INT = set_combine(sets.midcast.Enfeeble, {
		waist="Acuity Belt +1" -- Unity, Pashhow, Joyous Green
	})

	sets.midcast.Enhancing = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','DEX+1','Mag. Acc.+5','"Mag.Atk.Bns."+18','DMG:+4',}}, -- 800 DI points
		sub="Ammurapi Shield", -- Omen, Kei
		head={ name="Telchine Cap", augments={'Mag. Evasion+24','"Conserve MP"+4','Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		ear1="Mimir Earring", -- 600 DI points
		ear2="Andoaa Earring", -- Delve Fracture, Marjami, Cailimh
		body={ name="Telchine Chas.", augments={'Mag. Evasion+25','"Conserve MP"+5','Enh. Mag. eff. dur. +10',}}, -- Alluvion Skirmish, Yorcia Weald
		hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}, -- Alluvion Skirmish, Yorcia Weald
		ring1={name="Stikini Ring +1", bag="wardrobe2"}, -- Crafted, purchased
		ring2={name="Stikini Ring +1", bag="wardrobe4"}, -- Crafted, purchased
		back="Merciful Cape", -- Ix'Aern (MNK) Sea reward
		waist="Embla Sash", -- 1000 DI points
		legs={ name="Telchine Braconi", augments={'Mag. Evasion+24','"Conserve MP"+4','Enh. Mag. eff. dur. +8',}}, -- Alluvion Skirmish, Yorcia Weald
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+24','"Conserve MP"+3','Enh. Mag. eff. dur. +10',}} -- Alluvion Skirmish, Yorcia Weald
	}

	sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing, {
		neck="Nodens Gorget", -- Geas Fete, Escha Ru'Aun, Sava Savanovic
		ear2="Earthcry Earring", -- HKCNM50 reward
		waist="Siegel Sash", -- Abyssea Uleguerand, Ogopogo
		--legs="Shedir Seraweels"
	})

	sets.midcast.Nuke = {
		main={ name="Grioavolr", augments={'"Fast Cast"+6','INT+2','"Mag.Atk.Bns."+17',}}, -- 800 DI points or Geas Fete, Reisenjima, Bashmu T2
		sub="Niobid Strap", -- Geas Fete, Reisenjima, Dazzling Dolores T1
		head="Cath Palug Crown", -- Cait Sith HTBF
		neck="Sanctity Necklace", -- 100 DI points
		ear1="Malignance Earring", -- Lilith HTBF
		ear2="Friomisi Earring", -- Wildskeeper Reive, Kamihr Drifts, Kumhau
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, -- Venerian Abj. Body + Jinxed Doublet, Path A
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, -- Venerian Abj. Hands + Jinxed Gages, Path D
		ring1="Freke Ring", -- Odin HTBF
		ring2="Shiva Ring +1", -- Crafted, purchased (~3M)
		back={ name="Campestres's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}, -- Ambuscade
		waist="Eschan Stone", -- Geas Fete, Escha Zi'Tah, Urmahlullu
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, -- Venerian Abj. Legs + Jinxed Slops, Path A
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}} -- Venerian Abj. Feet + Jinxed Nails, Path D
	}

    sets.midcast["Refresh"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1", -- Venerian Abj. Head + Jinxed Coif
		waist="Gishdubar Sash" -- 100 DI points
	})

    sets.midcast["Aquaveil"] = set_combine(sets.midcast.Enhancing, {
		main="Vadose Rod", -- Leviathan HTBF
		head="Amalric Coif +1", -- Venerian Abj. Head + Jinxed Coif
		waist="Emphatikos Rope", -- Abyssea Vunkerl, Xan
	})

	sets.midcast["Dispelga"] = set_combine(sets.midcast.Enfeeble, {
		main="Daybreak", -- Lilith HTBF
		sub="Ammurapi Shield" -- Omen, Kei
	})

	sets.midcast["Mana Cede"] = { hands="Beckoner's Bracers +1" }

    sets.midcast["Astral Flow"] = { head="Glyphic Horn +3" }
	
	-- ===================================================================================================================
	--	Weaponskills
	-- ===================================================================================================================

	-- Magic accuracy can be nice here to land the defense down effect. Also keep in mind big damage Garland can make it
	-- harder for multiple people to get AM3 on trash mobs before popping an NM.
	sets.midcast["Garland of Bliss"] = {
		head="Nyame Helm", -- Odyssey
		neck="Sanctity Necklace", -- 100 DI points
		ear1="Malignance Earring", -- Lilith HTBF
		ear2="Dignitary's Earring", -- Geas Fete, Reisenjima, Strophadia
		body="Nyame Mail", -- Odyssey
		hands="Nyame Gauntlets", -- Odyssey
		ring1={name="Stikini Ring +1", bag="wardrobe2"},
		ring2={name="Stikini Ring +1", bag="wardrobe4"},
		back="Aurist's Cape +1", -- Unity, Misareaux, Volatile Cluster
		waist="Eschan Stone", -- Geas Fete, Escha Ru'Aun, Urmahlullu
		legs="Nyame Flanchard", -- Odyssey
		feet="Nyame Sollerets" -- Odyssey
	}

	-- My set focuses on accuracy here to make skillchains with Ifrit
	-- Just like Garland, it's not hard to improve on the damage from this set if that's what you're after.
	sets.midcast["Shattersoul"] = {
		head="Beckoner's Horn +3",
		neck="Fotia Gorget", -- Crafted only, synergy
		ear1="Zennaroi Earring", -- Incursion, Tryl-Wuj Wingrip
		ear2="Telos Earring", -- Geas Fete, Escha Ru'Aun, Warder of Courage
		body="Tali'ah Manteel +2", -- Ambuscade
		hands="Nyame Gauntlets", -- Odyssey
		ring1="Freke Ring", -- Odin HTBF
		ring2="Metamorph Ring +1", -- Unity, Yuhtunga Jungle, Sybaritic Samantha
		back={ name="Campestres's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, -- Ambuscade
		waist="Fotia Belt", -- Crafted only, synergy
		legs="Nyame Flanchard", -- Odyssey
		feet="Convoker's Pigaches +3"
	}

	sets.midcast["Cataclysm"] = set_combine(sets.midcast.Nuke, {})
	
	sets.midcast["Shell Crusher"] = set_combine(sets.midcast["Garland of Bliss"], {})
	
	sets.midcast["Black Halo"] = set_combine(sets.midcast["Garland of Bliss"], {})

	sets.pet_midcast = {}

	-- Main physical pact set (Volt Strike, Pred Claws, etc.)
	-- Prioritize BP Damage & Pet: Double Attack
	-- Strong Alternatives:
	-- Gridarvor, Apogee Crown, Apogee Pumps, Convoker's Doublet, Apogee Dalmatica, Shulmanu Collar (equal to ~R15 Collar), Gelos Earring, Regal Belt
	sets.pet_midcast.Physical_BP = {
		main="Nirvana",
		sub="Elan Strap +1", -- Crafted, purchased (~2.7M)
		ammo="Epitaph", -- Odyssey, Sgili
		head=HeliosBand.BPPhysical,
		neck="Summoner's Collar +2", -- Crafted, purchased $$$$
		ear1="Lugalbanda Earring", -- Omen, Kei
		ear2="Beckoner's Earring +1",
		-- body="Glyphic Doublet +3",
		body=HeliosJacket.BPPhysical,
		-- hands={ name="Merlinic Dastanas", augments={'Pet: Attack+24 Pet: Rng.Atk.+24','Blood Pact Dmg.+9','Pet: STR+10','Pet: Mag. Acc.+7',}}, -- 800 DI points or Geas Fete, Reisenjima, Kabandha
		hands=HeliosGloves.BPPhysical,
		ring1="Cath Palug Ring", -- Cait Sith HTBF
		ring2="Varar Ring +1", -- Crafted, purchased (~2M)
		-- back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}, -- Ambuscade
		back=Campestres.PetDD,
		waist="Incarnation Sash", -- Vagary, Plouton, or five key item reward during campaign
		-- legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}}, -- Abyssal Abj. Legs + Voodoo Slacks, Path D
		legs=HeliosSpats.BPPhysical,
		-- feet={ name="Helios Boots", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}} -- Alluvion Skirmish, Yorcia Weald
		feet=HeliosBoots.BPPhysical
	}

	-- Physical Pact AM3 set, less emphasis on Pet:DA
	sets.pet_midcast.Physical_BP_AM3 = set_combine(sets.pet_midcast.Physical_BP, {
		body="Convoker's Doublet +3",
		ring1="Varar Ring +1", -- Crafted, purchased
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}} -- Abyssal Abj. Feet + Voodoo Pumps, Path B
	})

	-- Physical pacts which benefit more from TP than Pet:DA (like Spinning Dive and other pacts you never use except that one time)
	sets.pet_midcast.Physical_BP_TP = set_combine(sets.pet_midcast.Physical_BP, {
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}, -- Abyssal Abj. Head + Voodoo Crown, Path B
		body="Convoker's Doublet +3",
		ring1="Varar Ring +1", -- Crafted, purchased
		waist="Regal Belt", -- Omen, Ou
		legs="Enticer's Pants", -- Sinister Reign, Arciela
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}} -- Abyssal Abj. Feet + Voodoo Pumps, Path B
	})

	-- Used for all physical pacts when AccMode is true
	sets.pet_midcast.Physical_BP_Acc = set_combine(sets.pet_midcast.Physical_BP, {
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}, -- Abyssal Abj. Head + Voodoo Crown, Path B
		body="Convoker's Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Blood Pact Dmg.+10','Pet: DEX+9','Pet: Mag. Acc.+9','Pet: "Mag.Atk.Bns."+3',}}, -- 800 DI points or Geas Fete, Reisenjima, Kabandha
		feet="Beckoner's Pigaches +3"
	})

	-- Base magic pact set
	-- Prioritize BP Damage & Pet:MAB
	-- Strong Alternatives:
	-- Espiritus, Apogee Crown, Adad Amulet (equal to ~R12 Collar)
	sets.pet_midcast.Magic_BP_Base = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+10','Pet: STR+5','Pet: Mag. Acc.+18','Pet: "Mag.Atk.Bns."+25',}},
		sub="Elan Strap +1", -- Crafted, purchased
		ammo="Epitaph", -- Odyssey, Sgili
		-- head="Cath Palug Crown", -- Cait Sith HTBF
		head=HeliosBand.BPMagic,
		neck="Summoner's Collar +2", -- Crafted, purchased
		ear1="Lugalbanda Earring", -- Omen, Kei
		ear2="Beckoner's Earring +1", -- Sortie old case reward
		-- body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}, -- Abyssal Abj. Body + Voodoo Dalmatica, Path A
		body=HeliosJacket.BPMagic,
		-- hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+25 Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+10','Pet: "Mag.Atk.Bns."+7',}}, -- 800 DI points or Geas Fete, Reisenjima, Kabandha
		hands=HeliosGloves.BPMagic,
		ring1={name="Varar Ring +1", bag="wardrobe2"}, -- Crafted, purchased
		ring2={name="Varar Ring +1", bag="wardrobe4"}, -- Crafted, purchased
		-- back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}}, -- Ambuscade
		back=Campestres.Magic,
		waist="Regal Belt", -- Omen, Ou
		-- legs={ name="Helios Spats", augments={'Pet: "Mag.Atk.Bns."+26','Pet: Crit.hit rate +3','Blood Pact Dmg.+7',}},
		legs=HeliosSpats.BPMagic,
		-- feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}} -- Abyssal Abj. Feet + Voodoo Pumps, Path A
		feet=HeliosBoots.BPMagic
	}
	
	-- Some magic pacts benefit more from TP than others.
	-- Note: This set will only be used on merit pacts if you have less than 4 merits.
	--       Make sure to update your merit values at the top of this Lua.
	sets.pet_midcast.Magic_BP_TP = set_combine(sets.pet_midcast.Magic_BP_Base, {
		legs="Enticer's Pants" -- Sinister Reign, Arciela
	})

	-- NoTP set used when you don't need Enticer's
	sets.pet_midcast.Magic_BP_NoTP = set_combine(sets.pet_midcast.Magic_BP_Base, {
		legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}} -- Abyssal Abj. Legs + Voodoo Slacks, Path A
	})

	sets.pet_midcast.Magic_BP_TP_Acc = set_combine(sets.pet_midcast.Magic_BP_TP, {
		head={ name="Merlinic Hood", augments={'Pet: Mag. Acc.+21 Pet: "Mag.Atk.Bns."+21','Blood Pact Dmg.+7','Pet: INT+6','Pet: "Mag.Atk.Bns."+11',}}, -- 800 DI points or Geas Fete, Reisenjima, Dazzling Dolores
		body="Convoker's Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+29','Blood Pact Dmg.+10','Pet: INT+7','Pet: "Mag.Atk.Bns."+10',}} -- 800 DI points or Geas Fete, Reisenjima, Kabandha
	})

	sets.pet_midcast.Magic_BP_NoTP_Acc = set_combine(sets.pet_midcast.Magic_BP_NoTP, {
		head={ name="Merlinic Hood", augments={'Pet: Mag. Acc.+21 Pet: "Mag.Atk.Bns."+21','Blood Pact Dmg.+7','Pet: INT+6','Pet: "Mag.Atk.Bns."+11',}}, -- 800 DI points or Geas Fete, Reisenjima, Dazzling Dolores
		body="Convoker's Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+29','Blood Pact Dmg.+10','Pet: INT+7','Pet: "Mag.Atk.Bns."+10',}} -- 800 DI points or Geas Fete, Reisenjima, Kabandha
	})

	-- Favor BP Damage above all. Pet:MAB also very strong.
	-- Pet: Accuracy, Attack, Magic Accuracy moderately important.
	-- Strong Alternatives:
	-- Keraunos, Grioavolr, Espiritus, Was, Apogee Crown, Apogee Dalmatica, Adad Amulet
	sets.pet_midcast.FlamingCrush = {
		main="Nirvana",
		sub="Elan Strap +1", -- Crafted, purchased
		ammo="Epitaph", -- Odyssey, Sgili
		-- head="Cath Palug Crown", -- Cait Sith HTBF
		head=HeliosBand.BPMagic,
		neck="Summoner's Collar +2", -- Crafted, purchased
		ear1="Lugalbanda Earring", -- Omen, Kei
		ear2="Beckoner's Earring +1",
		-- body="Convoker's Doublet +3",
		body=HeliosJacket.BPMagic,
		-- hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+25 Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+10','Pet: "Mag.Atk.Bns."+7',}}, -- 800 DI points or Geas Fete, Reisenjima, Kabandha
		hands=HeliosGloves.BPMagic,
		ring1={name="Varar Ring +1", bag="wardrobe2"}, -- Crafted, purchased
		ring2={name="Varar Ring +1", bag="wardrobe4"}, -- Crafted, purchased
		-- back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}, -- Ambuscade
		back=Campestres.PetDD,
		waist="Regal Belt", -- Omen, Ou
		-- legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}, -- Abyssal Abj. Legs + Voodoo Slacks, Path A
		legs=HeliosSpats.BPMagic,
		-- feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}} -- Abyssal Abj. Feet + Voodoo Pumps, Path A
		feet=HeliosBoots.BPMagic
	}

	sets.pet_midcast.FlamingCrush_Acc = set_combine(sets.pet_midcast.FlamingCrush, {
		body="Convoker's Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Blood Pact Dmg.+10','Pet: DEX+9','Pet: Mag. Acc.+9','Pet: "Mag.Atk.Bns."+3',}}, -- 800 DI points or Geas Fete, Reisenjima, Kabandha
		--feet="Convoker's Pigaches +3"
	})

	-- Pet: Magic Acc set - Mainly used for debuff pacts like Shock Squall
	sets.pet_midcast.MagicAcc_BP = {
		main="Nirvana",
		sub="Vox Grip", -- Abyssea Vunkerl, Khalkotaur
		ammo="Epitaph", -- Odyssey, Sgili
		head="Beckoner's Horn +3",
		neck="Summoner's Collar +2",
		ear1="Enmerkar Earring", -- Omen, Kyou
		ear2="Lugalbanda Earring", -- Omen, Kei
		body="Convoker's Doublet +3",
		hands="Lamassu Mitts +1", -- Unity, Temple of Uggalepih, Azure-toothed Clawberry
		ring1="Cath Palug Ring", -- Cait Sith HTBF
		ring2="Evoker's Ring",
		-- back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','"Fast Cast"+10',}}, -- Ambuscade
		back=Campestres.Magic,
		waist="Regal Belt", -- Omen, Ou
		legs="Convoker's Spats +3",
		feet="Bunzi's Sabots" -- Odyssey, Mboze
	}

	sets.pet_midcast.Debuff_Rage = sets.pet_midcast.MagicAcc_BP

	-- Pure summoning magic set, mainly used for buffs like Hastega II.
	-- Strong Alternatives:
	-- Andoaa Earring, Summoning Earring, Lamassu Mitts +1, Caller's Pendant
	sets.pet_midcast.SummoningMagic = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}}, -- 200 DI points or Geas Fete, Escha Ru'Aun, Hanbi; Path B
		sub="Vox Grip", -- Abyssea Vunkerl, Khalkotaur
		ammo="Epitaph", -- Odyssey, Sgili
		head="Baayami Hat +1", -- Crafted, purchased Su3
		neck="Incanter's Torque",
		ear1="Cath Palug Earring", -- Cait Sith HTBF
		ear2="Lodurr Earring", -- 600 DI points
		body="Baayami Robe +1", -- Crafted, purchased Su3
		hands="Baayami Cuffs +1", -- Crafted, purchased Su3
		ring1={name="Stikini Ring +1", bag="wardrobe2"}, -- Crafted, purchased
		ring2="Evoker's Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+12','Blood Pact Dmg.+2',}}, -- Reive JSE cape
		waist="Kobo Obi", -- Geas Fete, Escha Ru'Aun, Seiryu
		legs="Baayami Slops +1", -- Crafted, purchased Su3
		feet="Baayami Sabots +1" -- Crafted, purchased Su3
	}

	sets.pet_midcast.Buff = sets.pet_midcast.SummoningMagic
	
	-- Wind's Blessing set. Pet:MND increases potency.
	sets.pet_midcast.Buff_MND = set_combine(sets.pet_midcast.Buff, {
		main="Nirvana",
		neck="Summoner's Collar +2", -- Crafted, purchased $$$$
		ear2="Beckoner's Earring +1",
		hands="Lamassu Mitts +1", -- Unity, Temple of Uggalepih, Azure-toothed Clawberry
		-- back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}, -- Ambuscade
		back=Campestres.PetDD,
		legs="Assiduity Pants +1", -- Unity, Bibiki Bay, Intuila
		feet="Bunzi's Sabots" -- Odyssey, Mboze
	})

	-- Don't drop Avatar level in this set if you can help it.
	-- You can use Avatar:HP+ gear to increase the HP recovered, but most of it will decrease your own max HP.
	sets.pet_midcast.Buff_Healing = set_combine(sets.pet_midcast.Buff, {
		main="Nirvana",
		-- back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}, -- Ambuscade
		back=Campestres.PetDD,
		--body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
		--feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}
	})

	-- This set is used for certain blood pacts when ImpactDebuff mode is turned ON. (/console gs c ImpactDebuff)
	-- These pacts are normally used with magic damage gear, but they're also strong debuffs when enhanced by summoning skill.
	-- This set is safe to ignore.
	sets.pet_midcast.Impact = set_combine(sets.pet_midcast.SummoningMagic, {
		main="Nirvana",
		head="Beckoner's Horn +3",
		ear1="Enmerkar Earring", -- Omen, Kyou
		ear2="Lugalbanda Earring", -- Omen, Kei
		hands="Lamassu Mitts +1" -- Unity, Temple of Uggalepih, Azure-toothed Clawberry
	})

	-- ===================================================================================================================
	-- Aftercast Sets
	-- ===================================================================================================================
	-- Syntax: sets.aftercast.{IdleMode}.{PetName|Spirit|Avatar}.{PlayerStatus}.{LowMP}.{ForceIlvl}

	-- Example: sets.aftercast.DT["Cait Sith"] will be a set used when IdleMode is "DT" and you have Cait Sith summoned.

	-- This is your main idle set with no avatar out. Focus on refresh and defensive stats.
	sets.aftercast = {
		-- main="Mpaca's Staff", -- Odyssey, Arebati
		main="Gridarvor",
		-- sub="Oneiros Grip", -- Dynamis Jeuno, Arch Goblin Golem
		sub="Vox Grip",
		-- ammo="Epitaph", -- Odyssey, Sgili
		ammo="Seraphicaller",
		head="Beckoner's Horn +1", -- Upgrade to +3
		-- neck="Loricate Torque +1", -- Unity, Behemoth's Dominion, Sovereign Behemoth
		neck="Eidolon Pendant +1",
		-- ear1="Cath Palug Earring", -- Cait Sith HTBF
		ear1="Infused Earring",
		-- ear2="Beckoner's Earring +1",
		ear2="Loquacious Earring",
		-- body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}, -- Abyssal Abj. Body + Voodoo Dalmatica, Path A
		body="Shomonjijoe +1",
		-- hands={ name="Merlinic Dastanas", augments={'Pet: Crit.hit rate +2','"Mag.Atk.Bns."+25','"Refresh"+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}, -- 800 DI points or Geas Fete, Reisenjima, Kabandha
		hands="Beckoner's Bracers +1",
		-- ring1={name="Stikini Ring +1", bag="wardrobe2"}, -- Crafted, purchased
		ring1="Inyanga Ring",
		ring2="Defending Ring",
		-- back={ name="Campestres's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}, -- Ambsucade
		back="Cheviot Cape",
		-- waist="Regal Belt", -- Omen, Ou
		waist="Fucho-no-Obi",
		legs="Assiduity Pants +1", -- Unity, Bibiki Bay, Intuila
		feet="Herald's Gaiters" -- Ouryu HTBF
	}
	
	sets.aftercast.ForceIlvl = set_combine(sets.aftercast, {
		-- feet="Baayami Sabots +1" -- Crafted, purchased Su3
		feet="Inyanga Crackows +1"
	})
	sets.aftercast.LowMP = set_combine(sets.aftercast, {
		waist="Fucho-no-obi"
	})
	sets.aftercast.LowMP.ForceIlvl = set_combine(sets.aftercast.LowMP, {
		-- feet="Baayami Sabots +1"
		feet="Inyanga Crackows +1"
	})
	
	-- Main perpetuation set ~~ Strong Alternatives:
	-- Gridarvor, Asteria Mitts, Shomonjijoe, Convoker's Horn, Evans Earring, Isa Belt
	sets.aftercast.Avatar = {
		-- main="Nirvana",
		main=Keraunos.Perpetuation,
		main="Gridarvor", -- until Nirvana
		sub="Vox Grip", -- Replace with Oneiros Grip - Dynamis Jeuno, Arch Goblin Golem
		ammo="Seraphicaller", -- Replace with Epitaph - Odyssey, Sgili
		head="Beckoner's Horn +1", -- Upgrade to Beckoner's Horn +3
		neck="Caller's Pendant", -- Abyssea Misareaux, Ironclad Severer
		ear1="Handler's Earring +1", -- Replace with Cath Palug Earring
		ear2="Handler's Earring", -- Replace with Beckoner's Earring +1
		-- body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}}, -- Abyssean Abj. Body + Voodoo Dalmatica, Path D
		body="Shomonjijoe +1",
		-- hands={ name="Merlinic Dastanas", augments={'Pet: Crit.hit rate +2','"Mag.Atk.Bns."+25','"Refresh"+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}, -- 800 DI points or Geas Fete, Reisenjima, Kabandha
		hands="Beckoner's Bracers +1",
		ring1="Defending Ring", -- Replace with Stikini Ring +1
		ring2="Evoker's Ring",
		-- back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}, -- Ambuscade
		back=Campestres.PetDD,
		waist="Lucidity Sash", -- Geas Fete, Escha Zi'Tah, Angrboda
		legs="Assiduity Pants +1", -- Unity, Bibiki Bay, Intuila
		-- feet="Baayami Sabots +1" -- Crafted, purchased Su3
		feet="Beckoner's Pigaches +1"
	}
	-- If you have Fucho and don't need Lucidity Sash for perp down, you can uncomment the belt here to enable using it.
	sets.aftercast.Avatar.LowMP = set_combine(sets.aftercast.Avatar, {
		--waist="Fucho-no-obi"
	})
	
	-- Damage Taken set
	sets.aftercast.DT = set_combine(sets.DT_Base, {
	})
	
	sets.aftercast.DT.Avatar = set_combine(sets.aftercast.DT, {
		waist="Isa Belt" -- Delve Fracture, Kamihr Drifts, Utkux or Forri-Porri 250k plasm
	})
	
	-- I use this mode for Mewing Lullaby duty in V20+ Gaol. Heaviest defense possible, less attention toward MP management.
	sets.aftercast.MEva = set_combine(sets.aftercast.DT, {
		sub="Khonsu", -- Ambuscade grip
		hands="Nyame Gauntlets", -- Odyssey, Bumba
		feet="Baayami Sabots +1" -- Crafted, purchased Su3
	})

	sets.aftercast.MEva.Avatar = set_combine(sets.aftercast.MEva, {
		ear1="Enmerkar Earring", -- Omen, Kyou
		waist="Isa Belt", -- Delve Fracture, Kamihr Drifts, Utkux or Forri-Porri 250k plasm
		-- back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}, -- Ambuscade
		back=Campestres.PetDD,
	})
	
	-- These 2 sets are for when you're in DD mode but not actually engaged to something.
	sets.aftercast.DD = set_combine(sets.aftercast, {
	})
	
	sets.aftercast.DD.Avatar = set_combine(sets.aftercast.Avatar, {
	})
	
	-- Main melee set
	-- If you want specific things equipped only when an avatar is out, modify "sets.aftercast.DD.Avatar.Engaged" below.
	sets.aftercast.DD.Engaged = set_combine(sets.aftercast.DD.Avatar, {
		-- head="Beckoner's Horn +3",
		head="Nyame Helm", -- Odyssey, Bumba
		-- neck="Shulmanu Collar", -- Omen, Fu
		ear1="Telos Earring", -- Geas Fete, Escha Ru'Aun, Warder of Courage
		ear2="Cessance Earring", -- Omega/Ultima Weapon HTBF
		body="Tali'ah Manteel +2", -- Ambuscade
		hands="Bunzi's Gloves", -- Odyssey, Mboze
		ring1={ name="Chirich Ring +1", bag="wardrobe2" }, -- Crafted, purchased $$$$
		ring2={ name="Chirich Ring +1", bag="wardrobe4" }, -- Crafted, purchased $$$$
		back={ name="Campestres's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, -- Ambuscade
		waist="Cetl Belt", -- Wildskeeper Reive, Kamihr Drifts, Kumhau
		legs="Nyame Flanchard", -- Odyssey, Bumba
		feet="Convoker's Pigaches +3"
	})
	
	-- Main melee set when engaged with an avatar out. Usually doesn't have many changes from the above set.
	sets.aftercast.DD.Avatar.Engaged = set_combine(sets.aftercast.DD.Engaged, {
	})
	
	-- You aren't likely to be in PetDT mode without an avatar for long, but I default to the DT set in that scenario.
	sets.aftercast.PetDT = set_combine(sets.aftercast.DT, {
	})

	-- Pet:DT build. Equipped when IdleMode is "PetDT".
	-- Strong alternatives:
	-- Selenian Cap, Enmerkar Earring, Handler's Earring, Rimeice Earring, Thurandaut Ring, Tali'ah Seraweels
	sets.aftercast.PetDT.Avatar = {
		main="Nirvana",
		sub="Oneiros Grip", -- Dynamis Jeuno, Arch Goblin Golem
		ammo="Epitaph", -- Odyssey, Sgili
		head={ name="Apogee Crown +1", augments={'Pet: Accuracy+25','"Avatar perpetuation cost"+7','Pet: Damage taken -4%',}}, -- Abyssean Abj. Head + Voodoo Crown, Path D
		neck="Summoner's Collar +2", -- Crafted, purchased $$$$
		ear1="Enmerkar Earring", -- Omen, Kyou
		ear2="Beckoner's Earring +1", -- Sortie reward from Old Cases
		body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}}, -- Abyssean Abj. Body + Voodoo Dalmatica, Path D
		hands={ name="Telchine Gloves", augments={'Pet: DEF+18','Pet: "Regen"+3','Pet: Damage taken -4%',}}, -- Alluvion Skirmish, Yorcia Weald
		ring1="Thurandaut Ring +1", -- Adoulin Ring + Ygnas Directive upgrade
		ring2={name="Stikini Ring +1", bag="wardrobe4"}, -- Crafted, purchased
		-- back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}}, -- Ambuscade
		back=Campestres.PetDD,
		waist="Isa Belt", -- Delve Fracture, Kamihr Drifts, Utkux
		legs="Enticer's Pants", -- Sinister Reign, Arciela
		feet={ name="Telchine Pigaches", augments={'Pet: DEF+19','Pet: "Regen"+3','Pet: Damage taken -4%',}} -- Alluvion Skirmish, Yorcia Weald
	}
	
	sets.aftercast.Favor = set_combine(sets.aftercast, {
	})
	
	-- Used when IdleMode is "Favor" to maximize avatar's favor effect.
	-- Skill tiers are 512 / 575 / 670 / 735
	sets.aftercast.Favor.Avatar = set_combine(sets.aftercast.Avatar, {
		head="Beckoner's Horn +3",
		--ear2="Lodurr Earring",
		body="Beckoner's Doublet +3",
		hands="Baayami Cuffs +1", -- Crafted, purchased Su3
		legs="Baayami Slops +1", -- Crafted, purchased Su3
		feet="Baayami Sabots +1" -- Crafted, purchased Su3
	})

	sets.aftercast.PetDD = set_combine(sets.aftercast, {
	})

	-- Avatar Melee set. You really don't need this set. It's only here because I can't bring myself to throw it away.
	sets.aftercast.PetDD.Avatar = set_combine(sets.aftercast.Avatar, {
		ear2="Rimeice Earring", -- Shiva HTBF
		body="Glyphic Doublet +3",
		hands={ name="Helios Gloves", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+8','Pet: Haste+6',}}, -- Alluvion Skirmish, Yorcia Weald
		waist="Klouskap Sash", -- Crafted, purchased (~5M HQ, ~600k NQ)
		feet={ name="Helios Boots", augments={'Pet: Accuracy+27 Pet: Rng. Acc.+27','Pet: "Dbl. Atk."+7','Pet: Haste+6',}} -- Alluvion Skirmish, Yorcia Weald
	})

	sets.aftercast.Zendik = set_combine(sets.aftercast, {
		body="Zendik Robe" -- Geas Fete, Escha Ru'Aun, Warder of Courage
	})
	sets.aftercast.Zendik.ForceIlvl = set_combine(sets.aftercast.Zendik, {
		feet="Baayami Sabots +1" -- Crafted, purchased Su3
	})
	sets.aftercast.Zendik.LowMP = set_combine(sets.aftercast.Zendik, {
		waist="Fucho-no-obi" -- Delve, Marjami, Hakamai or Forri-Porri 40k plasm
	})
	sets.aftercast.Zendik.LowMP.ForceIlvl = set_combine(sets.aftercast.Zendik.LowMP, {
		feet="Baayami Sabots +1" -- Crafted, purchased Su3
	})

	sets.aftercast.Zendik.Avatar = set_combine(sets.aftercast.Favor.Avatar, {
		body="Zendik Robe" -- Geas Fete, Escha Ru'Aun, Warder of Courage
	})

	-- Idle set used when you have a spirit summoned. Glyphic Spats will make them cast more frequently.
	sets.aftercast.Spirit = {
		main="Nirvana",
		sub="Vox Grip", -- Abyssea Vunkerl, Khalkotaur
		ammo="Epitaph", -- Odyssey, Sgili
		head="Beckoner's Horn +3",
		neck="Incanter's Torque",
		ear1="Cath Palug Earring", -- Cait Sith HTBF
		ear2="Evans Earring", -- Geas Fete, Escha Ru'Aun, Met
		body="Baayami Robe +1", -- Crafted, purchased Su3
		hands="Baayami Cuffs +1", -- Crafted, purchased Su3
		ring1={name="Stikini Ring +1", bag="wardrobe2"}, -- Crafted, purchased
		ring2="Evoker's Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+12','Blood Pact Dmg.+2',}}, -- Reive JSE cape
		waist="Lucidity Sash", -- Geas Fete, Escha Zi'Tah, Angrboda
		legs="Glyphic Spats +3",
		feet="Baayami Sabots +1" -- Crafted, purchased Su3
	}
	sets.aftercast.Favor.Spirit = set_combine(sets.aftercast.Spirit, {
	})
	sets.aftercast.Zendik.Spirit = set_combine(sets.aftercast.Favor.Spirit, {
	})

	-- ===================================================================================================================
	--		End of Sets
	-- ===================================================================================================================

	Buff_BPs_Duration = S{'Shining Ruby','Aerial Armor','Frost Armor','Rolling Thunder','Crimson Howl','Lightning Armor','Ecliptic Growl','Glittering Ruby','Earthen Ward','Hastega','Noctoshield','Ecliptic Howl','Dream Shroud','Earthen Armor','Fleet Wind','Inferno Howl','Heavenward Howl','Hastega II','Soothing Current','Crystal Blessing','Katabatic Blades'}
	Buff_BPs_Healing = S{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'}
	Buff_BPs_MND = S{"Wind's Blessing"}
	Debuff_BPs = S{'Mewing Lullaby','Eerie Eye','Lunar Cry','Lunar Roar','Nightmare','Pavor Nocturnus','Ultimate Terror','Somnolence','Slowga','Tidal Roar','Diamond Storm','Sleepga','Shock Squall','Bitter Elegy','Lunatic Voice'}
	Debuff_Rage_BPs = S{'Moonlit Charge','Tail Whip'}

	Magic_BPs_NoTP = S{'Holy Mist','Nether Blast','Aerial Blast','Searing Light','Diamond Dust','Earthen Fury','Zantetsuken','Tidal Wave','Judgment Bolt','Inferno','Howling Moon','Ruinous Omen','Night Terror','Thunderspark','Tornado II','Sonic Buffet'}
	Magic_BPs_TP = S{'Impact','Conflag Strike','Level ? Holy','Lunar Bay'}
	Merit_BPs = S{'Meteor Strike','Geocrush','Grand Fall','Wind Blade','Heavenly Strike','Thunderstorm'}
	Physical_BPs_TP = S{'Rock Buster','Mountain Buster','Crescent Fang','Spinning Dive','Roundhouse'}
	
	ZodiacElements = S{'Fire','Earth','Water','Wind','Ice','Lightning'}

	--TownIdle = S{"windurst woods","windurst waters","windurst walls","port windurst","bastok markets","bastok mines","port bastok","southern san d'oria","northern san d'oria","port san d'oria","upper jeuno","lower jeuno","port jeuno","ru'lude gardens","norg","kazham","tavnazian safehold","rabao","selbina","mhaura","aht urhgan whitegate","al zahbi","nashmau","western adoulin","eastern adoulin"}
	--Salvage = S{"Bhaflau Remnants","Zhayolm Remnants","Arrapago Remnants","Silver Sea Remnants"}

	-- Select initial macro set and set lockstyle
	-- This section likely requires changes or removal if you aren't Pergatory
	-- NOTE: This doesn't change your macro set for you during play, your macros have to do that. This is just for when the Lua is loaded.
	if pet.isvalid then
		if pet.name=='Fenrir' then
			send_command('input /macro book 15;wait .1;input /macro set 2;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Ifrit' then
			send_command('input /macro book 15;wait .1;input /macro set 3;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Titan' then
			send_command('input /macro book 15;wait .1;input /macro set 4;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Leviathan' then
			send_command('input /macro book 15;wait .1;input /macro set 5;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Garuda' then
			send_command('input /macro book 15;wait .1;input /macro set 6;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Shiva' then
			send_command('input /macro book 15;wait .1;input /macro set 7;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Ramuh' then
			send_command('input /macro book 15;wait .1;input /macro set 8;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Diabolos' then
			send_command('input /macro book 15;wait .1;input /macro set 9;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Cait Sith' then
			send_command('input /macro book 15;wait .1;input /macro set 2;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Siren' then
			send_command('input /macro book 15;wait .1;input /macro set 4;wait 3;input /lockstyleset '..StartLockStyle)
		end
	else
		send_command('input /macro book 15;wait .1;input /macro set 1;wait 3;input /lockstyleset '..StartLockStyle)
	end
	-- End macro set / lockstyle section
end

-- ===================================================================================================================
--		Gearswap rules below this point - Modify at your own peril
-- ===================================================================================================================

function pretarget(spell,action)
	if not buffactive['Muddle'] then
		-- Auto Remedy --
		if AutoRemedy and (spell.action_type == 'Magic' or spell.type == 'JobAbility') then
			if buffactive['Paralysis'] or (buffactive['Silence'] and not AutoEcho) then
				cancel_spell()
				send_command('input /item "Remedy" <me>')
			end
		end
		-- Auto Echo Drop --
		if AutoEcho and spell.action_type == 'Magic' and buffactive['Silence'] then
			cancel_spell()
			send_command('input /item "Echo Drops" <me>')
		end
	end
end

function precast(spell)
    if (pet.isvalid and pet_midaction() and not spell.type=="SummonerPact") or spell.type=="Item" then
		-- Do not swap if pet is mid-action. I added the type=SummonerPact check because sometimes when the avatar
		-- dies mid-BP, pet.isvalid and pet_midaction() continue to return true for a brief time.
		return
	end
	-- Spell fast cast
	if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
    elseif spell.action_type=="Magic" then
		if spell.name=="Stoneskin" then
			equip(sets.precast.FC,{waist="Siegel Sash"})
		else
			equip(sets.precast.FC)
		end
    end
end

function midcast(spell)
    if (pet.isvalid and pet_midaction()) or spell.type=="Item" then
        return
    end
	-- BP Timer gear needs to swap here
	if (spell.type=="BloodPactWard" or spell.type=="BloodPactRage") then
		if not buffactive["Astral Conduit"] then
			equip(sets.midcast.BP)
		end
		-- If lag compensation mode is on, set up a timer to equip the BP gear.
		if LagMode then
			send_command('wait 0.5;gs c EquipBP '..spell.name)
		end
	-- Spell Midcast & Potency Stuff
    elseif sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
	elseif spell.name=="Elemental Siphon" then
		if pet.element==world.day_element and ZodiacElements:contains(pet.element) then
			if pet.element==world.weather_element then
				equip(sets.midcast.SiphonWeatherZodiac)
			else
				equip(sets.midcast.SiphonZodiac)
			end
		else
			if pet.element==world.weather_element then
				equip(sets.midcast.SiphonWeather)
			else
				equip(sets.midcast.Siphon)
			end
		end
	elseif spell.type=="SummonerPact" then
		equip(sets.midcast.Summon)
	elseif string.find(spell.name,"Cure") or string.find(spell.name,"Curaga") then
		equip(sets.midcast.Cure)
	elseif string.find(spell.name,"Protect") or string.find(spell.name,"Shell") then
		equip(sets.midcast.Enhancing,{ring2="Sheltered Ring"})
	elseif spell.skill=="Enfeebling Magic" then
		equip(sets.midcast.Enfeeble)
	elseif spell.skill=="Enhancing Magic" then
		equip(sets.midcast.Enhancing)
	elseif spell.skill=="Elemental Magic" then
		equip(sets.midcast.Nuke)
	elseif spell.action_type=="Magic" then
		equip(sets.midcast.EnmityRecast)
    else
        idle()
    end
	-- Treasure Hunter
	if TreasureHunter and THSpells:contains(spell.name) then
		equip(sets.TH)
	end
	-- Auto-cancel existing buffs
	if spell.name=="Stoneskin" and buffactive["Stoneskin"] then
		windower.send_command('cancel 37;')
	elseif spell.name=="Sneak" and buffactive["Sneak"] and spell.target.type=="SELF" then
		windower.send_command('cancel 71;')
	elseif spell.name=="Utsusemi: Ichi" and buffactive["Copy Image"] then
		windower.send_command('wait 1;cancel 66;')
	end
end

function aftercast(spell)
    if pet_midaction() or spell.type=="Item" then
        return
    end
	if not string.find(spell.type,"BloodPact") then
        idle()
    end
end

function pet_change(pet,gain)
	if (not (gain and pet_midaction())) then
		idle()
	end
end

function status_change(new,old)
	if not midaction() and not pet_midaction() then
        idle()
	end
end

function buff_change(name,gain)
    if name=="quickening" and not pet_midaction() then
        idle()
    end
	if SacTorque and name=="sleep" and gain and pet.isvalid then
		equip({neck="Sacrifice Torque"})
		disable("neck")
		if buffactive["Stoneskin"] then
			windower.send_command('cancel 37;')
		end
	end
	if SacTorque and name=="sleep" and not gain then
		enable("neck")
	end
end

function pet_midcast(spell)
	if not LagMode then
		equipBPGear(spell.name)
	end
end

function pet_aftercast(spell)
    idle()
end

function equipBPGear(spell)
    if spell=="Perfect Defense" then
        equip(sets.pet_midcast.SummoningMagic)
	elseif Debuff_BPs:contains(spell) then
		equip(sets.pet_midcast.MagicAcc_BP)
	elseif Buff_BPs_Healing:contains(spell) then
		equip(sets.pet_midcast.Buff_Healing)
	elseif Buff_BPs_Duration:contains(spell) then
		equip(sets.pet_midcast.Buff)
	elseif Buff_BPs_MND:contains(spell) then
		equip(sets.pet_midcast.Buff_MND)
	elseif spell=="Flaming Crush" then
		if AccMode then
			equip(sets.pet_midcast.FlamingCrush_Acc)
		else
			equip(sets.pet_midcast.FlamingCrush)
		end
	elseif ImpactDebuff and (spell=="Impact" or spell=="Conflag Strike") then
		equip(sets.pet_midcast.Impact)
	elseif Magic_BPs_NoTP:contains(spell) then
		if AccMode then
			equip(sets.pet_midcast.Magic_BP_NoTP_Acc)
		else
			equip(sets.pet_midcast.Magic_BP_NoTP)
		end
	elseif Magic_BPs_TP:contains(spell) or string.find(spell," II") or string.find(spell," IV") then
		if AccMode then
			equip(sets.pet_midcast.Magic_BP_TP_Acc)
		else
			equip(sets.pet_midcast.Magic_BP_TP)
		end
	elseif Merit_BPs:contains(spell) then
		if AccMode then
			equip(sets.pet_midcast.Magic_BP_TP_Acc)
		elseif spell=="Meteor Strike" and MeteorStrike>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Geocrush" and Geocrush>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Grand Fall" and GrandFall>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Wind Blade" and WindBlade>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Heavenly Strike" and HeavenlyStrike>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Thunderstorm" and Thunderstorm>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		else
			equip(sets.pet_midcast.Magic_BP_TP)
		end
	elseif Debuff_Rage_BPs:contains(spell) then
		equip(sets.pet_midcast.Debuff_Rage)
	else
		if AccMode then
			equip(sets.pet_midcast.Physical_BP_Acc)
		elseif Physical_BPs_TP:contains(spell) then
			equip(sets.pet_midcast.Physical_BP_TP)
		elseif buffactive["Aftermath: Lv.3"] then
			equip(sets.pet_midcast.Physical_BP_AM3)
		else
			equip(sets.pet_midcast.Physical_BP)
		end
	end
	-- Custom Timers
	if spell=="Mewing Lullaby" and string.find(world.area,"Walk of Echoes %[P") then
		send_command('timers create "Mewing Resist: can go @ 30s" 60 down') -- In Gaol, underperforms if used every 20s. 60s is full potency.
		-- Tip: I found it was best to go after 30 seconds. It doesn't fully drain them but you can't afford to wait the full 60.
		-- Use the time between this to use BP:Rages for additional damage! They feed no TP, as long as your avatar doesn't attack.
	end
end

-- This command is called whenever you input "gs c <command>"
function self_command(command)
	is_valid = command:lower()=="idle"
	
	for _, v in ipairs(IdleModes) do
		if command:lower()==v:lower() then
			IdleMode = v
			send_command('console_echo "Idle Mode: ['..IdleMode..']"')
			idle()
			return
		end
	end
	if string.sub(command,1,7)=="EquipBP" then
		equipBPGear(string.sub(command,9,string.len(command)))
		return
	elseif command:lower()=="accmode" then
		AccMode = AccMode==false
		is_valid = true
		send_command('console_echo "AccMode: '..tostring(AccMode)..'"')
	elseif command:lower()=="impactmode" then
		ImpactDebuff = ImpactDebuff==false
		is_valid = true
		send_command('console_echo "Impact Debuff: '..tostring(ImpactDebuff)..'"')
    elseif command:lower()=="forceilvl" then
        ForceIlvl = ForceIlvl==false
        is_valid = true
        send_command('console_echo "Force iLVL: '..tostring(ForceIlvl)..'"')
	elseif command:lower()=="lagmode" then
		LagMode = LagMode==false
		is_valid = true
		send_command('console_echo "Lag Compensation Mode: '..tostring(LagMode)..'"')
	elseif command:lower()=="th" then
		TreasureHunter = TreasureHunter==false
		is_valid = true
		send_command('console_echo "Treasure Hunter Mode: '..tostring(TreasureHunter)..'"')
	elseif command:lower()=="weaponlock" then
		if WeaponLock then
			enable("main","sub")
			WeaponLock = false
		else
			equip({main="Nirvana",sub="Elan Strap +1"})
			disable("main","sub")
			WeaponLock = true
		end
		is_valid = true
		send_command('console_echo "Weapon Lock: '..tostring(WeaponLock)..'"')
	elseif command=="ToggleIdle" then
		is_valid = true
		-- If you want to change the sets cycled with F9, this is where you do it
		if IdleMode=="Refresh" then
			IdleMode = "DT"
		elseif IdleMode=="DT" then
			IdleMode = "PetDT"
		elseif IdleMode=="PetDT" then
			IdleMode = "DD"
		elseif IdleMode=="DD" then
			IdleMode = "PetDD"
		else
			IdleMode = "Refresh"
		end
		send_command('console_echo "Idle Mode: ['..IdleMode..']"')
	elseif command:lower()=="lowhp" then
		-- Use for "Cure 500 HP" objectives in Omen
		equip({head="Apogee Crown +1",body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},legs="Apogee Slacks +1",feet="Apogee Pumps +1",back="Campestres's Cape"})
		return
	elseif string.sub(command:lower(),1,12)=="meteorstrike" then
		MeteorStrike = string.sub(command,13,13)
		send_command('console_echo "Meteor Strike: '..MeteorStrike..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,8)=="geocrush" then
		Geocrush = string.sub(command,9,9)
		send_command('console_echo "Geocrush: '..Geocrush..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,9)=="grandfall" then
		GrandFall = string.sub(command,10,10)
		send_command('console_echo "Grand Fall: '..GrandFall..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,9)=="windblade" then
		WindBlade = +string.sub(command,10,10)
		send_command('console_echo "Wind Blade: '..WindBlade..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,14)=="heavenlystrike" then
		HeavenlyStrike = string.sub(command,15,15)
		send_command('console_echo "Heavenly Strike: '..HeavenlyStrike..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,12)=="thunderstorm" then
		Thunderstorm = string.sub(command,13,13)
		send_command('console_echo "Thunderstorm: '..Thunderstorm..'/5"')
		is_valid = true
	end

	if is_valid then
		if not midaction() and not pet_midaction() then
			idle()
		end
	else
		sanitized = command:gsub("\"", "")
		send_command('console_echo "Invalid self_command: '..sanitized..'"') -- Note: If you use Gearinfo, comment out this line
	end
end

-- This function is for returning to aftercast gear after an action/event.
function idle()
	--if TownIdle:contains(world.area:lower()) then
	--	return
	--end
	equipSet = sets.aftercast
	if equipSet[IdleMode] then
		equipSet = equipSet[IdleMode]
	end
	if pet.isvalid then
		if equipSet[pet.name] then
			equipSet = equipSet[pet.name]
		elseif string.find(pet.name,'Spirit') and equipSet["Spirit"] then
			equipSet = equipSet["Spirit"]
		elseif equipSet["Avatar"] then
			equipSet = equipSet["Avatar"]
		end
	end
	if equipSet[player.status] then
		equipSet = equipSet[player.status]
	end
	if player.mpp < 50 and equipSet["LowMP"] then
		equipSet = equipSet["LowMP"]
	end
	if ForceIlvl and equipSet["ForceIlvl"] then
		equipSet = equipSet["ForceIlvl"]
	end
	equip(equipSet)

	if (buffactive['Quickening'] or buffactive['Sneak'] or buffactive['Invisible']) and IdleMode~='DT' and not ForceIlvl then
		equip(sets.Movement)
	end
	-- Balrahn's Ring
	--if Salvage:contains(world.area) then
	--	equip({ring2="Balrahn's Ring"})
	--end
	-- Maquette Ring
	--if world.area=='Maquette Abdhaljs-Legion' and not IdleMode=='DT' then
	--	equip({ring2="Maquette Ring"})
	--end
end