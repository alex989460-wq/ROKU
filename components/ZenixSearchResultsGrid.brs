sub init()
    m.leftSignal = 0
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if not press then return false
    content = m.top.content
    count = 0
    if content <> invalid then count = content.getChildCount()
    if count <= 0 then return false
    cols = m.top.numColumns
    if cols <= 0 then cols = 4
    idx = m.top.itemFocused
    if idx < 0 then idx = 0
    if key = "up" and idx < cols then return true
    if key = "down" and idx + cols >= count then return true
    if key = "right" and ((idx mod cols) = cols - 1 or idx = count - 1) then return true
    if key = "left" and (idx mod cols) = 0
        m.leftSignal = m.leftSignal + 1
        m.top.exitLeft = m.leftSignal
        return true
    end if
    return false
end function
