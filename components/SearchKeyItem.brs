sub init()
    m.bg = m.top.findNode("keyBg")
    m.focus = m.top.findNode("focusBg")
    m.focusLine = m.top.findNode("focusLine")
    m.shadow = m.top.findNode("shadow")
    m.label = m.top.findNode("keyLabel")
end sub

sub onContent()
    c = m.top.itemContent
    if c <> invalid then m.label.text = c.title
end sub

sub onFocus()
    m.focus.visible = m.top.itemHasFocus
    m.focusLine.visible = m.top.itemHasFocus
    if m.top.itemHasFocus then m.bg.color = "0xFFE18AFF" else m.bg.color = "0x202838F2"
    if m.top.itemHasFocus then m.label.color = "0xFFFFFFFF" else m.label.color = "0xE0E8E3FF"
end sub

sub updateLayout()
    w = m.top.width : h = m.top.height
    if w <= 0 then w = 80
    if h <= 0 then h = 46
    m.bg.width = w : m.bg.height = h
    m.shadow.width = w : m.shadow.height = h
    m.focus.width = w : m.focus.height = h
    m.focusLine.width = w : m.focusLine.translation = [0, h - 3]
    m.label.width = w : m.label.height = h
end sub
