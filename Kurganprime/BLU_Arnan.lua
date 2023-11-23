
		-----------------------------------------------
		-- *** Arnan Blue Mage Gearswap Lua File *** --
		-----------------------------------------------
		
			-- Things to do --
			
				-- Add Lunge to MB toggle and find a way to incorporate obi
				-- Add Vagary spells
				
			-- Commands --
				
				-- In Game: //gs c, Macro: /console gs c, Bind: gs c --
			
				-- gs c acc			Toggle accuracy tier for TP/WS
				-- gs c dw			Toggle Dual Wield tiers
				-- gs c idle		Toggle idle sets
				
				-- gs c pdt			PDT on/off
				-- gs c mdt			MDT on/off
				-- gs c kiting		Kiting on/off
				-- gs c hybrid		Hybrid on/off
				
				-- gs c th			Treasure Hunter TP gear on/off
				-- gs c thaumas		Thaumas Coat on/off
				-- gs c mb			Magic Burst on/off

				
		----------
		-- Sets --
		----------

function global_on_load()
--	send_command('bind !f9 gs c cycle RangedMode')
	send_command('bind @f9 gs c dw')
	send_command('bind f10 gs c pdt')
	send_command('bind ^f10 gs c hybrid')
	send_command('bind !f10 gs c kiting')
	send_command('bind f11 gs c mdt')
--	send_command('bind ^f11 gs c cycle CastingMode')
--	send_command('bind f12 gs c update user')
--	send_command('bind ^f12 gs c cycle IdleMode')
--	send_command('bind !f12 gs c reset DefenseMode')

--	send_command('bind ^- gs c toggle selectnpctargets')
	send_command('bind ^= gs c th')
end
		
