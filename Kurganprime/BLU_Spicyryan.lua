---Thanks to various sources for the help building my GearSwaps.

------------------------------------------
-- Macro and Style Change on Job Change
------------------------------------------
function set_macros(sheet,book)
    if book then 
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
end

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
	add_to_chat (21, 'Your Lockstyle Looks like shit, and you should feel bad')
	add_to_chat (121, 'You are on BLU btw')
--	add_to_chat (60, 'https://www.bg-wiki.com/bg/Out_of_the_BLU')
end

set_macros(1,9)
---Name the Lockstyle below after the default set number-- 
set_style(1) 
------------------------------------------
-- Variables
------------------------------------------
SetLocked = false --Used to Check if set is locked before changing equipment
LockedEquipSet = {} --Placeholder to store desired lock set
LockGearSet = {}
equipSet = {} --Currently Equiped Gearset
LockGearIndex = false
TargetDistance = 0
------------------------------------------
-- Windower Hooks              --
------------------------------------------

function buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if name == "terror" or name == "petrification" or name == "sleep" or name == "stun" then
		if gain == true then
			ChangeGear(sets.Utility.DerpDT)
		elseif player.status == 'Engaged' then
			ChangeGear(sets.TP[sets.TP.index[TP_ind]])
		else
			ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
		end
	end
	
	if name == "doom" then
		if gain == true then		   
			ChangeGear(sets.Utility.Doom)
			send_command('@input /p Doomed :|')
			disable('ring1','waist')
		elseif player.status == 'Engaged' then
			enable('ring1','waist')
			ChangeGear(sets.TP[sets.TP.index[TP_ind]])
		else
			enable('ring1','waist')
			ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
		end
	end
	
	
end

------------------------------------------
-- Binds                  --
------------------------------------------
send_command('bind f9 gs c toggle TP set') --This means if you hit cntrl and f9 it toggles the sets
send_command('bind f10 gs c toggle CDC set')
send_command('bind f11 gs c toggle Req set')
send_command('bind f12 gs c toggle Idle set')
send_command('bind ^f8 input /ws "Sanguine Blade" <t>')
send_command('bind ^f9 input /ws "Chant du Cygne" <t>') --^ means cntrl
send_command('bind ^f10 input /ws "Expiacion" <t>')
send_command('bind ^f11 input /ws "Requiescat" <t>')
send_command('bind ^f12 input /ws "Savage Blade" <t>') --Sanguine Blade
send_command('bind !f9 gs c changemaccmab') --! means alt
send_command('bind !f10 gs c toggle Expi set')
send_command('bind !f11 gs c toggle Rea set')
send_command('bind !f12 gs c lockgearindex')

