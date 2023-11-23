function init_gear_sets()

    --------------------------------------
    -- Augmented gear
    --------------------------------------

	Rawhide_Hands_Acc = {name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20'}}
	Rawhide_Feet_Acc  = {name="Rawhide Boots", augments={'HP+50','Accuracy+15','Evasion+20'}}

	
    sets.enmity = {ammo="Aqreqaq Bomblet",
			ear1="Friomisi Earring",
			hands="Futhark Gloves",
			back="Evasionist's Cape",waist="Trance Belt"}
			--{sub="Shark Strap",ammo="Sapience Orb",
			--head="Rabid Visor",neck="Unmoving Collar",ear1="Trux Earring",ear2="Cryptic Earring",
			--body="Emet Harness +1",hands="Nilas Gloves",ring1="Eihwaz Ring",
			--waist="Trance Belt"}

	--------------------------------------
	-- Precast sets
	--------------------------------------

    -- Precast set for calling Trusts at iLVL 119
    sets.precast.Trust = {
		head="Ayanmo Zucchetto +1",
		body="Ayanmo Corazza +1",
		hands="Ayanmo Manopolas +1",
		legs="Ayanmo Cosciales +1",
		feet="Ayanmo Gambieras +1"
	}
    sets.midcast.Trust = sets.precast.Trust

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = {body="Runeist Coat +1", legs="Futhark Trousers"}
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = {feet="Runeist Bottes +1"}
    sets.precast.JA['Battuta'] = {head="Futhark Bandeau"}
    sets.precast.JA['Liement'] = {body="Futhark Coat"}
    sets.precast.JA['Lunge'] = {
			head="Wayfarer's Circlet",ear1="Hecate's Earring",ear2="Friomisi Earring",
			body="Wayfarer's Robe",hands="Taeon Gloves",ring1="Acumen Ring",
			back="Evasionist's Cape",legs="Iuitl Tights",}
			--{main="Soulcleaver",sub="Forefathers' Grip",ammo="Dosis Tathlum",
			--head="Highwing Helm",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
            --body="Count's Garb",hands="Taeon Gloves",ring1="Fenrir Ring +1",ring2="Fenrir Ring +1",
            --back="Argochampsa Mantle",waist="Eschan Stone",legs="Limbo Trousers",feet="Manabyss Pigaches"}
    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
    sets.precast.JA['Gambit'] = {hands="Runeist Mitons +1"}
    sets.precast.JA['Rayke'] = {feet="Futhark Bottes"}
    sets.precast.JA['Elemental Sforzo'] = {body="Futhark Coat"}
    sets.precast.JA['Swordplay'] = {hands="Futhark Mitons"}
    sets.precast.JA['Embolden'] = {}
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea"}
    sets.precast.JA['One For All'] = {}
    sets.precast.JA['Provoke'] = sets.enmity


	-- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience Orb",
            head="Runeist Bandeau +1",ear1="Loquacious Earring",
            body="Dread Jupon",hands="Taeon Gloves",ring2="Prolix Ring",
            legs="Orvail Pants +1"}
			--{
            --head="Runeist Bandeau +1",neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter's Earring +1",
            --body="Dread Jupon",hands="Taeon Gloves",ring1="Weatherspoon Ring",ring2="Prolix Ring",
            --legs="Orvail Pants +1",feet="Chelona Boots +1"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers"})
    sets.precast.FC['Utsusemi: Ichi'] = set_combine(sets.precast.FC, {neck='Magoraga beads', back="Mujin Mantle"})
    sets.precast.FC['Utsusemi: Ni'] = set_combine(sets.precast.FC['Utsusemi: Ichi'], {})
	sets.precast.FC['Flash'] = sets.enmity


	-- Weaponskill sets
    sets.precast.WS['Resolution'] = {ammo="Aqreqaq Bomblet",
            head="Sukeroku Hachimaki",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Steelflash Earring",
            body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Karieyh Ring",
            back="Buquwik Cape",waist="Fotia Belt",legs="Taeon Tights",feet="Herculean Boots"}
			--{ammo="Floestone",
            --head="Rawhide Mask", neck="Fotia Gorget", ear1="Vulcan's Pearl", ear2="Vulcan's Pearl",
            --body="Rawhide Vest", hands="Erilaz Gauntlets +1", ring1="Ifrit's Ring +1", ring2="Ifrit's Ring +1",
            --back="Buquwik Cape", waist="Fotia Belt", legs="Taeon Tights", feet="Rawhide Boots"}
			
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'].Normal, 
			{ammo="Honed Tathlum",
			body="Taeon Tabard",hands="Adhemar Wristbands",
			back="Evasionist's Cape",legs="Taeon Tights",feet="Herculean Boots"})
			--{ammo="Honed Tathlum", body="Dread Jupon", hands="Umuthi Gloves", back="Evasionist's Cape", legs="Manibozho Legs"})
		
    sets.precast.WS['Dimidiation'] = {ammo="Jukukik Feather",
            head="Sukeroku Hachimaki",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Steelflash Earring",
            body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Karieyh Ring",
            back="Kayapa Cape",waist="Fotia Belt",legs="Taeon Tights",feet="Herculean Boots"}
			--{sub="Bloodrain Strap",ammo="Jukukik Feather",
            --head="Rawhide Mask", neck="Shifting Necklace +1", ear1="Jupiter's Pearl", ear2="Jupiter's Pearl",
            --body="Rawhide Vest", hands="Rawhide Gloves", ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
            --back="Kayapa Cape", waist="Artful Belt +1", legs="Taeon Tights", feet="Rawhide Boots"}
			
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS['Dimidiation'].Normal, 
        {ammo="Honed Tathlum",head="Whirlpool Mask",hands="Adhemar Wristbands",ring1="Karieyh Ring",back="Evasionist's Cape",waist="Fotia Belt",
		feet="Herculean Boots"})
		--{ammo="Honed Tathlum", head="Whirlpool Mask", hands="Rawhide Gloves", ring1="Karieyh Ring",back="Evasionist's Cape", waist="Thunder Belt"})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {hands="Umuthi Gloves"})
    sets.precast.WS['Herculean Slash'].Acc = set_combine(sets.precast.WS['Herculean Slash'].Normal, {})


	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {}
    sets.midcast['Enhancing Magic'] = {
			head="Carmine Mask",
			hands="Leyline Gloves",
			waist="Olympus Sash",legs="Rawhide Trousers"}
			--{
			--head="Erilaz Galea +1",neck="Colossus's Torque",ear1="Augmenting Earring",ear2="Andoaa Earring",
			--body="Manasa Chasuble",hands="Runeist Mitons +1",
			--back="Merciful Cape",waist="Olympus Sash",legs="Futhark Trousers +1"}
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {head="Futhark Bandeau"})
    sets.midcast['Regen'] = {head="Runeist Bandeau +1", legs="Futhark Trousers"}
    sets.midcast['Stoneskin'] = {waist="Siegel Sash"}
    sets.midcast.Cure = {neck="Colossus's Torque", hands="Buremte Gloves", ring1="Ephedra Ring", feet="Futhark Boots"}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.idle = {
            head="Ayanmo Zucchetto +1",neck="Focus Collar",ear1="Brutal Earring",ear2="Moonshade Earring",
            body="Ayanmo Corazza +1",hands="Ayanmo Manopolas +1",ring1="Rajas Ring",ring2="Epona's Ring",
            back="Atheling Mantle",waist="Flume Belt",legs="Crimson Cuisses",feet="Ayanmo Gambieras +1"}
			-- {
            -- head="Rawhide Mask",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
            -- body="Runeist Coat +1",hands="Futhark Mitons +1",ring1="Paguroidea Ring",ring2="Sheltered Ring",
            -- back="Shadow Mantle",waist="Fucho-no-Obi",legs="Carmine Cuisses",feet="Skadi's Jambeaux +1"}
    sets.idle.Refresh = set_combine(sets.idle, {body="Runeist Coat +1", waist="Fucho-no-obi"})
	
    sets.idle.Town = {ammo="Inlamvuyeso",
            head="Ayanmo Zucchetto +1",neck="Focus Collar",ear1="Brutal Earring",ear2="Moonshade Earring",
            body="Ayanmo Corazza +1",hands="Ayanmo Manopolas +1",ring1="Rajas Ring",ring2="Epona's Ring",
            back="Atheling Mantle",waist="Flume Belt",legs="Crimson Cuisses",feet="Ayanmo Gambieras +1"}
			-- {ammo="Inlamvuyeso",
            -- head="Futhark Bandeau +1",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
            -- body="Runeist Coat +1",hands="Futhark Mitons +1",ring1="Paguroidea Ring",ring2="Sheltered Ring",
            -- back="Evasionist's Cape",waist="Flume Belt",legs="Carmine Cuisses",feet="Futhark Boots +1"}
           
	sets.defense.PDT = {
			head="Futhark Bandeau +1",neck="Twilight Torque",ear1="Ethereal Earring",
			body="Futhark Coat +1",hands="Runeist Mitons +1",ring1="Defending Ring",ring2="Succor Ring",
			back="Evasionist's Cape",waist="Flume Belt",legs="Erilaz Leg Guards",feet="Erilaz Greaves"}
			--{sub="Bloodrain Strap",ammo="Vanir Battery",
			--head="Futhark Bandeau +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Cryptic Earring",
			--body="Erilaz Surcoat +1",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Vocane Ring",
			--back="Evasionist's Cape",waist="Flume Belt +1",legs="Erilaz Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.defense.MDT = {ammo="Vanir Battery",
			head="Skormoth Mask",neck="Warder's Charm +1",ear1="Spellbreaker Earring",ear2="Sanare Earring",
			body="Runeist Coat +1",hands="Futhark Mitons +1",ring1="Shadow Ring",ring2="Defending Ring",
			back="Evasionist's Cape",waist="Engraved Belt",legs="Erilaz Leg Guards",feet="Manabyss Pigaches"}
			--{ammo="Vanir Battery",
			--head="Skormoth Mask",neck="Warder's Charm +1",ear1="Spellbreaker Earring",ear2="Sanare Earring",
			--body="Runeist Coat +1",hands="Futhark Mitons +1",ring1="Shadow Ring",ring2="Defending Ring",
			--back="Mubvumbamiri Mantle",waist="Engraved Belt",legs="Erilaz Leg Guards +1",feet="Manabyss Pigaches"}

	sets.Kiting = {legs="Crimson Cuisses"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {sub="Bloodrain Strap",ammo="Honed Tathlum",
            head="Ayanmo Zucchetto +1",neck="Sanctity Necklace",ear1="Brutal Earring",ear2="Moonshade Earring",
            body="Ayanmo Corazza +1",hands="Ayanmo Manopolas +1",ring1="Rajas Ring",ring2="Epona's Ring",
            back="Atheling",waist="Anguinus Belt",legs="Ayanmo Cosciales +1",feet="Ayanmo Gambieras +1"}
			-- {sub="Bloodrain Strap",ammo="Honed Tathlum",
            -- head="Futhark Bandeau +1",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            -- body="Futhark Coat +1",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
            -- back="Mollusca Mantle",waist="Anguinus Belt",legs="Taeon Tights",feet="Erilaz Greaves"}
    sets.engaged.DD = {sub="Bloodrain Strap",ammo="Ginsen",
            head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
            back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Herculean Trousers",feet="Herculean Boots"}
			--{sub="Duplus Grip",ammo="Focal Orb",
            --head="Skormoth Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
            --body="Thaumas Coat",hands="Taeon Gloves",ring1="Pernicious Ring",ring2="Epona's Ring",
            --back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Taeon Tights",feet="Taeon Boots"}
    sets.engaged.Acc = {sub="Tzacab Grip", ammo="Honed Tathlum", 
			head="Carmine Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
			body="Rawhide Vest",hands="Adhemar Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
			back="Evasionist's Cape",waist="Hurch'lan Sash",legs="Taeon Tights",feet="Herculean Boots"}
			--{sub="Tzacab Grip",ammo="Honed Tathlum",
			--head="Taeon Chapeau",neck="Ej Necklace +1",ear1="Zennaroi Earring",ear2="Steelflash Earring",
			--body="Rawhide Vest",hands="Rawhide Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
			--back="Letalis Mantle",waist="Olseni Belt",legs="Taeon Tights",feet="Rawhide Boots"}
    sets.engaged.PDT = {sub="Bloodrain Strap",ammo="Aqreqaq Bomblet",
            head="Futhark Bandeau +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Colossus's earring",
            body="Futhark Coat +1",hands="Umuthi Gloves",ring1="Defending Ring",ring2="Succor Ring",
            back="Mollusca Mantle",waist="Flume Belt",legs="Runeist Trousers +1",feet="Erilaz Greaves"}
			--{sub="Bloodrain Strap",ammo="Vanir Battery",
			--head="Futhark Bandeau +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Cryptic Earring",
			--body="Erilaz Surcoat +1",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Vocane Ring",
			--back="Evasionist's Cape",waist="Flume Belt +1",legs="Erilaz Leg Guards +1",feet="Erilaz Greaves +1"}
    sets.engaged.MDT = {sub="Bloodrain Strap",ammo="Aqreqaq Bomblet",
            head="Futhark Bandeau +1",neck="Twilight Torque",ear1="Spellbreaker Earring",ear2="Sanare Earring",
            body="Runeist Coat +1",hands="Futhark Mitons +1",ring1="Shadow Ring",ring2="Defending Ring",
            back="Evasionist's Cape",waist="Flume Belt",legs="Runeist Trousers +1",feet="Erilaz Greaves"}
			--{ammo="Vanir Battery",
			--head="Skormoth Mask",neck="Warder's Charm +1",ear1="Spellbreaker Earring",ear2="Sanare Earring",
			--body="Runeist Coat +1",hands="Futhark Mitons +1",ring1="Shadow Ring",ring2="Defending Ring",
			--back="Mubvumbamiri Mantle",waist="Engraved Belt",legs="Erilaz Leg Guards +1",feet="Manabyss Pigaches"}
	sets.engaged.repulse = {back="Repulse Mantle"}

end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(5, 7)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 7)
	elseif player.sub_job == 'SAM' then
		set_macro_page(5, 7)
	else
		set_macro_page(5, 7)
	end
end
