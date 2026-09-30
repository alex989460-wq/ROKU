sub init()
    m.outline = m.top.findNode("outline")
    m.card = m.top.findNode("card")
    m.title = m.top.findNode("title")
end sub

sub onContent()
    c = m.top.itemContent
    if c = invalid then return
    m.title.text = c.title
end sub

sub onFocus()
    ' Apenas a temporada onde o cursor/foco esta fica vermelha.
    ' Evita duas temporadas marcadas ao mesmo tempo (selecionada + focada).
    if m.top.itemHasFocus
        m.outline.color = "0xE61F31FF"
        m.card.color = "0xE61F31F2"
    else
        m.outline.color = "0x8D99ABFF"
        m.card.color = "0x111722E8"
    end if
end sub