------------------------------------------
-- Console Commands             --
------------------------------------------
function self_command(command)
	if command == 'togglelock' then
		if SetLocked == false then
			SetLocked = true
			msg("Equipment Set LOCKED!")
		else
			SetLocked = false
			msg("Equipment Set UNLOCKED!")
		end
	elseif command == 'lockgearindex' then
		if LockGearIndex == false then
			LockGearIndex = true
			LockGearSet = {
				ammo = player.equipment.ammo,
				head = player.equipment.head,
				neck = player.equipment.neck,
				ear1 = player.equipment.left_ear,
				ear2 = player.equipment.right_ear,
				body = player.equipment.body,
				hands = player.equipment.hands,
				ring1 = player.equipment.left_ring,
				ring2 = player.equipment.right_ring,
				back = player.equipment.back,
				waist = player.equipment.waist,
				legs = player.equipment.legs,
				feet = player.equipment.feet
			}
			msg("Gear Index Locked")
		else
			LockGearIndex = false
			msg("Gear Index Unlocked")
			if player.status == 'Engaged' then
				equip(sets.TP[sets.TP.index[TP_ind]])
			else
				equip(sets.Idle[sets.Idle.index[Idle_ind]])
			end
		end
	end
	if command == 'toggle TP set' then
		TP_ind = TP_ind + 1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		send_command('@input /echo <----- TP Set changed to ' .. sets.TP.index[TP_ind] .. ' ----->')
		ChangeGear(sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'toggle Idle set' then
		Idle_ind = Idle_ind + 1
		if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
		send_command('@input /echo <----- Idle Set changed to ' .. sets.Idle.index[Idle_ind] .. ' ----->')
		ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
	elseif command == 'toggle Req set' then
		Requiescat_ind = Requiescat_ind + 1
		if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
		send_command('@input /echo <----- Requiescat Set changed to ' .. sets.Requiescat.index[Requiescat_ind] .. ' ----->')
	elseif command == 'toggle CDC set' then
		CDC_ind = CDC_ind + 1
		if CDC_ind > #sets.CDC.index then CDC_ind = 1 end
		send_command('@input /echo <----- CDC Set changed to ' .. sets.CDC.index[CDC_ind] .. ' ----->')
	elseif command == 'toggle Expi set' then
		Expiacion_ind = Expiacion_ind + 1
		if Expiacion_ind > #sets.Expiacion.index then Expiacion_ind = 1 end
		send_command('@input /echo <----- Expiacion Set changed to ' .. sets.Expiacion.index[Expiacion_ind] .. ' ----->')
	elseif command == 'toggle Savage set' then
		SavageBlade_ind = SavageBlade_ind + 1
		if SavageBlade_ind > #sets.SavageBlade.index then SavageBlade_ind = 1 end
		send_command('@input /echo <----- Savage Blade Set changed to ' .. sets.SavageBlade.index[SavageBlade_ind] .. ' ----->')
	elseif command == 'toggle Realm set' then
		Realmrazer_ind = Realmrazer_ind + 1
		if Realmrazer_ind > #sets.Realmrazer.index then Realmrazer_ind = 1 end
	elseif command == 'toggle Judgement set' then
		Realmrazer_ind = Realmrazer_ind + 1
		if Realmrazer_ind > #sets.Judgement.index then Judgement_ind = 1 end
	elseif command == 'toggle FlashNova set' then
		FlashNova_ind = FlashNova_ind + 1
		if FlashNova_ind > #sets.FlashNova.index then FlashNova_ind = 1 end
		send_command('@input /echo <----- Flash Nova Set changed to ' .. sets.FlashNova.index[FlashNova_ind] .. ' ----->')
	elseif command == 'equip TP set' then
		ChangeGear(sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'equip Idle set' then
		ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
	elseif command == 'changemaccmab' then
		MAB_ind = MAB_ind + 1
		if MAB_ind > #sets.BlueMagic.INT.index then MAB_ind = 1 end
		send_command('@input /echo <-----Blue Magic INT Type Changed To: ' .. sets.BlueMagic.INT.index[MAB_ind] .. '----->')
	end
end

------------------------------------------
-- Character States                     --
------------------------------------------
function IdleState()
    ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
    if player.mpp <= 50 then
        ChangeGear({waist = "Fucho-no-obi"})
    end
end

function RestingState()

end

function EngagedState()
	ChangeGear(sets.TP[sets.TP.index[TP_ind]])
end

------------------------------------------
-- cast                 --
------------------------------------------
function pc_JA(spell, act)
	IgnoreWS = S { "Sanguine Blade", "Flash Nova", "Realmrazer" }
	if spell.english == 'Azure Lore' then
		ChangeGear(sets.JA.AzureLore)
	end
	if spell.english == 'Provoke' then
		ChangeGear(sets.JA.Provoke)
	elseif spell.english == 'Warcry' then
		ChangeGear(sets.JA.Warcry)
	end
	if spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance <= 6 then
		if spell.english == 'Requiescat' then
			ChangeGear(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
		elseif spell.english == 'Chant du Cygne' or spell.english == 'Vorpal Blade' then
			ChangeGear(sets.CDC[sets.CDC.index[CDC_ind]])
		elseif spell.english == 'Expiacion' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'Savage Blade' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'True Strike' or spell.english == 'Judgment' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'Realmrazer' then
			ChangeGear(sets.Realmrazer[sets.Realmrazer.index[Realmrazer_ind]])
		elseif spell.english == 'Judgement' then
			ChangeGear(sets.Judgement[sets.Judgement.index[Judgement_ind]])
		elseif spell.english == 'Flash Nova' then
			ChangeGear(sets.FlashNova[sets.FlashNova.index[FlashNova_ind]])
		elseif spell.english == 'Circle Blade' then
			ChangeGear(sets.WS.CircleBlade)
		elseif spell.english == 'Sanguine Blade' or spell.english == 'Red Lotus Blade' or spell.english == 'Seraph Blade' then
			ChangeGear(sets.WS.SanguineBlade)
		end
		if player.tp > 2749 then
			if IgnoreWS:contains(spell.english) then
				do return end
			else
				equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
				msg("Ishvara Earring equiped")
			end
		end
	elseif player.tp >= 1000 and player.target and player.target.distance and player.target.distance > 6 and spell.type == 'WeaponSkill' then
		cancel_spell()
		msg("Weapon Skill Canceled  Target Out of Range")
	end

	if spell.english == 'Box Step' then
		ChangeGear(sets.Utility.Steps)
	elseif spell.english == 'Quick Step' then
		ChangeGear(sets.Utility.Steps)
	elseif spell.english == 'Animated Flourish' then
		ChangeGear(sets.BlueMagic.Enmity)
	end
end

function pc_Magic(spell, act)
	if spell.skill == 'BlueMagic' then
		ChangeGear(sets.precast.FC.Blue)
	else
		ChangeGear(sets.precast.FC.Standard)
	end
end

function pc_Item(spell, act)
end


------------------------------------------
-- Midcast                 --
------------------------------------------
function mc_JA(spell, act)
end

function mc_Magic(spell, act)
	if spell.skill == 'Healing Magic' then
		if spell.target and spell.target.type == 'SELF' then
				ChangeGear(sets.BlueMagic.SelfCures)
			else
				ChangeGear(sets.BlueMagic.Cures)
			end
		end
		
	if spell.skill == 'Enhancing Magic' then
		if spell.english == 'Refresh' then
			ChangeGear(sets.BlueMagic.Battery)
		elseif string.find(spell.english,'Shell') or string.find(spell.english,'Protect') then
			ChangeGear(sets.Enhancing.ProShell)
		elseif spell.english=="Phalanx" then
			ChangeGear(sets.Enhancing.Phalanx)
		elseif spell.english=="Aquaveil" then
			ChangeGear(sets.Enhancing.Aquaveil)
		else
			ChangeGear(sets.Enhancing)
		end
		
	if spell.skill == 'Enfeebling Magic' then
			ChangeGear(sets.BlueMagic.MagicAccuracy)
		end
		
	if spell.english == 'Stun' then
			ChangeGear(sets.BlueMagic.MagicAccuracy)
		end
		
	else if spell.skill == 'Blue Magic' then
		if spell.english == 'Battery Charge' then
			ChangeGear(sets.BlueMagic.Battery)
		elseif spell.english == 'Regeneration' or string.find(spell.english,'Regen') then
			ChangeGear(sets.BlueMagic.Regeneration)
			--For any other Spell Spefic Gearset, add the needed elseif here
		else
			-- Generic Precast Set
			ChangeGear(sets.precast.FC.Blue)
		end
		
		if BlueMagic_Diffusion:contains(spell.english) then
			ChangeGear(sets.JA.Diffusion)
		end
		
		if PhysicalSpells:contains(spell.english) then
			if PhysicalBlueMagic_STR:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STR)
			elseif PhysicalBlueMagic_DEX:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STRDEX)
			elseif PhysicalBlueMagic_VIT:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STRVIT)
			elseif PhysicalBlueMagic_AGI:contains(spell.english) then
				ChangeGear(sets.BlueMagic.AGI)
			elseif PhysicalBlueMagic:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STR)
			elseif BlueMagic_PhysicalAcc:contains(spell.english) then
				ChangeGear(sets.BlueMagic.HeavyStrike)
			end
			if buffactive['Chain Affinity'] then
				ChangeGear(sets.JA.ChainAffinity)
			end
			if buffactive['Efflux'] then
				ChangeGear(sets.JA.Efflux)
			end
		end
		
		if MagicalSpells:contains(spell.english) then
			if BlueMagic_INT:contains(spell.english) then
				ChangeGear(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]])
			elseif BlueMagic_Dark:contains(spell.english) then
				ChangeGear(sets.BlueMagic.DarkNuke)
			elseif BlueMagic_Light:contains(spell.english) then
				ChangeGear(sets.BlueMagic.LightNuke)
			elseif BlueMagic_Earth:contains(spell.english) then
				ChangeGear(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]])
			end
			if buffactive['Burst Affinity'] then
				ChangeGear(sets.JA.BurstAffinity)
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				ChangeGear(set_combine(equipSet, { waist = 'Hachirin-no-Obi' }))
			end
		end

		if BlueMagic_Accuracy:contains(spell.english) then
			ChangeGear(sets.BlueMagic.MagicAccuracy)
		elseif BlueMagic_Stun:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Stun)
		elseif BlueMagic_Enmity:contains(spell.english) or spell.english == 'Flash' then
			ChangeGear(sets.BlueMagic.Enmity)
		elseif BlueMagic_Buffs:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Buffs)
		elseif BlueMagic_Skill:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Skill)
		elseif buffactive.Diffusion then
			ChangeGear(sets.JA.Diffusion)
		elseif spell.english == 'White Wind' then
			ChangeGear(sets.BlueMagic.WhiteWind)
		end
		
		if BlueMagic_Healing:contains(spell.english) then 
			if spell.target and spell.target.type == 'SELF' then
				ChangeGear(sets.BlueMagic.SelfCures)
			else
				ChangeGear(sets.BlueMagic.Cures)
			end
		end
		
	end
	end
