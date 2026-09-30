sub init()
    m.downSignal = 0
    m.leftSignal = 0
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if not press then return false
    content = m.top.content
    count = 0
    if content <> invalid then count = content.getChildCount()
    if count <= 0 then return false
    idx = m.top.itemFocused
    if idx < 0 then idx = 0
    if key = "down"
        m.downSignal = m.downSignal + 1
        m.top.exitDown = m.downSignal
        return true
    else if key = "left" and idx = 0
        m.leftSignal = m.leftSignal + 1
        m.top.exitLeft = m.leftSignal
        return true
    end if
    return false
end function
