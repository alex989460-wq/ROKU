sub init()
    m.outer = m.top.findNode("outer")
    m.inner = m.top.findNode("inner")
    m.activeBg = m.top.findNode("activeBg")
    m.focusBg = m.top.findNode("focusBg")
    m.title = m.top.findNode("title")
    m.active = false
end sub

sub onContent()
    c = m.top.itemContent
    if c = invalid then return
    m.title.text = c.title
    m.active = (c.shortDescriptionLine2 = "active")
    m.activeBg.visible = m.active
end sub

sub onFocus()
    focused = m.top.itemHasFocus
    m.focusBg.visible = focused
    if focused
        m.outer.color = "0xFFE18AFF"
        m.outer.opacity = 1.0
        m.title.color = "0xFFFFFFFF"
    else
        m.outer.color = "0x566176FF"
        m.outer.opacity = 0.70
        m.title.color = "0xFFFFFFFF"
        m.activeBg.visible = m.active
    end if
end sub
