sub init()
    m.frame = m.top.findNode("focusFrame")
    m.poster = m.top.findNode("poster")
    m.title = m.top.findNode("title")
    m.stars = m.top.findNode("stars")
    m.fallbackMark = m.top.findNode("fallbackMark")
end sub

sub onContent()
    c = m.top.itemContent
    if c = invalid then return
    m.title.text = c.title
    p = c.hdPosterUrl
    if p = invalid or p = "" then p = c.hdGridPosterUrl
    if p = invalid then p = ""
    m.poster.uri = p
    m.poster.visible = (p <> "")
    if m.fallbackMark <> invalid then m.fallbackMark.visible = (p = "")
    s = c.shortDescriptionLine2
    if s = invalid then s = ""
    m.stars.text = s
end sub

sub onFocus()
    m.frame.visible = m.top.itemHasFocus
end sub
