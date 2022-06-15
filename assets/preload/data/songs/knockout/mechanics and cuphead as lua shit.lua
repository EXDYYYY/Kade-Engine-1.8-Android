-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz
local floatshit = 0
local greens = 0;
local animation = true;
local greenshit = {0, 1, 2}
local bluesshit = {0, 1}
local blues = 0;
local greensounds = 0
local bluesounds = 0
local ga = 'GreenShit01 instance 1'
local ba = 'BulletFX_H-Tween_02 instance 1'
local cupheadshooting = false;
local cupheadpeassss = false;
local cardthingy = 0;
local canattack = false;
local canstilladdmore = true;
local animationbf = true;
local ohshit = false;
local cardfully = 0;
local cardnotfully = 0;
local attacked = false;
function onCreate()

	makeAnimationList();
	makeOffsets();
	
	-- dude from indie cross 
	makeAnimatedLuaSprite('cuphead', 'characters/Cuphead Pissedtgfirl',  getProperty('dad.x'), getProperty('dad.y'));
	addAnimationByPrefix('cuphead', 'idle', '1 instance 1', 24, false);
	addAnimationByPrefix('cuphead', 'singLEFT', 'Left instance 1', 24, false);
	addAnimationByPrefix('cuphead', 'singDOWN', 'Down instance 1', 24, false);
	addAnimationByPrefix('cuphead', 'singUP', 'Up instance 1', 24, false);
	addAnimationByPrefix('cuphead', 'singRIGHT', 'Right instance 1', 24, false);
    addAnimationByPrefix('cuphead', 'hadoken', 'Hadoken!! instance 1', 24, false);
	addAnimationByPrefix('cuphead', 'die', 'DIE BITCH instance 1', 24, true);
	addAnimationByPrefix('cuphead', 'ouch', 'Ouch instance 1', 24, false);
	addAnimationByPrefix('cuphead', 'singLEFT-alt', 'Pewleft instance 1', 24, false);
	addAnimationByPrefix('cuphead', 'singDOWN-alt', 'pewdown instance 1', 24, false);
	addAnimationByPrefix('cuphead', 'singUP-alt', 'PewUp instance 1', 24, false);
	addAnimationByPrefix('cuphead', 'singRIGHT-alt', 'PewRight instance 1', 24, false);
	addAnimationByPrefix('cuphead', 'oh shit', 'Phase 2 instance 1', 24, false);
   
	if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
		cardfully = 100
		cardnotfully = 0
	else
		cardfully = 600
		cardnotfully = 500
	end

	makeLuaSprite('card', 'cardfull',  1100 - 100, cardfully);
	setObjectCamera('card', 'hud')
	addLuaSprite('card', true)
	setProperty('card.scale.y', 0.01)
	setProperty('card.alpha', 0)

	makeAnimatedLuaSprite('cardnotflipped', 'Cardcrap',  1100 - 100, cardnotfully);
	addAnimationByPrefix('cardnotflipped', 'popoutnormal', 'Card Normal Pop out instance 1', 24, false);
	addAnimationByPrefix('cardnotflipped', 'popoutparry', 'PARRY Card Pop out  instance 1', 24, false);
	addAnimationByPrefix('cardnotflipped', 'byehaveagreattime', 'Card Used instance 1', 24, false);
	addLuaSprite('cardnotflipped', true)
	setObjectCamera('cardnotflipped', 'hud')
	setProperty('cardnotflipped.alpha', 0)

    setProperty('cuphead.scale.x', 3.2)
    setProperty('cuphead.scale.y', 3.2)
	
	addLuaSprite('cuphead', true);

    setProperty('dad.visible', false)

	playAnimation('cuphead', 4, true);

	makebfAnimationList();
	makebfOffsets();
    makemissAnimationList();
    makemissOffsets();
	
	-- boxing guy
	makeAnimatedLuaSprite('bf', 'characters/BoyFriend_Rain',  getProperty('boyfriend.x'), getProperty('boyfriend.y'));
	addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false);
	addAnimationByPrefix('bf', 'singLEFT', 'BF NOTE LEFT instance 1', 24, false);
	addAnimationByPrefix('bf', 'singDOWN', 'BF NOTE DOWN instance 1', 24, false);
	addAnimationByPrefix('bf', 'singUP', 'BF NOTE UP instance 1', 24, false);
	addAnimationByPrefix('bf', 'singRIGHT', 'BF NOTE RIGHT instance 1', 24, false);
    addAnimationByPrefix('bf', 'singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
	addAnimationByPrefix('bf', 'singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
	addAnimationByPrefix('bf', 'singUPmiss', 'BF NOTE UP MISS', 24, false);
	addAnimationByPrefix('bf', 'singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
    addAnimationByPrefix('bf', 'attack', '0BF attack instance', 24, false);
	addAnimationByPrefix('bf', 'dodge', 'boyfriend dodge', 24, false);
	scaleObject('bf', 2, 2)

    setProperty('bf.flipX', false)
    setProperty('boyfriend.visible', false)
    setProperty('gf.visible', false)
	
	addLuaSprite('bf', true);

	playbfAnimation('bf', 4, true);

	makeAnimatedLuaSprite('Hadoken', 'bull/CupheadHadoken', getProperty('dad.x') - 400, getProperty('dad.y'));
	addAnimationByPrefix('Hadoken', 'burstfx', 'Hadolen instance 1', 25, true);
	addLuaSprite('Hadoken', false); 
	scaleObject('Hadoken', 4, 4)

	makeAnimatedLuaSprite('bluesshit', 'bull/Cupheadshoot', getProperty('dad.x') + 150, getProperty('dad.y') + -310);
    addAnimationByPrefix('bluesshit', '1', 'BulletFX_H-Tween_02 instance 1', 25, false);
	addLuaSprite('bluesshit', false);

	makeAnimatedLuaSprite('greenshit', 'bull/GreenShit', getProperty('dad.x') + 216, getProperty('dad.y') + -147);
    addAnimationByPrefix('greenshit', '1', ga, 25, false);
	addLuaSprite('greenshit', false);

	makeAnimatedLuaSprite('mugman', 'characters/Mugman Fucking dies',  500, 500 - 80);
	addAnimationByPrefix('mugman', 'whatalovelyday', 'Mugman instance 1', 24, false);
	addAnimationByPrefix('mugman', 'familyguydeadpose', 'MUGMANDEAD YES instance 1', 24, false);
	objectPlayAnimation('mugman', 'whatalovelyday')
	addLuaSprite('mugman', true)

	makeAnimatedLuaSprite('HOLYSHITYOUKILLEDYOURBROTHER', 'knock',  getProperty('dad.x'), 300);
	addAnimationByPrefix('HOLYSHITYOUKILLEDYOURBROTHER', 'knockout', 'A KNOCKOUT!', 24, false);
	addLuaSprite('HOLYSHITYOUKILLEDYOURBROTHER', true)

	makeAnimatedLuaSprite('dodgebutton', 'Notmobilegameanymore',  0, 506);
	setProperty('dodgebutton.scale.x', 1)
	setProperty('dodgebutton.scale.y', 1)
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'dodge', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'dodgeclick', 'Dodge click instance 1', 24, false);
	addLuaSprite('dodgebutton', true)

	makeAnimatedLuaSprite('attackbutton', 'Notmobilegameanymore',  1079,  573);
	setProperty('attackbutton.scale.x', 1)
	setProperty('attackbutton.scale.y', 1)
	setObjectCamera('attackbutton', 'hud')
	addAnimationByPrefix('attackbutton', 'attack', 'Attack instance 1', 24, false);
	addAnimationByPrefix('attackbutton', 'attackclick', 'Attack Click instance 1', 24, false);
	objectPlayAnimation('attackbutton', 'attack')
	addLuaSprite('attackbutton', true)

	setProperty('attackbutton.alpha', 0.5)
	setProperty('dodgebutton.alpha', 0.5)
	
	runTimer('precacheshit', 0.3 , 1)
end

function onCreatePost()
	makeLuaSprite('cupbar', 'cuphealthbar', getProperty('healthBar.x') - 20 ,getProperty('healthBar.y') - 20)
	setObjectCamera('cupbar', 'hud')
	addLuaSprite('cupbar', true)
	setObjectOrder('cupbar', 25)
	-- debugPrint(getObjectOrder('healthBar'))
	setProperty('oldScore.y', getProperty('oldScore.y') + 10)
	setTextFont('oldScore', 'rubik')
	setTextFont('funnikade', 'rubik')
end


animationsList = {}
holdTimers = {cuphead = -1.0};
noteDatas = {cuphead = 0};
function makeAnimationList()
	if not ohshit then
	if not cupheadshooting then
	animationsList[0] = 'singLEFT';
	animationsList[1] = 'singDOWN';
	animationsList[2] = 'singUP';
	animationsList[3] = 'singRIGHT';
	if cupheadpeassss == true then
    animationsList[4] = 'die';
	else
		animationsList[4] = 'idle';	
	end
	animationsList[5] = 'die';
    else
		animationsList[0] = 'singLEFT-alt';
		animationsList[1] = 'singDOWN-alt';
		animationsList[2] = 'singUP-alt';
		animationsList[3] = 'singRIGHT-alt';
		if cupheadpeassss == true then
			animationsList[4] = 'die';
		else
			animationsList[4] = 'idle';	
		end
	end
    else
		animationsList[0] = 'singLEFT';
		animationsList[1] = 'singDOWN';
		animationsList[2] = 'singUP';
		animationsList[3] = 'singRIGHT';
		animationsList[4] = 'oh shit';	
	end
end

function mugmanfuckingdies()
	makeAnimatedLuaSprite('mugman', 'characters/Mugman Fucking dies',  1000, getProperty('boyfriend.y') + 50);
	addAnimationByPrefix('mugman', 'whatalovelyday', 'Mugman instance 1', 24, false);
	addAnimationByPrefix('mugman', 'familyguydeadpose', 'MUGMANDEAD YES instance 1', 24, false);
	objectPlayAnimation('mugman', 'whatalovelyday')
	addLuaSprite('mugman', true)
end

function AKNOCKOUT()
	makeAnimatedLuaSprite('HOLYSHITYOUKILLEDYOURBROTHER', 'knock',  getProperty('dad.x') + 300, 100);
	addAnimationByPrefix('HOLYSHITYOUKILLEDYOURBROTHER', 'knockout', 'A KNOCKOUT!', 24, false);
	setObjectCamera('HOLYSHITYOUKILLEDYOURBROTHER', 'hud')
	addLuaSprite('HOLYSHITYOUKILLEDYOURBROTHER', true)
	playSound('knockout', 1)
	doTweenAlpha('damn', 'HOLYSHITYOUKILLEDYOURBROTHER', 0, 5, 'circInOut')
end

offsetscuphead = {};
function makeOffsets()
	if not ohshit then
	if not cupheadshooting then
	offsetscuphead[0] = {x = 149, y = 7}; --left
	offsetscuphead[1] = {x = 4, y = -30}; --down
	offsetscuphead[2] = {x = 32, y = 120}; --up
	offsetscuphead[3] = {x = 3, y = 27}; --right
	if cupheadpeassss == true then
		offsetscuphead[4] = {x = 6, y = -13}; --shoot anim
	else
	offsetscuphead[4] = {x = 0, y = 0}; --idle
	end
    else
		offsetscuphead[0] = {x = 150, y = -10}; --left
		offsetscuphead[1] = {x = 0, y = 0}; --down
		offsetscuphead[2] = {x = 42, y = 91}; --up
		offsetscuphead[3] = {x = 10, y = 30}; --right
		if cupheadpeassss == true then
			offsetscuphead[4] = {x = 6, y = -13}; --shoot anim
		else
		offsetscuphead[4] = {x = 0, y = 0}; --idle
		end
	end
    else
		offsetscuphead[0] = {x = 149, y = 7}; --left
		offsetscuphead[1] = {x = 4, y = -30}; --down
		offsetscuphead[2] = {x = 32, y = 120}; --up
		offsetscuphead[3] = {x = 3, y = 27}; --right
		offsetscuphead[4] = {x = 0, y = -20}; --idle
	end
end

bfanimationlist = {}
missanimationsList = {}
holdTimersbf = {bf = -1.0};
noteDatasbf = {bf = 0};
function makebfAnimationList()
	bfanimationlist[0] = 'singLEFT';
	bfanimationlist[1] = 'singDOWN';
	bfanimationlist[2] = 'singUP';
	bfanimationlist[3] = 'singRIGHT';
    bfanimationlist[4] = 'idle';
end

function makemissAnimationList()
	missanimationsList[0] = 'singLEFTmiss';
	missanimationsList[1] = 'singDOWNmiss';
	missanimationsList[2] = 'singUPmiss';
	missanimationsList[3] = 'singRIGHTmiss';
end


offsetsbf = {};
missoffsetsbf = {};
function makebfOffsets()
	offsetsbf[0] = {x = -11, y = 5}; --left
	offsetsbf[1] = {x = -8, y = 4}; --down
	offsetsbf[2] = {x = -7, y = -4}; --up
	offsetsbf[3] = {x = -3, y = 1}; --right
    offsetsbf[4] = {x = -5, y = -2}; --idle
end

function makemissOffsets()
	missoffsetsbf[0] = {x = -8, y = -3}; --left
	missoffsetsbf[1] = {x = -7, y = -1}; --down
	missoffsetsbf[2] = {x = -5, y = -8}; --up
	missoffsetsbf[3] = {x = -6, y = 0}; --right
end

function plusshit()
	cardthingy = cardthingy + 0.5
	-- debugPrint('card number: ', cardthingy)
end

function carddoesthething()
	setProperty('card.alpha', 0)
    setProperty('cardnotflipped.alpha', 1)
	objectPlayAnimation('cardnotflipped', 'popoutnormal')
	setProperty('cardnotflipped.offset.y', -10)
    canattack = true;
	canstilladdmore = false
	setProperty('card.scale.y', 0.01)
	setProperty('card.y', cardfully)
end

function carddoesthethingparry()
	setProperty('card.alpha', 0)
    setProperty('cardnotflipped.alpha', 1)
	objectPlayAnimation('cardnotflipped', 'popoutparry')
	setProperty('cardnotflipped.offset.y', -10)
    canattack = true;
	canstilladdmore = false
	setProperty('card.scale.y', 0.01)
	setProperty('card.y', cardfully)
end

function cardgoback()
	setProperty('cardnotflipped.alpha', 0)
	canstilladdmore = true
end

function opponentNoteHit(id, d, noteType, isSustainNote)
		if not isSustainNote then
			noteDatas.cuphead = d;
		end	
	characterToPlay = 'cuphead'
	animToPlay = noteDatas.cuphead;
	holdTimers.cuphead = 0;
			
    if animation then
	playAnimation(characterToPlay, animToPlay, true);
	if cupheadshooting then
	if not isSustainNote then
    spawnthegreens(greenshit[math.floor(math.random() * 3)])
	end
    end
    end
end


function noteMiss(id, d, noteType, isSustainNote)
	-- Called after the note miss calculations
	-- Player missed a note by letting it go offscreen

    if not isSustainNote then
		noteDatasbf.bf = d;
	end	

	characterToPlay = 'bf'
	animToPlay = noteDatasbf.bf;
	holdTimersbf.bf = 0;
			
    if animationbf then
	playMissAnimation(characterToPlay, animToPlay, true);
    end
end

function goodNoteHit(id, d, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
	if not isSustainNote then
		noteDatasbf.bf = d;
	end	
	characterToPlay = 'bf'
	animToPlay = noteDatasbf.bf;
	holdTimersbf.bf = 0;
			
    if animationbf then
	playbfAnimation(characterToPlay, animToPlay, true);
    end

	if canstilladdmore then
	if not isSustainNote then
	setProperty('card.scale.y', getProperty('card.scale.y') + 0.01)
	setProperty('card.y', getProperty('card.y') - 0.5)
	setProperty('card.alpha', 1)
	-- debugPrint(getProperty('card.scale.y'))
	end
	end

	if noteType == 'Parry note' then
		playSound('parry', 1)
		if canstilladdmore then
		carddoesthethingparry();
		end
	end

end
function spawnthegreens(gd)
    greens = greens + 1
	greensounds = greensounds + 1

	if gd == 0 then
       ga = 'GreenShit01 instance 1'
	elseif gd == 1 then
	   ga = 'GreenShit02 instance 1'
	else
	   ga = 'Greenshit03 instance 1'
	end

	if greensounds > 4 then
		greensounds = 0
    end

	setProperty('health', getProperty('health') - 0.01)

	makeAnimatedLuaSprite('greenshit' .. greens, 'bull/GreenShit', getProperty('dad.x') + 216, getProperty('dad.y') + -99);
    addAnimationByPrefix('greenshit'.. greens, '1', ga, 25, false);
	addLuaSprite('greenshit' .. greens, true);
	playSound('attacks/chaser' .. greensounds , 1)
end

function spawntheblues(bd)
    blues = blues + 1
	bluesounds = bluesounds + 1

	if bluesounds > 5 then
		bluesounds = 0
    end

	makeAnimatedLuaSprite('bluesshit' .. blues, 'bull/Cupheadshoot', getProperty('dad.x') + 280, getProperty('dad.y') + -270);
	setProperty('bluesshit' .. blues .. 'scale.x', 0.3)
	setProperty('bluesshit' .. blues .. 'scale.y', 0.3)
    addAnimationByPrefix('bluesshit'.. blues, '1', 'BulletFX_H-Tween_02 instance 1', 25, false);
	addLuaSprite('bluesshit' .. blues, true);
	playSound('attacks/pea' .. bluesounds , 0.6)
	-- playAnimation('cuphead', 5 , false)
end
	

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
    if animation then
	if holdTimers.cuphead >= 0 then
		holdTimers.cuphead = holdTimers.cuphead + elapsed;
		if holdTimers.cuphead >= holdCap then
			playAnimation('cuphead', 4, false);
			holdTimers.cuphead = -1;
		end
	end
    end
	if animationbf then
	holdCapbf = stepCrochet * 0.004;
	if holdTimersbf.bf >= 0 then
		holdTimersbf.bf = holdTimersbf.bf + elapsed;
		if holdTimersbf.bf >= holdCapbf then
			playbfAnimation('bf', 4, false);
			holdTimersbf.bf = -1;
		end
	end
    end
end

function onUpdatePost()
    if getProperty('cuphead.animation.curAnim.name') == 'hadoken' then
        if getProperty('cuphead.animation.curAnim.finished') then
        animation = true
        end
    end

	if getProperty('cuphead.animation.curAnim.name') == 'ouch' then
        if getProperty('cuphead.animation.curAnim.finished') then
        animation = true
        end
    end

	if getProperty('attackbutton.animation.curAnim.name') == 'attackclick' then
        if getProperty('attackbutton.animation.curAnim.finished') then
        objectPlayAnimation('attackbutton', 'attack')
        end
    end

	if getProperty('dodgebutton.animation.curAnim.name') == 'dodgeclick' then
        if getProperty('dodgebutton.animation.curAnim.finished') then
        objectPlayAnimation('dodgebutton', 'dodge')
        end
    end

	if getProperty('bf.animation.curAnim.name') == 'attack' then
        if getProperty('bf.animation.curAnim.curFrame') == 9 then
			animation = false
			cupheadpeassss = false;
			makeAnimationList()
			makeOffsets()
            objectPlayAnimation('cuphead', 'ouch') 
            setProperty('cuphead.offset.x', 147)
            setProperty('cuphead.offset.y', 0)
        end
    end

	if getProperty('cardnotflipped.animation.curAnim.name') == 'byehaveagreattime' then
        if getProperty('cardnotflipped.animation.curAnim.finished') then
        cardgoback()
        end
    end

    if getProperty('bf.animation.curAnim.name') == 'attack' then
        if getProperty('bf.animation.curAnim.finished') then
        animationbf = true
        end
    end

	if getProperty('bf.animation.curAnim.name') == 'dodge' then
        if getProperty('bf.animation.curAnim.finished') then
        animationbf = true
        end
    end

	for i = 0,greens do
		if getProperty('greenshit' .. i .. '.animation.curAnim.finished') then
			removeLuaSprite('greenshit' .. i);
		end
	end

	for i = 0,blues do
		if getProperty('bluesshit' .. i .. '.animation.curAnim.finished') then
			removeLuaSprite('bluesshit' .. i);
		end
	end
	-- if cardthingy == 10 then
	-- 	objectPlayAnimation('card', '1')
	-- elseif cardthingy == 20 then
	-- 	objectPlayAnimation('card', '2')
	-- elseif cardthingy == 30 then
	--     objectPlayAnimation('card', '3')
	-- elseif cardthingy == 40 then 
	-- 	objectPlayAnimation('card', '4')
	-- elseif cardthingy == 50 then 
	-- 	objectPlayAnimation('card', '5')
	-- elseif cardthingy == 60 then 
	-- 	objectPlayAnimation('card', '6')
	-- elseif cardthingy == 70 then 
	-- 	objectPlayAnimation('card', '7')
	-- elseif cardthingy == 80 then 
	-- 	objectPlayAnimation('card', '8')
	-- elseif cardthingy == 90 then 
	-- 	objectPlayAnimation('card', '9')
	-- elseif cardthingy == 100 then 
	-- 	objectPlayAnimation('card', '10')
	-- elseif cardthingy == 110 then 
	-- 	carddoesthething()
	-- elseif cardthingy == 0 then
	-- 	objectPlayAnimation('card', '0')
	-- end

	if getProperty('card.scale.y') > 0.9 then
	   if canstilladdmore then
       carddoesthething()
	   end
	end


	-- i fucking hate math istg this is so shit

	if canattack == true and (getMouseX('camHUD') > 1079 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 573 and getMouseY('camHUD') < 720 and mouseClicked('left')) then  
		attacked = true;
		objectPlayAnimation('cardnotflipped', 'byehaveagreattime') 
		setProperty('cardnotflipped.offset.x', -5)
		setProperty('cardnotflipped.offset.y', -30)
		animationbf = false  
		runTimer('hurtsound', 0.3, 1)
		setProperty('health', getProperty('health') + 0.5)
		objectPlayAnimation('bf', 'attack') 
		setProperty('bf.offset.x', 9)
		setProperty('bf.offset.y', -3)
        canattack = false
		objectPlayAnimation('attackbutton', 'attackclick')
    end
end


function onCountdownTick(counter)
	beatHitDance(counter);
	bfbeatHitDance(curBeat);
end

function onBeatHit()
	beatHitDance(curBeat);
	bfbeatHitDance(curBeat);
end

function beatHitDance(counter)
    if animation then
	if counter % 1 == 0 then
		if holdTimers.cuphead < 0 then
            if animation then
			playAnimation('cuphead', 4, false);
            end
		end
	end
    end
end



function playAnimation(character, animId, forced)
	-- 0 = idle
	-- 1 = singLEFT
	-- 2 = singDOWN
	-- 3 = singUP
	-- 4 = singRIGHT
	animName = animationsList[animId];
	--debugPrint(animName);
	if character == 'cuphead' then
		objectPlayAnimation('cuphead', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
		setProperty('cuphead.offset.x', offsetscuphead[animId].x);
		setProperty('cuphead.offset.y', offsetscuphead[animId].y);
	end
end

function bfbeatHitDance(counter)
    if animationbf then
	if counter % 2 == 0 then
		if holdTimersbf.bf < 0 then
			playbfAnimation('bf', 4, false);
		end
	end
    end
end

function playbfAnimation(character, animId, forced)
	-- 0 = idle
	-- 1 = singLEFT
	-- 2 = singDOWN
	-- 3 = singUP
	-- 4 = singRIGHT
	animName = bfanimationlist[animId];
	--debugPrint(animName);
	if character == 'bf' then
		objectPlayAnimation('bf', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
		setProperty('bf.offset.x', offsetsbf[animId].x);
		setProperty('bf.offset.y', offsetsbf[animId].y);
	end
end

function playMissAnimation(character, animId, forced)
	-- 0 = idle
	-- 1 = singLEFT
	-- 2 = singDOWN
	-- 3 = singUP
	-- 4 = singRIGHT
	animName = missanimationsList[animId];
	--debugPrint(animName);
	if character == 'bf' then
		objectPlayAnimation('bf', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
		setProperty('bf.offset.x', missoffsetsbf[animId].x);
		setProperty('bf.offset.y', missoffsetsbf[animId].y);
	end
end

function onTimerCompleted(t, l, ll)
	if t == 'precacheshit' then
       removeLuaSprite('bluesshit', false)
	   removeLuaSprite('greenshit', false)
	   removeLuaSprite('Hadoken', false)
	   removeLuaSprite('mugman', false)
	   removeLuaSprite('HOLYSHITYOUKILLEDYOURBROTHER', false)
	end
	if t == 'hurtsound' then
		playSound('hurt', 1)
	end
	if t == 'shootsound' then
		playSound('shoot', 1)
	end
	if t == 'dodge' then
		playSound('pre_shoot', 1)
		objectPlayAnimation('bf', 'dodge', false)
		setProperty('bf.offset.x', -10);
		setProperty('bf.offset.y', -16);
		animationbf = false;
	end
end

local splittc;

function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch('(.-)'..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function onEvent(n,v1,v2)
	if n == 'tween zoom camera' then
		splittc = Split(tostring(v1), ', ');
		doTweenZoom('zoommy', tostring(splittc[1]), tonumber(splittc[2]), tonumber(splittc[3]), tostring(splittc[4]))
    end
	if n == 'default zoom camera' then
        setProperty('defaultCamZoom', tonumber(v1))
    end
    if n == 'hadouken' then
        objectPlayAnimation('cuphead', 'hadoken', true);
		setProperty('cuphead.offset.x', 370);
		setProperty('cuphead.offset.y', 260);
        animation = false
		runTimer('dodge', 0.8, 1)
		playSound('pre_shoot', 1)
		runTimer('shootsound', 0.4, 1)
    end
	if n == 'cuphead pea' then
	   attacked = false;
	   cupheadpeassss = true;

	   makeAnimationList()
	   makeOffsets()
	end
	if n == 'shoot the mf' then
		if cupheadpeassss then
		spawntheblues(bluesshit[math.floor(math.random() * 2)])
		if not attacked then
		setProperty('health', getProperty('health') - 0.08)
		end
		end
	end
	if n == 'chaser moment' then
		cupheadshooting = v1 == "true"

		makeAnimationList();
		makeOffsets();
	end
	if n == 'botplay attack' then
		if getProperty('cpuControlled') == true then
		objectPlayAnimation('cardnotflipped', 'byehaveagreattime') 
		animationbf = false  
		runTimer('hurtsound', 0.3, 1)
		setProperty('health', getProperty('health') + 0.5)
		objectPlayAnimation('bf', 'attack') 
		setProperty('bf.offset.x', 9)
		setProperty('bf.offset.y', -3)
		end
	end
	if n == 'roundabout' then
		objectPlayAnimation('cuphead', 'hadoken', true);
		setProperty('cuphead.offset.x', 370);
		setProperty('cuphead.offset.y', 260);
        animation = false
		runTimer('dodge', 1.2, 1)
		runTimer('shootsound', 0.3, 1)
	end
	if n == 'mugman fucking dies' then
		mugmanfuckingdies()
	end
	if n == 'knockout' then
		AKNOCKOUT()
	end
	if n == 'oh shit' then
		ohshit = true
		makeAnimationList()
		makeOffsets()
	end
	if n == 'the brawl is surely brewing' then
		ohshit = false
	end
end

function onTweenCompleted(t) 
	if t == 'weeeeeroundabout1' then
		animationbf = false
       runTimer('dodge', 0.5, 1)
	end
	if t == 'zoommy' then
        setProperty('defaultCamZoom', tonumber(splittc[2]))
	end
 end