function get_sets()
        AccIndex = 1
        AccArray = {"LowACC","MidACC","HighACC","MaxACC"} -- 4 Levels Of Accuracy Sets For TP/WS. Default ACC Set Is LowACC (1) --
        WeaponIndex = 3
		WeaponArray = {"Single","DW3","DW4"} -- Amount of Dual Wield used for TP. Default is DW4 (3) --
        IdleIndex = 1
        IdleArray = {"Full","DT"} -- Default Idle Set Is Full (1) --
        Armor = 'None'
        target_distance = 6 -- Set Default Distance Here --
		Thaumas = 'OFF' -- Set Default Thaumas Coat ON or OFF Here --
		TH = 'OFF' -- Set Default TH ON or OFF Here --
		MB = 'OFF' -- Set Default Magic Burst ON or OFF Here --
        Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
        Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
        send_command('input /macro book 16;wait .1;input /macro set 1') -- Change Default Macro Book Here --
		add_to_chat(158,'-[Blue Mage Lua Loaded]-')
		add_to_chat(155,'Dual Wield: '..WeaponArray[WeaponIndex])
		add_to_chat(155,'Accuracy Level: ' .. AccArray[AccIndex])
		add_to_chat(155,'Idle Set: ' .. IdleArray[IdleIndex])

		-- Key Binds --
		send_command('bind Delete input /ws "Chant du Cygne" <t>')
		send_command('bind ` input /ma "Sudden Lunge" <t>')
		send_command('bind f9 gs c acc')
		send_command('bind ^f9 gs c hybrid')
		send_command('bind @f9 gs c dw')
		send_command('bind f10 gs c pdt')
		send_command('bind ^f10 gs c hybrid')
		send_command('bind !f10 gs c kiting')
		send_command('bind f11 gs c mdt')
		send_command('bind ^= gs c th')
		function file_unload()
			send_command('unbind Delete')
            send_command('unbind `')
			send_command('unbind f9')
			send_command('unbind ^f9')
			send_command('unbind @f9')
			send_command('unbind f10')
			send_command('unbind ^f10')
			send_command('unbind !f10')
			send_command('unbind f11')
			send_command('unbind ^=')
			end
		
		-- Town/City Areas --
		Cities = S{
                        "Ru'lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
                        "Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
                        "Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
                        "Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
                        "Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold",
                        "Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Tavnazia"}
					
		-- Physical Blue Magic --
        PhysicalBlueMagic = S{
                        'Asuran Claws','Bludgeon','Body Slam','Feather Storm','Mandibular Bite','Queasyshroom',
                        'Power Attack','Ram Charge','Saurian Slide','Screwdriver','Sickle Slash','Smite of Rage',
                        'Spinal Cleave','Spiral Spin','Sweeping Gouge','Terror Touch'}
 
		-- STR Physical Blue Magic --
        PhysicalBlueMagic_STR = S{
                        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash',
                        'Quadrastrike','Uppercut','Tourbillion','Thrashing Assault','Vertical Cleave',
                        'Whirl of Rage'}
 
		-- DEX Physical Blue Magic --
        PhysicalBlueMagic_DEX = S{
                        'Amorphic Spikes','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick',
                        'Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Seedspray',
                        'Sinker Drill','Vanity Dive'}
 
		-- VIT Physical Blue Magic --
        PhysicalBlueMagic_VIT = S{
                        'Cannonball','Delta Thrust','Glutinous Dart','Grand Slam','Quad. Continuum',
                        'Sprout Smack'}
 
		-- AGI Physical Blue Magic --
        PhysicalBlueMagic_AGI = S{
                        'Benthic Typhoon','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb','Wild Oats'}
			
        -- Physical Accuracy Blue Magic --			
		BlueMagic_PhysicalACC = S{
						'Heavy Strike'}
		
		-- Magical Blue Magic -- 
        MagicalBlueMagic = S{
                        'Acrid Stream','Anvil Lightning','Crashing Thunder','Charged Whisker','Droning Whirlwind','Firespit',
						'Foul Waters','Gates of Hades','Leafstorm','Molting Plumage','Nectarous Deluge','Polar Roar',
						'Regurgitation','Rending Deluge','Scouring Spate','Searing Tempest','Silent Storm','Spectral Floe',
						'Subduction','Tem. Upheaval','Thermal Pulse','Thunderbolt','Uproot','Water Bomb'}
			
		-- Dark Magical Blue Magic -- 			
		BlueMagic_Dark = S{
						'Atra. Libations','Blood Saber','Dark Orb','Death Ray','Eyes On Me',
						'Evryone. Grudge','Palling Salvo','Tenebral Crush'}
		
		-- Light Magical Blue Magic -- 
		BlueMagic_Light = S{
						'Blinding Fulgor','Diffusion Ray','Magic Hammer','Rail Cannon','Retinal Glare'}
		
		-- Earth Magical Blue Magic -- 
		BlueMagic_Earth = S{
						'Embalming Earth','Entomb','Sandspin'}
 
		-- Magic Accuracy Blue Magic --
        BlueMagic_Accuracy = S{
                        '1000 Needles','Absolute Terror','Auroral Drape','Awful Eye','Blank Gaze','Blistering Roar',
						'Blood Drain','Blood Saber','Chaotic Eye','Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze',
						'Demoralizing Roar','Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
                        'Geist Wall','Hecatomb Wave','Infrasonics','Light of Penance','Lowing','Mind Blast','Mortal Ray',
						'MP Drainkiss','Osmosis','Reaving Wind','Sheep Song','Soporific','Sound Blast','Stinking Gas',
						'Sub-zero Smash','Triumphant Roar','Venom Shell','Voracious Trunk','Yawn'}
 
		-- Breath Blue Magic --
        BlueMagic_Breath = S{
                        'Bad Breath','Flying Hip Press','Final Sting','Frost Breath','Heat Breath','Magnetite Cloud',
						'Poison Breath','Radiant Breath','Self Destruct','Thunder Breath','Wind Breath'}
 
        -- Blue Magic Buffs --
		BlueMagic_Buff = S{
                        'Carcharian Verve','Diamondhide','Metallic Body','Magic Barrier',"Occultation",
                        'Orcish Counterstance','Plasma Charge','Pyric Bulwark','Reactor Cool'}
                            
		-- Blue Magic Healing --					
        BlueMagic_Healing = S{
                        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','Wild Carrot'}
						
		-- HP Cure Blue Magic --				
		BlueMagic_HPCure = S{
						'White Wind'}

		-- Refresh Blue Magic --				
		BlueMagic_Refresh = S{
						'Battery Charge'}
 
		-- Blue Magic Stun --
        BlueMagic_Stun = S{
						'Blitzstrahl','Temporal Shift'}
		
		-- Blue Magic Physical Stun --
		BlueMagic_PhysicalStun = S{
						'Frypan','Head Butt','Sudden Lunge','Tail slap','Whirl of Rage'}		
		
		-- Blue Magic Enmity --
		BlueMagic_Emnity = S{
						'Actinic Burst','Exuviation','Fantod','Jettatura'}		
 
		-- Diffusion --
        BlueMagic_Diffusion = S{
                        'Amplification','Cocoon','Exuviation','Feather Barrier','Harden Shell','Memento Mori','Metallic Body',
                        'Mighty Guard','Plasma Charge','Reactor Cool','Refueling','Saline Coat','Warm-Up','Zephyr Mantle'}
 
		-- Unbridled --
        BlueMagic_Unbridled = S{
                        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
                        'Droning Whirlwind','Gates of Hades','Harden Shell','Mighty Guard','Pyric Bulwark',
                        'Thunderbolt','Tourbillion'}
		
		-- Herculean Helm Augments --
		HerculeanHelm={}
		HerculeanHelm.MAB={ name="Herculean Helm", augments={'Mag. Acc.+6 "Mag.Atk.Bns."+6','Magic burst mdg.+5%','INT+8','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
		
		-- Herculean Vest Augments --
		HerculeanVest={}	
		HerculeanVest.WSD={ name="Herculean Vest", augments={'Accuracy+27','Weapon skill damage +4%','Attack+1',}}
		HerculeanVest.DT={ name="Herculean Vest", augments={'Attack+24','Phys. dmg. taken -5%','Accuracy+10',}}
		
		-- Herculean Gloves Augments --
		HerculeanGloves={}
		HerculeanGloves.WSD={ name="Herculean Gloves", augments={'Attack+2','STR+4','Weapon skill damage +4%','Accuracy+15 Attack+15',}}
		HerculeanGloves.DT={ name="Herculean Gloves", augments={'Damage taken-3%','DEX+8','Accuracy+11','Attack+10',}}
		HerculeanGloves.TH={ name="Herculean Gloves", augments={'Mag. Acc.+6','Accuracy+8','"Treasure Hunter"+1','Accuracy+13 Attack+13',}}
		HerculeanGloves.RF={ name="Herculean Gloves", augments={'Magic dmg. taken -1%','Enmity-2','"Refresh"+1','Accuracy+11 Attack+11',}}
		
		-- Herculean Trousers Augments --
		HerculeanTrousers={}	
		HerculeanTrousers.WSD={ name="Herculean Trousers", augments={'Accuracy+1','Weapon skill damage +4%','STR+9','Attack+9',}}
		
		-- Herculean Boots Augments --
		HerculeanBoots={}
        HerculeanBoots.DW={ name="Herculean Boots", augments={'Accuracy+24 Attack+24','"Dual Wield"+5','AGI+8','Accuracy+9','Attack+3',}}
        HerculeanBoots.TA={ name="Herculean Boots", augments={'Accuracy+27','"Triple Atk."+4','DEX+7','Attack+13',}}
		HerculeanBoots.WSD={ name="Herculean Boots", augments={'Accuracy+18 Attack+18','Weapon skill damage +5%','STR+9','Attack+10',}}
		HerculeanBoots.DT={ name="Herculean Boots", augments={'Accuracy+12','Phys. dmg. taken -5%','Attack+5',}}
			
		--------------------
        -- Idle/Town Sets --
		--------------------
        sets.Idle = {
                        ammo="Ginsen",
                        head="Adehmar Bonnet",
                        neck="Sanctity Necklace",
                        ear1="Ethereal Earring",
                        ear2="Etiolation Earring",
                        body="Luhlaza Jubbah +1",
						hands="Adhemar Wristbands",
                        ring1="Defending Ring",
                        ring2="Paguroidea Ring",
                        back="Lupine Cape",
                        waist="Flume Belt",
                        legs="Crimson Cuisses",
						feet="Rawhide Boots"}
        sets.Idle.Full = set_combine(sets.Idle,{})
        sets.Idle.DT = set_combine(sets.Idle,{
						neck="Twilight Torque",
						ear2="Genmei Earring",
						ring2="Patricius Ring"})
		sets.Idle.Town = set_combine(sets.Idle,{})
 
		-------------
		-- TP Sets --
		-------------
         sets.TP = {
                        ammo="Ginsen",
                        head="Adhemar Bonnet",
                        neck="Asperity Necklace",
                        ear1="Brutal Earring",
                        ear2="Suppanomimi",
                        body="Luhlaza Jubbah +1",
                        hands="Adhemar Wristbands",
                        ring1="Rajas Ring",
                        ring2="Epona's Ring",
                        back="Bleating Mantle",
                        waist="Windbuffet Belt +1",
                        legs="Samnuha Tights",
                        feet="Rawhide Boots"}
        sets.TP.MidACC = set_combine(sets.TP,{
                        head="Dampening Tam",
						neck="Sanctity Necklace",
                        back="Lupine Cape"})
        sets.TP.HighACC = set_combine(sets.TP.MidACC,{
                        ammo="Falcon Eye",
						neck="Ej Necklace",
                        back="Ground. Mantle +1"})
		sets.TP.MaxACC = set_combine(sets.TP.HighACC,{
                        head="Carmine Mask",
                        ring1="Ramuh Ring +1",
                        ring2="Ramuh Ring +1",
						waist="Hurch'lan Sash",
                        legs="Carmine Cuisses"})

		---------------------------
        -- Single Weapon TP Sets --
		---------------------------
        sets.TP.Single = set_combine(sets.TP,{
                        ear1="Cessance Earring",
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
                        feet="Rawhide Boots"})
        sets.TP.Single.MidACC = set_combine(sets.TP.MidACC,{
                        ear1="Cessance Earring",
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
                        feet="Rawhide Boots"})
        sets.TP.Single.HighACC = set_combine(sets.TP.HighACC,{
                        ear1="Cessance Earring",
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
                        feet="Rawhide Boots"})
		sets.TP.Single.MaxACC = set_combine(sets.TP.MaxACC,{
                        ear1="Cessance Earring",
                        ear2="Zennaroi Earring",
                        waist="Olseni Belt",
                        feet="Rawhide Boots"})

        -- Single Weapon Capped Magic Haste Sets --
        sets.TP.Single.HighHaste = set_combine(sets.TP.Single,{})
        sets.TP.Single.MidACC.HighHaste = set_combine(sets.TP.Single.MidACC,{})
        sets.TP.Single.HighACC.HighHaste = set_combine(sets.TP.Single.HighACC,{})
		sets.TP.Single.MaxACC.HighHaste = set_combine(sets.TP.Single.MaxACC,{})
 
		-- Single Weapon Mythic AM3 Sets --
        sets.TP.Single.AM3 = set_combine(sets.TP.Single,{})
        sets.TP.Single.MidACC.AM3 = set_combine(sets.TP.Single.MidACC,{})
        sets.TP.Single.HighACC.AM3 = set_combine(sets.TP.Single.HighACC,{})
		sets.TP.Single.MaxACC.AM3 = set_combine(sets.TP.Single.MaxACC,{})
		
        -- Single Weapon Mythic AM3 Capped Magic Haste Sets --
        sets.TP.Single.HighHaste.AM3 = set_combine(sets.TP.Single,{})
        sets.TP.Single.MidACC.HighHaste.AM3 = set_combine(sets.TP.Single.MidACC,{})
        sets.TP.Single.HighACC.HighHaste.AM3 = set_combine(sets.TP.Single.HighACC,{})
		sets.TP.Single.MaxACC.HighHaste.AM3 = set_combine(sets.TP.Single.MaxACC,{})
 
		----------------------------
        -- Dual Wield III TP Sets --
		----------------------------
		sets.TP.DW3 = set_combine(sets.TP,{})
        sets.TP.DW3.MidACC = set_combine(sets.TP.MidACC,{})
        sets.TP.DW3.HighACC = set_combine(sets.TP.HighACC,{})
		sets.TP.DW3.MaxACC = set_combine(sets.TP.MaxACC,{
                        ear2="Zennaroi Earring"})
 
        -- Dual Wield III Capped Magic Haste Sets --
        sets.TP.DW3.HighHaste =  set_combine(sets.TP,{
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
        sets.TP.DW3.MidACC.HighHaste =  set_combine(sets.TP.MidACC,{
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
        sets.TP.DW3.HighACC.HighHaste =  set_combine(sets.TP.HighACC,{
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
		sets.TP.DW3.MaxACC.HighHaste =  set_combine(sets.TP.MaxACC,{
                        ear2="Zennaroi Earring",
                        waist="Olseni Belt",
						feet="Rawhide Boots"})
                        	
		-- Dual Wield III Mythic AM3 Sets --
        sets.TP.DW3.AM3 = set_combine(sets.TP,{
						back="Lupine Cape"})
        sets.TP.DW3.MidACC.AM3 = set_combine(sets.TP.MidACC,{})
        sets.TP.DW3.HighACC.AM3 = set_combine(sets.TP.HighACC,{})
		sets.TP.DW3.MaxACC.AM3 = set_combine(sets.TP.MaxACC,{
                        ear2="Zennaroi Earring"})
 
        -- Dual Wield III Mythic AM3 Capped Magic Haste Sets --
        sets.TP.DW3.HighHaste.AM3 =  set_combine(sets.TP,{
                        ear2="Dedition Earring",
						back="Lupine Cape",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
        sets.TP.DW3.MidACC.HighHaste.AM3 = set_combine(sets.TP.MidACC,{
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
        sets.TP.DW3.HighACC.HighHaste.AM3 = set_combine(sets.TP.HighACC,{
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
		sets.TP.DW3.MaxACC.HighHaste.AM3 = set_combine(sets.TP.MaxACC,{
                        ear2="Zennaroi Earring",
                        waist="Olseni Belt",
						feet="Rawhide Boots"})
								
		---------------------------
        -- Dual Wield IV TP Sets --
		---------------------------
        sets.TP.DW4 = set_combine(sets.TP,{
						ear2="Brutal Earring"})
        sets.TP.DW4.MidACC = set_combine(sets.TP.MidACC,{
						ear2="Brutal Earring"})
        sets.TP.DW4.HighACC = set_combine(sets.TP.HighACC,{
						ear2="Brutal Earring"})
		sets.TP.DW4.MaxACC = set_combine(sets.TP.MaxACC,{
                        ear2="Zennaroi Earring"})
 
        -- Dual Wield IV Capped Magic Haste Sets --
        sets.TP.DW4.HighHaste =  set_combine(sets.TP,{
                        ear1="Cessance Earring",
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
        sets.TP.DW4.MidACC.HighHaste =  set_combine(sets.TP.MidACC,{
                        ear1="Cessance Earring",
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
        sets.TP.DW4.HighACC.HighHaste =  set_combine(sets.TP.HighACC,{
                        ear1="Cessance Earring",
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
		sets.TP.DW4.MaxACC.HighHaste =  set_combine(sets.TP.MaxACC,{
                        ear1="Cessance Earring",
                        ear2="Zennaroi Earring",
                        waist="Olseni Belt",
						feet="Rawhide Boots"})

		-- Dual Wield IV Mythic AM3 Sets --
        sets.TP.DW4.AM3 = set_combine(sets.TP,{
						ear2="Dedition Earring",
						back="Lupine Cape"})
        sets.TP.DW4.MidACC.AM3 = set_combine(sets.TP.MidACC,{
						ear2="Brutal Earring"})
        sets.TP.DW4.HighACC.AM3 = set_combine(sets.TP.HighACC,{
						ear2="Brutal Earring"})
		sets.TP.DW4.MaxACC.AM3 = set_combine(sets.TP.MaxACC,{
                        ear2="Zennaroi Earring"})
 
        -- Dual Wield IV Mythic AM3 Capped Magic Haste Sets --
        sets.TP.DW4.HighHaste.AM3 =  set_combine(sets.TP,{
                        ear1="Cessance Earring",
                        ear2="Dedition Earring",
						back="Lupine Cape",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
        sets.TP.DW4.MidACC.HighHaste.AM3 = set_combine(sets.TP.MidACC,{
                        ear1="Cessance Earring",
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
        sets.TP.DW4.HighACC.HighHaste.AM3 = set_combine(sets.TP.HighACC,{
                        ear1="Cessance Earring",
                        ear2="Brutal Earring",
                        waist="Windbuffet Belt +1",
						feet="Rawhide Boots"})
		sets.TP.DW4.MaxACC.HighHaste.AM3 = set_combine(sets.TP.MaxACC,{
                        ear1="Cessance Earring",
                        ear2="Zennaroi Earring",
                        waist="Olseni Belt",
						feet="Rawhide Boots"})
						
		-- TP Thaumas Coat --
		sets.TP.Thaumas = {body="Thaumas Coat"}
		
		-- TP Treasure Hunter --
		sets.TP.TH = {hands=HerculeanGloves.TH,waist="Chaac Belt"}
 
		-----------------------
		-- Damage Taken Sets --
		-----------------------
		
        -- PDT Set --
        sets.PDT = {
                        ammo="Iron Gobbet",
                        head="Lithelimb Cap",
                        neck="Loricate Torque +1",
                        ear1="Ethereal Earring",
                        ear2="Eabani Earring",
                        body="Emet Harness +1",
                        hands=HerculeanGloves.DT,
                        ring1="Defending Ring",
                        ring2="Gelatinous Ring +1",
                        back="Xucau Mantle",
                        waist="Flume Belt +1",
                        legs="Iuitl Tights +1",
                        feet=HerculeanBoots.DT}
 
		-- MDT Set --
        sets.MDT = set_combine(sets.PDT,{
						ammo="Vanir Battery",
						head="Dampening Tam",
						ear1="Sanare Earring",
						ear2="Etiolation Earring",
						Ring2="Shadow Ring",
						back="Engulfer Cape +1"})
 
        -- Hybrid Sets --
        sets.TP.Hybrid = set_combine(sets.PDT,{
						ammo="Ginsen",
						ear1="Suppanomimi",
						ear2="Brutal Earring",
						waist="Shetal Stone",
						legs="Samnuha Tights"})
        sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
						ammo="Falcon Eye",
						ear2="Zennaroi Earring"})
        sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
						hands=HerculeanGloves.DT,
						back="Ground. Mantle +1"})
		sets.TP.Hybrid.MaxACC = set_combine(sets.TP.Hybrid.HighACC,{
						neck="Combatant's Torque",
						waist="Olseni Belt"})
						
        -- Hybrid High Haste Sets --
        sets.TP.Hybrid.HighHaste = set_combine(sets.PDT,{
						ammo="Ginsen",
						ear1="Suppanomimi",
						ear2="Brutal Earring",
						waist="Windbuffet Belt +1",
						legs="Samnuha Tights"})
        sets.TP.Hybrid.MidACC.HighHaste = set_combine(sets.TP.Hybrid.HighHaste,{
						ammo="Falcon Eye",
						ear2="Zennaroi Earring"})
        sets.TP.Hybrid.HighACC.HighHaste = set_combine(sets.TP.Hybrid.MidACC.HighHaste,{
						hands=HerculeanGloves.DT,
						back="Ground. Mantle +1"})
		sets.TP.Hybrid.MaxACC.HighHaste = set_combine(sets.TP.Hybrid.HighACC.HighHaste,{
						neck="Combatant's Torque",
						waist="Olseni Belt"})

		-- Kiting Set --
		sets.Kiting =  set_combine(sets.PDT,{
						ear2="Genmei Earring",
						body="Vrikodara Jupon",
						legs="Carmine Cuisses +1",
						feet="Hippo. Socks +1"})
 
		-----------------------
		-- Weapon Skill Sets --
		-----------------------
 
        -- WS Base Sets --
        sets.WS = {
                        ammo="Floestone",
                        head="Adhemar Bonnet +1",
                        neck="Light Gorget",
                        ear1="Moonshade Earring",
                        ear2="Brutal Earring",
                        body="Adhemar Jacket +1",
                        hands="Adhemar Wristbands",
                        ring1="Shukuyu Ring",
                        ring2="Epona's Ring",
                        back="Bleating Mantle",
                        waist="Light Belt",
                        legs="Samnuha Tights",
                        feet="Rawhide Boots"}
		sets.WS.MidACC = set_combine(sets.WS,{
                        ammo="Falcon Eye",
                        head="Dampening Tam"})
		sets.WS.HighACC = set_combine(sets.WS.MidACC,{
                        ear2="Zennaroi Earring",
						back="Letalis Mantle"})
		sets.WS.MaxACC = set_combine(sets.WS.HighACC,{
                        head="Carmine Mask",
                        ring1="Ramuh Ring +1",
                        ring2="Ramuh Ring +1",
                        back="Ground. Mantle +1",
                        legs="Carmine Cuisses +1"})

		-- One-Hit Sets --
        sets.WS.OneHit = set_combine(sets.WS,{
                        head="Lilitu Headpiece",
						neck="Caro Necklace",
						ear2="Ishvara Earring",
						body=HerculeanVest.WSD,
						hands=HerculeanGloves.WSD,
						ring2="Ifrit Ring +1",
						waist="Grunfeld Rope",
						legs=HerculeanTrousers.WSD,
						feet=HerculeanBoots.WSD})
        sets.WS.OneHit.MidACC = set_combine(sets.WS.MidACC,{
                        head="Lilitu Headpiece",
						neck="Caro Necklace",
						ear2="Ishvara Earring",
						body=HerculeanVest.WSD,
						hands=HerculeanGloves.WSD,
						ring2="Ifrit Ring +1",
						waist="Grunfeld Rope",
						legs=HerculeanTrousers.WSD,
						feet=HerculeanBoots.WSD})
        sets.WS.OneHit.HighACC = set_combine(sets.WS.HighACC,{
						neck="Combatant's Torque",
						ear2="Ishvara Earring",
						body=HerculeanVest.WSD,
						hands=HerculeanGloves.WSD,
						ring2="Ifrit Ring +1",
						waist="Grunfeld Rope",
						legs=HerculeanTrousers.WSD,
						feet=HerculeanBoots.WSD})
		sets.WS.OneHit.MaxACC = set_combine(sets.WS.MaxACC,{
						neck="Combatant's Torque",
						waist="Olseni Belt"})
						
		-- Magic WS Base Set --
		sets.WS.MABWS = {
                        ammo="Pemphredo Tathlum",
                        head=HerculeanHelm.MAB,
                        neck="Sanctity Necklace",
                        ear1="Friomisi Earring",
						ear2="Crematio Earring",
                        body="Amalric Doublet +1",
                        hands="Amalric Gages",
						ring1="Shiva Ring +1",
                        ring2="Shiva Ring +1",
                        back="Cornflower Cape",
                        waist="Eschan Stone",
                        legs="Hagondes Pants +1",
                        feet="Amalric nails +1"}
		
		-----------------------------
		-- Sword Weapon Skill Sets --
		-----------------------------
 
        -- Chant du Cygne Sets -- 
        sets.WS["Chant du Cygne"] = set_combine(sets.WS,{
						ammo="Jukukik Feather",
                        ring1="Hetairoi Ring",
                        back="Rancorous Mantle",
						feet="Thereoid Greaves"})
        sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS.MidACC,{
						ammo="Jukukik Feather",
						head="Adhemar Bonnet +1",
                        ring1="Ramuh Ring +1",
                        back="Rancorous Mantle",
						feet="Thereoid Greaves"})
        sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS.HighACC,{
                        ring1="Ramuh Ring +1",
                        back="Rancorous Mantle"})
        sets.WS["Chant du Cygne"].MaxACC = set_combine(sets.WS.MaxACC,{})
 
		-- Requiescat Sets --
        sets.WS.Requiescat = set_combine(sets.WS,{
                        ammo="Hydrocera",
                        head="Lilitu Headpiece",
                        ring1="Rufescent Ring"})
        sets.WS.Requiescat.MidACC = set_combine(sets.WS.MidACC,{
                        ammo="Hydrocera",
						ring1="Rufescent Ring"})
        sets.WS.Requiescat.HighACC = set_combine(sets.WS.HighACC,{
						ring1="Rufescent Ring"})
        sets.WS.Requiescat.MaxACC = set_combine(sets.WS.MaxACC,{})
 
        -- Vorpal Blade Sets --
        sets.WS["Vorpal Blade"] = set_combine(sets.WS,{
						ring1="Hetairoi Ring",
                        back="Rancorous Mantle",
						feet="Thereoid Greaves"})
        sets.WS["Vorpal Blade"].MidACC = set_combine(sets.WS.MidACC,{
						head="Adhemar Bonnet +1",
                        back="Rancorous Mantle",
						feet="Thereoid Greaves"})
        sets.WS["Vorpal Blade"].HighACC = set_combine(sets.WS.HighACC,{
                        back="Rancorous Mantle"})
        sets.WS["Vorpal Blade"].MaxACC = set_combine(sets.WS.MaxACC,{})
 
		-- Expiacion Sets --
        sets.WS.Expiacion = set_combine(sets.WS.OneHit,{})
        sets.WS.Expiacion.MidACC = set_combine(sets.WS.MidACC.OneHit,{})
        sets.WS.Expiacion.HighACC = set_combine(sets.WS.HighACC.OneHit,{})
		sets.WS.Expiacion.MaxACC = set_combine(sets.WS.MaxACC.OneHit,{})
		
		-- Savage Blade Set --
		sets.WS["Savage Blade"] = set_combine(sets.WS.OneHit,{})
        sets.WS["Savage Blade"].MidACC = set_combine(sets.WS.OneHit.MidACC,{})
        sets.WS["Savage Blade"].HighACC = set_combine(sets.WS.OneHit.HighACC,{})
        sets.WS["Savage Blade"].MaxACC = set_combine(sets.WS.OneHit.MaxACC,{})
		
        -- Circle Blade Sets --
        sets.WS["Circle Blade"] = set_combine(sets.WS.OneHit,{})
        sets.WS["Circle Blade"].MidACC = set_combine(sets.WS.OneHit.MidACC,{})
        sets.WS["Circle Blade"].HighACC = set_combine(sets.WS.OneHit.HighACC,{})
        sets.WS["Circle Blade"].MaxACC = set_combine(sets.WS.OneHit.MaxACC,{})		
		
		-- Sanguine Blade Set --
		sets.WS["Sanguine Blade"] = set_combine(sets.WS.MABWS,{
                        head="Pixie Hairpin +1",
                        ring1="Archon Ring"})
        sets.WS["Sanguine Blade"].MidACC = set_combine(sets.WS.MABWS,{
                        head="Pixie Hairpin +1",
                        ring1="Archon Ring"})
        sets.WS["Sanguine Blade"].HighACC = set_combine(sets.WS.MABWS,{
                        head="Pixie Hairpin +1",
                        ring1="Archon Ring"})
        sets.WS["Sanguine Blade"].MaxACC = set_combine(sets.WS.MABWS,{
                        head="Pixie Hairpin +1",
                        ring1="Archon Ring"})
		
		----------------------------
		-- Club Weapon Skill Sets --
		----------------------------
		
		-- Realmrazer Sets --
		sets.WS.Realmrazer = set_combine(sets.WS,{
                        ammo="Hydrocera",
                        head="Lilitu Headpiece",
						ear2="Lifestorm Earring",
                        ring1="Rufescent Ring",
						ring2="Levia. Ring"})
        sets.WS.Realmrazer.MidACC = set_combine(sets.WS.MidACC,{
                        ammo="Hydrocera",
						ear2="Lifestorm Earring",
                        ring1="Rufescent Ring",
						ring2="Levia. Ring"})
        sets.WS.Realmrazer.HighACC = set_combine(sets.WS.HighACC,{
						ear2="Lifestorm Earring",
                        ring1="Rufescent Ring",
						ring2="Levia. Ring"})
        sets.WS.Realmrazer.MaxACC = set_combine(sets.WS.MaxACC,{
                        ring1="Rufescent Ring",})

		-- Black Halo Sets --
        sets.WS["Black Halo"] = set_combine(sets.WS,{
                        ammo="Hydrocera",
                        head="Dampening Tam",
                        ring1="Rufescent Ring"})
        sets.WS["Black Halo"].MidACC = set_combine(sets.WS.MidACC,{
                        ammo="Hydrocera",
						ring1="Rufescent Ring"})
        sets.WS["Black Halo"].HighACC = set_combine(sets.WS.HighACC,{
						ring1="Rufescent Ring"})
        sets.WS["Black Halo"].MaxACC = set_combine(sets.WS.MaxACC,{})
		
		-- True Strike Sets --
        sets.WS["True Strike"] = set_combine(sets.WS.OneHit,{
						head="Adhemar Bonnet +1",
						body="Abnoba Kaftan",
						feet="Thereoid Greaves"})
        sets.WS["True Strike"].MidACC = set_combine(sets.WS.OneHit.MidACC,{
						head="Adhemar Bonnet +1",
						body="Abnoba Kaftan",
						feet="Thereoid Greaves"})
        sets.WS["True Strike"].HighACC = set_combine(sets.WS.OneHit.HighACC,{
						head="Adhemar Bonnet +1",
						body="Abnoba Kaftan",
						feet="Thereoid Greaves"})
        sets.WS["True Strike"].MaxACC = set_combine(sets.WS.OneHit.MaxACC,{})
		
		-- Judgment Sets --
        sets.WS.Judgment = set_combine(sets.WS.OneHit,{})
        sets.WS.Judgment.MidACC = set_combine(sets.WS.OneHit.MidACC,{})
        sets.WS.Judgment.HighACC = set_combine(sets.WS.OneHit.HighACC,{})
		sets.WS.Judgment.MaxACC = set_combine(sets.WS.OneHit.MaxACC,{})
		
		-- Flash Nova Set --
		sets.WS["Flash Nova"] = set_combine(sets.WS.MABWS,{})
        sets.WS["Flash Nova"].MidACC = set_combine(sets.WS.MABWS,{})
        sets.WS["Flash Nova"].HighACC = set_combine(sets.WS.MABWS,{})
        sets.WS["Flash Nova"].MaxACC = set_combine(sets.WS.MABWS,{})
        
		----------------------
		-- Job Ability Sets --
		----------------------
		
		-- Blue Mage JA Sets --
        sets.JA = {}
		sets.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}
		sets['Chain Affinity'] = {head="Hashishin Kavuk +1",ring2="Mujin Band",feet="Assim. Charuqs +1"}
		sets.Efflux = {legs="Hashishin Tayt +1"}
		sets['Burst Affinity'] = {feet="Hashi. Basmak +1"}
		sets.Convergence = {head="Luh. Keffiyeh +1"}
		sets.Diffusion = {feet="Luhlaza Charuqs +1"}
        
		-- Enmity JA Set --
		sets.JA.Enmity = set_combine(sets.PDT,{
						ammo="Iron Gobbet",
						head="Rabid Visor",
						neck="Unmoving Collar +1",
                        ear1="Trux Earring",
                        ear2="Cryptic Earring",
						body="Emet Harness +1",
						ring1="Petrov Ring",
						ring2="Eihwaz Ring",
						back="Reiki Cloak",
						waist="Goading Belt",
						legs="Zoar Subligar +1"})
		
		-- /WAR JA Sets --
        sets.JA.Provoke = set_combine(sets.JA.Enmity,{})
        sets.JA.Warcry = set_combine(sets.JA.Enmity,{})
		
		-- /PLD JA Sets --
        sets.JA["Shield Bash"] = set_combine(sets.JA.Enmity,{})
        sets.JA.Sentinel = set_combine(sets.JA.Enmity,{})
        sets.JA["Holy Circle"] = set_combine(sets.JA.Enmity,{})
		
		-- /DRK JA Sets --
		sets.JA.Souleater = set_combine(sets.JA.Enmity,{})
        sets.JA["Last Resort"] = set_combine(sets.JA.Enmity,{})
        sets.JA["Arcane Circle"] = set_combine(sets.JA.Enmity,{})
		
        -- /DNC JA Sets --
        sets.Waltz = {
						ammo="Iron Gobbet",
						head="Carmine Mask",
						neck="Loricate Torque +1",
						ear1="Ethereal Earring",
						ear2="Genmei Earring",
						body="Vrikodara Jupon",
						hands="Amalric Gages",
						ring1="Defending Ring",
						ring2="Gelatinous Ring +1",
						back="Swith Cape +1",
						waist="Chaac Belt",
						legs="Hashishin Tayt +1",
						feet="Hippo. Socks +1"}
        sets.Step = {
						ammo="Pemphredo Tathlum",
                        head="Dampening Tam",
                        neck="Sanctity Necklace",
                        ear1="Lifestorm Earring",
                        ear2="Psystorm Earring",
						body="Hashishin Mintan +1",
                        hands="Leyline Gloves",
                        ring1="Etana Ring",
                        ring2="Sangoma Ring",
						back="Cornflower Cape",
						waist="Chaac Belt",
                        legs="Psycloth Lappas",
                        feet=HerculeanBoots.DT}
		sets.Flourish = set_combine(sets.Step,{})

		-- /RUN JA Sets --
		sets.JA.Lunge = {
                        ammo="Pemphredo Tathlum",
                        head=HerculeanHelm.MAB,
                        neck="Sanctity Necklace",
                        ear1="Friomisi Earring",
						ear2="Crematio Earring",
                        body="Amalric Doublet +1",
                        hands="Amalric Gages",
						ring1="Shiva Ring +1",
                        ring2="Shiva Ring +1",
                        back="Cornflower Cape",
                        waist="Eschan Stone",
                        legs="Hagondes Pants +1",
                        feet="Amalric nails +1"}
		
		--------------------
        -- Pre-Cast Sets --
		-------------------- 
		
		-- Base Pre-Cast Set --
        sets.Precast = {
                        ammo="Impatiens",
                        head="Carmine Mask",
                        neck="Orunmila's Torque",
                        ear1="Loquac. Earring",
                        ear2="Etiolation Earring",
                        body="Taeon Tabard",
                        hands="Leyline Gloves",
                        ring1="Lebeche Ring",
                        ring2="Prolix Ring",
                        back="Perimede Cape",
                        waist="Witful Belt",
                        legs="Psycloth Lappas",
                        feet="Carmine Greaves +1"}
		
		-- Fast Cast Set --
        sets.Precast.FastCast = set_combine(sets.Precast,{})
						
		-- Pre-Cast Blue Magic --
		sets.Precast['Blue Magic'] = set_combine(sets.Precast,{
						body="Hashishin Mintan +1"})
						
        -- Pre-Cast Enhancing Magic --
        sets.Precast['Enhancing Magic'] = set_combine(sets.Precast,{
						waist="Siegel Sash"})
		
		-- Cure Precast Set --
        sets.Precast.Cure = set_combine(sets.Precast.FastCast,{
						ear2="Mendi. Earring",
						waist="Acerbic Sash +1"})
 
		------------------------------------
		-- Mid-Cast Sets (Non-Blue Magic) --
		------------------------------------
 
        -- Mid-Cast Base Set --
        sets.Midcast = {
                        ammo="Impatiens",
                        head="Carmine Mask",
                        neck="Orunmila's Torque",
                        ear1="Loquac. Earring",
                        ear2="Etiolation Earring",
                        body="Taeon Tabard",
                        hands="Leyline Gloves",
                        ring1="Defending Ring",
                        ring2="Prolix Ring",
                        back="Swith Cape +1",
                        waist="Witful Belt",
                        legs="Psycloth Lappas",
                        feet="Amalric nails +1"}
 
        -- Magic Haste Set --
        sets.Midcast.Haste = set_combine(sets.Midcast,{})
						
		-- Magic Attack Bonus Set --
		sets.Midcast.MAB = {
                        ammo="Pemphredo Tathlum",
                        head=HerculeanHelm.MAB,
                        neck="Sanctity Necklace",
                        ear1="Friomisi Earring",
						ear2="Crematio Earring",
                        body="Amalric Doublet +1",
                        hands="Amalric Gages",
						ring1="Shiva Ring +1",
                        ring2="Shiva Ring +1",
                        back="Cornflower Cape",
                        waist="Eschan Stone",
                        legs="Hagondes Pants +1",
                        feet="Amalric nails +1"}
						
		-- Magic Burst Set --
		sets.Midcast.MB = {
						head=HerculeanHelm.MAB,
                        body="Samnuha Coat",
                        hands="Amalric Gages",
						ring1="Mujin Band",
						ring2="Locus Ring",
						back="Seshaw Cape"}

		-- Magic Accuracy Set --
		sets.Midcast.MACC = {
						ammo="Pemphredo Tathlum",
                        head="Carmine Mask",
                        neck="Sanctity Necklace",
                        ear1="Lifestorm Earring",
                        ear2="Psystorm Earring",
						body="Amalric Doublet +1",
                        hands="Leyline Gloves",
                        ring1="Etana Ring",
                        ring2="Sangoma Ring",
						back="Cornflower Cape",
                        waist="Eschan Stone",
                        legs="Psycloth Lappas",
                        feet="Hashi. Basmak +1"}
						
		-- Magic Enmity Set --
		sets.Midcast.MagicEnmity = set_combine(sets.Midcast,{
						ammo="Iron Gobbet",
						head="Rabid Visor",
						neck="Unmoving Collar +1",
                        ear1="Trux Earring",
                        ear2="Cryptic Earring",
						body="Emet Harness +1",
						ring1="Petrov Ring",
						ring2="Eihwaz Ring",
						back="Reiki Cloak",
						waist="Goading Belt",
						legs="Zoar Subligar +1"})
		
        -- Enhancing Magic Base Set --
        sets.Midcast['Enhancing Magic'] = {
						head="Carmine Mask",
						neck="Incanter's Torque",
						ear1="Andoaa Earring",
						ear2="Augment. Earring",
						body="Telchine Chas.",
						back="Perimede Cape",
						waist="Olympus Sash",
                        legs="Carmine Cuisses +1"}
		
		-- Elemental Magic Set --
		sets.Midcast['Elemental Magic'] = set_combine(sets.Midcast.MAB,{})

		-- Enfeebling Magic Set --
		sets.Midcast['Enfeebling Magic'] = set_combine(sets.Midcast.MACC,{
						head="Carmine Mask",
                        feet="Medium's Sabots"})
		
		-- Dark Magic Set --
		sets.Midcast['Dark Magic'] = set_combine(sets.Midcast.MACC,{})
		
		-- Refresh Set --
        sets.Midcast.Refresh = set_combine(sets.Midcast,{
						head="Amalric Coif",
						waist="Gishdubar Sash"})
		
		-- Flash Set --
		sets.Midcast.Flash = set_combine(sets.Midcast.MagicEnmity,{})
		
		-- Repose Set --
		sets.Midcast.Repose = set_combine(sets.Midcast.MACC,{})
		
        -- Stoneskin Set --
        sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{waist="Siegel Sash"})
						
		-- Enfeebling Ninjutsu Set --
		sets.Midcast.Enfeebling_Ninjutsu = set_combine(sets.Midcast.MACC,{})
		
        -- Elemental Ninjutsu Set --
        sets.Midcast.Elemental_Ninjutsu = set_combine(sets.Midcast.MAB,{})
 
		-----------------------------------------------------
        -- For Cure Spells & The Listed Healing Blue Magic --
		-----------------------------------------------------
		
		-- Cure Set --
        sets.Midcast.Cure = {
                        ammo="Hydrocera",
                        head="Carmine Mask",
                        neck="Phalaina Locket",
                        ear1="Loquac. Earring",
						ear2="Mendi. Earring",
                        body="Vrikodara Jupon",
                        hands="Telchine Gloves",
                        ring1="Rufescent Ring",
						ring2="Levia. Ring",
                        back="Solemnity Cape",
						waist="Gishdubar Sash",
                        legs="Telchine Braconi",
                        feet="Medium's Sabots"}
						
		-- Self Cures --
		sets.Midcast.SelfCure = set_combine(sets.Midcast.Cure,{
						ring2="Kunaji Ring",
						waist="Gishdubar Sash"})
						
		-- HP-up Cures --
		sets.Midcast.HPCure = set_combine(sets.Midcast.Cure,{
						ring2="Kunaji Ring",
						waist="Gishdubar Sash"})
		
		------------------------------
		-- Mid-Cast Blue Magic Sets --
		------------------------------
		
         -- Blue Magic Base Mid-Cast Set --
        sets.Midcast['Blue Magic'] = set_combine(sets.Midcast,{hands="Hashi. Bazu. +1"})
 
        -- For The Listed Physical Type Blue Magic --
        sets.Midcast.PhysicalBlueMagic = {
                        ammo="Floestone",
                        head="Lilitu Headpiece",
                        neck="Caro Necklace",
						ear1="Cessance Earring",
                        ear2="Zennaroi Earring",
                        body="Adhemar Jacket +1",
                        hands="Adhemar Wristbands",
                        ring1="Shukuyu Ring",
                        ring2="Ifrit Ring +1",
                        back="Cornflower Cape",
                        waist="Grunfeld Rope",
                        legs="Samnuha Tights",
                        feet="Rawhide Boots"}
 
        -- BlueMagic STR Set --
        sets.Midcast.PhysicalBlueMagic_STR = set_combine(sets.Midcast.PhysicalBlueMagic,{})
 
        -- BlueMagic STR/DEX Set --
        sets.Midcast.PhysicalBlueMagic_DEX = set_combine(sets.Midcast.PhysicalBlueMagic,{
						ring1="Ramuh Ring +1",
						ring2="Ramuh Ring +1"})
 
        -- BlueMagic STR/VIT Set --
        sets.Midcast.PhysicalBlueMagic_VIT = set_combine(sets.Midcast.PhysicalBlueMagic,{
						ammo="Iron Gobbet"})
 
        -- BlueMagic STR/AGI Set --
        sets.Midcast.PhysicalBlueMagic_AGI = set_combine(sets.Midcast.PhysicalBlueMagic,{})
		
		-- Physical Acc Blue Magic --
		sets.Midcast.BlueMagic_PhysicalACC = {
                        ammo="Falcon Eye",
                        head="Carmine Mask",
                        neck="Combatant's Torque",
                        ear1="Cessance Earring",
                        ear2="Zennaroi Earring",
						body="Adhemar Jacket +1",
						hands="Adhemar Wristbands",
                        ring1="Ramuh Ring +1",
                        ring2="Ramuh Ring +1",
                        back="Ground. Mantle +1",
                        waist="Olseni Belt",
                        legs="Carmine Cuisses +1",
						feet="Rawhide Boots"}
 
        -- For The Listed Magical Type BlueMagic --
        sets.Midcast.MagicalBlueMagic = set_combine(sets.Midcast.MAB,{})
		
		-- Dark Based Magical Blue Magic --
		sets.Midcast.BlueMagic_Dark = set_combine(sets.Midcast.MAB,{head="Pixie Hairpin +1",ring1="Archon Ring"})
		
		-- Light Based Magical Blue Magic --
		sets.Midcast.BlueMagic_Light = set_combine(sets.Midcast.MAB,{}) -- Insert Weatherspoon Ring Here --

		-- Earth Based Magical Blue Magic --
		sets.Midcast.BlueMagic_Earth = set_combine(sets.Midcast.MAB,{}) -- Insert Quanpur Necklace Here --
		
		-- Blue Magic Burst Affinity Magic Burst Set --
		sets.Midcast.BAMB = {
						head=HerculeanHelm.MAB,
                        body="Samnuha Coat",
                        hands="Amalric Gages",
						ring1="Mujin Band",
						ring2="Locus Ring",
						back="Seshaw Cape",
                        feet="Hashi. Basmak +1"}
 
        -- Magic Accuracy For The Listed BlueMagic --
        sets.Midcast.BlueMagic_Accuracy = set_combine(sets.Midcast.MACC,{})
 
        -- Stun Set For The Listed BlueMagic --
        sets.Midcast.BlueMagic_Stun = set_combine(sets.Midcast.MACC,{})
						
		-- Physical Stun Blue Magic --
		sets.Midcast.BlueMagic_PhysicalStun = set_combine(sets.Midcast.MACC,{
                        body="Hashishin Mintan +1",
                        feet="Rawhide Boots"})
 
        -- Buff Set For The Listed Blue Magic --
        sets.Midcast.BlueMagic_Buff = {
						ammo="Impatiens",
                        head="Carmine Mask",
                        neck="Incanter's Torque",
                        ear1="Loquac. Earring",
                        ear2="Genmei Earring",
                        body="Assim. Jubbah +1",
                        hands="Hashi. Bazu. +1",
                        ring1="Defending Ring",
                        ring2="Gelatinous Ring +1",
                        back="Cornflower Cape",
                        legs="Hashishin Tayt +1",
						waist="Hachirin-no-Obi",
                        feet="Luhlaza Charuqs +1"}
 
        -- Breath Set For The Listed Blue Magic --
        sets.Midcast.BlueMagic_Breath = set_combine(sets.Midcast,{head="Luh. Keffiyeh +1"})
		
		-- White Wind Set --
		sets.Midcast.BlueMagic_HPCure = set_combine(sets.Midcast.HPCure,{})
		
		-- Enmity Sets For the Listed Blue Magic --
		sets.Midcast.BlueMagic_Emnity = set_combine(sets.Midcast.MagicEnmity,{})
 
end

		---------------
		-- Functions --
		---------------
		
		----------------
		-- Pre-Target --
		----------------

function pretarget(spell,action)
        if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
                cancel_spell()
                send_command('input /item "Echo Drops" <me>')
        elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
                cancel_spell()
                send_command('Aggressor')
        elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then -- Cure Degradation --
                degrade_spell(spell,Cure_Spells)
        elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then -- Curaga Degradation --
                degrade_spell(spell,Curaga_Spells)
		return
	end
end
 
		--------------
		-- Pre-Cast --
		--------------
		
function precast(spell,action)
		if spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
				cancel_spell()
				add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
		return
		else
				equipSet = sets.WS
		if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
				end
		if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
				end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
				equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
				end
		if spell.english == "Chant du Cygne" and player.tp > 2900 then
                equipSet = set_combine(equipSet,{ear1="Ishvara Earring",ear2="Brutal Earring"})  
        elseif spell.english == "Requiescat" and player.tp > 2900 then
                equipSet = set_combine(equipSet,{ear1="Lifestorm Earring"})  
		elseif spell.english == "Expiacion" and player.tp > 2900 then
                equipSet = set_combine(equipSet,{ear1="Ishvara Earring",ear2="Brutal Earring"}) 
		elseif spell.english == "Savage Blade" and player.tp > 2900 then
                equipSet = set_combine(equipSet,{ear1="Ishvara Earring",ear2="Brutal Earring"})
		elseif spell.english == "Vorpal Blade" and player.tp > 2900 then
                equipSet = set_combine(equipSet,{ear1="Ishvara Earring",ear2="Brutal Earring"})
		elseif spell.english == "Sanguine Blade" and world.day == "Darksday" or world.weather_element == "Dark" then
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
        elseif spell.english == "Realmrazer" and player.tp > 2900 then
				equipSet = set_combine(equipSet,{ear1="Lifestorm Earring"})  
		elseif spell.english == "Black Halo" and player.tp > 2900 then
				equipSet = set_combine(equipSet,{ear1="Ishvara Earring",ear2="Brutal Earring"}) 
		elseif spell.english == "Flash Nova" and world.day == "Lightsday" or world.weather_element == "Light" then
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})					
				end
                equip(equipSet)
				end
        elseif spell.type == "JobAbility" or spell.type == "Ward" then
        if sets.JA[spell.english] then
                equip(sets.JA[spell.english])
				end			
        elseif spell.english == 'Lunge' or spell.english == 'Swipe' then
				equip(sets.JA.Lunge)
        elseif spell.type == "Rune" then
				equip(sets.JA.Enmity)				
        elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
        if buffactive.silence  then -- Cancel Magic or Ninjutsu If You Are Silenced --
                cancel_spell()
                add_to_chat(123, spell.name..' Canceled: [Silenced]')
        return
        else
        if (string.find(spell.english,'Cur') or BlueMagic_Healing:contains(spell.english) or BlueMagic_HPCure:contains(spell.english))  and spell.english ~= "Cursna" then
                equip(sets.Precast.Cure)
        elseif string.find(spell.english,'Utsusemi') then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
                cancel_spell()
                add_to_chat(123, spell.english .. ' Canceled: [3+ Images]')
        return
		else
				equip(sets.Precast.FastCast)
				end
		elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
		else
				equip(sets.Precast.FastCast)
				end
				end
        elseif string.find(spell.type,'Flourish') then
        if spell.english == "Animated Flourish" then
                equip(sets.Enmity)
        else
                equip(sets.Flourish)
				end
        elseif spell.type == "Step" then
                equip(sets.Step)
        elseif spell.type == "Waltz" then
                refine_waltz(spell,action)
                equip(sets.Waltz)
        elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
                cast_delay(0.2)
                send_command('cancel Sneak')
        end
end
			
		--------------
		-- Mid-Cast --
		--------------
			
function midcast(spell,action)
				equipSet = {}
        if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' or spell.type == 'Trust' then 
                equipSet = sets.Midcast
        if equipSet[spell.english] then
                equipSet = equipSet[spell.english]
		elseif (string.find(spell.english,'Cur') or BlueMagic_Healing:contains(spell.english)) and spell.english ~= "Cursna" then
        if spell.target.name == player.name then
                equipSet = equipSet.SelfCure
        else
                equipSet = equipSet.Cure
                end
        elseif BlueMagic_HPCure:contains(spell.english) then
                equipSet = equipSet.BlueMagic_HPCure
        elseif string.find(spell.english,'Protect') or string.find(spell.english,'Shell') then
        if spell.target.name == player.name then
                equipSet = set_combine(equipSet,{ring1="Sheltered Ring"})
                end		
		elseif spell.english:startswith('Haste') or spell.english:startswith('Flurry') or spell.english:startswith('Blink') or spell.english:startswith('Regen') or spell.english:endswith('Spikes') then
				equipSet = sets.Haste
		elseif spell.english == "Stoneskin" then
		if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
				end
				equipSet = equipSet.Stoneskin
        elseif PhysicalBlueMagic:contains(spell.english) or PhysicalBlueMagic_STR:contains(spell.english) or PhysicalBlueMagic_DEX:contains(spell.english) or PhysicalBlueMagic_VIT:contains(spell.english) or PhysicalBlueMagic_AGI:contains(spell.english) or BlueMagic_PhysicalACC:contains(spell.english) then
        if PhysicalBlueMagic_STR:contains(spell.english) then
                equipSet = equipSet.PhysicalBlueMagic_STR
        elseif PhysicalBlueMagic_DEX:contains(spell.english) then
                equipSet = equipSet.PhysicalBlueMagic_DEX
        elseif PhysicalBlueMagic_VIT:contains(spell.english) then
                equipSet = equipSet.PhysicalBlueMagic_VIT
        elseif PhysicalBlueMagic_AGI:contains(spell.english) then
                equipSet = equipSet.PhysicalBlueMagic_AGI
        elseif PhysicalBlueMagic:contains(spell.english) then
                equipSet = equipSet.PhysicalBlueMagic
        elseif BlueMagic_PhysicalACC:contains(spell.english) then
                equipSet = equipSet.BlueMagic_PhysicalACC
				end
		if buffactive['Sneak Attack'] or buffactive['Trick Attack'] then -- Equip Crit damage+ gear during Physical Blue Magic when Sneak or Trick Attack are active --
				equipSet = set_combine(equipSet,{head="Adhemar Bonnet +1",body="Abnoba Kaftan",feet="Thereoid Greaves"})
				end
		if buffactive['Chain Affinity'] then
				equipSet = set_combine(equipSet,sets['Chain Affinity'])
				end
		if buffactive.Efflux then
				equipSet = set_combine(equipSet,sets.Efflux)
				end
        elseif MagicalBlueMagic:contains(spell.english) or BlueMagic_Dark:contains(spell.english) or BlueMagic_Light:contains(spell.english) or BlueMagic_Earth:contains(spell.english) then
        if MagicalBlueMagic:contains(spell.english) then
                equipSet = equipSet.MagicalBlueMagic
        elseif BlueMagic_Dark:contains(spell.english) then
                equipSet = equipSet.BlueMagic_Dark
        elseif BlueMagic_Light:contains(spell.english) then
                equipSet = equipSet.BlueMagic_Light
        elseif BlueMagic_Earth:contains(spell.english) then
				equipSet = equipSet.BlueMagic_Earth
                end
        if buffactive['Burst Affinity'] then
				equipSet = set_combine(equipSet,sets['Burst Affinity'])
                end
		if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{waist='Hachirin-no-Obi'})
				end
		if buffactive.Convergence then
				equipSet = set_combine(equipSet,sets.Convergence)
				end
		if buffactive['Burst Affinity'] or buffactive['Azure Lore'] and MB == 'ON' then
				equipSet = set_combine(equipSet,sets.Midcast.BAMB)
				end
				equip(equipSet)
        elseif BlueMagic_Accuracy:contains(spell.english) then
                equipSet = equipSet.BlueMagic_Accuracy
        elseif BlueMagic_Stun:contains(spell.english) then
                equipSet = equipSet.BlueMagic_Stun
		elseif BlueMagic_PhysicalStun:contains(spell.english) then
                equipSet = equipSet.BlueMagic_PhysicalStun
        elseif BlueMagic_Emnity:contains(spell.english) then
                equipSet = equipSet.BlueMagic_Emnity						
        elseif BlueMagic_Buff:contains(spell.english) then
                equipSet = equipSet.BlueMagic_Buff
        elseif BlueMagic_Refresh:contains(spell.english) then
                equipSet = equipSet.Refresh
        elseif BlueMagic_Diffusion:contains(spell.english) and buffactive.Diffusion then
                equipSet = set_combine(equipSet,sets.Diffusion)
        elseif BlueMagic_Breath:contains(spell.english) then
                equipSet = equipSet.BlueMagic_Breath
        elseif spell.english == "Stoneskin" then
        if buffactive.Stoneskin then
                send_command('@wait 2.8;cancel stoneskin')
                end
                equipSet = equipSet.Stoneskin
        elseif spell.english == "Sneak" then
        if spell.target.name == player.name and buffactive['Sneak'] then
                send_command('cancel sneak')
                end
                equipSet = equipSet.Haste
        elseif string.find(spell.english,'Utsusemi') then
        if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
                send_command('@wait 1.7;cancel Copy Image*')
                end
                equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
		if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
				end
				equipSet = equipSet.Haste
		elseif spell.english:startswith('Tonko') then
				equipSet = equipSet.Haste
		elseif spell.english:startswith('Jabaku') or spell.english:startswith('Hojo') or spell.english:startswith('Kurayami') or spell.english:startswith('Dokumori') then
				equipSet = equipSet.Enfeebling_Ninjutsu
		elseif spell.english:startswith('Katon') or spell.english:startswith('Suiton') or spell.english:startswith('Doton') or spell.english:startswith('Hyoton') or spell.english:startswith('Huton') or spell.english:startswith('Raiton') then
				equipSet = equipSet.Elemental_Ninjutsu
		if (world.day_element == spell.element or world.weather_element == spell.element) then
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
		end
		if MB == 'ON' then
				equipSet = set_combine(equipSet,sets.Midcast.MB)
				end
		elseif equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
				end
		if spell.english:startswith('Cur') or spell.english:startswith('White Wind') and spell.english ~= "Cursna" then
		if (world.day_element == spell.element or world.weather_element == spell.element) then
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
				end
				end
		if spell.skill == 'Elemental Magic' or spell.english:startswith('Aspir') or spell.english:startswith('Drain') then
		if (world.day_element == spell.element or world.weather_element == spell.element) then
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
				end
		if MB == 'ON' then
				equipSet = set_combine(equipSet,sets.Midcast.MB)
				end
				end
		elseif equipSet[spell.english] then
				equipSet = equipSet[spell.english]
		end
		equip(equipSet)
end
		
		----------------
		-- After-Cast --
		----------------
		
function aftercast(spell,action)
        if spell.type == "WeaponSkill" and not spell.interrupted then
                send_command('wait 0.2;gs c TP')
		elseif spell.english == "Sleep II" or spell.english == "Repose" or spell.english == "Dream Flower" then -- Sleep II//Repose/Dream Flower Countdown --
				send_command('wait 60;input /echo Sleep II/Dream Flower Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep II/Dream Flower Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep II/Dream Flower Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Sleep" or spell.english == "Sleepga" or spell.english == "Sheep Song" then -- Sleep/Sleepga/Sheep Song Countdown --
				send_command('wait 30;input /echo Sleep/Sheep Song Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep/Sheep Song Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep/Sheep Song Effect: [WEARING OFF IN 5 SEC.]')
		end
		status_change(player.status)
end

		-------------------
		-- Status Change --
		-------------------
		
function status_change(new,old)
        if Armor == 'PDT' then
                equip(sets.PDT)
        elseif Armor == 'MDT' then
                equip(sets.MDT)
		elseif Armor == 'Kiting' then
                equip(sets.Kiting)
        elseif new == 'Engaged' then
                equipSet = sets.TP
        if Armor == 'Hybrid' and equipSet["Hybrid"] then
                equipSet = equipSet["Hybrid"]
				end
		if equipSet[WeaponArray[WeaponIndex]] then
                equipSet = equipSet[WeaponArray[WeaponIndex]]
				end
        if equipSet[AccArray[AccIndex]] then
                equipSet = equipSet[AccArray[AccIndex]]
				end
		if (buffactive.March and (buffactive.Embrava or buffactive.Haste or buffactive['Mighty Guard']) or (buffactive.Haste == 2) or (buffactive['Mighty Guard']) and (buffactive.Embrava or buffactive.Haste)) and equipSet["HighHaste"] then
				equipSet = equipSet["HighHaste"]
				end
		if buffactive["Aftermath: Lv.3"] and player.equipment.main == 'Tizona' and equipSet["AM3"] then -- AM3 Set Equip (Mythic Only) --
				equipSet = equipSet["AM3"]
				end
		if Thaumas == 'ON' then
				equipSet = set_combine(equipSet,sets.TP.Thaumas)
				end
		if TH == 'ON' then -- Treasure Hunter TP Toggle --
			equipSet = set_combine(equipSet,sets.TP.TH)
		end
				equip(equipSet)
		elseif new == 'Idle' then
				equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
				equipSet = equipSet[IdleArray[IdleIndex]]
				end
		if Cities:contains(world.area) then
				equipSet = equip(sets.Idle.Town)
				end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
				equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
				end
		equip(equipSet)
		end
end
		


        -----------------
        -- Buff Change --
        -----------------
   
function buff_change(buff,gain,buff_table)
        buff = string.lower(buff)
        if buff_table['id'] == 272 and player.equipment.main == 'Tizona' then -- Tizona AM3 Timer/Countdown --
        if gain then
				send_command('timers create "Mythic Aftermath: Lv.3" 180 down')
        else
                send_command('timers delete "Mythic Aftermath: Lv.3"')
                add_to_chat(123,'Tizona AM3: [OFF]')
				end
        elseif buff_table['id'] == 271 and player.equipment.main == 'Tizona' then -- Tizona AM2 Timer/Countdown --
        if gain then
				send_command('timers create "Mythic Aftermath: Lv.2" 270 down')
        else
                send_command('timers delete "Mythic Aftermath: Lv.2"')
                add_to_chat(123,'Tizona AM2: [OFF]')
				end		
        elseif buff_table['id'] == 272 and player.equipment.main == 'Almace' then -- Almace AM3 Timer/Countdown --
        if gain then
                send_command('timers create "Empy Aftermath: Lv.3" 180 down')
                else
                send_command('timers delete "Empy Aftermath: Lv.3"')
                add_to_chat(123,'Almace AM3: [OFF]')
                end	
        elseif buff_table['id'] == 271 and player.equipment.main == 'Almace' then -- Almace AM2 Timer/Countdown --
        if gain then
                send_command('timers create "Empy Aftermath: Lv.2" 120 down')
        else
                send_command('timers delete "Empy Aftermath: Lv.2"')
                add_to_chat(123,'Almace AM2: [OFF]')
                end		
        elseif buff_table['id'] == 272 and player.equipment.main == 'Sequence' then -- Sequence AM3 Timer/Countdown --
        if gain then
                send_command('timers create "Aeonic Aftermath: Lv.3" 180 down')
                else
                send_command('timers delete "Aeonic Aftermath: Lv.3"')
                add_to_chat(123,'Sequence AM3: [OFF]')
                end	
        elseif buff_table['id'] == 271 and player.equipment.main == 'Sequence' then -- Sequence AM2 Timer/Countdown --
        if gain then
                send_command('timers create "Aeonic Aftermath: Lv.2" 180 down')
        else
                send_command('timers delete "Aeonic Aftermath: Lv.2"')
                add_to_chat(123,'Sequence AM2: [OFF]')
                end		
        elseif buff_table['id'] == 163 then -- Azure Lore Timer --
        if gain then
                send_command('timers create "Azure Lore" 40 down')
        else
                send_command('timers delete "Azure Lore"')
                end     
        elseif buff_table['id'] == 164 then -- Chain Affinity Timer --
        if gain then
                send_command('timers create "Chain Affinity" 30 down')
        else
                send_command('timers delete "Chain Affinity"')
                end         
        elseif buff_table['id'] == 165 then -- Burst Affinity Timer --
        if gain then
                send_command('timers create "Burst Affinity" 30 down')
        else
                send_command('timers delete "Burst Affinity"')
                end     
        elseif buff_table['id'] == 457 then -- Efflux Timer --
        if gain then
                send_command('timers create "Efflux" 60 down')
        else
                send_command('timers delete "Efflux"')
                end     
        elseif buff_table['id'] == 356 then -- Diffusion Timer --
        if gain then
                send_command('timers create "Diffusion" 60 down')
        else
                send_command('timers delete "Diffusion"')
                end     
        elseif buff_table['id'] == 485 then -- Unbridled Learning Timer --
        if gain then
                send_command('timers create "Unbridled Learning" 60 down')
        else
                send_command('timers delete "Unbridled Learning"')
                end     
        elseif buff_table['id'] == 505 then -- Unbridled Wisdom Timer --
        if gain then
                send_command('timers create "Unbridled Wisdom" 60 down')
        else
                send_command('timers delete "Unbridled Wisdom"')
                end                     
        elseif buff_table['id'] == 434 then -- Brew Timer --
        if gain then
                send_command('timers create "Transcendency" 180 down')
        else
                send_command('timers delete "Transcendency"')
                add_to_chat(123,'Transcendency: [OFF]')
                end             
        elseif buff_table['id'] == 1 then -- Weakness Timer --
        if gain then
                send_command('timers create "Weakness" 300 up')
        else
                send_command('timers delete "Weakness"')
				add_to_chat(158,'Weakness: [OFF]')
                end
        elseif buff_table['id'] == 15 then -- Doom Party Chat --
        if gain then
                send_command('input /party Doom')
        else
                send_command('input /party Doom off')
                add_to_chat(158,'Doom: [OFF]')
                end
        elseif buff_table['id'] == 9 then -- Curse Party Chat --
        if gain then
                send_command('input /party Curse')
        else
                add_to_chat(158,'Curse: [OFF]')
                end
        elseif buff_table['id'] == 14 or buff_table['id'] == 17 then -- Charm Party Chat --
        if gain then
                send_command('input /party Charmed')
        else
                send_command('input /party Charm off')
                add_to_chat(158,'Charm: [OFF]')
                end
        elseif buff_table['id'] == 4 then -- Paralysis Party Chat --
        if gain then
                add_to_chat(123,'Paralyzed!')
        else
                add_to_chat(158,'Paralysis: [OFF]')
                end				
		elseif buff_table['id'] == 91 then -- Nat. Meditation --
        if not gain then 
				add_to_chat(123,'Nat. Meditation: [OFF]')
				end
        elseif buff_table['id'] == 93 then -- Cocoon Notification --
        if not gain then 
                add_to_chat(123,'Cocoon: [OFF]')
                end     
        elseif buff_table['id'] == 33 then -- Haste --
        if not gain then 
                add_to_chat(123,'Haste: [OFF]')
                end     
        elseif buff_table['id'] == 147 then -- Attack Down --
        if not gain then 
                add_to_chat(158,'Attack Down: [OFF]')
                end
        elseif buff_table['id'] == 149 then -- Defense Down --
        if not gain then 
                add_to_chat(158,'Defense Down: [OFF]')
                end     
        elseif buff_table['id'] == 13  then    -- Slow --
        if gain then
                add_to_chat(123,'Slowed!')
                else
                add_to_chat(158,'Slow: [OFF]')
                end 
        elseif buff_table['id'] == 42 then -- Regen --
        if not gain then 
                add_to_chat(123,'Regen: [OFF]')
                end     
        elseif buff_table['id'] == 43 then -- Refresh --
        if not gain then 
                add_to_chat(123,'Refresh: [OFF]')
                end 
        elseif buff_table['id'] == 152 then -- Magic Barrier --
        if not gain then 
                add_to_chat(123,'Magic Barrier: [OFF]')
                end     
        elseif buff_table['id'] == 116 then -- Phalanx/Barrier Tusk -- 
        if not gain then 
                add_to_chat(123,'Phalanx: [OFF]')
                end     
        elseif buff_table['id'] == 36 then -- Blink/Occultation --
        if not gain then 
                add_to_chat(123,'Blink: [OFF]')
                end     
        elseif buff_table['id'] == 604 then -- Mighty Guard --
        if not gain then 
                add_to_chat(123,'Mighty Guard: [OFF]')
                end     
        elseif buff_table['id'] == 251 then -- Food --
        if not gain then 
                add_to_chat(123,'Food: [OFF]')
                end 
        elseif buff_table['id'] == 28 then -- Terror --
        if not gain then 
                add_to_chat(158,'Terror: [OFF]')
                end 
        elseif buff_table['id'] == 10 then -- Stun --
        if not gain then 
                add_to_chat(158,'Stun: [OFF]')
                end     
        elseif buff_table['id'] == 16 then -- Amnesia --
        if not gain then 
                add_to_chat(158,'Amnesia: [OFF]')
                end                 
        elseif buff_table['id'] == 2 or buff_table['id'] == 19 then -- Sleep --
        if gain then
				send_command('input /party ZZZ')
        else
                add_to_chat(158,'Sleep: [OFF]')
                end         
        end
        if buffactive.Terror or buffactive.Stun or buffactive.Petrification or buffactive.Sleep and gain then -- Lock PDT When You Are Terrorised/Stunned/Petrified/Slept --
                equip({
						ammo="Iron Gobbet",
						head="Lithelimb Cap",
						neck="Loricate Torque +1",
						ear1="Ethereal Earring",
						ear2="Eabani Earring",
						body="Emet Harness +1",
						hands=HerculeanGloves.DT,
						ring1="Defending Ring",
						ring2="Gelatinous Ring +1",
						back="Xucau Mantle",
						waist="Flume Belt +1",
						legs="Iuitl Tights +1",
						feet=HerculeanBoots.DT})
        else
        if not midaction() then
                status_change(player.status)
                end
        end
end
 

		-------------------------------------------------------------------------------------
		-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
		-------------------------------------------------------------------------------------
		
function self_command(command)
        if command == 'acc' then -- Accuracy Level Toggle --
				AccIndex = (AccIndex % #AccArray) + 1
				add_to_chat(155,'Accuracy Level: ' .. AccArray[AccIndex])
				status_change(player.status)
		elseif command == 'dw' then -- DW Toggle --
				WeaponIndex = (WeaponIndex % #WeaponArray) + 1
				add_to_chat(155,'Dual Wield: '..WeaponArray[WeaponIndex])
				status_change(player.status)
        elseif command == 'update' then -- Update Gear --
				status_change(player.status)
				add_to_chat(155,'-[Gear Update]-')
				add_to_chat(155,'Dual Wield: '..WeaponArray[WeaponIndex])
				add_to_chat(155,'Accuracy Level: ' .. AccArray[AccIndex])
				add_to_chat(155,'Idle Set: ' .. IdleArray[IdleIndex])
		elseif command == 'hybrid' then -- Hybrid Toggle --
        if Armor == 'Hybrid' then
                Armor = 'None'
                add_to_chat(123,'Hybrid Set: [Unlocked]')
        else
                Armor = 'Hybrid'
                add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
                end
                status_change(player.status)
		elseif command == 'th' then -- Treasure Hunter TP Toggle --
		if TH == 'ON' then
				TH = 'OFF'
				add_to_chat(123,'Treasure Hunter TP: [Unlocked]')
		else
				TH = 'ON'
				add_to_chat(158,'Treasure Hunter TP: [Locked]')
				end
				status_change(player.status)
        elseif command == 'pdt' then -- PDT Toggle --
        if Armor == 'PDT' then
                Armor = 'None'
                add_to_chat(123,'PDT Set: [Unlocked]')
        else
                Armor = 'PDT'
                add_to_chat(158,'PDT Set: [Locked]')
                end
                status_change(player.status)
        elseif command == 'mdt' then -- MDT Toggle --
        if Armor == 'MDT' then
                Armor = 'None'
                add_to_chat(123,'MDT Set: [Unlocked]')
        else
                Armor = 'MDT'
                add_to_chat(158,'MDT Set: [Locked]')
                end
				status_change(player.status)
        elseif command == 'kiting' then -- Kiting Toggle --
        if Armor == 'Kiting' then
                Armor = 'None'
                add_to_chat(123,'Kiting Set: [Unlocked]')
        else
                Armor = 'Kiting'
                add_to_chat(158,'Kiting Set: [Locked]')
                end
                status_change(player.status)
		elseif command == 'thaumas' then -- Thaumas Coat Toggle --
		if Thaumas == 'ON' then
				Thaumas = 'OFF'
				add_to_chat(123,'Thaumas Coat: [OFF]')
		else
				Thaumas = 'ON'
				add_to_chat(158,'Thaumas Coat: [ON]')
				end
		elseif command == 'mb' then -- Magic Burst Toggle --
		if MB == 'ON' then
				MB = 'OFF'
				add_to_chat(123,'Magic Burst: [OFF]')
		else
				MB = 'ON'
				add_to_chat(158,'Maic Burst: [ON]')
				end
				status_change(player.status)
        elseif command == 'distance' then -- Distance Toggle --
        if player.target.distance then
                target_distance = math.floor(player.target.distance*10)/10
                add_to_chat(158,'Distance: '..target_distance)
        else
                add_to_chat(123,'No Target Selected')
				end
        elseif command == 'idle' then -- Idle Toggle --
				IdleIndex = (IdleIndex % #IdleArray) + 1
				add_to_chat(155,'Idle Set: ' .. IdleArray[IdleIndex])
				status_change(player.status)
        elseif command == 'TP' then
				add_to_chat(155,'TP Return: ['..tostring(player.tp)..']')
        elseif command:match('^SC%d$') then
				send_command('//' .. sc_map[command])
				end
		
end

		-----------
		-- Misc. --
		-----------
		
function actualCost(originalCost)
        if buffactive["Penury"] then
				return originalCost*.5
        elseif buffactive["Light Arts"] then
				return originalCost*.9
        else
				return originalCost
        end
end
 
function degrade_spell(spell,degrade_array)
				spell_index = table.find(degrade_array,spell.name)
        if spell_index>1 then
                new_spell = degrade_array[spell_index - 1]
                change_spell(new_spell,spell.target.raw)
                add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
        end
end

function find_player_in_alliance(name)
		for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
		if p.name == name then
		return p
		end
	end
	end
end