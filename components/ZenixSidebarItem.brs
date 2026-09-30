sub init()
    m.outer = m.top.findNode("outer")
    m.inner = m.top.findNode("inner")
    m.focusBg = m.top.findNode("focusBg")
    m.focusAccent = m.top.findNode("focusAccent")
    m.title = m.top.findNode("title")
end sub

sub onContent()
    c = m.top.itemContent
    if c = invalid then return
    m.title.text = c.title
    updateVisual()
end sub

sub onFocus()
    updateVisual()
end sub

sub updateVisual()
    focused = m.top.itemHasFocus
    selected = false
    if m.top.itemContent <> invalid and m.top.itemContent.shortDescriptionLine1 = "selected" then selected = true
    m.focusBg.visible = focused
    m.focusAccent.visible = focused or selected
    if focused
        m.outer.color = "0xF4C95DFF"
        m.focusBg.color = "0xD9203AFF"
        m.outer.opacity = 1.0
        m.title.color = "0xFFFFFFFF"
    else if selected
        m.outer.color = "0xF1263CFF"
        m.focusBg.visible = true
        m.focusBg.color = "0x252F40FF"
        m.title.color = "0xFFFFFFFF"
    else
        m.outer.color = "0x151C29EE"
        m.focusBg.color = "0x202A3AF8"
        m.outer.opacity = 1.0
        m.title.color = "0xDDE3EDFF"
    end if
end sub
