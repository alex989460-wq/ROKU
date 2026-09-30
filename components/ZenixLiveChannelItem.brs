sub init()
    m.focusBg = m.top.findNode("focusBg")
    m.topStroke = m.top.findNode("focusStrokeTop")
    m.bottomStroke = m.top.findNode("focusStrokeBottom")
    m.leftStroke = m.top.findNode("focusStrokeLeft")
    m.rightStroke = m.top.findNode("focusStrokeRight")
    m.number = m.top.findNode("number")
    m.logo = m.top.findNode("logo")
    m.title = m.top.findNode("title")
end sub

sub onContent()
    c = m.top.itemContent
    if c = invalid then return
    m.title.text = c.title
    n = c.shortDescriptionLine2
    if n = invalid then n = ""
    m.number.text = n
    logoUrl = ""
    if c.hdPosterUrl <> invalid then logoUrl = c.hdPosterUrl
    if logoUrl = "" and c.hdGridPosterUrl <> invalid then logoUrl = c.hdGridPosterUrl
    if m.logo <> invalid
        m.logo.uri = logoUrl
        m.logo.visible = (logoUrl <> "")
    end if
end sub

sub onFocus()
    focused = m.top.itemHasFocus
    m.focusBg.visible = focused
    m.topStroke.visible = focused
    m.bottomStroke.visible = focused
    m.leftStroke.visible = focused
    m.rightStroke.visible = focused
end sub
