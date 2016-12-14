local tests = {}

local frame = CreateFrame('Frame')
frame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0)
frame:SetWidth(128)
frame:SetHeight(128)

local tex = frame:CreateTexture('ARTWORK')
tex:SetAllPoints(frame)
tex:SetBlendMode('ADD')
tex:SetTexture('Interface\\Icons\\Ability_Warrior_WarCry')
frame:Show()

local ag

local Setup = function()
    ag = frame:CreateAnimationGroup()
    ag:SetLooping('BOUNCE')
end
table.insert(tests, Setup)

local TranslationScaleRotationAlphaAnimation = function()
    local translation = ag:CreateAnimation('Translation')
    translation:SetOffset(100, 100)
    translation:SetDuration(1)
    translation:SetSmoothing('OUT')

    local scale = ag:CreateAnimation('Scale')
    scale:SetScale(0.5, 0.5)
    scale:SetDuration(1)
    scale:SetSmoothing('OUT')

    local rotation = ag:CreateAnimation('Rotation')
    rotation:SetDegrees(0)
    rotation:SetDuration(2)
    rotation:SetSmoothing('INOUT')

    local alpha = ag:CreateAnimation('Alpha')
    alpha:SetChange(-0.5)
    alpha:SetDuration(3)
    alpha:SetSmoothing('OUT')

    ag:Play()
end
table.insert(tests, TranslationScaleRotationAlphaAnimation)

local function OnEvent()
    for _, test in next, tests do
        test()
    end
end

frame:RegisterEvent('UPDATE_INSTANCE_INFO')
frame:SetScript('OnEvent', OnEvent)
