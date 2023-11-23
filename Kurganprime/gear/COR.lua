function job_setup()
    -- Whether to use Luzaf's Ring
    state.LuzafRing = M(true, "Luzaf's Ring")
    -- Whether a warning has been given for low ammo
    state.warned = M(true)

    define_roll_values()
end

function user_setup()
    state.OffenseMode:options('Ranged', 'Melee', 'Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Att', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')

    gear.RAbullet = "Steel Bullet"
    gear.WSbullet = "Steel Bullet"
    gear.MAbullet = "Steel Bullet"
    gear.QDbullet = "Steel Bullet"
    options.ammo_warning_limit = 15

    -- Additional local binds
    send_command('bind ^` input /ja "Double-up" <me>')
    send_command('bind !` input /ja "Bolter\'s Roll" <me>')

    select_default_macro_book()
end

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets

    -- Precast sets to enhance JAs
    
    sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Culottes +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +1"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +1"}

    
    sets.precast.CorsairRoll = {ranged="Compensator",
		head="Lanun Tricorne +1",neck="Twilight Torque",ear1="Darkness Earring",ear2="Black Earring",
		body="Lanun Frac +1",hands="Chasseur's Gants",ring1="Barataria Ring",ring2="Luzaf's Ring",
		back="Gunslinger's Cape",waist="Flume Belt",legs="Desultor's Tassets",feet="Lanun Bottes +1"}
		--{ranged="Compensator",
		--head="Lanun Tricorne +1",neck="Twilight Torque",ear1="Darkness Earring",ear2="Black Earring",
		--body="Lanun Frac +1",hands="Chasseur's Gants +1",ring1="Barataria Ring",ring2="Luzaf's Ring",
		--back="Gunslinger's Cape",waist="Flume Belt",legs="Desultor's Tassets",feet="Lanun Bottes +1"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chasseur's Culottes"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chasseur's Tricorne"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants"})
    
    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}
    
    sets.precast.CorsairShot = {head="Blood Mask"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Whirlpool Mask",
        body="Iuitl Vest",hands="Iuitl Wristbands",
        legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {head="Haruspex Hat",ear2="Loquacious Earring",hands="Thaumas Gloves",ring1="Prolix Ring"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    sets.precast.RA = {ammo=gear.RAbullet,
        head="Chasseur's Tricorne",
        body="Laksamana's Frac +1",hands="Lanun Gants +1",
        back="Navarch's Mantle",waist="Impulse Belt",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}
		--Max Snapshot set:
		--{main="Acinaces",ammo=gear.RAbullet,
		--head="Aurore Beret +1",
		--body="Skopos Jerkin",hands="Lanun Gants +1",
		--back="Navarch's Mantle",waist="Impulse Belt",legs="Chasseur's Culottes +1",feet="Wurrukatte Boots"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Whirlpool Mask",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Manibozho Jerkin",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist=gear.ElementalBelt,legs="Manibozho Brais",feet="Iuitl Gaiters +1"}


    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = sets.precast.WS

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Lanun Tricorne +1",neck=gear.ElementalGorget,ear1="Clearview Earring",ear2="Moonshade Earring",
        body="Laksamana's Frac +1",hands="Pursuer's Cuffs",ring1="Rajas Ring",ring2="Stormsoul Ring",
        back="Gunslinger's Cape",waist=gear.ElementalBelt,legs="Pursuer's Pants",feet="Pursuer's Gaiters"}
		--{ammo=gear.WSbullet,
		--head="Pursuer's Beret",neck="Light Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		--body="Pursuer's Doublet",hands="Pursuer's Cuffs",ring1="Garuda Ring +1",ring2="Garuda Ring +1",
		--back="Gunslinger's Cape",waist="Light Belt",legs="Pursuer's Pants",feet="Pursuer's Gaiters"}
		--Alternates:
		--head="Lanun Tricorne +1",neck="Flame Gorget",ear1="Moonshade Earring",ear2="Matanki Earring",
		--body="Laksamana's Frac +1",hands="Carmine Finger Gauntlets +1",ring1="Garuda Ring",ring2="Moepapa Ring",
		--back="Terebellum Mantle",waist="Fire Belt",legs="Chasseur's Culottes +1",feet="Chasseur's Culottes +1"
		--hands="Lanun Gants +1"
		
    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
        head="Laksamana's Hat",neck=gear.ElementalGorget,ear1="Clearview Earring",ear2="Moonshade Earring",
        body="Lanun Frac +1",hands="Pursuer's Cuffs",ring1="Hajduk Ring",ring2="Stormsoul Ring",
        back="Libeccio Mantle",waist=gear.ElementalBelt,legs="Pursuer's Pants",feet="Pursuer's Gaiters"}
		--{ammo=gear.WSbullet,
		--head="Pursuer's Beret",neck="Light Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		--body="Pursuer's Doublet",hands="Pursuer's Cuffs",ring1="Garuda Ring +1",ring2="Garuda Ring +1",
		--back="Gunslinger's Cape",waist="Light Belt",legs="Pursuer's Pants",feet="Pursuer's Gaiters"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Lanun Frac +1",hands="Pursuer's Cuffs",ring1="Stormsoul Ring",ring2="Acumen Ring",
        back="Gunslinger's Cape",waist=gear.ElementalBelt,legs="Laksamana Trews +1",feet="Taeon Boots"}
		--{ammo=gear.MAbullet,
		--head="Taeon Chapeau",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
		--body="Samnuha Coat",hands="Pursuer's Cuffs",ring1="Arvina Ringlet +1",ring2="Garuda Ring +1",
		--back="Gunslinger's Cape",waist="Karin Obi",legs="Taeon Tights",feet="Adhemar Gamashes +1"}
		--Alternates:
		--head="Fugacity Beret +1",neck="Deviant Necklace",ear1="Novio Earring",ear2="Ishvara Earring",
		--body="Rawhide Vest",hands="Leyline Gloves",ring1="Stormsoul Ring",ring2="Acumen Ring",
		--back="Forban Cape +1",waist="Eschan Stone",legs="Laksamana Trews +1",feet="Taeon Boots"
		--body="Lanun Frac +1"
		--neck="Stoicheion Medal"

    sets.precast.WS['Wildfire'].Brew = {ammo=gear.MAbullet,
        head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Manibozho Jerkin",hands="Iuitl Wristbands",ring1="Stormsoul Ring",ring2="Demon's Ring",
        back="Toro Cape",waist=gear.ElementalBelt,legs="Iuitl Tights",feet="Iuitl Gaiters +1"}
    
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
		head="Pixie Hairpin +1",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
		body="Lanun Frac +1",hands="Pursuer's Cuffs",ring1="Stormsoul Ring",ring2="Acumen Ring",
		back="Gunslinger's Cape",waist="Anrin Obi",legs="Laksamana Trews +1",feet="Taeon Boots"}
		--{ammo=gear.MAbullet,
		--head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Moonshade Earring",
		--body="Samnuha Coat",hands="Pursuer's Cuffs",ring1="Arvina Ringlet +1",ring2="Archon Ring",
		--back="Gunslinger's Cape",waist="Anrin Obi",legs="Taeon Tights",feet="Adhemar Gamashes +1"}
		--Alternates:
		--head="Fugacity Beret +1",neck="Deviant Necklace",ear1="Novio Earring",ear2="Ishvara Earring",
		--body="Rawhide Vest",hands="Leyline Gloves",ring1="Stormsoul Ring",ring2="Acumen Ring",
		--back="Forban Cape +1",waist="Eschan Stone",legs="Laksamana Trews +1",feet="Taeon Boots"
    
	sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
	sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
	
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Whirlpool Mask",
        body="Iuitl Vest",hands="Iuitl Wristbands",
        legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
        
    -- Specific spells
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.midcast.CorsairShot = {ammo=gear.QDbullet,
        head="Laksamana's Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Lanun Frac +1",hands="Pursuer's Cuffs",ring1="Hajduk Ring",ring2="Acumen Ring",
        back="Gunslinger's Cape",waist="Aquiline Belt",legs="Pursuer's Pants",feet="Pursuer's Gaiters"}
		--{ammo=gear.QDbullet,
		--head="Blood Mask",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		--body="Samnuha Coat",hands="Leyline Gloves",ring1="Fenrir Ring +1",ring2="Fenrir Ring +1",
		--back="Gunslinger's Cape",waist="Hachirin-no-Obi",legs="Taeon Tights",feet="Adhemar Gamashes +1"}
		--Alternatives:
		--head="Taeon Chapeau",neck="Deviant Necklace",ear1="Novio Earring",ear2="Hecate's Earring",
		--body="Mirke Wardecors",hands="Taeon Gloves",ring1="Shiva Ring +1",ring2="Acumen Ring",
		--back="Aput Mantle +1",waist="Salire Belt",legs="Shneddick Tights +1",feet="Taeon Boots"
		--neck="Stoicheion Medal"
		--body="Rawhide Vest"

    sets.midcast.CorsairShot.Acc = {ammo=gear.QDbullet,
        head="Laksamana's Hat",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Lanun Frac +1",hands="Pursuer's Cuffs",ring1="Stormsoul Ring",ring2="Sangoma Ring",
        back="Gunslinger's Cape",waist="Aquiline Belt",legs="Pursuer's Pants",feet="Pursuer's Gaiters"}

    sets.midcast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
        head="Laksamana's Hat",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Lanun Frac +1",hands="Chasseur's Gants",ring1="Stormsoul Ring",ring2="Sangoma Ring",
        back="Gunslinger's Cape",waist="Aquiline Belt",legs="Pursuer's Pants",feet="Chasseur's Bottes"}
		--{ammo=gear.QDbullet,
		--head="Laksamana's Hat +1",neck="Waylayer's Scarf +1",ear1="Enervating Earring",ear2="Gwati Earring",
		--body="Mirke Wardecors",hands="Chasseur's Gants +1",ring1="Longshot Ring",ring2="Arvina Ringlet +1",
		--back="Gunslinger's Cape",waist="Eschan Stone",legs="Pursuer's Pants",feet="Chasseur's Bottes +1"}
		
    sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']
		--ring2="Archon Ring"


    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Lanun Tricorne +1",neck="Ocachi Gorget",ear1="Clearview Earring",ear2="Volley Earring",
        body="Laksamana's Frac +1",hands="Pursuer's Cuffs",ring1="Rajas Ring",ring2="Stormsoul Ring",
        back="Gunslinger's Cape",waist="Commodore Belt",legs="Pursuer's Pants",feet="Pursuer's Gaiters"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Laksamana's Hat",neck="Ej Necklace",ear1="Clearview Earring",ear2="Volley Earring",
        body="Laksamana's Frac +1",hands="Buremte Gloves",ring1="Hajduk Ring",ring2="Beeline Ring",
        back="Gunslinger's Cape",waist="Commodore Belt",legs="Pursuer's Pants",feet="Pursuer's Gaiters"}
		--{ammo=gear.RAbullet,
		--head="Chasseur's Tricorne +1",neck="Ej Necklace +1",ear1="Enervating Earring",ear2="Telos Earring",
		--body="Pursuer's Doublet",hands="Floral Gauntlets",ring1="Hajduk Ring +1",ring2="Hajduk Ring +1",
		--back="Gunslinger's Cape",waist="Eschan Stone",legs="Pursuer's Pants",feet="Pursuer's Gaiters"}
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Clearview Earring",ear2="Infused Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Stearc Subligar",feet="Skadi's Jambeaux +1"}
		--{
		--head="Blood Mask",neck="Wiglen Gorget",ear1="Dawn Earring",ear2="Infused Earring",
		--body="Mechosuchinae Harness",hands="Feronia's Bangles",ring1="Sheltered Earring",ring2="Paguroidea Ring",
		--back="Scuta Cape",waist="Lycopodium Sash",legs="Stearc Subligar",feet="Skadi's Jambeaux +1"}

    sets.idle.Town = {main="Surcouf's Jambiya",range="Eminent Gun",ammo=gear.RAbullet,
        head="Chasseur's Tricorne",neck="Wiglen Gorget",ear1="Clearview Earring",ear2="Infused Earring",
        body="Chasseur's Frac",hands="Chasseur's Gants",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Chasseur's Culottes",feet="Skadi's Jambeaux +1"}
		--legs="Nahtirah Trousers"
    
    -- Defense sets
    sets.defense.PDT = {
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Clearview Earring",ear2="Volley Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}
		--{
		--head="Iuitl Headgear +1",neck="Wiglen Gorget",ear1="Darkness Earring",ear2="Genmei Earring",
		--body="Lanun Frac +1",hands="Umuthi Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		--back="Shadow Mantle",waist="Flume Belt",legs="Iuitl Tights +1",feet="Lanun Bottes +1"}

    sets.defense.MDT = {
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Clearview Earring",ear2="Volley Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}
		--{main="Vanir Knife",
		--head="Dampening Tam",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Merman's Earring",
		--body="Carmine Scale Mail +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		--back="Engulfer Cape +1",waist="Lieutenant's Sash",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}
    

    sets.Kiting = {feet="Skadi's Jambeaux +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged.Melee = {ammo=gear.RAbullet,
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
    
    sets.engaged.Acc = {ammo=gear.RAbullet,
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Iuitl Gaiters +1"}

    sets.engaged.Melee.DW = {ammo=gear.RAbullet,
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
		--{main="Atoyac",sub="Odium",ranged="Doomsday",ammo=gear.RAbullet,
		--head="Adhemar Bonnet +1",neck="Defiant Collar",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
		--body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Epona's Ring",ring2="Petrov Ring",
		--back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Adhemar Gamashes +1"}
		--Alternates:
		--main="Vanir Knife",sub="Demersal Degen +1",
		--head="Dampening Tam",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
		--body="Rawhide Vest",hands="Floral Gauntlets",ring1="Rajas Ring",ring2="Epona's Ring",
		--back="Atheling Mantle",waist="Reiki Yotai",legs="Ta'lab Trousers",feet="Taeon Boots"
    
    sets.engaged.Acc.DW = {ammo=gear.RAbullet,
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
		--main="Odium",sub="Fettering Blade",
		--head="Whirlpool Mask",neck="Ej Necklace +1",ear1="Telos Earring",ear2="Zennaroi Earring",
		--body="Foppish Tunica +1",hands="Chasseur's Gants +1",ring1="Ramuh Ring +1",ring2="Cacoethic Ring +1",
		--back="Letalis Mantle",waist="Anguinus Belt",legs="Qaaxo Tights",feet="Qaaxo Leggings"
		--ring1="Patricius Ring"


    sets.engaged.Ranged = {ammo=gear.RAbullet,
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Clearview Earring",ear2="Volley Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 17)
end
