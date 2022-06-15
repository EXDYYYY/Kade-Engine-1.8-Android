function onCreatePost()

    makeAnimatedLuaSprite('r1', 'angry/NewRAINLayer', 130, 100);
    addAnimationByPrefix('r1', 'rain', 'RainFirstlayer instance', 24, true)

    makeLuaSprite('a0', 'angry/CH-RN-00', 0, 300);
    makeLuaSprite('a1', 'angry/CH-RN-01', 0, 300);
    makeLuaSprite('a2', 'angry/CH-RN-02', 0, 300);

    setObjectCamera('r1', 'hud')
    -- setObjectCamera('r2', 'hud')
    
    addLuaSprite('a0', false)
    addLuaSprite('a1', false)
    addLuaSprite('a2', false)

    addLuaSprite('r1', true)

    setProperty('a0.scale.x', 3.5)
    setProperty('a0.scale.y', 3.5)
    setProperty('a1.scale.x', 3.5)
    setProperty('a1.scale.y', 3.5)
    setProperty('a2.scale.x', 3.6)
    setProperty('a2.scale.y', 3.6)

    setProperty('r1.scale.x', 1.4)
    setProperty('r1.scale.y', 1.4)

    setProperty('r1.antialiasing', true)

    -- setProperty('r1.scale.x', 0.8)
    -- setProperty('r1.scale.y', 0.8)
    -- setProperty('r2.scale.x', 0.8)
    -- setProperty('r2.scale.y', 0.8)

    setScrollFactor('a0', 0.2, 0.2)
    setScrollFactor('a1', 0.4, 0.4)
    setScrollFactor('a2', 1, 1)
    -- setScrollFactor('a2', 0.5, 0.5)
end
