sub init()
    m.cardBg = m.top.findNode("cardBg")
    m.focusLine = m.top.findNode("focusLine")
    m.competitionLogo = m.top.findNode("competitionLogo")
    m.competition = m.top.findNode("competition")
    m.dateTime = m.top.findNode("dateTime")
    m.team1Logo = m.top.findNode("team1Logo")
    m.team1 = m.top.findNode("team1")
    m.score = m.top.findNode("score")
    m.team2Logo = m.top.findNode("team2Logo")
    m.team2 = m.top.findNode("team2")
    m.channels = m.top.findNode("channels")
    m.statusText = m.top.findNode("statusText")
end sub

sub itemContentChanged()
    c = m.top.itemContent
    if c = invalid then return
    m.competition.text = c.gameCompetition
    m.competitionLogo.uri = c.gameCompetitionLogo
    m.dateTime.text = c.gameDateTime
    m.team1.text = c.gameTeam1
    m.team1Logo.uri = c.gameTeam1Logo
    m.team2.text = c.gameTeam2
    m.team2Logo.uri = c.gameTeam2Logo
    m.score.text = c.gameScore
    m.statusText.text = c.gameStatusText
    m.channels.text = c.gameChannelsText
end sub

sub focusChanged()
    if m.top.focusPercent > 0.5
        m.cardBg.color = "0x201B31FF"
        m.focusLine.visible = true
    else
        m.cardBg.color = "0x0E0B17FF"
        m.focusLine.visible = false
    end if
end sub
