function user_setup()
    state.OffenseMode:options('Normal', 'MedAcc', 'HighAcc')
    state.HybridMode:options('Normal', 'Hybrid')
    state.WeaponskillMode:options('Normal', 'WSMedAcc', 'WSHighAcc')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal', 'Reraise', 'Refresh', 'Regen')
    state.RestingMode:options('Normal')
    state.PhysicalDefenseMode:options('PetPDT', 'PDT', 'Reraise')
    state.MagicalDefenseMode:options('MDTShell', 'MDT')

    -- 'Out of Range' distance; WS will auto-cancel
    target_distance = 6

    -- Set up Jug Pet cycling and keybind Alt+F8
    -- INPUT PREFERRED JUG PETS HERE
    state.JugMode = M{['description']='Jug Mode', 'BlackbeardRandy', 'SwoopingZhivago', 'WarlikePatrick',
        'HeadbreakerKen', 'VivaciousVickie', 'BouncingBertha', 'ScissorlegXerin', 'ThreestarLynn', 'HeraldHenry', 'RhymingShizuna'}
    send_command('bind !f8 gs c cycle JugMode')

    -- Set up Monster Correlation Modes and keybind Ctrl+F8
    state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
    send_command('bind ^f8 gs c cycle CorrelationMode')

    -- Set up Pet Modes for Hybrid sets and keybind 'Windows Key'+F8
    state.PetMode = M{['description']='Pet Mode', 'PetOnly', 'PetTank', 'Normal'}
    send_command('bind @f8 gs c cycle PetMode')

    -- Keybind Ctrl+F11 to cycle Magical Defense Modes
    send_command('bind ^f11 gs c cycle MagicalDefenseMode')

    -- Set up Reward Modes and keybind alt+=
    state.RewardMode = M{['description']='Reward Mode', 'Theta', 'Eta', 'Zeta'}
    send_command('bind != gs c cycle RewardMode')

    -- Set up Treasure Modes and keybind Ctrl+=
    state.TreasureMode = M{['description']='Treasure Mode', 'Tag', 'Normal'}
    send_command('bind ^= gs c cycle TreasureMode')

	select_default_macro_book()
	
	
-- Complete list of Ready moves
physical_ready_moves = S{'Sic','Foot Kick','Whirl Claws','Wild Carrot','Sheep Charge','Lamb Chop','Head Butt',
    'Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang','Nimble Snap','Cyclotail','Rhino Attack','Power Attack',
    'Mandibular Bite','Big Scissors','Grapple','Spinning Top','Double Claw','Frogkick','Blockhead','Brain Crush',
    'Tail Blow','??? Needles','Needleshot','Scythe Tail','Ripper Fang','Chomp Rush','Recoil Dive','Sudden Lunge',
    'Spiral Spin','Wing Slap','Beak Lunge','Suction','Back Heel','Choke Breath','Fantod','Tortoise Stomp',
    'Harden Shell','Sensilla Blades','Tegmina Buffet','Swooping Frenzy','Pentapeck','Sweeping Gouge',
    'Zealous Snort','Somersault','Tickling Tendrils','Pecking Flurry','Sickle Slash'}

magic_atk_ready_moves = S{'Dust Cloud','Cursed Sphere','Venom','Toxic Spit','Bubble Shower','Drainkiss',
    'Silence Gas','Dark Spore','Fireball','Plague Breath','Snow Cloud','Charged Whisker','Purulent Ooze',
    'Corrosive Ooze','Aqua Breath','Stink Bomb','Nectarous Deluge','Nepenthic Plunge','Pestilent Plume',
    'Foul Waters','Infected Leech','Gloom Spray'}

magic_acc_ready_moves = S{'Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
    'Soporific','Geist Wall','Toxic Spit','Numbing Noise','Spoil','Hi-Freq Field','Sandpit','Sandblast',
    'Venom Spray','Filamented Hold','Queasyshroom','Numbshroom','Spore','Shakeshroom','Infrasonics',
    'Chaotic Eye','Blaster','Intimidate','Noisome Powder','Acid Mist','TP Drainkiss','Jettatura',
    'Molting Plumage','Spider Web'}

tp_based_ready_moves = S{'Sic','Foot Kick','Dust Cloud','Snow Cloud','Wild Carrot','Sheep Song','Sheep Charge',
    'Lamb Chop','Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
    'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Somersault','Geist Wall','Numbing Noise',
    'Frogkick','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Hi-Freq Field','Sandpit','Sandblast',
    'Mandibular Bite','Metallic Body','Bubble Shower','Bubble Curtain','Scissor Guard','Grapple','Spinning Top',
    'Double Claw','Filamented Hold','Spore','Blockhead','Secretion','Fireball','Tail Blow','Plague Breath',
    'Brain Crush','Infrasonics','Needleshot','Chaotic Eye','Blaster','Ripper Fang','Intimidate','Recoil Dive',
    'Water Wall','Sudden Lunge','Noisome Powder','Wing Slap','Beak Lunge','Suction','Drainkiss','Acid Mist',
    'TP Drainkiss','Back Heel','Jettatura','Choke Breath','Fantod','Charged Whisker','Purulent Ooze',
    'Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath','Sensilla Blades','Tegmina Buffet',
    'Sweeping Gouge','Zealous Snort','Tickling Tendrils','Pecking Flurry','Pestilent Plume','Foul Waters',
    'Spider Web','Gloom Spray'}

-- List of abilities to reference for applying Treasure Hunter +1 via Chaac Belt.
abilities_to_check = S{'Feral Howl','Quickstep','Box Step','Stutter Step','Desperate Flourish',
    'Violent Flourish','Animated Flourish','Provoke','Dia','Dia II','Flash','Bio','Bio II',
    'Sleep','Sleep II','Drain','Aspir','Dispel','Stun','Steal','Mug'}
end

