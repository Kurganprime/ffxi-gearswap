function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto +1",hands="Sakonji Kote"}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +1"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Yaoyotl Helm",
        body="Otronif Harness +1",hands="Buremte Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Phorcys Korazin",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Spiral Ring",
        back="Atheling Mantle",waist="Fotia Belt",legs="Karieyh Brayettes +1",feet="Karieyh Sollerets +1"}
		--{ammo="Thew Bomblet",
        --head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Moonshade Earring",
        --body="Phorcys Korazin",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Spiral Ring",
        --back="Atheling Mantle",waist="Caudata Belt",legs="Karieyh Brayettes +1",feet="Karieyh Sollerets +1"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {back="Letalis Mantle"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Fudo'].Mod = set_combine(sets.precast.WS['Tachi: Fudo'], {})

    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Shoha'].Mod = set_combine(sets.precast.WS['Tachi: Shoha'], {})

    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {ear1="Bladeborn Earring",ear2="Steelflash Earring",})
    sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Bladeborn Earring",ear2="Steelflash Earring",})
    sets.precast.WS['Tachi: Rana'].Mod = set_combine(sets.precast.WS['Tachi: Rana'], {})

    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {})


    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Yaoyotl Helm",
        body="Otronif Harness +1",hands="Otronif Gloves",
        legs="Phorcys Dirs",feet="Otronif Boots +1"}
		--{
        --head="Yaoyotl Helm",
        --body="Otronif Harness +1",hands="Otronif Gloves",
        --legs="Phorcys Dirs",feet="Otronif Boots +1"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle.Town = {main="Tsurumaru", sub="Pole Grip",ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Kasuga Domaru",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="Patricius Ring",
        back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Wakido Haidate +1",feet="Danzo Sune-ate"}
		--{main="Tsurumaru", sub="Pole Grip",ammo="Thew Bomblet",
        --head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Atheling Mantle",waist="Flume Belt",legs="Phorcys Dirs",feet="Danzo Sune-ate"}
    
    sets.idle.Field = {
        head="Yaoyotl Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Wakido Domaru +1",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="Patricius Ring",
        back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Wakido Haidate +1",feet="Danzo Sune-ate"}
		--{
        --head="Yaoyotl Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Shadow Mantle",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Danzo Sune-ate"}

    sets.idle.Weak = {
        head="Twilight Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Buremte Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Danzo Sune-ate"}
		--{
        --head="Twilight Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Twilight Mail",hands="Buremte Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Shadow Mantle",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Danzo Sune-ate"}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Wakido Domaru +1",hands="Otronif Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Iron Gobbet",
        --head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        --back="Shadow Mantle",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

    sets.defense.Reraise = {
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Buremte Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{
        --head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Twilight Mail",hands="Buremte Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
        --back="Shadow Mantle",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Wakido Domaru +1",hands="Wakido Kote +1",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Demonry Stone",
        --head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        --back="Engulfer Cape",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

    sets.Kiting = {feet="Danzo Sune-ate"}

    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    -- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
    sets.engaged = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Wakido Domaru +1",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="Patricius Ring",
        back="Atheling Mantle",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Thew Bomblet",
        --head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Gorney Haubert +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        --back="Atheling Mantle",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}
    sets.engaged.Acc = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Wakido Domaru +1",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="Patricius Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Thew Bomblet",
        --head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Gorney Haubert +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        --back="Letalis Mantle",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}
    sets.engaged.PDT = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Wakido Domaru +1",hands="Wakido Kote +1",ring1="Defending Ring",ring2="K'ayres Ring",
        back="Iximulew Cape",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Thew Bomblet",
        --head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
        --back="Iximulew Cape",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT = {ammo="Honed Tathlum",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Wakido Domaru +1",hands="Wakido Kote +1",ring1="Defending Ring",ring2="K'ayres Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Honed Tathlum",
        --head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
        --back="Letalis Mantle",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}
    sets.engaged.Reraise = {ammo="Thew Bomblet",
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Wakido Kote +1",ring1="Beeline Ring",ring2="K'ayres Ring",
        back="Ik Cape",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Thew Bomblet",
        --head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
        --back="Ik Cape",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}
    sets.engaged.Acc.Reraise = {ammo="Thew Bomblet",
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Wakido Kote +1",ring1="Beeline Ring",ring2="K'ayres Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Thew Bomblet",
        --head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
        --back="Letalis Mantle",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}
        
    -- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills.
    -- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (49 Store TP in gear), 2 Store TP for a 5-hit
    sets.engaged.Adoulin = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Wakido Domaru +1",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Takaha Mantle",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Thew Bomblet",
        --head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Gorney Haubert +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        --back="Takaha Mantle",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}
    sets.engaged.Adoulin.Acc = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Wakido Domaru +1",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Thew Bomblet",
        --head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Kasuga Domaru",hands="Otronif Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        --back="Letalis Mantle",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}
    sets.engaged.Adoulin.PDT = {ammo="Thew Bomblet",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Wakido Domaru +1",hands="Wakido Kote +1",ring1="Defending Ring",ring2="K'ayres Ring",
        back="Iximulew Cape",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Thew Bomblet",
        --head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
        --back="Iximulew Cape",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}
    sets.engaged.Adoulin.Acc.PDT = {ammo="Honed Tathlum",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Wakido Domaru +1",hands="Wakido Kote +1",ring1="Defending Ring",ring2="K'ayres Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Honed Tathlum",
        --head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
        --back="Letalis Mantle",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}
    sets.engaged.Adoulin.Reraise = {ammo="Thew Bomblet",
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Wakido Kote +1",ring1="Beeline Ring",ring2="K'ayres Ring",
        back="Ik Cape",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Thew Bomblet",
        --head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
        --back="Ik Cape",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}
    sets.engaged.Adoulin.Acc.Reraise = {ammo="Thew Bomblet",
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Wakido Kote +1",ring1="Beeline Ring",ring2="K'ayres Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		--{ammo="Thew Bomblet",
        --head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        --body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
        --back="Letalis Mantle",waist="Goading Belt",legs="Kasuga Haidate",feet="Otronif Boots +1"}


    sets.buff.Sekkanoki = {hands="Kasuga Kote"}
    sets.buff.Sengikori = {feet="Kasuga Sune-Ate"}
    sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate"}
end

function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 12)
    elseif player.sub_job == 'THF' then
        set_macro_page(3, 12)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 12)
    else
        set_macro_page(1, 12)
    end
end