end


function mc_Item(spell, act)
end


------------------------------------------
-- After Cast               --
------------------------------------------
function ac_JA(spell)
end

function ac_Magic(spell)
end

function ac_Item(spell)
end

function ac_Global()
    if LockGearIndex == true then
        ChangeGear(LockGearSet)
        msg("Lock Gear is ON -- Swapping Gear")
    else
        if player.status == 'Engaged' then
            EngagedState()
        else
            IdleState()
        end
    end
end

------------------------------------------
-- Framework Core            --
------------------------------------------
function status_change(new, old)
	if new == 'Idle' then
		IdleState()
	elseif new == 'Resting' then
		RestingState()
	elseif new == 'Engaged' then
		EngagedState();
	end
end

function precast(spell, act)
	if spell.action_type == 'Ability' then
		pc_JA(spell, act)
	elseif spell.action_type == 'Magic' then
		pc_Magic(spell, act)
	else
		pc_Item(spell, act)
	end
end

function midcast(spell, act)
	if spell.action_type == 'Ability' then
		mc_JA(spell, act)
	elseif spell.action_type == 'Magic' then
		mc_Magic(spell, act)
	else
		mc_Item(spell, act)
	end
end

function aftercast(spell)
	if spell.action_type == 'Ability' then
		ac_JA(spell)
	elseif spell.action_type == 'Magic' then
		ac_Magic(spell)
	else
		ac_Item(spell)
	end
	ac_Global()
end

function ChangeGear(GearSet)

	equipSet = GearSet
	equip(GearSet)
end

function LockGearSet(GearSet)
	LockedEquipSet = GearSet
	equip(GearSet)
	SetLocked = true
end

function UnlockGearSet()
	locked = false
	equip(equipSet)
end

--Unload Binds
function file_unload()
	send_command('unbind ^f9')
	send_command('unbind ^f10')
	send_command('unbind ^f11')
	send_command('unbind ^f12')
	send_command('unbind !f9')
	send_command('unbind !f10')
	send_command('unbind !f11')
	send_command('unbind !f12')
	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
end