-- BST gearsets
function init_gear_sets()
    -- AUGMENTED GEAR
    Pet_PDT_AxeMain = "Skullrender" --"Izizoeksi"
    Pet_PDT_AxeSub = "Skullrender" --"Astolfo"

    Pet_PDT_head = "Despair Helm"
		--"Anwig Salade"
    Pet_PDT_body = "Totemic Jackcoat +1"
		--{name="Acro Surcoat", augments={'Pet: DEF+22','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_PDT_hands = "Ankusa Gloves +1"
		--{name="Acro Gauntlets", augments={'Pet: DEF+22','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_PDT_legs = "Totemic Trousers +1"
		--{name="Acro Breeches", augments={'Pet: DEF+25','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_PDT_feet = "Ankusa Gaiters"
		--{name="Acro Leggings", augments={'Pet: DEF+25','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_PDT_back = "Pastoralist's Mantle"
		--{name="Pastoralist's Mantle", augments={'STR+1 DEX+1','Accuracy+1','Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: Damage taken -5%',}}

    Ready_Atk_head = "Despair Helm"
    Ready_Atk_body = "Totemic Jackcoat +1"
		--{name="Acro Surcoat", augments={'Pet: Accuracy+24 Pet: Rng.Acc.+24','Pet: "Dbl. Atk."+5','Pet: Haste+5',}}
    Ready_Atk_hands = {name="Taeon Gloves", augments={'Pet: Accuracy+7 Rng. Acc.+7','Pet: "Dbl. Atk."+3'}}
		--{name="Acro Gauntlets", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5',}}
    Ready_Atk_legs = "Totemic Trousers +1"
		--{name="Taeon Tights", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: "Dbl. Atk."+5','Pet: Haste+5',}}
    Ready_Atk_feet = "Totemic Gaiters +1"
		--{name="Taeon Boots", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: "Dbl. Atk."+5','Pet: Haste+5',}}
    Ready_Atk_back = "Pastoralist's Mantle"
		--{name="Pastoralist's Mantle", augments={'STR+1 DEX+1','Accuracy+1','Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: Damage taken -5%',}}

    Ready_Acc_head = "Totemic Helm +1"
    Ready_Acc_body = "Totemic Jackcoat +1"
		--{name="Acro Surcoat", augments={'Pet: Accuracy+24 Pet: Rng.Acc.+24','Pet: "Dbl. Atk."+5','Pet: Haste+5',}}
    Ready_Acc_hands = "Regimen Mittens"
    Ready_Acc_legs = "Totemic Trousers +1"
		--"Wisent Kecks"
    Ready_Acc_feet = "Totemic Gaiters +1"
		--{name="Taeon Boots", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23',}}
    Ready_Acc_back = Ready_Atk_back

    Ready_MAB_head = Ready_Acc_head
		--{name="Acro Helm", augments={'Pet: "Mag.Atk.Bns."+25','Pet: "Store TP"+6',}}
    Ready_MAB_body = Ready_Acc_body
		--{name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25',}}
    Ready_MAB_hands = Ready_Acc_hands
		--{name="Acro Gauntlets", augments={'Pet: "Mag.Atk.Bns."+20','Pet: "Store TP"+3',}}
    Ready_MAB_legs = Ready_Acc_legs
		--{name="Acro Breeches", augments={'Pet: "Mag.Atk.Bns."+22','Pet: Breath+7',}}
    Ready_MAB_feet = Ready_Acc_feet
		--{name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+23','Pet: Breath+7',}}

    Ready_MAcc_head = Ready_Acc_head
		--{name="Acro Helm", augments={'Pet: Mag. Acc.+25','"Call Beast" ability delay -5',}}
    Ready_MAcc_body = Ready_Acc_body
		--{name="Acro Surcoat", augments={'Pet: Mag. Acc.+24',}}
    Ready_MAcc_hands = "Regimen Mittens"
    Ready_MAcc_legs = Ready_Acc_legs
		--{name="Acro Breeches", augments={'Pet: Mag. Acc.+25','"Call Beast" ability delay -5',}}
    Ready_MAcc_feet = Ready_Acc_feet
		--{name="Acro Leggings", augments={'Pet: Mag. Acc.+23',}}

    Ready_Atk_Axe = "Skullrender"
		--{name="Kumbhakarna", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2','Pet: TP Bonus+180',}}
    Ready_Acc_Axe = Ready_Atk_Axe
    Ready_MAB_Axe = "Kumbhakarna"
		--{name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+20','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+180',}}
    Ready_MAcc_Axe = Ready_MAB_Axe

    Pet_Melee_head = Ready_Acc_head
    Pet_Melee_body = Ready_Acc_body
    Pet_Melee_hands = "Regimen Mittens"
    Pet_Melee_legs = Ready_Acc_legs
    Pet_Melee_feet = Ready_Acc_feet

    Hybrid_head = Pet_PDT_head
		--{name="Taeon Chapeau", augments={'Accuracy+24','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Hybrid_body = Pet_PDT_body
    Hybrid_hands = Pet_PDT_hands
    Hybrid_legs = Pet_PDT_legs
		--{name="Taeon Tights", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','Pet: Damage taken -4%',}}
    Hybrid_feet = Pet_PDT_feet
		--{name="Taeon Boots", augments={'Accuracy+25','"Triple Atk."+2','Pet: Damage taken -4%',}}

    DW_head = "Totemic Helm +1"
    DW_body = "Totemic Jackcoat +1"
    DW_hands = "Ankusa Gloves +1"
    DW_legs = "Totemic Trousers +1"
    DW_feet = "Totemic Gaiters +1"
    --DW_head = {name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Dual Wield"+5','STR+3 VIT+3',}}
    --DW_body = {name="Taeon Tabard", augments={'Accuracy+20 Attack+20','"Dual Wield"+5','Crit. hit damage +2%',}}
    --DW_hands = {name="Taeon Gloves", augments={'Accuracy+18 Attack+18','"Dual Wield"+5','STR+6 VIT+6',}}
    --DW_legs = {name="Taeon Tights", augments={'Accuracy+22','"Dual Wield"+5','Crit. hit damage +2%',}}
    --DW_feet = {name="Taeon Boots", augments={'Accuracy+23','"Dual Wield"+5','Crit. hit damage +2%',}}

    MAB_head = DW_head
		--{name="Taeon Chapeau", augments={'"Mag.Atk.Bns."+19','"Fast Cast"+4','Weapon skill damage +2%',}}
    MAB_body = DW_body
		--{name="Taeon Tabard", augments={'"Mag.Atk.Bns."+20','"Fast Cast"+5','Weapon skill damage +2%',}}
    MAB_hands = DW_hands
		--{name="Taeon Gloves", augments={'"Mag.Atk.Bns."+20','"Fast Cast"+4','Weapon skill damage +3%',}}
    MAB_legs = DW_legs
		--{name="Taeon Tights", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Fast Cast"+3','STR+10',}}
    MAB_feet = DW_feet
		--{name="Taeon Boots", augments={'Mag. Acc.+13 "Mag.Atk.Bns."+13','"Fast Cast"+5','Weapon skill damage +2%',}}

    FC_head = MAB_head
    FC_body = MAB_body
    FC_hands = MAB_hands
    FC_legs = MAB_legs
    FC_feet = MAB_feet

    MAcc_head = MAB_head
		--"Seiokona Beret"
    MAcc_body = "Ankusa Jackcoat"
    MAcc_hands = MAB_hands
    MAcc_legs = MAB_legs
    MAcc_feet = MAB_feet

    CB_head = Ready_MAcc_head
    CB_body = "Totemic Jackcoat +1"
    CB_hands = "Ankusa Gloves +1"
    CB_legs = Ready_MAcc_legs
    CB_feet = "Totemic Gaiters +1"

    -- PRECAST SETS
    sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm"}
		--{head="Ankusa Helm +1"}
    sets.precast.JA['Bestial Loyalty'] = {head=CB_head,
        body=CB_body,
        hands=CB_hands,
        legs=CB_legs,
        feet=CB_feet}
    sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
    sets.precast.JA.Familiar = {legs="Ankusa Trousers"}
		--{legs="Ankusa Trousers +1"}
    sets.precast.JA.Tame = {head="Totemic Helm +1",ear1="Tamer's Earring",legs="Stout Kecks"}
		--{head="Totemic Helm +1",ear1="Tamer's Earring",legs="Stout Kecks"}
    sets.precast.JA.Spur = {feet="Nukumi Ocreae"}
		--{feet="Nukumi Ocreae +1"}

    sets.precast.JA['Feral Howl'] = {ammo="Ombre Tathlum +1",
        head=MAcc_head,
        neck="Voltsurge Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body=MAcc_body,
        hands=MAcc_hands,
        ring1="Perception Ring",ring2="Sangoma Ring",
        back="Aput Mantle +1",
        waist="Eschan Stone",
        legs=MAcc_legs,
        feet=MAcc_feet}
		--{ammo="Ombre Tathlum +1",
        --head=MAcc_head,
        --neck="Voltsurge Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        --body=MAcc_body,
        --hands=MAcc_hands,
        --ring1="Perception Ring",ring2="Sangoma Ring",
        --back="Aput Mantle +1",
        --waist="Eschan Stone",
        --legs=MAcc_legs,
        --feet=MAcc_feet}

    sets.precast.JA.Reward = {
        head="Stout Bonnet",neck="Aife's Medal",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
        body="Totemic Jackcoat +1",hands="Regimen Mittens",ring1="Leviathan Ring +1",ring2="Leviathan Ring +1",
        back=Pet_PDT_back,
		waist="Engraved Belt",legs="Ankusa Trousers",feet="Ankusa Gaiters"}
		--{
        --head="Stout Bonnet",neck="Aife's Medal",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
        --body="Totemic Jackcoat +1",hands="Regimen Mittens",ring1="Leviathan Ring +1",ring2="Leviathan Ring +1",
        --back=Pet_PDT_back,
        --waist="Engraved Belt",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1"}

    sets.precast.JA.Reward.Theta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Theta"})
    sets.precast.JA.Reward.Zeta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Zeta"})
    sets.precast.JA.Reward.Eta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Eta"})

    sets.precast.JA.Charm = {ammo="Tsar's Egg",
        head="Ighwa Cap",neck="Dualism Collar +1",ear1="Enchanter's Earring",ear2="Enchanter Earring +1",
        body="Totemic Jackcoat +1",hands="Ankusa Gloves +1",ring1="Dawnsoul Ring",ring2="Dawnsoul Ring",
        back="Aisance Mantle +1",waist="Aristo Belt",legs="Ankusa Trousers",feet="Ankusa Gaiters"}
		--{ammo="Tsar's Egg",
        --head="Ighwa Cap",neck="Dualism Collar +1",ear1="Enchanter's Earring",ear2="Enchanter Earring +1",
        --body="Totemic Jackcoat +1",hands="Ankusa Gloves +1",ring1="Dawnsoul Ring",ring2="Dawnsoul Ring",
        --back="Aisance Mantle +1",waist="Aristo Belt",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1"}

    -- CURING WALTZ
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Ighwa Cap",neck="Dualism Collar +1",ear1="Enchanter's Earring",ear2="Enchanter Earring +1",
        body="Totemic Jackcoat +1",hands="Regimen Mittens",ring1="Valseur's Ring",ring2="Asklepian Ring",
        back="Aisance Mantle +1",waist="Aristo Belt",legs="Desultor Tassets",feet="Totemic Gaiters +1"}
		--{ammo="Sonia's Plectrum",
        --head="Ighwa Cap",neck="Dualism Collar +1",ear1="Enchanter's Earring",ear2="Enchanter Earring +1",
        --body="Totemic Jackcoat +1",hands="Regimen Mittens",ring1="Valseur's Ring",ring2="Asklepian Ring",
        --back="Aisance Mantle +1",waist="Aristo Belt",legs="Desultor Tassets",feet="Totemic Gaiters +1"}

    -- HEALING WALTZ
    sets.precast.Waltz['Healing Waltz'] = {}

    -- STEPS
	sets.precast.Step = {ammo="Jukukik Feather",
        head="Yaoyotl Helm",neck="Ferine Necklace",ear1="Steelflash Earring",ear2="Heartseeker Earring",
        body="Nukumi Gausape",
        hands="Buremte Gloves",
        ring1="Rajas Ring",ring2="Enlivened Ring",
        back="Pastoralist's Mantle",waist="Hurch'lan Sash",
        legs="Nukumi Quijotes",
        feet="Despair Greaves"}
		--{ammo="Hasty Pinion +1",
        --head="Yaoyotl Helm",neck="Ferine Necklace",ear1="Steelflash Earring",ear2="Heartseeker Earring",
        --body="Mes'yohi Haubergeon",
        --hands=DW_hands,
        --ring1="Mars's Ring",ring2="Oneiros Annulet",
        --back="Grounded Mantle +1",waist="Olseni Belt",
        --legs=DW_legs,
        --feet=DW_feet}

    -- VIOLENT FLOURISH
    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {ammo="Jukukik Feather",
        head=MAcc_head,
        neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Nukumi Gausape",
        hands=MAcc_hands,
        ring1="Sangoma Ring",ring2="Fenrir Ring +1",
        back="Pastoralist's Mantle",waist="Eschan Stone",
        legs=MAcc_legs,
        feet=MAcc_feet}
		--{ammo="Hasty Pinion +1",
        --head=MAcc_head,
        --neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        --body="Mes'yohi Haubergeon",
        --hands=MAcc_hands,
        --ring1="Sangoma Ring",ring2="Fenrir Ring +1",
        --back="Grounded Mantle +1",waist="Eschan Stone",
        --legs=MAcc_legs,
        --feet=MAcc_feet}

    sets.precast.FC = {ammo="Impatiens",
        head=FC_head,
        neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
        body=FC_body,
        hands=FC_hands,
        ring1="Prolix Ring",ring2="Weatherspoon Ring",
        legs=FC_legs,
        feet=FC_feet}
		--{ammo="Impatiens",
        --head=FC_head,
        --neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
        --body=FC_body,
        --hands=FC_hands,
        --ring1="Prolix Ring",ring2="Fenrir Ring +1",
        --legs=FC_legs,
        --feet=FC_feet}

        sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    -- CALLING TRUSTS @ iLV119
    sets.precast.Trust = sets.precast.JA['Call Beast']

    -- MIDCAST SETS
    sets.midcast.FastRecast = {
        head=FC_head,
        neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
        body=FC_body,
        hands=FC_hands,
        ring1="Prolix Ring",ring2="Weatherspoon Ring",
        back="Repulse Mantle",waist="Hurch'lan Sash",
        legs=FC_legs,
        feet=FC_feet}
		--{
        --head=FC_head,
        --neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
        --body=FC_body,
        --hands=FC_hands,
        --ring1="Prolix Ring",ring2="Defending Ring",
        --back="Repulse Mantle",waist="Hurch'lan Sash",
        --legs=FC_legs,
        --feet=FC_feet}
 
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.midcast.Cure = {ammo="Quartz Tathlum +1",
        head="Yaoyotl Helm",neck="Phalaina Locket",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
        body="Savas Jawshan",hands="Buremte Gloves",ring1="Leviathan Ring +1",ring2="Asklepian Ring",
        back=Pet_PDT_back,
        waist="Chuq'aba Belt",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1"}
		--{ammo="Quartz Tathlum +1",
        --head="Yaoyotl Helm",neck="Phalaina Locket",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
        --body="Savas Jawshan",hands="Buremte Gloves",ring1="Leviathan Ring +1",ring2="Asklepian Ring",
        --back=Pet_PDT_back,
        --waist="Chuq'aba Belt",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Stoneskin = {ammo="Quartz Tathlum +1",
        head="Ighwa Cap",neck="Stone Gorget",ear1="Earthcry Earring",ear2="Lifestorm Earring",
        body="Totemic Jackcoat +1",hands="Stone Mufflers",ring1="Leviathan Ring +1",ring2="Leviathan Ring +1",
        back=Pet_PDT_back,
        waist="Engraved Belt",legs="Haven Hose",feet="Whirlpool Greaves"}
		--{ammo="Quartz Tathlum +1",
        --head="Ighwa Cap",neck="Stone Gorget",ear1="Earthcry Earring",ear2="Lifestorm Earring",
        --body="Totemic Jackcoat +1",hands="Stone Mufflers",ring1="Leviathan Ring +1",ring2="Leviathan Ring +1",
        --back=Pet_PDT_back,
        --waist="Engraved Belt",legs="Haven Hose",feet="Whirlpool Greaves"}

    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {neck="Malison Medallion",
        ring1="Eshmun's Ring",ring2="Ephedra Ring"})
		--{neck="Malison Medallion",
        --ring1="Eshmun's Ring",ring2="Haoma's Ring"})

    sets.midcast.Protect = {ring2="Sheltered Ring"}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {ring2="Sheltered Ring"}
    sets.midcast.Shellra = sets.midcast.Shell

    sets.midcast['Enfeebling Magic'] = {ammo="Quartz Tathlum +1",
        head=FC_head,
        neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body=FC_body,
        hands=FC_hands,
        ring1="Sangoma Ring",ring2="Fenrir Ring +1",
        back="Aput Mantle +1",waist="Eschan Stone",
        legs=FC_legs,
        feet=FC_feet}
		--{ammo="Quartz Tathlum +1",
        --head=FC_head,
        --neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        --body=FC_body,
        --hands=FC_hands,
        --ring1="Sangoma Ring",ring2="Fenrir Ring +1",
        --back="Aput Mantle +1",waist="Eschan Stone",
        --legs=FC_legs,
        --feet=FC_feet}

    sets.midcast['Elemental Magic'] = sets.midcast['Enfeebling Magic']

    sets.precast.LuzafRing = {ring1="Luzaf's Ring"}

    -- WEAPONSKILLS
    -- Default weaponskill sets.
    sets.precast.WS = {ammo="Cheruski Needle",
        head="Otomi Helm",neck="Asperity Necklace",ear1="Kokou's Earring",ear2="Brutal Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Ifrit Ring +1",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Windbuffet Belt +1",
        legs=Hybrid_legs,
        feet=Hybrid_Feet}
		--{ammo="Cheruski Needle",
        --head="Otomi Helm",neck="Asperity Necklace",ear1="Kokou's Earring",ear2="Brutal Earring",
        --body="Mes'yohi Haubergeon",
        --hands=DW_hands,
        --ring1="Ifrit Ring +1",ring2="Epona's Ring",
        --back="Bleating Mantle",waist="Windbuffet Belt +1",
        --legs=Hybrid_legs,
        --feet=Hybrid_Feet}

    sets.precast.WS.WSMedAcc = {ammo="Jukukik Feather",
        head="Otomi Helm",neck="Ferine Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Ifrit Ring +1",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Anguinus Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
		--{ammo="Hasty Pinion +1",
        --head="Otomi Helm",neck="Ferine Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        --body="Mes'yohi Haubergeon",
        --hands=DW_hands,
        --ring1="Ifrit Ring +1",ring2="Epona's Ring",
        --back="Bleating Mantle",waist="Anguinus Belt",
        --legs=Hybrid_legs,
        --feet=Hybrid_feet}

    sets.precast.WS.WSHighAcc = {ammo="Jukukik Feather",
        head="Yaoyotl Helm",neck="Ferine Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Mars's Ring",ring2="Oneiros Annulet",
        back="Grounded Mantle +1",waist="Anguinus Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
		--{ammo="Hasty Pinion +1",
        --head="Yaoyotl Helm",neck="Ferine Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        --body="Mes'yohi Haubergeon",
        --hands=DW_hands,
        --ring1="Mars's Ring",ring2="Oneiros Annulet",
        --back="Grounded Mantle +1",waist="Anguinus Belt",
        --legs=Hybrid_legs,
        --feet=Hybrid_feet}

    -- Specific weaponskill sets.
    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",hands="Boor Bracelets",
        back="Buquwik Cape",waist="Fotia Belt"})
    sets.precast.WS['Ruinator'].Gavialis = set_combine(sets.precast.WS['Ruinator'], {head="Gavialis Helm"})
    sets.precast.WS['Ruinator'].WSMedAcc = set_combine(sets.precast.WS.WSMedAcc, {neck="Fotia Gorget",
        ear1="Kokou's Earring",ear2="Brutal Earring",
        back="Buquwik Cape",waist="Fotia Belt"})
    sets.precast.WS['Ruinator'].WSHighAcc = set_combine(sets.precast.WS.WSHighAcc, {neck="Fotia Gorget",
        ear1="Kokou's Earring",ear2="Brutal Earring",
        waist="Fotia Belt"})

    sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {neck="Justiciar's Torque",
        ear1="Steelflash Earring",ear2="Bladeborn Earring",
        ring1="Rajas Ring",back="Vespid Mantle"})
    sets.precast.WS['Onslaught'].WSMedAcc = set_combine(sets.precast.WSMedAcc, {ring1="Rajas Ring",back="Vespid Mantle"})
    sets.precast.WS['Onslaught'].WSHighAcc = set_combine(sets.precast.WSHighAcc, {back="Vespid Mantle"})

    sets.precast.WS['Primal Rend'] = {ammo="Erlene's Notebook",
        head=MAB_head,
        neck="Stoicheion Medal",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body=MAB_body,
        hands=MAB_hands,
        ring1="Acumen Ring",ring2="Fenrir Ring +1",
        back="Argochampsa Mantle",waist="Eschan Stone",
        legs=MAB_legs,
        feet=MAB_feet}
    sets.precast.WS['Primal Rend'].WSMedAcc = set_combine(sets.precast.WS['Primal Rend'], {neck="Fotia Gorget",waist="Fotia Belt"})
    sets.precast.WS['Primal Rend'].WShighAcc = sets.precast.WS['Primal Rend'].WSMedAcc
    sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'], {neck="Fotia Gorget",
        ring2="Fenrir Ring +1",waist="Fotia Belt"})

    sets.midcast.NightEarrings = {ear1="Lugra Earring",ear2="Lugra Earring +1"}
    sets.midcast.ExtraMAB = {ear1="Hecate's Earring"}

    -- PET SIC & READY MOVES
    sets.midcast.Pet.WS = {ammo="Demonry Core",
        neck="Empath Necklace",ear1="Ruby Earring",ear2="Domesticator's Earring",
        body=Ready_Atk_body,
        hands=Ready_Atk_hands,
        ring1="Thurandaut Ring",
        ring2="Angel's Ring",
        back=Ready_Atk_back,
        waist="Hurch'lan Sash",
        legs=Ready_Atk_legs,
        feet=Ready_Atk_feet}
		--{ammo="Demonry Core",
        --neck="Empath Necklace",ear1="Ruby Earring",ear2="Domesticator's Earring",
        --body=Ready_Atk_body,
        --hands=Ready_Atk_hands,
        --ring1="Thurandaut Ring",
        --ring2="Angel's Ring",
        --back=Ready_Atk_back,
        --waist="Hurch'lan Sash",
        --legs=Ready_Atk_legs,
        --feet=Ready_Atk_feet}

    sets.midcast.Pet.MagicAtkReady = set_combine(sets.midcast.Pet.WS, {
        head=Ready_MAB_head,
        ear1="Diamond Earring",ear2="Sapphire Earring",
        body=Ready_MAB_body,
        hands=Ready_MAB_hands,
        back="Argochampsa Mantle",
        legs=Ready_MAB_legs,
        feet=Ready_MAB_feet})
        --head=Ready_MAB_head,
        --ear1="Diamond Earring",ear2="Sapphire Earring",
        --body=Ready_MAB_body,
        --hands=Ready_MAB_hands,
        --back="Argochampsa Mantle",
        --legs=Ready_MAB_legs,
        --feet=Ready_MAB_feet})

    sets.midcast.Pet.MagicAccReady = set_combine(sets.midcast.Pet.WS, {
        head=Ready_MAcc_head,
        ear1="Diamond Earring",ear2="Sapphire Earring",
        body=Ready_MAcc_body,
        hands=Ready_MAcc_hands,
        back="Argochampsa Mantle",
        legs=Ready_MAcc_legs,
        feet=Ready_MAcc_feet})
        --head=Ready_MAcc_head,
        --ear1="Diamond Earring",ear2="Sapphire Earring",
        --body=Ready_MAcc_body,
        --hands=Ready_MAcc_hands,
        --back="Argochampsa Mantle",
        --legs=Ready_MAcc_legs,
        --feet=Ready_MAcc_feet})

    sets.midcast.Pet.ReadyRecast = {legs="Desultor Tassets"}

    sets.midcast.Pet.Neutral = {head=Ready_Atk_head}
    sets.midcast.Pet.Favorable = {head="Nukumi Cabasset"}
    sets.midcast.Pet.MedAcc = set_combine(sets.midcast.Pet.WS, {ear2="Ferine Earring",
        body=Ready_Acc_body,
        legs=Ready_Acc_legs})
    sets.midcast.Pet.HighAcc = set_combine(sets.midcast.Pet.WS, {ear2="Ferine Earring",
        body=Ready_Acc_body,
        hands=Ready_Acc_hands,
        legs=Ready_Acc_legs,
        feet=Ready_Acc_feet})
    sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas"}

    -- PET-ONLY READY GEARSETS
    -- Single-wield PetOnly Sets
    sets.midcast.Pet.ReadyRecastNE = {main="Charmer's Merlin",legs="Desultor Tassets"}

    sets.midcast.Pet.ReadyNE = set_combine(sets.midcast.Pet.WS, {main="Kumbhakarna"})
    sets.midcast.Pet.ReadyNE.MedAcc = set_combine(sets.midcast.Pet.WS, {main="Kumbhakarna",
        ear2="Ferine Earring",
        body=Ready_Acc_body,
        legs=Ready_Acc_legs})
    sets.midcast.Pet.ReadyNE.HighAcc = set_combine(sets.midcast.Pet.WS, {main="Kumbhakarna",
        ear2="Ferine Earring",
        body=Ready_Acc_body,
        hands=Ready_Acc_hands,
        legs=Ready_Acc_legs,
        feet=Ready_Acc_feet})

    sets.midcast.Pet.MagicAtkReadyNE = set_combine(sets.midcast.Pet.MagicAtkReady, {main=Ready_MAB_Axe})
    sets.midcast.Pet.MagicAtkReadyNE.MedAcc = set_combine(sets.midcast.Pet.MagicAtkReady, {main=Ready_MAB_Axe,
        head=Ready_MAcc_head,
        legs=Ready_MAcc_legs,
        feet=Ready_MAcc_feet})
    sets.midcast.Pet.MagicAtkReadyNE.HighAcc = set_combine(sets.midcast.Pet.MagicAtkReady, {main=Ready_MAB_Axe,
        head=Ready_MAcc_head,
        body=Ready_MAcc_body,
        hands=Ready_MAcc_hands,
        legs=Ready_MAcc_legs,
        feet=Ready_MAcc_feet})

    sets.midcast.Pet.MagicAccReadyNE = set_combine(sets.midcast.Pet.MagicAccReady, {main="Kumbhakarna"})

    sets.DTAxeShield = {main=Pet_PDT_AxeMain,
        sub="Pallas's Shield"}

    -- Dual-wield PetOnly Sets
    sets.midcast.Pet.ReadyRecastDWNE = {main="Kumbhakarna",sub="Charmer's Merlin",legs="Desultor Tassets"}

    sets.midcast.Pet.ReadyDWNE = set_combine(sets.midcast.Pet.ReadyNE, {sub=Ready_Atk_Axe})
    sets.midcast.Pet.ReadyDWNE.MedAcc = set_combine(sets.midcast.Pet.ReadyNE.MedAcc, {sub=Ready_Acc_Axe})
    sets.midcast.Pet.ReadyDWNE.HighAcc = set_combine(sets.midcast.Pet.ReadyNE.HighAcc, {sub="Kumbhakarna"})

    sets.midcast.Pet.MagicAtkReadyDWNE = set_combine(sets.midcast.Pet.MagicAtkReadyNE, {main="Kumbhakarna",sub=Ready_MAB_Axe})
    sets.midcast.Pet.MagicAtkReadyDWNE.MedAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.MedAcc, {main="Kumbhakarna",sub=Ready_MAB_Axe})
    sets.midcast.Pet.MagicAtkReadyDWNE.HighAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.HighAcc, {main="Kumbhakarna",sub=Ready_MAcc_Axe})

    sets.midcast.Pet.MagicAccReadyDWNE = set_combine(sets.midcast.Pet.MagicAccReadyNE, {sub=Ready_MAcc_Axe})

    sets.DTAxes = {main=Pet_PDT_AxeMain,
        sub=Pet_PDT_AxeSub}

    -- RESTING
    sets.resting = {}

    -- IDLE SETS
    sets.ExtraRegen = {waist="Muscle Belt +1"}
    sets.RegenAxes = {main="Hatxiik",sub="Hunahpu"}

    sets.idle = {ammo="Paeapua",
        head="Twilight Helm",neck="Ferine Necklace",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
        body="Twilight Mail",hands="Ankusa Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Flume Belt",legs="Totemic Trousers +1",feet="Skadi's Jambeaux +1"}
		--{ammo="Demonry Core",
        --head="Twilight Helm",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Dawn Earring",
        --body="Kirin's Osode",hands="Umuthi Gloves",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        --back="Repulse Mantle",waist="Flume Belt +1",legs="Iuitl Tights +1",feet="Skadi's Jambeaux +1"}

    sets.idle.Town = {main="Skullrender",sub="Skullrender",ammo="Paeapua",
        head="Nukumi Cabasset",neck="Ferine Necklace",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
        body="Nukumi Gausape",hands="Ankusa Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Pastoralist's Mantle",waist="Hurch'lan Sash",legs="Nukumi Quijotes",feet="Ankusa Gaiters"}

	sets.idle.Regen = {ammo="Demonry Core",
        head="Twilight Helm",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Dawn Earring",
        body="Kirin's Osode",hands="Umuthi Gloves",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back="Repulse Mantle",waist="Flume Belt",legs="Iuitl Tights +1",feet="Skadi's Jambeaux +1"}
		--{ammo="Demonry Core",
        --head="Twilight Helm",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Dawn Earring",
        --body="Kirin's Osode",hands="Umuthi Gloves",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        --back="Repulse Mantle",waist="Flume Belt +1",legs="Iuitl Tights +1",feet="Skadi's Jambeaux +1"}

    sets.idle.Refresh = set_combine(sets.idle, {head="Wivre Hairpin",body="Twilight Mail",legs="Stearc Subligar"})
    sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

    sets.idle.Pet = set_combine(sets.idle,
		{ammo="Demonry Core",
        head="Despair Helm",
        neck="Ferine Necklace",ear1="Infused Earring",ear2="Dawn Earring",
        body=Pet_PDT_body,
        hands=Pet_PDT_hands,
        ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back=Pet_PDT_back,
        waist="Hurch'lan Sash",
        legs=Pet_PDT_legs,
        feet="Skadi's Jambeaux +1"})
		--neck="Empath Necklace"

    sets.idle.Pet.Engaged = 
		{ammo="Demonry Core",
        head="Despair Helm",
        neck="Ferine Necklace",ear1="Sabong Earring",ear2="Domesticator's Earring",
        body=Pet_Melee_body,
        hands=Pet_Melee_hands,
        ring1="Thurandaut Ring",ring2="Defending Ring",
        back=Pet_PDT_back,
        waist="Hurch'lan Sash",
        legs=Pet_Melee_legs,
        feet="Despair Greaves"}

    -- DEFENSE SETS
    sets.defense.PDT = {ammo="Hasty Pinion +1",
        head="Ighwa Cap",neck="Agitator's Collar",
        body="Emet Harness +1",hands="Umuthi Gloves",ring1="Patricius Ring",ring2="Defending Ring",
        back="Repulse Mantle",waist="Flume Belt",legs="Iuitl Tights +1",feet="Diamantaire Sollerets"}
		--{ammo="Hasty Pinion +1",
        --head="Ighwa Cap",neck="Agitator's Collar",
        --body="Emet Harness +1",hands="Umuthi Gloves",ring1="Patricius Ring",ring2="Defending Ring",
        --back="Repulse Mantle",waist="Flume Belt +1",legs="Iuitl Tights +1",feet="Diamantaire Sollerets"}

    sets.defense.Killer = set_combine(sets.defense.PDT, {ammo="Bibiki Seashell",head="Ankusa Helm +1",
        hands=DW_hands,
        ring1="Patricius Ring",ring2="Oneiros Annulet",
        waist="Hurch'lan Sash",
        legs=DW_legs,
        feet=DW_feet})

    sets.defense.Reraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

    sets.defense.PetPDT = {ammo="Demonry Core",
        head="Anwig Salade",neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
        body=Pet_PDT_body,
        hands=Pet_PDT_hands,
        ring1="Thurandaut Ring",ring2="Defending Ring",
        back=Pet_PDT_back,
        waist="Isa Belt",
        legs=Pet_PDT_legs,
        feet=Pet_PDT_feet}
		--{ammo="Demonry Core",
        --head="Anwig Salade",neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
        --body=Pet_PDT_body,
        --hands=Pet_PDT_hands,
        --ring1="Thurandaut Ring",ring2="Defending Ring",
        --back=Pet_PDT_back,
        --waist="Isa Belt",
        --legs=Pet_PDT_legs,
        --feet=Pet_PDT_feet}

    sets.defense.MDT = set_combine(sets.defense.PDT, {ammo="Sihirik",
        head="Iuitl Headgear +1",neck="Twilight Torque",ear1="Sanare Earring",ear2="Etiolation Earring",
        body="Savas Jawshan",
        back="Engulfer Cape +1",waist="Nierenschutz"})

    sets.defense.MDTShell = set_combine(sets.defense.MDT, {ammo="Vanir Battery",
        neck="Inquisitor Bead Necklace",ear1="Sanare Earring",
        ring1="Shadow Ring",back="Engulfer Cape +1",waist="Resolute Belt"})

    sets.Kiting = {feet="Skadi's Jambeaux +1"}

    -- MELEE (SINGLE-WIELD) SETS
    sets.engaged = {ammo="Paeapua",
        head="Despair Helm",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Totemic Jackcoat +1",hands="Ankusa Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Totemic Trousers +1",feet="Despair Greaves"}
		--{ammo="Paeapua",
        --head="Otomi Helm",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        --body="Mes'yohi Haubergeon",hands="Xaddi Gauntlets",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Bleating Mantle",waist="Windbuffet Belt +1",
        --legs=Hybrid_legs,
        --feet=Hybrid_feet}
    sets.engaged.LowAccHaste = sets.engaged
    sets.engaged.MedAcc = {ammo="Paeapua",
        head=Hybrid_head,
        neck="Ferine Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Nukumi Gausape",
        hands=DW_hands,
        ring1="Rajas Ring",ring2="Epona's Ring",
        back="Grounded Mantle +1",waist="Hurch'lan Sash",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
		--{ammo="Paeapua",
        --head=Hybrid_head,
        --neck="Ferine Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        --body="Nukumi Gausape",
        --hands=DW_hands,
        --ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Grounded Mantle +1",waist="Hurch'lan Sash",
        --legs=Hybrid_legs,
        --feet=Hybrid_feet}
    sets.engaged.MedAccHaste = sets.engaged.MedAcc
    sets.engaged.HighAcc = {ammo="Jukukik Feather",
        head=Hybrid_head,
        neck="Ferine Necklace",ear1="Steelflash Earring",ear2="Zennaroi Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Mars's Ring",ring2="Oneiros Annulet",
        back="Grounded Mantle +1",waist="Olseni Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
		--{ammo="Hasty Pinion +1",
        --head=Hybrid_head,
        --neck="Ferine Necklace",ear1="Steelflash Earring",ear2="Zennaroi Earring",
        --body="Mes'yohi Haubergeon",
        --hands=DW_hands,
        --ring1="Mars's Ring",ring2="Oneiros Annulet",
        --back="Grounded Mantle +1",waist="Olseni Belt",
        --legs=Hybrid_legs,
        --feet=Hybrid_feet}
    sets.engaged.HighAccHaste = sets.engaged.HighAcc
    sets.engaged.Aftermath = set_combine(sets.engaged, {hands="Aetosaur Gloves +1"})
    sets.engaged.LowAccHaste.Aftermath = sets.engaged.Aftermath
    sets.engaged.MedAcc.Aftermath = set_combine(sets.engaged.MedAcc, {hands="Aetosaur Gloves +1"})
    sets.engaged.MedAccHaste.Aftermath = sets.engaged.MedAcc.Aftermath
    sets.engaged.HighAcc.Aftermath = set_combine(sets.engaged.HighAcc)
    sets.engaged.HighAccHaste.Aftermath = sets.engaged.HighAcc.Aftermath

    -- MELEE (SINGLE-WIELD) HYBRID SETS
    sets.engaged.Hybrid = set_combine(sets.engaged, {head="Iuitl Headgear +1",
        back="Mollusca Mantle",hands="Umuthi Gloves",legs="Iuitl Tights +1",feet="Diamantaire Sollerets"})
    sets.engaged.LowAccHaste.Hybrid = sets.engaged.Hybrid
    sets.engaged.MedAcc.Hybrid = set_combine(sets.engaged.MedAcc, {head="Iuitl Headgear +1",
        legs="Iuitl Tights +1",feet="Diamantaire Sollerets"})
    sets.engaged.MedAccHaste.Hybrid = sets.engaged.MedAcc.Hybrid
    sets.engaged.HighAcc.Hybrid = set_combine(sets.engaged.HighAcc, {head="Iuitl Headgear +1",
        legs="Iuitl Tights +1",feet="Diamantaire Sollerets"})
    sets.engaged.HighAccHaste.Hybrid = sets.engaged.HighAcc.Hybrid

    -- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
    sets.engaged.DW = {ammo="Paeapua",
        head="Despair Helm",neck="Asperity Necklace",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
        body="Totemic Jackcoat +1",hands="Ankusa Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Patentia Sash",legs="Totemic Trousers +1",feet="Despair Greaves"}
		--{ammo="Paeapua",
        --head=DW_head,
        --neck="Asperity Necklace",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
        --body=DW_body,
        --hands=DW_hands,
        --ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Vellaunus' Mantle +1",waist="Patentia Sash",
        --legs=DW_legs,
        --feet=DW_feet}
    sets.engaged.DW.LowAccHaste = {ammo="Paeapua",
        head="Otomi Helm",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
        body=DW_body,
        hands="Xaddi Gauntlets",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Windbuffet Belt +1",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
		--{ammo="Paeapua",
        --head="Otomi Helm",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
        --body=DW_body,
        --hands="Xaddi Gauntlets",ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Bleating Mantle",waist="Windbuffet Belt +1",
        --legs=Hybrid_legs,
        --feet=Hybrid_feet}
    sets.engaged.DW.MedAcc = {ammo="Jukukik Feather",
        head=DW_head,
        neck="Ferine Necklace",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
        body=DW_body,
        hands=DW_hands,
        ring1="Rajas Ring",ring2="Epona's Ring",
        back="Vellaunus' Mantle +1",waist="Patentia Sash",
        legs=DW_legs,
        feet=DW_feet}
		--{ammo="Hasty Pinion +1",
        --head=DW_head,
        --neck="Ferine Necklace",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
        --body=DW_body,
        --hands=DW_hands,
        --ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Vellaunus' Mantle +1",waist="Patentia Sash",
        --legs=DW_legs,
        --feet=DW_feet}
    sets.engaged.DW.MedAccHaste = {ammo="Jukukik Feather",
        head=Hybrid_head,
        neck="Ferine Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Rajas Ring",ring2="Epona's Ring",
        back="Grounded Mantle +1",waist="Hurch'lan Sash",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
		--{ammo="Hasty Pinion +1",
        --head=Hybrid_head,
        --neck="Ferine Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
        --body="Mes'yohi Haubergeon",
        --hands=DW_hands,
        --ring1="Rajas Ring",ring2="Epona's Ring",
        --back="Grounded Mantle +1",waist="Hurch'lan Sash",
        --legs=Hybrid_legs,
        --feet=Hybrid_feet}
    sets.engaged.DW.HighAcc = {ammo="Jukukik Feather",
        head=Hybrid_head,
        neck="Ferine Necklace",ear1="Heartseeker Earring",ear2="Zennaroi Earring",
        body=DW_body,
        hands=DW_hands,
        ring1="Mars's Ring",ring2="Oneiros Annulet",
        back="Grounded Mantle +1",waist="Olseni Belt",
        legs=DW_legs,
        feet=DW_feet}
		--{ammo="Hasty Pinion +1",
        --head=Hybrid_head,
        --neck="Ferine Necklace",ear1="Heartseeker Earring",ear2="Zennaroi Earring",
        --body=DW_body,
        --hands=DW_hands,
        --ring1="Mars's Ring",ring2="Oneiros Annulet",
        --back="Grounded Mantle +1",waist="Olseni Belt",
        --legs=DW_legs,
        --feet=DW_feet}
    sets.engaged.DW.HighAccHaste = {ammo="Jukukik Feather",
        head=Hybrid_head,
        neck="Ferine Necklace",ear1="Heartseeker Earring",ear2="Zennaroi Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Mars's Ring",ring2="Oneiros Annulet",
        back="Grounded Mantle +1",waist="Olseni Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
		--{ammo="Hasty Pinion +1",
        --head=Hybrid_head,
        --neck="Ferine Necklace",ear1="Heartseeker Earring",ear2="Zennaroi Earring",
        --body="Mes'yohi Haubergeon",
        --hands=DW_hands,
        --ring1="Mars's Ring",ring2="Oneiros Annulet",
        --back="Grounded Mantle +1",waist="Olseni Belt",
        --legs=Hybrid_legs,
        --feet=Hybrid_feet}
    sets.engaged.DW.Aftermath = sets.engaged.DW
    sets.engaged.DW.LowAccHaste.Aftermath = sets.engaged.DW.Aftermath
    sets.engaged.DW.MedAcc.Aftermath = sets.engaged.DW.MedAcc
    sets.engaged.DW.MedAccHaste.Aftermath = sets.engaged.DW.MedAcc.Aftermath
    sets.engaged.DW.HighAcc.Aftermath = sets.engaged.DW.HighAcc
    sets.engaged.DW.HighAccHaste.Aftermath = sets.engaged.DW.HighAcc.Aftermath
    -- MELEE (DUAL-WIELD) HYBRID SETS
    sets.engaged.DW.Hybrid = set_combine(sets.engaged.DW, {head="Iuitl Headgear +1",
        back="Mollusca Mantle",hands="Umuthi Gloves",legs="Iuitl Tights +1",feet="Diamantaire Sollerets"})
    sets.engaged.DW.LowAccHaste.Hybrid = sets.engaged.DW.Hybrid
    sets.engaged.DW.MedAcc.Hybrid = set_combine(sets.engaged.DW.MedAcc, {head="Iuitl Headgear +1",
        legs="Iuitl Tights +1",feet="Diamantaire Sollerets"})
    sets.engaged.DW.MedAccHaste.Hybrid =sets.engaged.DW.MedAcc.Hybrid
    sets.engaged.DW.HighAcc.Hybrid = set_combine(sets.engaged.DW.HighAcc, {head="Iuitl Headgear +1",
        legs="Iuitl Tights +1",feet="Diamantaire Sollerets"})
    sets.engaged.DW.HighAccHaste.Hybrid = sets.engaged.DW.HighAcc.Hybrid

    -- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
    sets.engaged.PetTank = set_combine(sets.engaged, {
        head=Hybrid_head,
        neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
        body=Hybrid_body,
        hands=Hybrid_hands,
        ring1="Thurandaut Ring",
        back=Pet_PDT_back,
        waist="Isa Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet})
        --head=Hybrid_head,
        --neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
        --body=Hybrid_body,
        --hands=Hybrid_hands,
        --ring1="Thurandaut Ring",
        --back=Pet_PDT_back,
        --waist="Isa Belt",
        --legs=Hybrid_legs,
        --feet=Hybrid_feet})
    sets.engaged.PetTank.LowAccHaste = sets.engaged.PetTank
    sets.engaged.PetTank.MedAcc = sets.engaged.PetTank
    sets.engaged.PetTank.MedAccHaste = sets.engaged.PetTank
    sets.engaged.PetTank.HighAcc = sets.engaged.PetTank
    sets.engaged.PetTank.HighAccHaste = sets.engaged.PetTank

    -- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
    sets.engaged.DW.PetTank = set_combine(sets.engaged.DW, {
        head=Pet_PDT_head,
        neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
        body=Hybrid_body,
        hands=Hybrid_hands,
        ring1="Thurandaut Ring",
        back=Pet_PDT_back,
        waist="Isa Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet})
        --head=Pet_PDT_head,
        --neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
        --body=Hybrid_body,
        --hands=Hybrid_hands,
        --ring1="Thurandaut Ring",
        --back=Pet_PDT_back,
        --waist="Isa Belt",
        --legs=Hybrid_legs,
        --feet=Hybrid_feet})
    sets.engaged.DW.PetTank.LowAccHaste = sets.engaged.DW.PetTank
    sets.engaged.DW.PetTank.MedAcc = set_combine(sets.engaged.DW.MedAcc, {
        head=Hybrid_head,
        ear1="Handler's Earring",ear2="Handler's Earring +1",
        body=Hybrid_body,
        ring1="Thurandaut Ring",
        hands=Hybrid_hands,
        legs=Hybrid_legs,
        feet=Hybrid_feet})
        --head=Hybrid_head,
        --ear1="Handler's Earring",ear2="Handler's Earring +1",
        --body=Hybrid_body,
        --ring1="Thurandaut Ring",
        --hands=Hybrid_hands,
        --legs=Hybrid_legs,
        --feet=Hybrid_feet})
    sets.engaged.DW.PetTank.MedAccHaste = sets.engaged.DW.PetTank.MedAcc
    sets.engaged.DW.PetTank.HighAcc = set_combine(sets.engaged.DW.HighAcc, {
        head=Hybrid_head,
        ear1="Handler's Earring",ear2="Handler's Earring +1",
        body="Mes'yohi Haubergeon",
        hands=Hybrid_hands,
        ring1="Thurandaut Ring",
        legs=Hybrid_legs,
        feet=Hybrid_feet})
        --head=Hybrid_head,
        --ear1="Handler's Earring",ear2="Handler's Earring +1",
        --body="Mes'yohi Haubergeon",
        --hands=Hybrid_hands,
        --ring1="Thurandaut Ring",
        --legs=Hybrid_legs,
        --feet=Hybrid_feet})
    sets.engaged.DW.PetTank.HighAccHaste = sets.engaged.DW.PetTank.HighAcc

    sets.buff['Killer Instinct'] = {body="Nukumi Gausape"}
    sets.buff.Doomed = {ring1="Eshmun's Ring"}
    sets.THBelt = {waist="Chaac Belt"}
    sets.DaytimeAmmo = {ammo="Tengu-no-Hane"}

-------------------------------------------------------------------------------------------------------------------
-- Complete Lvl 76-99 Jug Pet Precast List +Funguar +Courier +Amigo
-------------------------------------------------------------------------------------------------------------------

    sets.precast.JA['Bestial Loyalty'].FunguarFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Seedbed Soil"})
    sets.precast.JA['Bestial Loyalty'].CourierCarrie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fish Oil Broth"})
    sets.precast.JA['Bestial Loyalty'].AmigoSabotender = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sun Water"})
    sets.precast.JA['Bestial Loyalty'].NurseryNazuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="D. Herbal Broth"})
    sets.precast.JA['Bestial Loyalty'].CraftyClyvonne = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cng. Brain Broth"})
    sets.precast.JA['Bestial Loyalty'].PrestoJulio = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Grass. Broth"})
    sets.precast.JA['Bestial Loyalty'].SwiftSieghard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Mlw. Bird Broth"})
    sets.precast.JA['Bestial Loyalty'].MailbusterCetas = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gob. Bug Broth"})
    sets.precast.JA['Bestial Loyalty'].AudaciousAnna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
    sets.precast.JA['Bestial Loyalty'].TurbidToloi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Auroral Broth"})
    sets.precast.JA['Bestial Loyalty'].LuckyLulush = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="L. Carrot Broth"})
    sets.precast.JA['Bestial Loyalty'].DipperYuly = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wool Grease"})
    sets.precast.JA['Bestial Loyalty'].FlowerpotMerle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vermihumus"})
    sets.precast.JA['Bestial Loyalty'].DapperMac = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Briny Broth"})
    sets.precast.JA['Bestial Loyalty'].DiscreetLouise = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepbed Soil"})
    sets.precast.JA['Bestial Loyalty'].FatsoFargann = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Plasma Broth"})
    sets.precast.JA['Bestial Loyalty'].FaithfulFalcorr = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lucky Broth"})
    sets.precast.JA['Bestial Loyalty'].BugeyedBroncha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Svg. Mole Broth"})
    sets.precast.JA['Bestial Loyalty'].BloodclawShasra = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rzr. Brain Broth"})
    sets.precast.JA['Bestial Loyalty'].GorefangHobs = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
    sets.precast.JA['Bestial Loyalty'].GooeyGerard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cl. Wheat Broth"})
    sets.precast.JA['Bestial Loyalty'].CrudeRaphie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shadowy Broth"})

-------------------------------------------------------------------------------------------------------------------
-- Complete iLvl Jug Pet Precast List
-------------------------------------------------------------------------------------------------------------------

    sets.precast.JA['Bestial Loyalty'].DroopyDortwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Swirling Broth"})
    sets.precast.JA['Bestial Loyalty'].PonderingPeter = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vis. Broth"})
    sets.precast.JA['Bestial Loyalty'].SunburstMalfik = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shimmering Broth"})
    sets.precast.JA['Bestial Loyalty'].AgedAngus = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Ferm. Broth"})
    sets.precast.JA['Bestial Loyalty'].WarlikePatrick = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Livid Broth"})
    sets.precast.JA['Bestial Loyalty'].ScissorlegXerin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spicy Broth"})
    sets.precast.JA['Bestial Loyalty'].BouncingBertha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bubbly Broth"})
    sets.precast.JA['Bestial Loyalty'].RhymingShizuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lyrical Broth"})
    sets.precast.JA['Bestial Loyalty'].AttentiveIbuki = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Salubrious Broth"})
    sets.precast.JA['Bestial Loyalty'].SwoopingZhivago = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Windy Greens"})
    sets.precast.JA['Bestial Loyalty'].AmiableRoche = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Airy Broth"})
    sets.precast.JA['Bestial Loyalty'].HeraldHenry = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Trans. Broth"})
    sets.precast.JA['Bestial Loyalty'].BrainyWaluis = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crumbly Soil"})
    sets.precast.JA['Bestial Loyalty'].HeadbreakerKen = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Blackwater Broth"})
    sets.precast.JA['Bestial Loyalty'].RedolentCandi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Electrified Broth"})
    sets.precast.JA['Bestial Loyalty'].AlluringHoney = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bug-Ridden Broth"})
    sets.precast.JA['Bestial Loyalty'].CaringKiyomaro = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fizzy Broth"})
    sets.precast.JA['Bestial Loyalty'].VivaciousVickie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Tant. Broth"})
    sets.precast.JA['Bestial Loyalty'].HurlerPercival = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pale Sap"})
    sets.precast.JA['Bestial Loyalty'].BlackbeardRandy = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Meaty Broth"})
    sets.precast.JA['Bestial Loyalty'].GenerousArthur = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Dire Broth"})
    sets.precast.JA['Bestial Loyalty'].ThreestarLynn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Muddy Broth"})
    sets.precast.JA['Bestial Loyalty'].BraveHeroGlenn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wispy Broth"})
    sets.precast.JA['Bestial Loyalty'].SharpwitHermes = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Saline Broth"})
    sets.precast.JA['Bestial Loyalty'].ColibriFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sugary Broth"})
    sets.precast.JA['Bestial Loyalty'].ChoralLeera = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Glazed Broth"})
    sets.precast.JA['Bestial Loyalty'].SpiderFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sticky Webbing"})
    sets.precast.JA['Bestial Loyalty'].GussyHachirobe = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Slimy Webbing"})
    sets.precast.JA['Bestial Loyalty'].AcuexFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Poisonous Broth"})
    sets.precast.JA['Bestial Loyalty'].FluffyBredo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Venomous Broth"})
    sets.precast.JA['Bestial Loyalty'].SuspiciousAlice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Furious Broth"})
    sets.precast.JA['Bestial Loyalty'].AnklebiterJedd = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crackling Broth"})
    sets.precast.JA['Bestial Loyalty'].FleetReinhard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rapid Broth"})
    sets.precast.JA['Bestial Loyalty'].CursedAnnabelle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Creepy Broth"})
    sets.precast.JA['Bestial Loyalty'].SurgingStorm = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Insipid Broth"})
    sets.precast.JA['Bestial Loyalty'].SubmergedIyo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepwater Broth"})
    sets.precast.JA['Bestial Loyalty'].MosquitoFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wetlands Broth"})
    sets.precast.JA['Bestial Loyalty'].LeftHandedYoko = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Heavenly Broth"})
end

function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 9)
    elseif player.sub_job == 'WHM' then
        set_macro_page(3, 9)
    else
        set_macro_page(10, 9)
    end
end