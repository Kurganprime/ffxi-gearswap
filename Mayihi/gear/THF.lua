function init_gear_sets()
	--------------------------------------
	-- Special sets (required by rules)
	--------------------------------------

	sets.TreasureHunter = {hands="Plunderer's Armlets +1", feet="Raider's Poulaines +2"}
	sets.ExtraRegen = {}
	sets.Kiting = {}

	sets.buff['Sneak Attack'] = {range="Raider's Bmrng.",
		head="Assassin's Bonnet",neck="Spike Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Espial Gambison",hands="Raid. Armlets +2",ring1="Rajas Ring",ring2="Thunder Ring",
		back="Nifty Mantle",waist="Warwolf Belt",legs="Raid. Culottes +2",feet="Assassin's Pouln."}

	sets.buff['Trick Attack'] = {ammo="Raider's Bmrng.",
		head="Aurore Bonnet",neck="Arctier's Torque",ear1="Drone Earring",ear2="Drone Earring",
		body="Espial Gambison",hands="Asn. Armlets +2",ring1="Stormsoul Ring",ring2="Epona's Ring",
		back="Assassin's Cape",waist="Patentia Sash",legs="Rogue's Culottes",feet="Raid. Poulaines +2"}

	-- Actions we want to use to tag TH.
	sets.precast.Step = sets.TreasureHunter
	sets.precast.Flourish1 = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter


	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Collaborator'] = {head="Raider's Bonnet +2"}
	sets.precast.JA['Accomplice'] = {head="Raider's Bonnet +2"}
	sets.precast.JA['Flee'] = {feet="Rogue's Poulaines"}
	sets.precast.JA['Hide'] = {body="Rogue's Vest"}
	sets.precast.JA['Conspirator'] = {body="Raider's Vest +2"}
	sets.precast.JA['Steal'] = {head="Assassin's Bonnet",hands="Rogue's Armlets",legs="Pillager's Culottes +1",feet="Rogue's Poulaines"}
	sets.precast.JA['Despoil'] = {legs="Raider's Culottes +2",feet="Raider's Poulaines +2"}
	sets.precast.JA['Perfect Dodge'] = {hands="Asn. Armlets +2"}
	sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

	sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
	sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {ammo="Sonia's Plectrum",
		head="Whirlpool Mask",
		body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Asklepian Ring",
		back="Iximulew Cape",waist="Caudata Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}


	-- Fast cast sets for spells
	sets.precast.FC = {head="Raid. Bonnet +2",body="Raider's Vest +2", hands="Dusk Gloves",waist="Twilight Belt",legs="Raid. Culottes +2"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


	-- Ranged snapshot gear
	sets.precast.RA = {head="Aurore Beret",neck="Arctier's Torque",ear1="Volley Earring",ear2="Volley Earring",
		body="Aurore Doublet",hands="Deadeye Gloves",ring1="Behemoth Ring",ring2="Behemoth Ring",
		waist="Precise Belt",legs="Dusk Trousers",feet="Raid. Poulaines +2"}


	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Raider's Bmrng.",
		head="Whirlpool Mask",neck="Agasaya's Collar",ear1="Brutal Earring",ear2="Steelflash Earring",
		body="Raider's Vest +2",hands="Raid. Armlets +2",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Caudata Belt",legs="Tumbler Trunks",feet="Assassin's Pouln."}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Honed Tathlum", back="Letalis Mantle"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {ring1="Stormsoul Ring",legs="Nahtirah Trousers"})
	sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {head="Felistris Mask",waist=gear.ElementalBelt})
	sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum"})
	sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum"})
	sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum"})

	sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'], {waist=gear.ElementalBelt})
	sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum"})
	sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum"})
	sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum"})

	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Qirmiz Tathlum",
		head="Uk'uxkaj Cap",neck="Rancor Collar",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'], {back="Kayapa Cape",waist=gear.ElementalBelt})
	sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Mod, {})
	sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Mod, {})
	sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Mod, {})

	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {head="Pillager's Bonnet +1",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"], {back="Kayapa Cape",waist=gear.ElementalBelt})
	sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {ammo="Qirmiz Tathlum",
		body="Pillager's Vest +1",legs="Pillager's Culottes +1"})
	sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {ammo="Qirmiz Tathlum",
		body="Pillager's Vest +1",legs="Pillager's Culottes +1"})
	sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {ammo="Qirmiz Tathlum",
		body="Pillager's Vest +1",legs="Pillager's Culottes +1"})

	sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {head="Pillager's Bonnet +1",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {back="Kayapa Cape",waist=gear.ElementalBelt})
	sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum",
		body="Pillager's Vest +1",legs="Pillager's Culottes +1"})
	sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum",
		body="Pillager's Vest +1",legs="Pillager's Culottes +1"})
	sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum",
		body="Pillager's Vest +1",legs="Pillager's Culottes +1"})

	sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS, {head="Pillager's Bonnet +1",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'], {back="Kayapa Cape",waist=gear.ElementalBelt})
	sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum",
		body="Pillager's Vest +1",legs="Pillager's Culottes +1"})
	sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum",
		body="Pillager's Vest +1",legs="Pillager's Culottes +1"})
	sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum",
		body="Pillager's Vest +1",legs="Pillager's Culottes +1"})

	sets.precast.WS['Aeolian Edge'] = {ammo="Jukukik Feather",
		head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
		body="Wayfarer Robe",hands="Pillager's Armlets +1",ring1="Acumen Ring",ring2="Demon's Ring",
		back="Toro Cape",waist=gear.ElementalBelt,legs="Shneddick Tights +1",feet="Wayfarer Clogs"}

	sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = {} --{
		--head="Whirlpool Mask",ear2="Loquacious Earring",
		--body="Pillager's Vest +1",hands="Pillager's Armlets +1",
		--back="Canny Cape",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

	-- Specific spells
	sets.midcast.Utsusemi = {} --{
		--head="Whirlpool Mask",neck="Ej Necklace",ear2="Loquacious Earring",
		--body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Beeline Ring",
		--back="Canny Cape",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

	-- Ranged gear
	sets.midcast.RA = {} --{
		--head="Whirlpool Mask",neck="Ej Necklace",ear1="Clearview Earring",ear2="Volley Earring",
		--body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Hajduk Ring",
		--back="Libeccio Mantle",waist="Aquiline Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

	sets.midcast.RA.Acc = {} --{
		--head="Pillager's Bonnet +1",neck="Ej Necklace",ear1="Clearview Earring",ear2="Volley Earring",
		--body="Iuitl Vest",hands="Buremte Gloves",ring1="Beeline Ring",ring2="Hajduk Ring",
		--back="Libeccio Mantle",waist="Aquiline Belt",legs="Thurandaut Tights +1",feet="Pillager's Poulaines +1"}


	--------------------------------------
	-- Idle/resting/defense sets
	--------------------------------------

	-- Resting sets
	sets.resting = {} --{head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		--ring1="Sheltered Ring",ring2="Paguroidea Ring"}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle = {range="Raider's Bmrng.",
		head="Espial Cap",neck="Agasaya's Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Taeon Tabard",hands="Plunderer's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Taeon Tights",feet="Taeon Boots"}

	sets.idle.Town = {range="Raider's Bmrng.",
		head="Espial Cap",neck="Agasaya's Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Taeon Tabard",hands="Plunderer's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Taeon Tights",feet="Taeon Boots"}

	sets.idle.Weak = {range="Raider's Bmrng.",
		head="Espial Cap",neck="Agasaya's Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Taeon Tabard",hands="Plunderer's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Taeon Tights",feet="Taeon Boots"}
		--{ammo="Thew Bomblet",
		--head="Pillager's Bonnet +1",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		--body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		--back="Shadow Mantle",waist="Flume Belt",legs="Pillager's Culottes +1",feet="Skadi's Jambeaux +1"}

    sets.Adoulin = {body="Councilor's Garb",}

    sets.MoveSpeed = {feet = "Trotter Boots",}

	-- Defense sets

	sets.defense.Evasion = {ammo="Raider's Bmrng.",
		head="Raid. Bonnet +2",neck="Agasaya's Collar",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Espial Gambison",hands="Raid. Armlets +2",ring1="Rajas Ring",ring2="Keen Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Raid. Culottes +2",feet="Raid. Poulaines +2"}
		--{
		--head="Pillager's Bonnet +1",neck="Ej Necklace",
		--body="Qaaxo Harness",hands="Pillager's Armlets +1",ring1="Defending Ring",ring2="Beeline Ring",
		--back="Canny Cape",waist="Flume Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

	sets.defense.PDT = {ammo="Raider's Bmrng.",
		head="Raid. Bonnet +2",neck="Agasaya's Collar",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Espial Gambison",hands="Raid. Armlets +2",ring1="Rajas Ring",ring2="Keen Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Raid. Culottes +2",feet="Raid. Poulaines +2"}
		--{ammo="Iron Gobbet",
		--head="Pillager's Bonnet +1",neck="Twilight Torque",
		--body="Iuitl Vest",hands="Pillager's Armlets +1",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		--back="Iximulew Cape",waist="Flume Belt",legs="Pillager's Culottes +1",feet="Iuitl Gaiters +1"}

	sets.defense.MDT = {ammo="Raider's Bmrng.",
		head="Raid. Bonnet +2",neck="Agasaya's Collar",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Espial Gambison",hands="Raid. Armlets +2",ring1="Rajas Ring",ring2="Keen Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Raid. Culottes +2",feet="Raid. Poulaines +2"}
		--{ammo="Demonry Stone",
		--head="Pillager's Bonnet +1",neck="Twilight Torque",
		--body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Defending Ring",ring2="Shadow Ring",
		--back="Engulfer Cape",waist="Flume Belt",legs="Pillager's Culottes +1",feet="Iuitl Gaiters +1"}


	--------------------------------------
	-- Melee sets
	--------------------------------------

	-- Normal melee group
	sets.engaged = {range="Raider's Bmrng.",
		head="Espial Cap",neck="Agasaya's Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Taeon Tabard",hands="Plunderer's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Taeon Tights",feet="Taeon Boots"}
	sets.engaged.Acc = {ammo="Jukukik Feather",
		head="Espial Cap",neck="Agasaya's Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Taeon Tabard",hands="Plunderer's Armlets +1",ring1="Rajas Ring",ring2="Enlivened Ring",
		back="Canny Cape",waist="Life Belt",legs="Taeon Tights",feet="Taeon Boots"}
		
	-- Mod set for trivial mobs (Skadi+1)
	sets.engaged.Mod = {ammo="Raider's Bmrng.",
		head="Raid. Bonnet +2",neck="Agasaya's Collar",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Espial Gambison",hands="Raid. Armlets +2",ring1="Rajas Ring",ring2="Keen Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Raid. Culottes +2",feet="Raid. Poulaines +2"}

	-- Mod set for trivial mobs (Thaumas)
	sets.engaged.Mod2 = {ammo="Raider's Bmrng.",
		head="Raid. Bonnet +2",neck="Agasaya's Collar",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Espial Gambison",hands="Raid. Armlets +2",ring1="Rajas Ring",ring2="Keen Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Raid. Culottes +2",feet="Raid. Poulaines +2"}

	sets.engaged.Evasion = {ammo="Raider's Bmrng.",
		head="Raid. Bonnet +2",neck="Agasaya's Collar",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Espial Gambison",hands="Raid. Armlets +2",ring1="Rajas Ring",ring2="Keen Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Raid. Culottes +2",feet="Raid. Poulaines +2"}
	sets.engaged.Acc.Evasion = {ammo="Raider's Bmrng.",
		head="Raid. Bonnet +2",neck="Agasaya's Collar",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Espial Gambison",hands="Raid. Armlets +2",ring1="Rajas Ring",ring2="Keen Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Raid. Culottes +2",feet="Raid. Poulaines +2"}

	sets.engaged.PDT = {ammo="Raider's Bmrng.",
		head="Raid. Bonnet +2",neck="Agasaya's Collar",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Espial Gambison",hands="Raid. Armlets +2",ring1="Rajas Ring",ring2="Keen Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Raid. Culottes +2",feet="Raid. Poulaines +2"}
	sets.engaged.Acc.PDT = {ammo="Raider's Bmrng.",
		head="Raid. Bonnet +2",neck="Agasaya's Collar",ear1="Brutal Earring",ear2="Suppanomimi",
		body="Espial Gambison",hands="Raid. Armlets +2",ring1="Rajas Ring",ring2="Keen Ring",
		back="Atheling Mantle",waist="Twilight Belt",legs="Raid. Culottes +2",feet="Raid. Poulaines +2"}

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
        set_macro_page(2, 6)
    end
end