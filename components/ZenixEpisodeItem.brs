sub init()
    m.frame = m.top.findNode("focusFrame")
    m.poster = m.top.findNode("poster")
    m.title = m.top.findNode("title")
    m.track = m.top.findNode("progressTrack")
    m.fill = m.top.findNode("progressFill")
    m.progressText = m.top.findNode("progressText")
end sub

sub onContent()
    c = m.top.itemContent
    if c = invalid then return
    m.title.text = c.title
    p = ""
    if c.episodeImage <> invalid then p = c.episodeImage
    if p = invalid or p = "" then p = c.hdPosterUrl
    if p = invalid or p = "" then p = c.hdGridPosterUrl
    if p = invalid then p = ""
    m.poster.uri = p

    pct = 0
    if c.shortDescriptionLine2 <> invalid and c.shortDescriptionLine2 <> "" then pct = Val(c.shortDescriptionLine2)
    if pct > 0
        if pct > 100 then pct = 100
        m.track.visible = true
        m.fill.visible = true
        m.fill.width = Int(246 * pct / 100)
        if pct >= 98 then m.progressText.text = "Visto" else m.progressText.text = pct.ToStr() + "%"
    else
        m.track.visible = false
        m.fill.visible = false
        m.progressText.text = ""
    end if
end sub

sub onFocus()
    m.frame.visible = m.top.itemHasFocus
end sub
