function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Bounty Shot'] = {hands="Amini Glovelettes"}
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin"} --{body="Orion Jerkin +1"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks"} --{feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers"} --{hands="Orion Bracers +1"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae"} --{legs="Orion Braccae +1"}


	-- Fast cast sets for spells

	sets.precast.FC = {
		ear2="Loquacious Earring",
		ring1="Prolix Ring"} 
		--{
		--head="Haruspex Hat",ear2="Loquacious Earring",
		--hands="Thaumas Gloves",ring1="Prolix Ring"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Amini Gapette",
		body="Amini Caban",
		waist="Impulse Belt"}
		--{
		--head="Orion Beret +1",
		--body="Sylvan Caban +2",hands="Iuitl Wristbands",
		--waist="Impulse Belt",legs="Nahtirah Trousers",feet="Khepri Gamashes"}


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Adhemar Bonnet",neck="Fotia Gorget",
		ring2="Rajas Ring",
		back="Sylvan Chlamys",waist="Fotia Belt"}
		--{
		--head="Orion's Beret +1",neck=gear.ElementalGorget,ear1="Vulcan's Pearl",ear2="Vulcan's Pearl",
		--body="Khepri Jacket",hands="Arcadian Bracers +1",ring1="Pyrosoul Ring",ring2="Rajas Ring",
		--back="Sylvan Chlamys",waist=gear.ElementalBelt,legs="Nahtirah Trousers",feet="Orion Socks +1" }

	sets.precast.WS.Acc = set_combine(sets.precast.WS, {body="Adhemar Jacket",ring1="Hajduk Ring +1",
		back="Lutian Cape",legs="Herculean Trousers"})
		--set_combine(sets.precast.WS, {body="Kyujutsugi",ring1="Hajduk Ring +1",
		--back="Lutian Cape",legs="Orion Braccae +1"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = {
		ear1="Loquacious Earring",
		ring1="Prolix Ring"}
		--{
		--head="Orion Beret +1",ear1="Loquacious Earring",
		--ring1="Prolix Ring",
		--waist="Pya'ekue Belt +1",legs="Orion Braccae +1",feet="Orion Socks +1"}

	sets.midcast.Utsusemi = {}

	-- Ranged sets

	sets.midcast.RA = {
		head="Adhemar Bonnet",neck="Sylvan Scarf",ear1="Volley Earring",ear2="Bladeborn Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Longshot Ring",ring2="Fistmele Ring",
		back="Libeccio Mantle",waist="Scout's Belt",legs="Herculean Trousers",feet="Herculean Boots"}
		--{
		--head="Arcadian Beret +1",neck="Ocachi Gorget",ear1="Volley earring",ear2="Tripudio Earring",
		--body="Kyujutsugi",hands="Manibozho Gloves",ring1="Paqichikaji Ring",ring2="Hajduk Ring +1",
		--back="Lutian Cape",waist="Elanid Belt",legs="Nahtirah Trousers",feet="Orion Socks +1"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{head="Dampening Tam",neck="Huani Collar",
		body="Adhemar Jacket",ring2="Arewe Ring",
		legs="Feast Hose",feet="Herculean Boots"})
		--set_combine(sets.midcast.RA,
		--{head="Orion Beret +1",neck="Ej Necklace +1",hands="Manibozho Gloves",ring2="Hajduk Ring +1",
		--back="Lutian Cape",legs="Orion Braccae +1"})

	sets.midcast.RA.Annihilator = set_combine(sets.midcast.RA)

	sets.midcast.RA.Annihilator.Acc = set_combine(sets.midcast.RA.Acc)

	sets.midcast.RA.Yoichinoyumi = set_combine(sets.midcast.RA, {ear2="Clearview Earring",ring2="Rajas Ring",
		back="Sylvan Chlamys"})

	sets.midcast.RA.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Acc, {ear2="Clearview Earring"})
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		ring1="Sheltered Ring",ring2="Paguroidea Ring"}
		--{head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		--ring1="Sheltered Ring",ring2="Paguroidea Ring"}

	-- Idle sets
	sets.idle = {
		head="Adhemar Bonnet",neck="Ej Necklace",ear1="Volley Earring",ear2="Bladeborn Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Longshot Ring",ring2="Fistmele Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Herculean Trousers",feet="Skadi's Jambeaux +1"}
		--{
		--head="Arcadian Beret +1",neck="Ej Necklace +1",ear1="Vulcan's Pearl",ear2="Vulcan's Pearl",
		--body="Khepri Jacket",hands="Arcadian Bracers +1",ring1="Defending Ring",ring2="Shadow Ring",
		--back="Shadow Mantle",waist="Pya'ekue Belt +1",legs="Nahtirah Trousers",feet="Fajin Boots"}

	sets.idle.Town = {main="Perun",sub="",range="Hangaku-no-Yumi",ammo="",
		head="Adhemar Bonnet",neck="Ej Necklace",ear1="Volley Earring",ear2="Bladeborn Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Longshot Ring",ring2="Fistmele Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Herculean Trousers",feet="Skadi's Jambeaux +1"}
		--{
		--head="Sylvan Gapette +2",neck="Sylvan Scarf",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		--body="Qaaxo Harness",hands="Syl. Glvltte. +2",ring1="Longshot Ring",ring2="Fistmele Ring",
		--back="Libeccio Mantle",waist="Impulse Belt",legs="Qaaxo Tights",feet="Sylvan Bottln. +2"}
	
	-- Defense sets
	sets.defense.PDT = {
		neck="Twilight Torque"}
		--{
		--head="Whirlpool Mask",neck="Twilight Torque",
		--body="Orion Jerkin +1",hands="Orion Bracers +1",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		--back="Mollusca Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Orion Socks +1"}

	sets.defense.MDT = {
		neck="Twilight Torque"}
		--{
		--head="Orion Beret +1",neck="Twilight Torque",
		--body="Orion Jerkin +1",hands="Orion Bracers +1",ring1="Defending Ring",ring2="Shadow Ring",
		--back="Mollusca Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Orion Socks +1"}

	sets.Kiting = {feet="Skadi's Jambeaux +1"} --{feet="Fajin Boots"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
		head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Scout's Belt",legs="Herculean Trousers",feet="Herculean Boots"}
		--{
		--head="Whirlpool Mask",neck="Twilight Torque",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		--body="Orion Jerkin +1", hands="Arcadian Bracers +1", ring1="Defending Ring",ring2="Rajas Ring",
		--back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Orion Socks +1"}

	sets.engaged.Acc = {
		head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="Enlivened Ring",
		back="Atheling Mantle",waist="Scout's Belt",legs="Herculean Trousers",feet="Herculean Boots"}
		--{
		--head="Whirlpool Mask",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		--body="Manibozho Jerkin",hands="Iuitl Wristbands",ring1="K'ayres Ring",ring2="Rajas Ring",
		--back="Letalis Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Iuitl Gaiters"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.buff.Barrage = set_combine(sets.midcast.RA.Acc, {hands="Orion Bracers"})
		--set_combine(sets.midcast.RA.Acc, {hands="Orion Bracers +1"})
	sets.buff.Camouflage = {body="Orion Jerkin"} --{body="Orion Jerkin +1"}
end

function select_default_macro_book()
	set_macro_page(1, 11)
end