function get_sets()
	maps()

	HerculeanHelm = {}
	HerculeanHelm.Nuke = { name = "Herculean Helm", augments = { 'Mag. Acc.+18 "Mag.Atk.Bns."+18', '"Fast Cast"+1', 'INT+9', 'Mag. Acc.+9', '"Mag.Atk.Bns."+12', } }
	HerculeanHelm.DT = { name = "Herculean Helm", augments = { 'Attack+12', 'Phys. dmg. taken -4%', 'STR+9', 'Accuracy+8', } }
	HerculeanHelm.Refesh = { name = "Herculean Helm", augments = { 'Weapon skill damage +2%','Pet: Accuracy+11 Pet: Rng. Acc.+11','"Refresh"+2', } }
	HerculeanHelm.WSD = { name = "Herculean Helm", augments = { 'Attack+18','Weapon skill damage +4%','STR+10','Accuracy+12', } }
	HerculeanHelm.WSDAcc = { name = "Herculean Helm", augments = { 'Accuracy+23 Attack+23','Weapon skill damage +3%','STR+3','Accuracy+13','Attack+11', } }
	
	HerculeanGloves = {}
	HerculeanGloves.WSD = { name = "Herculean Gloves", augments = { 'Accuracy+21 Attack+21', 'Weapon skill damage +4%', 'Accuracy+9', 'Attack+10', } }
	HerculeanGloves.DT = { name = "Herculean Gloves", augments = { 'Accuracy+13', 'Damage taken-3%', 'AGI+1', 'Attack+5', } }
	HerculeanGloves.HighAcc = { name = "Herculean Gloves", augments = { 'Accuracy+23 Attack+23', '"Triple Atk."+2', 'DEX+15', 'Accuracy+11', 'Attack+13', } }
	HerculeanGloves.Refresh = { name = "Herculean Gloves", augments = { 'DEX+7', 'Weapon skill damage +2%', '"Refresh"+1', } }
	HerculeanGloves.Crit = { name = "Herculean Gloves", augments = { 'Attack+23', 'Crit. hit damage +4%', 'DEX+8', 'Accuracy+11', } }
	HerculeanGloves.Phalanx = { name="Herculean Gloves", augments={'INT+5','Pet: "Dbl. Atk."+3','Phalanx +4',}}
	HerculeanGloves.PhysicalSpells = { name="Herculean Gloves", augments={'Accuracy+11 Attack+11','"Triple Atk."+2','STR+10','Accuracy+15','Attack+5', } }
	
	TelchineLegs = {}
	TelchineLegs.CP = { name = "Telchine Braconi" , augments = {'Potency of "Cure" effect received+7%','INT+1 MND+1',} }
	TelchineLegs.WS = { name = "Telchine Braconi" , augments = {'Accuracy+16','"Dbl.Atk."+3','STR+9',} }
	
	HerculeanLegs = {}
	HerculeanLegs.DT = { name = "Herculean Trousers", augments = { 'Accuracy+22', 'Damage taken-2%', 'VIT+6', } }
	HerculeanLegs.WSD = { name = "Herculean Trousers", augments = { 'Attack+28', 'Weapon skill damage +3%', 'STR+10', 'Accuracy+9', } }

	TaeonBoots = {}
	TaeonBoots.TA = { name = "Taeon Boots", augments = { 'STR+6 DEX+6', 'Accuracy+15 Attack+15', '"Triple Atk."+2' } }
	TaeonBoots.Regen ={ name="Taeon Boots", augments = {'Mag. Acc.+9','"Conserve MP"+5','"Regen" potency+3',} }
	
	HerculeanFeet = {}
	HerculeanFeet.QA = { name = "Herculean Boots", augments = { 'AGI+4', '"Dbl.Atk."+2', 'Quadruple Attack +3', 'Accuracy+4 Attack+4', } }
	HerculeanFeet.TA = { name = "Herculean Boots", augments = { 'Accuracy+14 Attack+14', '"Triple Atk."+4', 'DEX+3', 'Accuracy+2', 'Attack+15' } }
	HerculeanFeet.DT = { name = "Herculean Boots", augments = { 'Accuracy+23', 'Damage taken -3%' } }
	HerculeanFeet.Idle = { name = "Herculean Boots", augments = { 'Crit. hit damage +1%','STR+10','"Refresh"+2','Accuracy+15 Attack+15','Mag. Acc.+17 "Mag.Atk.Bns."+17', } }
	HerculeanFeet.CritDmg = { name = "Herculean Boots", augments = { 'Accuracy+28', 'Crit. hit damage +5%', 'DEX+9', } }
	HerculeanFeet.WSD = { name = "Herculean Boots", augments = { 'Attack+22', 'Weapon skill damage +4%', 'Accuracy+15', } }
	HerculeanFeet.DW = { name = "Herculean Boots", augments = { 'Accuracy+3 Attack+3','"Dual Wield"+4','AGI+3','Accuracy+14', } }
	
	Rosmerta = {}
	Rosmerta.Crit = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10', } }
	Rosmerta.WSD = { name = "Rosmerta's Cape", augments = { 'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%', } }
	Rosmerta.STP = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10', } }
	Rosmerta.DW = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10', } }
	Rosmerta.Nuke = { name = "Rosmerta's Cape", augments = { 'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10', } }
	Rosmerta.Cure = { name = "Rosmerta's Cape", augments = {'MND+20','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%', } }
	
	
	sets.Idle = {}
	--Idle Sets--
	sets.Idle.index = { 'Standard', 'DT', 'Town' }
	Idle_ind = 3
	sets.Idle.Standard = {
		ammo = "Staunch Tathlum",
		head = HerculeanHelm.Refesh,
		neck = "Wiglen Gorget",
		ear1 = "Infused Earring",
		ear2 = "Ethereal earring",
		body = "Assim. Jubbah +3",
		hands = HerculeanGloves.Refresh,
		ring1 = "Sheltered ring",
		ring2 = "Paguroidea Ring",
		back = "Kumbira Cape",
		waist = "Flume Belt",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.Idle
	}

	sets.Idle.DT = {
		ammo = "Staunch Tathlum",
		head = HerculeanHelm.DT,
		neck = "Loricate Torque +1",
		ear1 = "Infused Earring",
		ear2 = "Ethereal Earring",
		body = "Emet Harness +1",
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Dark ring",
		back = "Shadow Mantle",
		waist = "Flume belt",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.DT
	}

	sets.Idle.Town = {
		ammo = "Staunch Tathlum",
		head = HerculeanHelm.Refesh,
		neck = "Wiglen Gorget",
		ear1 = "Infused Earring",
		ear2 = "Ethereal earring",
		body = "Assim. Jubbah +3",
		hands = HerculeanGloves.Refresh,
		ring1 = "Sheltered ring",
		ring2 = "Matrimony ring",
		back = "Kumbira Cape",
		waist = "Flume Belt",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.Idle
	}


	--TP Sets--
	sets.TP = {}
	sets.TP.index = { 'DualWield', 'CappedHaste', 'AccuracyLite', 'AccuracyMid', 'AccuracyFull' }
	--1=DualWield gear, uncapped haste, 2=CappedHaste, 3=AccuracyLite, 4=AccuracyMid, 5=AccuracyFull--
	TP_ind = 1

	--DW III +1200JP, +31 DW needed to cap with only Flutter on--
	sets.TP.DualWield = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet +1",
		neck = "Asperity necklace",
		ear1 = "Suppanomimi",
		ear2 = "Brutal Earring",
		body = "Adhemar Jacket",
		hands = "Adhemar Wristbands",
		ring1 = "Epona's ring",
		ring2 = "Petrov Ring",
		back = Rosmerta.DW,
		waist = "Reiki Yotai",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.DW
	}

	--+11 DW for capping--	
	sets.TP.CappedHaste = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet +1",
		neck = "Asperity necklace",
		ear1 = "Suppanomimi",
		ear2 = "Brutal Earring",
		body = "Adhemar Jacket",
		hands = "Adhemar Wristbands",
		ring1 = "Epona's ring",
		ring2 = "Hetairoi Ring",
		back = Rosmerta.STP,
		waist = "Windbuffet Belt +1",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.QA
	}

	sets.TP.AccuracyLite = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet +1",
		neck = "Lissome Necklace",
		ear1 = "Suppanomimi",
		ear2 = "Cessance Earring",
		body = "Adhemar Jacket",
		hands = "Adhemar Wristbands",
		ring1 = "Epona's ring",
		ring2 = "Hetairoi Ring",
		back = Rosmerta.STP,
		waist = "Windbuffet Belt +1",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.TA
	}

	sets.TP.AccuracyMid = {
		ammo = "Falcon Eye",
		head = "Dampening Tam",
		neck = "Lissome Necklace",
		ear1 = "Suppanomimi",
		ear2 = "Telos earring",
		body = "Adhemar Jacket",
		hands = "Adhemar Wristbands",
		ring1 = "Epona's ring",
		ring2 = "Ilabrat Ring",
		back = Rosmerta.STP,
		waist = "Kentarch Belt +1",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.TA
	}

	sets.TP.AccuracyFull = {
		ammo = "Falcon Eye",
		head = "Carmine Mask +1",
		neck = "Combatant's Torque",
		ear1 = "Dignitary's Earring",
		ear2 = "Telos earring",
		body = "Adhemar Jacket",
		hands = HerculeanGloves.HighAcc,
		ring1 = "Cacoethic Ring +1",
		ring2 = "Ilabrat Ring",
		back = Rosmerta.STP,
		waist = "Olseni Belt",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.CritDmg
	}


	--Weaponskill Sets--
	sets.WS = {}

	sets.Requiescat = {}

	sets.Requiescat.index = { 'Attack', 'Accuracy' }
	Requiescat_ind = 1

	sets.Requiescat.Attack = {
		ammo = "Hydrocera",
		head = "Jhakri Coronal +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Brutal Earring",
		body = "Jhakri Robe +1",
		hands = "Jhakri Cuffs +1",
		ring1 = "Epona's ring",
		ring2 = "Rufescent Ring",
		back = Rosmerta.WSD,
		waist = "Fotia Belt",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}

	sets.Requiescat.Accuracy = {
		ammo = "Falcon Eye",
		head = "Carmine Mask",
		neck = "Fotia Gorget",
		ear1 = "Cessance Earring",
		ear2 = "Zennaroi Earring",
		body = "Adhemar Jacket",
		hands = "Adhemar Wristbands",
		ring1 = "Epona's ring",
		ring2 = "Ilabrat Ring",
		back = Rosmerta.WSD,
		waist = "Fotia Belt",
		legs = TelchineLegs.WS,
		feet = "Carmine Greaves +1"
	}

	sets.CDC = {}

	sets.CDC.index = { 'Attack', 'Accuracy', 'AccuracyHigh' }
	CDC_ind = 1

	sets.CDC.Attack = {
		ammo = "Jukukik Feather",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Brutal Earring",
		body = "Abnoba Kaftan",
		hands = HerculeanGloves.Crit,
		ring1 = "Epona's ring",
		ring2 = "Begrudging Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = "Thereoid Greaves"
	}

	sets.CDC.Accuracy = {
		ammo = "Falcon Eye",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Mache Earring",
		body = "Abnoba Kaftan",
		hands = HerculeanGloves.HighAcc,
		ring1 = "Epona's ring",
		ring2 = "Begrudging Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.CritDmg
	}

	sets.CDC.AccuracyHigh = {
		ammo = "Falcon Eye",
		head = "Dampening Tam",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Mache earring",
		body = "Sayadio's Kaftan",
		hands = HerculeanGloves.HighAcc,
		ring1 = "Begrudging Ring",
		ring2 = "Ilabrat Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.CritDmg
	}

	sets.Expiacion = {}

	sets.Expiacion.index = { 'Attack', 'Accuracy' }
	Expiacion_ind = 1

	sets.Expiacion.Attack = {
		ammo = "Floestone",
		head = HerculeanHelm.WSD,
		neck = "Caro Necklace",
		ear1 = "Moonshade Earring",
		ear2 = "Brutal Earring",
		body = "Assim. Jubbah +3",
		hands = HerculeanGloves.WSD,
		ring1 = "Ifrit Ring +1",
		ring2 = "Shukuyu Ring",
		back = Rosmerta.WSD,
		waist = "Prosilio Belt +1",
		legs = HerculeanLegs.WSD,
		feet = HerculeanFeet.WSD
	}

	sets.Expiacion.Accuracy = {
		ammo = "Falcon Eye",
		head = HerculeanHelm.WSDAcc,
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Telos Earring",
		body = "Assim. Jubbah +3",
		hands = HerculeanGloves.WSD,
		ring1 = "Rufescent Ring",
		ring2 = "Ilabrat Ring",
		back = Rosmerta.WSD,
		waist = "Prosilio Belt +1",
		legs = HerculeanLegs.WSD,
		feet = HerculeanFeet.WSD
	}

	sets.WS.SanguineBlade = {}

	sets.WS.SanguineBlade = {
		ammo = "Pemphredo Tathlum",
		head = "Pixie Hairpin +1",
		neck = "Sanctity Necklace",
		ear1 = "Friomisi Earring",
		ear2 = "Hecate's earring",
		body = "Jhakri Robe +1",
		hands = "Jhakri Cuffs +1",
		ring1 = "Archon Ring",
		ring2 = "Rufescent Ring",
		back = Rosmerta.Nuke,
		waist = "Eschan Stone",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}

	sets.WS.CircleBlade = set_combine(sets.Expiacion.Attack[sets.Expiacion.index[Expiacion_ind]], {
	})

	sets.SavageBlade = {}

	sets.SavageBlade.index = { 'Attack', 'Accuracy' }
	SavageBlade_ind = 1
	sets.SavageBlade.Attack = set_combine(sets.Expiacion.Attack, {})

	sets.SavageBlade.Accuracy = set_combine(sets.Expiacion.Accuracy, {})

	sets.Realmrazer = {}

	sets.Realmrazer.index = { 'Attack', 'Accuracy' }
	Realmrazer_ind = 1
	sets.Realmrazer.Attack = {
		ammo = "Hydrocera",
		head = "Jhakri Coronal +1",
		neck = "Fotia Gorget",
		ear1 = "Telos Earring",
		ear2 = "Brutal Earring",
		body = "Jhakri Robe +1",
		hands = "Jhakri Cuffs +1",
		ring1 = "Epona's ring",
		ring2 = "Rufescent Ring",
		back = Rosmerta.WSD,
		waist = "Fotia Belt",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}

	sets.Realmrazer.Accuracy = set_combine(sets.Realmrazer.Attack, {})

	sets.Judgement = {}

	sets.Judgement.index = { 'Attack', 'Accuracy' }
	Realmrazer_ind = 1
	sets.Judgement.Attack = set_combine(sets.Expiacion.Attack, {})

	sets.Judgement.Accuracy = set_combine(sets.Expiacion.Accuracy, {})
	
	sets.FlashNova = {}

	sets.FlashNova.index = { 'Attack', 'Accuracy' }
	FlashNova_ind = 1
	sets.FlashNova.Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Jhakri Coronal +1",
		neck = "Sanctity Necklace",
		ear1 = "Hecate's Earring",
		ear2 = "Friomisi Earring",
		body = "Jhakri Robe +1",
		hands = "Jhakri Cuffs +1",
		ring1 = "Shiva Ring +1",
		ring2 = "Weatherspoon Ring",
		back = Rosmerta.Nuke,
		waist = "Eschan Stone",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}

	sets.FlashNova.Accuracy = set_combine(sets.FlashNova.Attack, {})


	--Blue Magic Sets--
	sets.BlueMagic = {}

	sets.BlueMagic.STR = {
		ammo = "Floestone",
		head = "Adhemar Bonnet +1",
		neck = "Caro Necklace",
		ear1 = "Telos Earring",
		ear2 = "Odnowa Earring +1",
		body = "Assim. Jubbah +3",
		hands = HerculeanGloves.PhysicalSpells,
		ring1 = "Ifrit Ring +1",
		ring2 = "Shukuyu Ring",
		back = Rosmerta.WSD,
		waist = "Prosilio Belt +1",
		legs = HerculeanLegs.WSD,
		feet = "Jhakri Pigaches +1"
	}

	sets.BlueMagic.STRDEX = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.STRVIT = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.STRMND = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.AGI = set_combine(sets.BlueMagic.STR, {	})
	--------------------------------------------------
	sets.BlueMagic.INT = {}
	sets.BlueMagic.INT.index = { "MAB", "MACC" }
	MAB_ind = 1

	sets.BlueMagic.INT.MAB = {
		ammo = "Pemphredo Tathlum",
		head = HerculeanHelm.Nuke,
		neck = "Sanctity Necklace",
		ear1 = "Hermetic Earring",
		ear2 = "Friomisi earring",
		body = "Jhakri Robe +1",
		hands = "Amalric Gages",
		ring1 = "Shiva Ring +1",
		ring2 = "Acumen Ring",
		back = Rosmerta.Nuke,
		waist = "Eschan Stone",
		legs = "Amalric Slops",
		feet = "Jhakri Pigaches +1"
	}
	
	sets.BlueMagic.INT.MACC = {
		ammo = "Pemphredo Tathlum",
		head = "Jhakri Coronal +1",
		neck = "Erra Pendant",
		ear1 = "Hermetic Earring",
		ear2 = "Friomisi earring",
		body = "Jhakri Robe +1",
		hands = "Jhakri Cuffs +1",
		ring1 = "Shiva Ring +1",
		ring2 = "Weatherspoon Ring",
		back = Rosmerta.Nuke,
		waist = "Eschan Stone",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}
	-----------------------------------------
	sets.BlueMagic.LightNuke = set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]], {
		ring2 = "Weatherspoon Ring",
	})

	sets.BlueMagic.DarkNuke = set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]], {
		head = "Pixie Hairpin +1",
		ring2 = "Archon Ring",
	})

	--CP cap 50%, CP Received cap 30%--
	sets.BlueMagic.Cures = {
		ammo = "Hydrocera",
		head = "Carmine Mask",
		neck = "Phalaina Locket",
		ear1 = "Mendicant's Earring",
		ear2 = "Flashward Earring",
		body = "Vrikodara Jupon",
		hands = "Hashishin Bazubands +1",
		ring1 = "Stikini Ring",
		ring2 = "Rufescent Ring",
		back = Rosmerta.Cure,
		waist = "Luminary Sash",
		legs = "Gyve Trousers",
		feet = "Medium's Sabots"
	}
	
	sets.BlueMagic.SelfCures = {
		ammo = "Hydrocera",
		head = "Carmine Mask",
		neck = "Phalaina Locket",
		ear1 = "Mendicant's Earring",
		ear2 = "Flashward Earring",
		body = "Vrikodara Jupon",
		hands = "Telchine Gloves",
		ring1 = "Kunaji Ring",
		ring2 = "Rufescent Ring",
		back = Rosmerta.Cure,
		waist = "Gishdubar Sash",
		legs = TelchineLegs.CP,
		feet = "Medium's Sabots"
	}

	--Conserve MP Gear--
	sets.BlueMagic.Buffs = {
		ammo = "Pemphredo Tathlum",
		head = "Telchine Cap",
		neck = "Incanter's Torque",
		ear1 = "Mendicant's Earring",
		ear2 = "Calamitous Earring",
		body = "Vedic Coat",
		hands = "Hashishin Bazubands +1",
		ring1 = "Kishar Ring",
		ring2 = "Weatherspoon Ring",
		back = "Solemnity Cape",
		waist = "Hachirin-no-Obi",
		legs = "Lengo Pants",
		feet = TaeonBoots.Regen
	}

	sets.BlueMagic.Battery = set_combine(sets.BlueMagic.Buffs, {
		head = "Amalric Coif",
		waist = "Gishdubar Sash"
	})

	--Telchine Regen+ potency augments--
	sets.BlueMagic.Regeneration = set_combine(sets.BlueMagic.Buffs, {
		Body = "Telchine Chasuble",
		Feet =  TaeonBoots.Regen
	})

	sets.BlueMagic.Stun = {
		ammo = "Pemphredo Tathlum",
		head = "Carmine Mask +1",
		neck = "Erra Pendant",
		ear1 = "Zennaroi Earring",
		ear2 = "Dignitary's Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Etana Ring",
		ring2 = "Weatherspoon Ring",
		back = "Cornflower cape",
		waist = "Eschan Stone",
		legs = "Hashishin Tayt +1",
		feet = HerculeanFeet.Idle
	}

	sets.BlueMagic.HeavyStrike = {
		ammo = "Falcon Eye",
		head = "Adhemar Bonnet +1",
		neck = "Caro Necklace",
		ear1 = "Zennaroi Earring",
		ear2 = "Odnowa Earring +1 ",
		body = "Adhemar Jacket",
		hands = HerculeanGloves.Crit,
		ring1 = "Ifrit Ring +1",
		ring2 = "Rufescent Ring",
		back = Rosmerta.WSD,
		waist = "Prosilio Belt +1",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.TA
	}

	sets.BlueMagic.WhiteWind = {
		ammo = "Falcon Eye",
		head = "Blistering Sallet +1",
		neck = "Phalaina Locket",
		ear1 = "Mendicant's Earring",
		ear2 = "Ethereal Earring",
		body = "Vrikodara Jupon",
		hands = "Telchine Gloves",
		ring1 = "Kunaji Ring",
		ring2 = "Etana Ring",
		back = "Reiki Cloak",
		waist = "Carrier's Sash",
		legs = "Gyve Trousers",
		feet = "Medium's Sabots"
	}

	sets.BlueMagic.MagicAccuracy = {
		ammo = "Pemphredo Tathlum",
		head = "Carmine Mask +1",
		neck = "Erra Pendant",
		ear1 = "Hermetic earring",
		ear2 = "Dignitary's earring",
		body = "Jhakri Robe +1",
		hands = "Rawhide Gloves",
		ring1 = "Sangoma Ring",
		ring2 = "Weatherspoon Ring",
		back = "Cornflower Cape",
		waist = "Eschan Stone",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}

	--Occultation is every 50 skill, magic barrier equals skill, rest dont matter
	---For example diamondhide caps at 500
	sets.BlueMagic.Skill = {
		ammo = "Pemphredo Tathlum",
		head = "Luhlaza Keffiyeh",
		neck = "Incanter's Torque",
		ear1 = "Suppanomimi",
		ear2 = "Ethereal earring",
		body = "Assim. Jubbah +3",
		hands = "Hashishin Bazubands +1",
		ring1 = "Lebeche ring",
		ring2 = "Weatherspoon Ring",
		back = "Cornflower cape",
		waist = "Gishdubar Sash",
		legs = "Hashishin Tayt +1",
		feet = "Luhlaza charuqs +1"
	}

	sets.BlueMagic.Enmity = {
		ammo = "Sapience Orb",
		head = "Rabid Visor",
		neck = "Warder's Charm +1",
		ear1 = "Friomisi Earring",
		ear2 = "Cryptic Earring",
		body = "Emet Harness +1",
		hands = "None",
		ring1 = "Supershear Ring",
		ring2 = "Pernicious Ring",
		back = "Reiki Cloak",
		waist = "None",
		legs = "Obatala Subligar",
		Feet = "Ahosi Leggings"
	}


	--Enhancing Sets--
	
	sets.Enhancing = set_combine(sets.BlueMagic.Buffs, {
		head = "Telchine Cap",
		neck = "Incanter's Torque",
		ear1 = "Andoaa Earring",
		body = "Telchine Chasuble",
		hands = HerculeanGloves.Phalanx,
		back = "Perimede Cape",
		legs = "Carmine Cuisses +1"
	})
	
	sets.Enhancing.Phalanx = set_combine(sets.BlueMagic.Buffs, {
		head = "Telchine Cap",
		neck = "Incanter's Torque",
		ear1 = "Andoaa Earring",
		body = "Telchine Chasuble",
		hands = HerculeanGloves.Phalanx,
		back = "Perimede Cape",
		legs = "Carmine Cuisses +1"
	})
	
	sets.Enhancing.Aquaveil = set_combine(sets.BlueMagic.Buffs, {
		head = "Amalric Coif",
	})
	
	sets.Enhancing.ProShell = set_combine(sets.BlueMagic.Buffs, {
		ring2 = "Sheltered Ring"
	})


	--Utility Sets--

	sets.Utility = {}

	sets.Utility.Steps = set_combine(sets.TP.AccuracyFull, {})
	
	sets.Utility.PDT = {
		ammo = "Staunch Tathlum",
		head = "Blistering Sallet +1",
		neck = "Loricate Torque +1",
		ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Ayanmo Corazza +1",
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = "Shadow Mantle",
		waist = "Flume belt",
		legs = "Ayanmo Cosciales +1",
		feet = HerculeanFeet.DT
	}
	
	sets.Utility.DerpDT = set_combine(sets.Utility.PDT, {
		back = "Engulfer Cape +1"
	})
	
	sets.Utility.Doom = {
		ring1 = "Purity Ring",
		waist = "Gishdubar Sash"
	}

	sets.Utility.DTHybrid = {
		ammo = "Falcon Eye",
		head = HerculeanHelm.DT,
		neck = "Loricate Torque +1",
		ear1 = "Eabani Earring",
		ear2 = "Telos Earring",
		body = "Ayanmo Corazza +1",
		hands = HerculeanGloves.DT,
		ring1 = "Defending Ring",
		ring2 = "Patricius Ring",
		back = Rosmerta.STP,
		waist = "Reiki Yotai",
		legs = "Ayanmo Cosciales +1",
		feet = HerculeanFeet.DT
	}

	sets.Utility.MDTank = {
		ammo = "Staunch Tathlum",
		head = "Dampening Tam",
		neck = "Loricate Torque +1",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Emet Harness +1",
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Dark ring",
		back = "Engulfer Cape +1",
		waist = "Flume Belt",
		legs = HerculeanLegs.DT,
		feet = HerculeanFeet.DT
	}
	
	--Shell V on. Need 23% when 5/5 with pants, 21% with sheltered (23 again with sheltered and trust)--
	sets.Utility.MDTV = {
		ammo = "Staunch Tathlum",
		head = "Amalric Coif",
		neck = "Warder's Charm +1",
		ear1 = "Flashward Earring",
		ear2 = "Etiolation Earring",
		body = "Amalric Doublet",
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Shadow Ring",
		back = "Mubvumbamiri Mantle",
		waist = "Carrier's Sash",
		legs = "Amalric Slops",
		feet = "Ahosi Leggings"
	}

	--Shell II only--
	sets.Utility.MDTII = {
		ammo = "Staunch Tathlum",
		head = "Dampening Tam",
		neck = "Loricate Torque +1",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Amalric Doublet",
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Dark ring",
		back = "Engulfer Cape +1",
		waist = "Carrier's Sash",
		legs = HerculeanLegs.DT,
		feet = HerculeanFeet.DT
	}

	--No Shell--
	sets.Utility.MDTNO = {
		ammo = "Staunch Tathlum",
		head = "Dampening Tam",
		neck = "Loricate Torque +1",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Amalric Doublet", 
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Dark ring",
		back = "Engulfer Cape +1",
		waist = "Carrier's Sash",
		legs = HerculeanLegs.DT,
		feet = HerculeanFeet.DT
	}

	--Telchine with proper ball busting augments is the best for magic evasion--
	sets.Utility.MEVA = {
		ammo = "Staunch Tathlum",
		head = "Amalric Coif",
		neck = "Warder's Charm +1",
		ear1 = "Flashward Earring",
		ear2 = "Hearty Earring",
		body = "Amalric Doublet",
		hands = "Shrieker's Cuffs",
		ring1 = "Defending Ring",
		ring2 = "Purity Ring",
		back = "Mubvumbamiri Mantle",
		waist = "Carrier's Sash",
		legs = "Amalric Slops",
		feet = "Ahosi Leggings"
	}

	--Set I made for something niche--
	sets.Utility.RSleep = {
		ammo = "Staunch Tathlum",
		head = "Amalric Coif",
		neck = "Invidia Torque",
		ear1 = "Flashward Earring",
		ear2 = "Hearty Earring",
		body = "Amalric Doublet",
		hands = "Leyline Gloves",
		ring1 = "Wuji Ring",
		ring2 = "Purity Ring",
		back = "Mubvumbamiri Mantle",
		waist = "Acipayam Belt",
		legs = "Amalric Slops",
		feet = "Ahosi Leggings"
	}

	--Job Ability Sets--

	sets.JA = {}

	sets.JA.ChainAffinity = { feet = "Assim. charuqs +1" }

	sets.JA.BurstAffinity = { feet = "Hashishin Basmak +1" }

	sets.JA.Efflux = { legs = "Hashishin Tayt +1", back= Rosmerta.WSD }

	sets.JA.AzureLore = { hands = "Luhlaza bazubands" }

	sets.JA.Diffusion = set_combine(sets.BlueMagic.Buffs, { feet = "Luhlaza Charuqs +1" })

	sets.JA.Provoke = set_combine(sets.BlueMagic.Enmity, {})

	sets.JA.Warcry = set_combine(sets.BlueMagic.Enmity, {})


	--Precast Sets--
	sets.precast = {}

	sets.precast.FC = {}

	sets.precast.FC.Standard = {
		ammo = "Sapience Orb",
		head = "Carmine Mask +1",
		neck = "Orunmila's Torque",
		ear1 = "Loquac. Earring",
		ear2 = "Etiolation Earring",
		body = "Taeon Tabard",
		hands = "Leyline Gloves",
		ring1 = "Kishar Ring",
		ring2 = "Weatherspoon Ring",
		back = "Perimede Cape",
		waist = "Witful Belt",
		legs = "Ayanmo Cosciales +1",
		feet = "Carmine Greaves +1"
	}

	--Empy body stacks with FC, 80% cap, empy hands must be on at time of casting (mid) for effect--
	sets.precast.FC.Blue = set_combine(sets.precast.FC.Standard, {
		--body = "Hashishin Mintan"
	})
