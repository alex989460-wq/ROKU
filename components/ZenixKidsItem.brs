sub init()
    m.frame = m.top.findNode("focusFrame")
    m.poster = m.top.findNode("poster")
    m.fallback = m.top.findNode("fallback")
    m.title = m.top.findNode("title")
    m.stars = m.top.findNode("stars")
end sub

sub onContent()
    c = m.top.itemContent
    if c = invalid then return
    title = c.title
    if title = invalid then title = "Diversão Kids"
    m.title.text = title
    p = c.hdPosterUrl
    if p = invalid or p = "" then p = c.hdGridPosterUrl
    if p = invalid then p = ""
    m.poster.uri = p
    m.poster.visible = (p <> "")
    m.fallback.visible = (p = "")
    stars = c.shortDescriptionLine2
    if stars = invalid then stars = ""
    m.stars.text = stars
end sub

sub onFocus()
    m.frame.visible = m.top.itemHasFocus
end sub
