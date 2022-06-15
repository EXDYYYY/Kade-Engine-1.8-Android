local splashCount = 0;
local enabled = false;

local splashThing = 'PurpC instance 1';

local fuck = 0;

local sickTrack = 0;

local enableNewSystem = true; -- Toggles Psych Splashes or New Splashes On/Off

local texture = 'AllnoteSplashes';

-- No longer messes with your ClientPrefs! Which means Note Splashes no longer randomly turn off!

-- function onCreate()
-- 	preCacheShit()
-- end

function onCreatePost()
	if enableNewSystem then
		enabled = getPropertyFromClass('ClientPrefs', 'noteSplashes');
	else
		enabled = false;
	end
	makeAnimatedLuaSprite('noteSplashp', texture, 100, 100);
	addLuaSprite('noteSplashp');
	runTimer('precacheshit', 0.3, 1)
	setObjectCamera('noteSplashp', 'hud')
    -- setProperty('noteSplashp.alpha', 0.0)
end

function goodNoteHit(note, direction, type, sus)
	if sickTrack < getProperty('sicks') then
		sickTrack = sickTrack + 1;
		spawnCustomSplash(note, direction, type, sus);
	  end
end

function spawnCustomSplash(note, direction, type, sus)
	if enabled then
		splashCount = splashCount + 1;
		
		if type == 'Example Type' then
			texture = 'exampleSplashes';

		elseif type == 'Example Type 2' then
			texture = 'exampleSplashes';

		else
			texture = 'AllnoteSplashes';
		end

		makeAnimatedLuaSprite('noteSplash' .. splashCount, texture, getPropertyFromGroup('playerStrums', direction, 'x'), getPropertyFromGroup('playerStrums', direction, 'y'));

		if direction == 0 then
			splashThing = 'PurpC instance 1';
		elseif direction == 1 then
			splashThing = 'BlueC instance 1';
		elseif direction == 2 then
			splashThing = 'GreenC instance 1';
		else
			splashThing = 'RedC instance 1';
		end

		addAnimationByPrefix('noteSplash' .. splashCount, 'anim', splashThing, 22, false);
		addLuaSprite('noteSplash' .. splashCount);
		-- objectPlayAnimation('noteSplash' .. splashCount, 'anim')

		if type == 'Example Type' then
			setProperty('noteSplash' .. splashCount .. '.offset.x', -80);
			setProperty('noteSplash' .. splashCount .. '.offset.y', 200);
			setProperty('noteSplash' .. splashCount .. '.alpha', 0.2);

		elseif type == 'Example Type 2' then
			setProperty('noteSplash' .. splashCount .. '.offset.x', 0);
			setProperty('noteSplash' .. splashCount .. '.offset.y', 0);
			setProperty('noteSplash' .. splashCount .. '.alpha', 1);

		else
			setProperty('noteSplash' .. splashCount .. '.offset.x', 90);
			setProperty('noteSplash' .. splashCount .. '.offset.y', 100);
			-- setProperty('noteSplash' .. splashCount .. '.scale.y', 0.9);
			-- setProperty('noteSplash' .. splashCount .. '.scale.x', 0.9);
			setProperty('noteSplash' .. splashCount .. '.alpha', 0.6);
		end

		-- if direction == 0 then
		-- 	setProperty('noteSplash' .. splashCount .. '.offset.x', 90);
		-- end

		-- if direction == 1 then
		-- 	setProperty('noteSplash' .. splashCount .. '.offset.x', 90);
		-- end

		-- if direction == 4 then
		-- 	setProperty('noteSplash' .. splashCount .. '.offset.x', 90);
		-- end

		setObjectCamera('noteSplash' .. splashCount, 'hud');
		setObjectOrder('noteSplash' .. splashCount, 9999); -- this better make the splashes go in front-
		setObjectOrder('timeBarBG', 99999);
		setObjectOrder('timeBar', 999999);
		setObjectOrder('timeTxt', 9999999);
	end
end

function onUpdatePost()
	if enabled then
		for i = 0, splashCount do
			if getProperty('noteSplash' .. i .. '.animation.curAnim.finished') then
				removeLuaSprite('noteSplash' .. i);
			end
		end

		for i = 0, getProperty('grpNoteSplashes.length')-1 do
			setPropertyFromGroup('grpNoteSplashes', i, 'visible', false);
		end
	end
end
function onTimerCompleted(tag)
	if tag == 'precacheshit' then
		setProperty('noteSplashp.alpha', 0.0)
    end
end

-- function preCacheShit()
--     precacheImage(texture)
-- end