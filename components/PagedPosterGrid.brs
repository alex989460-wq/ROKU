sub init()
    m.downSignal = 0
    m.upSignal = 0
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if not press then return false

    content = m.top.content
    count = 0
    if content <> invalid then count = content.getChildCount()
    if count <= 0 then return false

    cols = m.top.numColumns
    if cols <= 0 then cols = 6
    idx = m.top.itemFocused
    if idx < 0 then idx = 0

    if key = "down"
        ' Se nao existe outro item abaixo, entrega o foco para a paginacao.
        if idx + cols >= count
            m.downSignal = m.downSignal + 1
            m.top.exitDown = m.downSignal
            return true
        end if
    else if key = "up"
        ' Na primeira linha, permite sair do grid para os controles superiores.
        if idx < cols
            m.upSignal = m.upSignal + 1
            m.top.exitUp = m.upSignal
            return true
        end if
    end if

    return false
end function