end

function maps()
	PhysicalSpells = S {
		'Asuran Claws', 'Bilgestorm', 'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 'Queasyshroom',
		'Power Attack', 'Ram Charge', 'Saurian Slide', 'Screwdriver', 'Sickle Slash', 'Smite of Rage',
		'Spinal Cleave', 'Spiral Spin', 'Sweeping Gouge', 'Terror Touch', 'Battle Dance', 'Bloodrake',
		'Death Scissors', 'Dimensional Death', 'Empty Thrash', 'Quadrastrike', 'Uppercut', 'Tourbillion',
		'Thrashing Assault', 'Vertical Cleave', 'Whirl of Rage', 'Amorphic Spikes', 'Barbed Crescent',
		'Claw Cyclone', 'Disseverment', 'Foot Kick', 'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage',
		'Paralyzing Triad', 'Seedspray', 'Sinker Drill', 'Vanity Dive', 'Cannonball', 'Delta Thrust',
		'Glutinous Dart', 'Grand Slam', 'Quad. Continuum', 'Sprout Smack', 'Benthic Typhoon', 'Helldive',
		'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats', 'Heavy Strike'
	}

	PhysicalBlueMagic = S {
		'Asuran Claws', 'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 'Queasyshroom',
		'Power Attack', 'Ram Charge', 'Saurian Slide', 'Screwdriver', 'Sickle Slash', 'Smite of Rage',
		'Spinal Cleave', 'Spiral Spin', 'Sweeping Gouge', 'Terror Touch'
	}

	PhysicalBlueMagic_STR = S {
		'Battle Dance', 'Bloodrake', 'Death Scissors', 'Dimensional Death', 'Empty Thrash',
		'Quadrastrike', 'Uppercut', 'Tourbillion', 'Sinker Drill', 'Thrashing Assault', 'Vertical Cleave',
		'Whirl of Rage'
	}

	PhysicalBlueMagic_DEX = S {
		'Amorphic Spikes', 'Barbed Crescent', 'Claw Cyclone', 'Disseverment', 'Foot Kick',
		'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage', 'Paralyzing Triad', 'Seedspray',
		'Vanity Dive'
	}

	PhysicalBlueMagic_VIT = S {
		'Cannonball', 'Delta Thrust', 'Glutinous Dart', 'Grand Slam', 'Quad. Continuum',
		'Sprout Smack'
	}

	PhysicalBlueMagic_AGI = S {
		'Benthic Typhoon', 'Helldive', 'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats'
	}

	BlueMagic_PhysicalAcc = S {
		'Heavy Strike'
	}

	MagicalSpells = S {
		'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind',
		'Firespit', 'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Nectarous Deluge',
		'Polar Roar', 'Regurgitation', 'Rending Deluge', 'Scouring Spate', 'Searing Tempest', 'Silent Storm',
		'Spectral Floe', 'Subduction', 'Sudden Lunge', 'Tem. Upheaval', 'Thermal Pulse', 'Thunderbolt', 'Uproot', 'Mighty Guard',
		'Water Bomb', 'Atra. Libations', 'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me', 'Blazing Bound',
		'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush', 'Blinding Fulgor', 'Diffusion Ray', 'Ice Break',
		'Magic Hammer', 'Rail Cannon', 'Retinal Glare', 'Embalming Earth', 'Entomb', 'Sandspin', 'Vapor Spray'
	}

	BlueMagic_INT = S {
		'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind', 'Firespit',
		'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Nectarous Deluge', 'Polar Roar',
		'Regurgitation', 'Rending Deluge', 'Scouring Spate', 'Searing Tempest', 'Silent Storm', 'Spectral Floe',
		'Subduction', 'Tem. Upheaval', 'Thermal Pulse', 'Thunderbolt', 'Uproot', 'Water Bomb'
	}

	BlueMagic_Dark = S {
		'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me',
		'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush'
	}

	BlueMagic_Light = S {
		'Blinding Fulgor', 'Diffusion Ray', 'Magic Hammer', 'Rail Cannon', 'Retinal Glare'
	}

	--- here if you need it for earth spells but down below, nuking these spells goes to the same int nuke set at others. I don't carry the neck
	BlueMagic_Earth = S {
		'Embalming Earth', 'Entomb', 'Sandspin'
	}

	BlueMagic_Accuracy = S {
		'1000 Needles', 'Absolute Terror', 'Auroral Drape', 'Awful Eye', 'Blank Gaze', 'Blistering Roar', 'Blitzstrahl',
		'Blood Drain', 'Blood Saber', 'Chaotic Eye', 'Cimicine Discharge', 'Cold Wave', 'Digest', 'Corrosive Ooze',
		'Demoralizing Roar', 'Dream Flower', 'Enervation', 'Feather Tickle', 'Filamented Hold', 'Frightful Roar',
		'Geist Wall', 'Hecatomb Wave', 'Infrasonics', 'Light of Penance', 'Lowing', 'Mind Blast', 'Mortal Ray',
		'MP Drainkiss', 'Osmosis', 'Reaving Wind', 'Sheep Song', 'Soporific', 'Sound Blast', 'Stinking Gas',
		'Venom Shell', 'Voracious Trunk', 'Yawn'
	}

	BlueMagic_Breath = S {
		'Bad Breath', 'Flying Hip Press', 'Final Sting', 'Frost Breath', 'Heat Breath', 'Magnetite Cloud',
		'Poison Breath', 'Radiant Breath', 'Self Destruct', 'Thunder Breath', 'Vapor Spray', 'Wind Breath'
	}

	BlueMagic_Buffs = S {
		'Barrier Tusk', 'Cocoon', 'Erratic Flutter', 'Harden Shell', 'Orcish Counterstance',
		'Plasma Charge', 'Pyric Bulwark', 'Memento Mori', 'Nat. Meditation', 'Reactor Cool', 'Saline Coat', 
		'Feather Barrier','Refueling','Warm-Up', 'Zephyr Mantle', 'Reactor Cool', 'Plasma Charge', 'Amplification'
	}

	BlueMagic_Skill = S {
		'Diamondhide', 'Metallic Body', 'Magic Barrier', 'Occultation', 'Atra. Libations'
	}

	BlueMagic_Healing = S {
		'Healing Breeze', 'Magic Fruit', 'Plenilune Embrace', 'Pollen', 'Restoral', 'Wild Carrot'
	}
--- Acc + Macc "Stun" set ---
	BlueMagic_Stun = S {
		'Frypan', 'Head Butt', 'Sudden Lunge', 'Tail slap', 'Whirl of Rage', 'Sub-zero Smash'
	}
	BlueMagic_Enmity = S {
		'Actinic Burst', 'Exuviation', 'Fantod', 'Jettatura', 'Temporal Shift'
	}
	BlueMagic_Diffusion = S {
		 'Harden Shell', 'Mighty Guard', 'Carcharian Verve'
	}
end

function msg(str)
	send_command('@input /echo <----- ' .. str .. ' ----->')
end