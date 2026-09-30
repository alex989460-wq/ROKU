sub init()
    m.outline = m.top.findNode("outline")
    m.card = m.top.findNode("card")
    m.accent = m.top.findNode("accent")
    m.avatar = m.top.findNode("avatar")
    m.initial = m.top.findNode("initial")
    m.title = m.top.findNode("title")
    m.subtitle = m.top.findNode("subtitle")
    m.badge = m.top.findNode("badge")
    m.badgeText = m.top.findNode("badgeText")
end sub

sub onContent()
    c = m.top.itemContent
    if c = invalid then return
    m.title.text = c.title
    subtext = "Provider autorizado"
    if c.subtitle <> invalid and c.subtitle <> "" then subtext = c.subtitle
    m.subtitle.text = subtext
    first = "P"
    if c.title <> invalid and c.title <> "" then first = UCase(Left(c.title, 1))
    m.initial.text = first
    isCurrent = false
    if c.isCurrent <> invalid then isCurrent = c.isCurrent
    m.badge.visible = isCurrent
    m.badgeText.visible = isCurrent
end sub

sub onFocus()
    if m.top.itemHasFocus
        m.outline.color = "0xFFD27AFF"
        m.card.color = "0xE71F2CF2"
        m.accent.opacity = 1.0
        m.avatar.color = "0x0C111BFF"
        m.subtitle.color = "0xFFF1F3FF"
    else
        m.outline.color = "0x566177FF"
        m.card.color = "0x171E2AEF"
        m.accent.opacity = 0.0
        m.avatar.color = "0xE71F2CFF"
        m.subtitle.color = "0xAEB8C8FF"
    end if
end sub
