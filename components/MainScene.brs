sub init()
    m.top.backExitsScene = false
    cfg = AWConfig()
    m.panelBase = cfg.panelBase
    m.apiBase = m.panelBase + "/api/"
    m.appVersion = cfg.appVersion
    m.loginConfigRequested = false
    m.loginConfigLoaded = false
    m.currentScreen = ""
    m.currentSection = ""
    m.kidsMode = false
    m.categories = []
    m.items = []
    m.seriesEpisodes = []
    m.seriesTmdbId = ""
    m.episodeMetaRequested = {}
    m.sportsGames = []
    m.sportsChannelNames = []
    m.netTasks = []
    m.providerId = ""
    m.providerName = ""
    m.providerOptions = []
    m.loginProviderCandidates = []
    m.loginProviderIndex = 0
    m.loginProbeProviderId = ""
    m.recentScanSection = ""
    m.recentScanCategories = []
    m.recentScanIndex = 0
    m.recentScanRanked = []
    m.providerDialog = invalid
    m.providerPickerGroup = invalid
    m.providerPickerGrid = invalid
    m.username = ""
    m.password = ""
    m.loginProviderPlaceholder = "Provedor"
    m.loginUsernamePlaceholder = "Digite seu usuário"
    m.loginPasswordPlaceholder = "Digite sua senha"
    m.loginStatusDefault = "Informe usuário e senha para continuar."
    m.expiredTitle = "CONTA EXPIRADA"
    m.expiredMessage = "Sua lista de reprodução venceu e o acesso aos conteúdos foi temporariamente suspenso."
    m.expiredContact = "Entre em contato com seu revendedor para renovar sua conta."
    m.expiredWait = "Assim que a renovação for feita no servidor, o Strimo VU libera o acesso automaticamente."
    m.expiredCheckText = "Verificar agora"
    m.expiredAutoSeconds = 15
    m.supportWhatsappEnabled = false
    m.supportWhatsapp = ""
    m.supportQrUrl = ""
    m.statusFallbackTried = false
    m.statusRequestPending = false
    m.appConfigFallbackTried = false
    m.xtreamCheckMode = ""
    m.xtream = invalid
    m.currentVideoUrl = ""
    m.currentVideoTitle = ""
    m.currentVideoKind = ""
    m.pendingSeek = 0
    m.liveRetryCount = 0
    m.liveRetryPending = false
    m.resumeApplied = false
    m.keyboardTarget = ""
    m.loginKeyboardTarget = ""
    m.loginKeyboardValueText = ""
    m.loginKeyboardMode = "lower"
    m.loginKeyboardSecure = false
    m.loginEditing = false
    m.homeRecent = []
    m.homeRecentSeries = []
    m.homeRecentLoaded = false
    m.homeRecentLoading = false
    m.homeRecentMoviesLoaded = false
    m.homeRecentMoviesLoading = false
    m.homeRecentSeriesLoaded = false
    m.homeRecentSeriesLoading = false
    m.homeHeroEntry = invalid
    m.homeHeroSection = "movies"
    m.homeHeroRequestKey = ""
    m.allItems = []
    m.catalogSearchQuery = ""
    m.currentCategoryName = ""
    m.videoMode = ""
    m.previewStreamId = ""
    m.currentVideoPoster = ""
    m.currentCategoryId = ""
    m.masterLive = []
    m.masterMovies = []
    m.masterSeries = []
    m.favoriteLive = []
    m.favoriteMovies = []
    m.favoriteSeries = []
    m.epgFocusedKey = ""
    m.renderedItems = []
    m.catalogPage = 0
    ' Mantém somente três linhas de pôsteres na memória. Imagens grandes de alguns
    ' provedores encerram canais Roku quando toda a categoria vira nós de uma vez.
    m.catalogPageSize = 12
    m.catalogPageWindowSize = 5
    m.refreshingContent = false
    m.pendingDeleteSlot = 0
    m.selectedMedia = invalid
    m.detailType = ""
    m.detailMeta = invalid
    m.detailSimilarItems = []
    m.detailRequestKey = ""
    m.detailProviderTmdbId = ""
    m.currentExpiryText = "Vencimento da lista: --"
    m.currentAccountData = invalid
    m.selectedMovieUrl = ""
    m.selectedSeriesId = ""
    m.selectedSeriesName = ""
    m.selectedSeriesPoster = ""
    m.seriesSeasons = []
    m.currentSeasonEpisodes = []
    m.defaultProvider = cfg.defaultProvider
    m.searchGroup = invalid
    m.instantSearchSection = ""
    m.instantSearchQuery = ""
    m.instantSearchResults = []
    m.instantSearchSource = invalid
    m.instantSearchOriginalItems = invalid
    m.instantSearchIndex = []
    m.instantSearchCategoryName = ""
    m.instantSearchCategoryId = ""
    m.inlineSearchActive = false
    m.quickMenuActive = false
    m.searchKeyboardMode = "lower"
    m.pageGridActions = []
    m.progressEntries = []
    m.currentVideoSeriesId = ""
    m.skipProgressSave = false
    m.resumeUrl = ""
    m.resumeTitleText = ""
    m.resumeKind = ""
    m.resumePoster = ""
    m.resumeSeriesId = ""
    m.resumePosition = 0
    m.detailFromSearch = false
    m.openSeriesContinueAfterLoad = false
    m.activeAccountSlot = 0
    m.selectedAccountSlot = 1
    m.accountSlots = []
    m.activationQrReady = false
    m.deviceId = ""
    m.deviceKey = ""
    m.rokuStore = invalid
    m.rokuRfiRequested = false
    m.rokuRfiAccepted = false
    m.outputFormat = "DEFAULT"
    m.adultLockEnabled = true
    m.adultKeywords = "adult,adulto,adultos,xxx,18+,+18,porn,porno,pornô,erotico,erótico"
    m.adultUnlocked = false
    m.pendingAdultAction = ""
    m.pendingAdultIndex = -1
    m.pendingAdultItem = invalid
    m.pendingAdultSection = ""
    fmtReg = CreateObject("roRegistrySection", "awplay_settings")
    savedFmt = UCase(fmtReg.Read("output_format"))
    if savedFmt = "TS" or savedFmt = "M3U8" then m.outputFormat = savedFmt
    if savedFmt = "MPEG" then m.outputFormat = "TS"

    m.consentGroup = m.top.findNode("consentGroup")
    m.activationGroup = m.top.findNode("activationGroup")
    m.accountGroup = m.top.findNode("accountGroup")
    m.accountInfoGroup = m.top.findNode("accountInfoGroup")
    m.expiredGroup = m.top.findNode("expiredGroup")
    m.settingsGroup = m.top.findNode("settingsGroup")
    m.homeGroup = m.top.findNode("homeGroup")
    m.catalogGroup = m.top.findNode("catalogGroup")
    m.detailGroup = m.top.findNode("detailGroup")
    m.searchGroup = m.top.findNode("searchGroup")
    m.loginKeyboardGroup = m.top.findNode("loginKeyboardGroup")
    m.providerPickerGroup = m.top.findNode("providerPickerGroup")
    m.providerPickerGrid = m.top.findNode("providerPickerGrid")
    m.resumeGroup = m.top.findNode("resumeGroup")
    m.sportsGroup = m.top.findNode("sportsGroup")
    m.infoGroup = m.top.findNode("infoGroup")
    m.outputFormatGroup = m.top.findNode("outputFormatGroup")
    m.supportGroup = m.top.findNode("supportGroup")
    m.liveLayout = m.top.findNode("liveLayout")
    m.vodLayout = m.top.findNode("vodLayout")
    m.kidsLayout = m.top.findNode("kidsLayout")
    m.episodeLayout = m.top.findNode("episodeLayout")
    m.loadingGroup = m.top.findNode("loadingGroup")
    m.toastGroup = m.top.findNode("toastGroup")
    m.toastText = m.top.findNode("toastText")
    m.video = m.top.findNode("video")
    m.taskContainer = m.top.findNode("taskContainer")
    m.pollTimer = m.top.findNode("pollTimer")
    m.toastTimer = m.top.findNode("toastTimer")
    m.clockTimer = m.top.findNode("clockTimer")
    m.searchDebounce = m.top.findNode("searchDebounce")
    m.splashTimer = m.top.findNode("splashTimer")
    m.liveRetryTimer = m.top.findNode("liveRetryTimer")
    m.liveStallTimer = m.top.findNode("liveStallTimer")
    m.brandSplash = m.top.findNode("brandSplash")
    m.searchKeyGrid = m.top.findNode("searchKeyGrid")
    m.loginKeyboard = m.top.findNode("loginKeyboard")
    m.searchResultsGrid = m.top.findNode("searchResultsGrid")
    m.inlineSearchGroup = m.top.findNode("catalogInlineSearch")
    m.inlineSearchKeyboard = m.top.findNode("inlineSearchKeyboard")
    m.quickMenuGroup = m.top.findNode("catalogQuickMenu")
    m.quickMenuList = m.top.findNode("quickMenuList")
    m.catalogPageGrid = m.top.findNode("catalogPageGrid")
    m.detailSimilarGrid = m.top.findNode("detailSimilarGrid")

    buttonIds = [
        "consentAccept", "consentExit", "providerActivationBtn", "activationRefreshBtn",
        "providerField", "usernameField", "passwordField", "saveAccountBtn", "accountInfoDeleteBtn", "accountInfoBackBtn", "expiredCheckBtn", "expiredExitBtn",
        "settingsAccounts", "settingsRefresh", "settingsClearProgress", "settingsClearFavorites", "settingsPrivacy", "settingsAbout", "settingsBack", "settingsOutputFormat",
        "heroPlay", "heroInfo", "homeHeroPlayBtn",
        "homeLive", "homeMovies", "homeSeries", "homeKids", "homeSports", "homeAccount", "homeSettings", "homeRefresh", "homeSupport", "supportBack", "continueBtn",
        "catalogBack", "catalogLiveTab", "catalogMoviesTab", "catalogSeriesTab", "catalogSearch", "catalogFavorite", "catalogPrevPage", "catalogNextPage", "vodSearchBtn", "liveFavoriteBtn",
        "pagePrevBottom", "pageNum1", "pageNum2", "pageNum3", "pageNum4", "pageNum5", "pageNextBottom",
        "detailBack", "detailPrimary", "detailContinue", "detailFavorite", "seriesStartBtn", "seriesFavoriteBtn", "sportsBack",
        "searchBack", "resumeContinueBtn", "resumeRestartBtn", "resumeCancelBtn",
        "infoAccountBtn", "infoBack", "fmtDefaultBtn", "fmtM3U8Btn", "fmtTSBtn", "fmtBackBtn"
    ]
    for each id in buttonIds
        n = m.top.findNode(id)
        if n <> invalid then n.observeField("buttonSelected", "onButtonSelected")
    end for

    m.categoryList = m.top.findNode("categoryList")
    m.itemList = m.top.findNode("itemList")
    m.itemGrid = m.top.findNode("itemGrid")
    m.vodGrid = m.itemGrid
    m.kidsGrid = m.top.findNode("kidsGrid")
    m.episodeList = m.top.findNode("episodeList")
    m.seasonList = m.top.findNode("seasonList")
    m.sportsGrid = m.top.findNode("sportsGrid")
    m.sportsChannels = m.top.findNode("sportsChannels")
    m.recentGrid = m.top.findNode("recentGrid")
    m.recentSeriesGrid = m.top.findNode("recentSeriesGrid")
    m.categoryList.observeField("itemSelected", "onCategorySelected")
    if m.quickMenuList <> invalid then m.quickMenuList.observeField("itemSelected", "onQuickMenuSelected")
    m.itemList.observeField("itemSelected", "onItemSelected")
    m.itemList.observeField("itemFocused", "onItemFocused")
    m.itemGrid.observeField("itemSelected", "onGridItemSelected")
    m.itemGrid.observeField("itemFocused", "onGridItemFocused")
    m.itemGrid.observeField("exitDown", "onVodGridExitDown")
    m.itemGrid.observeField("exitUp", "onVodGridExitUp")
    if m.kidsGrid <> invalid
        m.kidsGrid.observeField("itemSelected", "onGridItemSelected")
        m.kidsGrid.observeField("itemFocused", "onGridItemFocused")
        m.kidsGrid.observeField("exitDown", "onVodGridExitDown")
        m.kidsGrid.observeField("exitUp", "onVodGridExitUp")
    end if
    m.episodeList.observeField("itemSelected", "onEpisodeSelected")
    m.episodeList.observeField("itemFocused", "onEpisodeFocused")
    m.seasonList.observeField("itemSelected", "onSeasonSelected")
    m.seasonList.observeField("itemFocused", "onSeasonFocused")
    m.sportsGrid.observeField("itemSelected", "onSportsGameSelected")
    m.sportsGrid.observeField("itemFocused", "onSportsGameFocused")
    m.sportsChannels.observeField("itemSelected", "onSportsChannelSelected")
    m.recentGrid.observeField("itemSelected", "onHomeRecentSelected")
    m.recentGrid.observeField("itemFocused", "onHomeRecentFocused")
    m.recentSeriesGrid.observeField("itemSelected", "onHomeRecentSeriesSelected")
    if m.providerPickerGrid <> invalid then m.providerPickerGrid.observeField("itemSelected", "onProviderGridSelected")
    m.searchKeyGrid.observeField("itemSelected", "onSearchKeySelected")
    if m.loginKeyboard <> invalid then m.loginKeyboard.observeField("text", "onLoginKeyboardTextChanged")
    m.searchKeyGrid.observeField("exitRight", "onSearchKeyboardExitRight")
    if m.inlineSearchKeyboard <> invalid
        m.inlineSearchKeyboard.observeField("itemSelected", "onInlineSearchKeySelected")
        m.inlineSearchKeyboard.observeField("exitRight", "onInlineSearchExitRight")
    end if
    m.searchResultsGrid.observeField("itemSelected", "onInstantSearchSelected")
    m.searchResultsGrid.observeField("itemFocused", "onInstantSearchFocused")
    m.searchResultsGrid.observeField("exitLeft", "onSearchResultsExitLeft")
    if m.detailSimilarGrid <> invalid
        m.detailSimilarGrid.observeField("itemSelected", "onDetailSimilarSelected")
    end if
    if m.catalogPageGrid <> invalid
        m.catalogPageGrid.observeField("itemSelected", "onCatalogPageSelected")
        m.catalogPageGrid.observeField("exitDown", "onPageGridExitDown")
        m.catalogPageGrid.observeField("exitLeft", "onPageGridExitLeft")
    end if
    m.searchDebounce.observeField("fire", "onSearchDebounce")
    m.splashTimer.observeField("fire", "onSplashTimer")
    m.liveRetryTimer.observeField("fire", "onLiveRetryTimer")
    m.liveStallTimer.observeField("fire", "onLiveStallTimer")
    m.pollTimer.observeField("fire", "onPollTimer")
    m.toastTimer.observeField("fire", "onToastTimer")
    m.clockTimer.observeField("fire", "onClockTimer")
    setupQuickMenu()
    m.video.observeField("state", "onVideoState")

    startBrandSplash()

    loadFavorites()
    loadPlaybackProgress()
    loadSavedAccountHints()
    requestAppConfig()
    refreshContinueCard()

    reg = CreateObject("roRegistrySection", "awplay")
    consent = reg.Read("consent_version")
    if consent <> "1"
        showConsent()
    else
        initDevice()
        startRegistration()
    end if
end sub

sub startBrandSplash()
    m.splashFrame = 0
    if m.brandSplash <> invalid
        m.brandSplash.visible = true
        m.brandSplash.opacity = 1.0
    end if
    ghost = m.top.findNode("brandSplashGhost")
    logo = m.top.findNode("brandSplashLogo")
    title = m.top.findNode("brandSplashTitle")
    if ghost <> invalid then ghost.opacity = 0.0
    if logo <> invalid
        logo.opacity = 0.0
        logo.translation = [495,215]
        logo.width = 290
        logo.height = 290
    end if
    if title <> invalid then title.opacity = 0.0
    if m.splashTimer <> invalid then m.splashTimer.control = "start"
end sub

sub onSplashTimer()
    if m.brandSplash = invalid then return
    m.splashFrame = m.splashFrame + 1
    ghost = m.top.findNode("brandSplashGhost")
    logo = m.top.findNode("brandSplashLogo")
    title = m.top.findNode("brandSplashTitle")

    ' Fase 1: a marca em relevo aparece devagar sobre o fundo claro.
    if m.splashFrame <= 12 and ghost <> invalid
        nextGhost = ghost.opacity + 0.018
        if nextGhost > 0.20 then nextGhost = 0.20
        ghost.opacity = nextGhost
    end if

    ' Fase 2: a marca colorida surge e faz um zoom muito leve, como na referência.
    if m.splashFrame >= 9 and m.splashFrame <= 24 and logo <> invalid
        nextLogo = logo.opacity + 0.095
        if nextLogo > 1.0 then nextLogo = 1.0
        logo.opacity = nextLogo
        if logo.width > 250
            newW = logo.width - 4
            newH = logo.height - 4
            newX = 640 - (newW / 2)
            newY = 360 - (newH / 2)
            logo.width = newW
            logo.height = newH
            logo.translation = [newX,newY]
        end if
    end if

    if m.splashFrame >= 17 and title <> invalid
        nextTitle = title.opacity + 0.10
        if nextTitle > 0.92 then nextTitle = 0.92
        title.opacity = nextTitle
    end if

    ' Segura a marca por alguns instantes e depois revela a interface.
    if m.splashFrame >= 38
        nextOpacity = m.brandSplash.opacity - 0.14
        if nextOpacity < 0.0 then nextOpacity = 0.0
        m.brandSplash.opacity = nextOpacity
    end if

    if m.splashFrame >= 46
        m.splashTimer.control = "stop"
        m.brandSplash.visible = false
        m.brandSplash.opacity = 1.0
    end if
end sub

sub initDevice()
    reg = CreateObject("roRegistrySection", "awplay")
    m.deviceId = reg.Read("device_id")
    m.deviceKey = reg.Read("device_key")
    m.previousDeviceKey = ""
    if m.deviceId = ""
        info = CreateObject("roDeviceInfo")
        raw = info.GetChannelClientId()
        if raw = invalid or raw = ""
            dtFallback = CreateObject("roDateTime")
            raw = dtFallback.AsSeconds().ToStr() + "a7c4e9b12855"
        end if
        rx = CreateObject("roRegex", "[^0-9A-Fa-f]", "i")
        compact = LCase(rx.ReplaceAll(raw, ""))
        if Len(compact) < 12
            compact = compact + "a7c4e9b12855"
        end if
        compact = Left(compact, 12)
        m.deviceId = Mid(compact,1,2) + ":" + Mid(compact,3,2) + ":" + Mid(compact,5,2) + ":" + Mid(compact,7,2) + ":" + Mid(compact,9,2) + ":" + Mid(compact,11,2)
        reg.Write("device_id", m.deviceId)
    end if
    numericCode = CreateObject("roRegex", "^[0-9]{6}$", "")
    if m.deviceKey <> "" and numericCode.IsMatch(m.deviceKey)
        m.previousDeviceKey = m.deviceKey
        m.deviceKey = generateDeviceCode()
        reg.Write("device_key", m.deviceKey)
    else if m.deviceKey = ""
        m.deviceKey = generateDeviceCode()
        reg.Write("device_key", m.deviceKey)
    end if
    reg.Flush()
    updateAccountButtons()
end sub

sub loadSavedAccountHints()
    reg = CreateObject("roRegistrySection", "awplay")
    m.providerId = reg.Read("provider_id")
    m.providerName = reg.Read("provider_name")
    ' Não pré-preenche usuário na tela de login. O provedor pode continuar salvo.
    m.username = ""
    m.password = ""
    updateAccountButtons()
end sub

sub saveAccountHints()
    reg = CreateObject("roRegistrySection", "awplay")
    reg.Write("provider_id", m.providerId)
    reg.Write("provider_name", m.providerName)
    reg.Write("username", m.username)
    reg.Flush()
end sub

sub updateAccountButtons()
    p = "Provedor"
    if m.loginProviderPlaceholder <> invalid and m.loginProviderPlaceholder <> "" then p = m.loginProviderPlaceholder
    if m.providerId <> ""
        p = m.providerId
        if m.providerName <> "" then p = m.providerName
    end if
    u = "Nome de usuário"
    if m.loginUsernamePlaceholder <> invalid and m.loginUsernamePlaceholder <> "" then u = m.loginUsernamePlaceholder
    if m.username <> "" then u = m.username
    pw = "Senha"
    if m.loginPasswordPlaceholder <> invalid and m.loginPasswordPlaceholder <> "" then pw = m.loginPasswordPlaceholder
    if m.password <> "" then pw = m.password

    pf = m.top.findNode("providerField") : if pf <> invalid then pf.text = ""
    uf = m.top.findNode("usernameField") : if uf <> invalid then uf.text = ""
    wf = m.top.findNode("passwordField") : if wf <> invalid then wf.text = ""
    pfl = m.top.findNode("providerFieldLabel") : if pfl <> invalid then pfl.text = shortText(p, 34)
    ufl = m.top.findNode("usernameFieldLabel") : if ufl <> invalid then ufl.text = shortText(u, 34)
    wfl = m.top.findNode("passwordFieldLabel") : if wfl <> invalid then wfl.text = shortText(pw, 34)

    deviceIdText = sVal(m.deviceId)
    deviceKeyText = sVal(m.deviceKey)
    if deviceIdText = "" then deviceIdText = "--:--:--:--:--:--"
    if deviceKeyText = "" then deviceKeyText = "------"
    if m.top.findNode("accountDeviceInfo") <> invalid then m.top.findNode("accountDeviceInfo").text = "CHAVE DO DISPOSITIVO:  " + deviceKeyText
end sub

function generateDeviceCode() as string
    chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
    code = ""
    for i = 1 to 6
        code = code + Mid(chars, Rnd(Len(chars)), 1)
    end for
    return code
end function

function accountSummary(slot as integer) as dynamic
    if m.accountSlots = invalid then return invalid
    for each a in m.accountSlots
        if a <> invalid and a.slot <> invalid and Int(a.slot) = slot then return a
    end for
    return invalid
end function

function accountConfigured(slot as integer) as boolean
    a = accountSummary(slot)
    return a <> invalid and a.configured <> invalid and a.configured = true
end function

sub updateAccountSlotButtons()
    for slot = 1 to 2
        a = accountSummary(slot)
        title = "Conta " + slot.ToStr()
        state = "VAZIA"
        detail = "Adicione um servidor para usar esta conta."
        if a <> invalid and a.configured <> invalid and a.configured = true
            name = "Servidor cadastrado"
            if a.name <> invalid and sVal(a.name) <> "" then name = sVal(a.name)
            provider = ""
            if a.provider_name <> invalid and sVal(a.provider_name) <> ""
                provider = sVal(a.provider_name)
            else if a.provider_id <> invalid and sVal(a.provider_id) <> ""
                provider = sVal(a.provider_id)
            end if
            host = ""
            if a.host <> invalid and sVal(a.host) <> "" then host = sVal(a.host)
            detail = name
            if provider <> "" and LCase(provider) <> LCase(name) then detail = detail + " · " + provider
            if host <> "" then detail = detail + " · " + host
            state = "PRONTA"
            if m.activeAccountSlot = slot then state = "EM USO"
        end if
        btn = m.top.findNode("accountSlot" + slot.ToStr())
        if btn <> invalid then btn.text = ""
        lbl = m.top.findNode("accountSlot" + slot.ToStr() + "Label")
        if lbl <> invalid then lbl.text = title
        st = m.top.findNode("accountSlot" + slot.ToStr() + "State")
        if st <> invalid then st.text = state
        info = m.top.findNode("accountSlot" + slot.ToStr() + "Info")
        if info <> invalid then info.text = shortText(detail, 30)
    end for

    sw = m.top.findNode("switchAccountBtn")
    if sw <> invalid then sw.visible = false

    d = m.top.findNode("disconnectAccountBtn")
    dc = m.top.findNode("disconnectAccountBtnCard")
    dl = m.top.findNode("disconnectAccountBtnLabel")
    disconnectOutline = m.top.findNode("disconnectAccountBtnOutline")
    disconnectVisible = accountConfigured(m.selectedAccountSlot)
    if d <> invalid then d.visible = disconnectVisible
    if dc <> invalid then dc.visible = disconnectVisible
    if dl <> invalid then dl.visible = disconnectVisible
    if disconnectOutline <> invalid then disconnectOutline.visible = disconnectVisible
    if disconnectVisible
        txt = "Excluir Conta " + m.selectedAccountSlot.ToStr() + " e sair"
        if d <> invalid then d.text = ""
        if dl <> invalid then dl.text = shortText(txt, 32)
    end if
end sub

sub selectAccountSlot(slot as integer)
    if slot < 1 or slot > 2 then return
    m.selectedAccountSlot = slot
    a = accountSummary(slot)
    m.password = ""
    if a <> invalid and a.configured <> invalid and a.configured = true
        if a.provider_id <> invalid then m.providerId = sVal(a.provider_id)
        m.providerName = ""
        if a.provider_name <> invalid then m.providerName = sVal(a.provider_name)
        m.username = ""
        if m.activeAccountSlot = slot and m.xtream <> invalid
            m.top.findNode("accountStatus").text = "Conta " + slot.ToStr() + " já está conectada. Use os campos abaixo somente para substituir os dados."
        else
            m.top.findNode("accountStatus").text = "Conta " + slot.ToStr() + " salva. Pressione OK no card novamente para conectar."
        end if
    else
        m.providerId = ""
        m.providerName = ""
        m.username = ""
        m.top.findNode("accountStatus").text = "Conta " + slot.ToStr() + " vazia. Escolha o Provider, informe usuário e senha para cadastrar."
    end if
    updateAccountButtons()
end sub

sub switchAccountSlot(slot as integer)
    m.adultUnlocked = false
    if not accountConfigured(slot)
        selectAccountSlot(slot)
        return
    end if
    showLoading("Trocando para Conta " + slot.ToStr() + "...")
    payload = { device_id: m.deviceId, device_key: m.deviceKey, slot: slot }
    startRequest("switch_account", m.apiBase + "switch-account.php", "POST", FormatJson(payload))
end sub

sub disconnectCurrentAccount()
    if not accountConfigured(m.selectedAccountSlot) then return
    m.pendingDeleteSlot = m.selectedAccountSlot
    dialog = CreateObject("roSGNode", "Dialog")
    dialog.title = "Excluir conta?"
    dialog.message = "A conta será removida desta TV e o aplicativo voltará para a tela de login."
    dialog.buttons = ["Excluir e sair", "Cancelar"]
    dialog.observeField("buttonSelected", "onDeleteAccountDialog")
    m.top.dialog = dialog
end sub

sub onDeleteAccountDialog(event as object)
    dialog = event.getRoSGNode()
    selected = event.getData()
    dialog.close = true
    if selected <> 0 then return
    slot = m.pendingDeleteSlot
    if slot < 1 or slot > 2 then return
    showLoading("Excluindo conta...")
    payload = { device_id: m.deviceId, device_key: m.deviceKey, slot: slot }
    startRequest("delete_account", m.apiBase + "delete-account.php", "POST", FormatJson(payload))
end sub

sub hideMainGroups()
    if m.video <> invalid and m.video.visible and m.videoMode = "preview" then stopEmbeddedPreview()
    m.consentGroup.visible = false
    m.activationGroup.visible = false
    m.accountGroup.visible = false
    if m.accountInfoGroup <> invalid then m.accountInfoGroup.visible = false
    if m.expiredGroup <> invalid then m.expiredGroup.visible = false
    if m.settingsGroup <> invalid then m.settingsGroup.visible = false
    m.homeGroup.visible = false
    m.catalogGroup.visible = false
    m.detailGroup.visible = false
    m.searchGroup.visible = false
    if m.loginKeyboardGroup <> invalid then m.loginKeyboardGroup.visible = false
    m.resumeGroup.visible = false
    m.sportsGroup.visible = false
    if m.infoGroup <> invalid then m.infoGroup.visible = false
    if m.outputFormatGroup <> invalid then m.outputFormatGroup.visible = false
    if m.supportGroup <> invalid then m.supportGroup.visible = false
end sub

sub showConsent()
    hideMainGroups()
    m.clockTimer.control = "stop"
    m.currentScreen = "consent"
    m.consentGroup.visible = true
    m.top.findNode("consentAccept").setFocus(true)
end sub

sub prepareActivationQr()
    m.activationQrReady = false
    qr = m.top.findNode("activationQr")
    frame = m.top.findNode("activationQrFrame")
    loading = m.top.findNode("activationQrLoading")
    if qr <> invalid
        qr.uri = ""
        qr.visible = false
    end if
    if frame <> invalid then frame.visible = false
    if loading <> invalid
        loading.text = "Gerando QR seguro..."
        loading.visible = true
    end if
end sub

sub showDynamicActivationQr(url as string)
    qr = m.top.findNode("activationQr")
    frame = m.top.findNode("activationQrFrame")
    loading = m.top.findNode("activationQrLoading")
    if url = ""
        m.activationQrReady = false
        if qr <> invalid then qr.visible = false
        if frame <> invalid then frame.visible = false
        if loading <> invalid
            loading.text = "QR indisponível · tente Verificar"
            loading.visible = true
        end if
        return
    end if
    m.activationQrReady = true
    if qr <> invalid
        qr.uri = url
        qr.visible = true
    end if
    if frame <> invalid then frame.visible = true
    if loading <> invalid then loading.visible = false
end sub

sub startRegistration()
    showAccount()
    m.top.findNode("accountStatus").text = "Preparando o dispositivo..."
    info = CreateObject("roDeviceInfo")
    model = info.GetModel()
    os = info.GetOSVersion()
    osver = ""
    if os <> invalid
        if os.major <> invalid then osver = sVal(os.major)
        if os.minor <> invalid then osver = osver + "." + sVal(os.minor)
        if os.revision <> invalid then osver = osver + "." + sVal(os.revision)
        if os.build <> invalid then osver = osver + " build " + sVal(os.build)
    end if
    payload = {
        device_id: m.deviceId,
        device_key: m.deviceKey,
        previous_device_key: m.previousDeviceKey,
        app_version: m.appVersion,
        platform: "roku",
        device_model: model,
        device_os: osver
    }
    startRequest("register", m.apiBase + "register.php", "POST", FormatJson(payload))
end sub

sub ensureRokuRfiForSignIn()
    if m.rokuRfiRequested then return
    m.rokuRfiRequested = true

    store = CreateObject("roSGNode", "ChannelStore")
    if store = invalid then return
    m.rokuStore = store

    requestInfo = CreateObject("roSGNode", "ContentNode")
    requestInfo.AddFields({context: "signin"})
    m.rokuStore.requestedUserDataInfo = requestInfo
    m.rokuStore.requestedUserData = "email"
    m.rokuStore.observeField("userData", "onRokuUserData")
    m.rokuStore.command = "getUserData"
end sub

sub onRokuUserData()
    if m.rokuStore = invalid then return
    userData = m.rokuStore.userData
    m.rokuRfiAccepted = false
    if userData <> invalid
        if userData.email <> invalid
            if userData.email <> "" then m.rokuRfiAccepted = true
        end if
    end if
    ' O e-mail da conta Roku e opcional e nao e salvo nem enviado ao painel.
end sub

sub showActivation(message as string)
    ' Esta edição usa somente login direto por usuário e senha.
    showAccount()
    if message <> "" then m.top.findNode("accountStatus").text = message
end sub

sub updateActivationVisualState()
    defs = [
        { btn: "providerActivationBtn", card: "activationProviderCard", label: "activationProviderLabel" },
        { btn: "activationRefreshBtn", card: "activationRefreshCard", label: "activationRefreshLabel" }
    ]
    for each item in defs
        btn = m.top.findNode(item.btn)
        card = m.top.findNode(item.card)
        label = m.top.findNode(item.label)
        focused = (btn <> invalid and btn.hasFocus())
        if card <> invalid
            if focused then card.color = "0xF2F2F2FF" else card.color = "0x151926FF"
        end if
        if label <> invalid
            if focused then label.color = "0x111111FF" else label.color = "0xF2F2F2FF"
        end if
    end for
end sub


sub requestAppConfig()
    if m.loginConfigRequested then return
    m.loginConfigRequested = true
    startRequest("app_config", m.apiBase + "app-config.php", "GET", "")
end sub

sub setLoginStatusDefault()
    statusText = "Informe seus dados e pressione Entrar."
    n = m.top.findNode("accountStatus")
    if n <> invalid
        if m.loginConfigLoaded and m.loginStatusDefault <> invalid and m.loginStatusDefault <> "" then statusText = m.loginStatusDefault
        n.text = statusText
    end if
end sub

sub applyAppConfig(data as dynamic)
    if data = invalid then return
    m.loginConfigRequested = true
    m.loginConfigLoaded = true

    if data.login_kicker <> invalid and sVal(data.login_kicker) <> "" then m.top.findNode("loginKicker").text = sVal(data.login_kicker)
    m.top.findNode("loginTitle").text = "Bem-vindo ao Strimo VU"
    if data.login_intro <> invalid and sVal(data.login_intro) <> "" then m.top.findNode("loginIntro").text = sVal(data.login_intro)
    m.top.findNode("loginInstructions").text = "Informe somente o usuário e a senha fornecidos pelo seu serviço. O servidor já está configurado com segurança."
    if data.login_notice <> invalid and sVal(data.login_notice) <> "" then m.top.findNode("loginNotice").text = sVal(data.login_notice)

    m.loginProviderPlaceholder = "Provedor"
    if data.login_provider_placeholder <> invalid and sVal(data.login_provider_placeholder) <> ""
        m.loginProviderPlaceholder = sVal(data.login_provider_placeholder)
    end if
    m.loginUsernamePlaceholder = "Digite seu usuário"
    if data.login_username_placeholder <> invalid and sVal(data.login_username_placeholder) <> ""
        m.loginUsernamePlaceholder = sVal(data.login_username_placeholder)
    end if
    m.loginPasswordPlaceholder = "Digite sua senha"
    if data.login_password_placeholder <> invalid and sVal(data.login_password_placeholder) <> ""
        m.loginPasswordPlaceholder = sVal(data.login_password_placeholder)
    end if
    if data.login_button_text <> invalid and sVal(data.login_button_text) <> "" then m.top.findNode("saveAccountBtnLabel").text = sVal(data.login_button_text)
    m.loginStatusDefault = "Informe usuário e senha para continuar."
    m.expiredTitle = "CONTA EXPIRADA"
    m.expiredMessage = "Sua lista de reprodução venceu e o acesso aos conteúdos foi temporariamente suspenso."
    m.expiredContact = "Entre em contato com seu revendedor para renovar sua conta."
    m.expiredWait = "Assim que a renovação for feita no servidor, o Strimo VU libera o acesso automaticamente."
    m.expiredCheckText = "Verificar agora"
    m.expiredAutoSeconds = 15
    if data.login_status_text <> invalid and sVal(data.login_status_text) <> ""
        m.loginStatusDefault = sVal(data.login_status_text)
    end if
    if data.expired_title <> invalid and sVal(data.expired_title) <> "" then m.expiredTitle = sVal(data.expired_title)
    if data.expired_message <> invalid and sVal(data.expired_message) <> "" then m.expiredMessage = sVal(data.expired_message)
    if data.expired_contact <> invalid and sVal(data.expired_contact) <> "" then m.expiredContact = sVal(data.expired_contact)
    ' A marca do aplicativo é local; o painel continua apenas fornecendo a situação da conta.
    if data.expired_button_text <> invalid and sVal(data.expired_button_text) <> "" then m.expiredCheckText = sVal(data.expired_button_text)
    if data.expired_auto_check_seconds <> invalid
        sec = Int(data.expired_auto_check_seconds)
        if sec >= 5 and sec <= 120 then m.expiredAutoSeconds = sec
    end if

    m.supportWhatsappEnabled = false
    m.supportWhatsapp = ""
    m.supportQrUrl = ""
    if data.support_whatsapp_enabled <> invalid then m.supportWhatsappEnabled = data.support_whatsapp_enabled
    if data.support_whatsapp <> invalid then m.supportWhatsapp = sVal(data.support_whatsapp)
    if data.support_qr_image_url <> invalid then m.supportQrUrl = sVal(data.support_qr_image_url)
    if m.supportWhatsapp = "" or m.supportQrUrl = "" then m.supportWhatsappEnabled = false
    supportNodes = ["loginSupportCard", "loginSupportQrPoster", "loginSupportLabel"]
    for each supportId in supportNodes
        supportNode = m.top.findNode(supportId)
        if supportNode <> invalid then supportNode.visible = m.supportWhatsappEnabled
    end for
    loginQr = m.top.findNode("loginSupportQrPoster")
    if loginQr <> invalid
        if m.supportWhatsappEnabled
            loginQr.uri = m.supportQrUrl + "?login=1"
        else
            loginQr.uri = ""
        end if
    end if

    updateAccountButtons()
    if m.currentScreen = "account" then setLoginStatusDefault()
end sub

sub clearAccountHints()
    reg = CreateObject("roRegistrySection", "awplay")
    reg.Delete("provider_id")
    reg.Delete("provider_name")
    reg.Delete("username")
    reg.Flush()
end sub

sub updateAccountInfoVisualState()
    delBtn = m.top.findNode("accountInfoDeleteBtn")
    delCard = m.top.findNode("accountInfoDeleteCard")
    delOutline = m.top.findNode("accountInfoDeleteOutline")
    backBtn = m.top.findNode("accountInfoBackBtn")
    backCard = m.top.findNode("accountInfoBackCard")
    backOutline = m.top.findNode("accountInfoBackOutline")

    if delCard <> invalid
        if delBtn <> invalid and delBtn.hasFocus() then delCard.color = "0xF02AAEFF" else delCard.color = "0x0B38BEFF"
    end if
    if delOutline <> invalid
        if delBtn <> invalid and delBtn.hasFocus() then delOutline.color = "0xC677FFFF" else delOutline.color = "0x414F77FF"
    end if
    if backCard <> invalid
        if backBtn <> invalid and backBtn.hasFocus() then backCard.color = "0x2E3854FF" else backCard.color = "0x252C43EE"
    end if
    if backOutline <> invalid
        if backBtn <> invalid and backBtn.hasFocus() then backOutline.color = "0xC677FFFF" else backOutline.color = "0x414F77FF"
    end if
end sub

sub showExpiredAccount(data as dynamic, reason as string)
    hideMainGroups()
    m.currentScreen = "expired"
    m.clockTimer.control = "stop"
    if m.expiredGroup <> invalid then m.expiredGroup.visible = true

    titleNode = m.top.findNode("expiredTitle")
    msgNode = m.top.findNode("expiredMessage")
    contactNode = m.top.findNode("expiredContact")
    waitNode = m.top.findNode("expiredWait")
    btnLabel = m.top.findNode("expiredCheckLabel")
    providerNode = m.top.findNode("expiredProvider")
    expiryNode = m.top.findNode("expiredExpiry")
    supportNode = m.top.findNode("expiredSupport")
    autoNode = m.top.findNode("expiredAutoStatus")
    spinner = m.top.findNode("expiredSpinner")

    titleText = m.expiredTitle
    messageText = m.expiredMessage
    contactText = m.expiredContact
    waitText = m.expiredWait
    if reason = "playlist_blocked" or reason = "account_blocked" or reason = "device_blocked"
        titleText = "CONTA BLOQUEADA"
        messageText = "O acesso desta conta foi bloqueado ou desativado pelo servidor."
        contactText = "Entre em contato com seu revendedor para liberar sua conta."
        waitText = "Assim que a conta for ativada novamente, o Strimo VU libera o acesso automaticamente."
    else
        titleText = "CONTA VENCIDA"
        messageText = "Sua lista venceu e o acesso aos conteúdos foi temporariamente suspenso."
    end if
    if titleNode <> invalid then titleNode.text = titleText
    if msgNode <> invalid then msgNode.text = messageText
    if contactNode <> invalid then contactNode.text = contactText
    if waitNode <> invalid then waitNode.text = waitText
    if btnLabel <> invalid then btnLabel.text = m.expiredCheckText

    provider = m.providerName
    if provider = "" then provider = m.providerId
    if data <> invalid and data.account <> invalid
        if data.account.provider_name <> invalid and sVal(data.account.provider_name) <> "" then provider = sVal(data.account.provider_name)
        if data.account.provider_id <> invalid and sVal(data.account.provider_id) <> "" then m.providerId = sVal(data.account.provider_id)
        if data.account.playlist_url <> invalid and sVal(data.account.playlist_url) <> "" then m.xtream = parseXtream(sVal(data.account.playlist_url))
    end if
    if provider = "" then provider = "--"
    if providerNode <> invalid then providerNode.text = provider

    expiry = "--"
    if data <> invalid and data.account <> invalid
        if data.account.playlist_expires_at <> invalid and sVal(data.account.playlist_expires_at) <> "" then expiry = formatExpiryValue(data.account.playlist_expires_at)
        if expiry = "" or expiry = "--"
            tmp = buildExpiryText(data.account)
            prefix = "Vencimento da lista: "
            if Left(tmp, Len(prefix)) = prefix then tmp = Mid(tmp, Len(prefix) + 1)
            if tmp <> "" then expiry = tmp
        end if
    end if
    if expiryNode <> invalid then expiryNode.text = expiry

    support = "Fale com seu revendedor"
    if data <> invalid and data.support_whatsapp <> invalid and sVal(data.support_whatsapp) <> ""
        support = "WhatsApp: " + sVal(data.support_whatsapp)
    end if
    if supportNode <> invalid then supportNode.text = support
    if autoNode <> invalid then autoNode.text = "Verificação automática a cada " + m.expiredAutoSeconds.ToStr() + " segundos"
    if spinner <> invalid then spinner.control = "start"

    if m.pollTimer <> invalid
        m.pollTimer.control = "stop"
        m.pollTimer.duration = m.expiredAutoSeconds
        m.pollTimer.control = "start"
    end if
    btn = m.top.findNode("expiredCheckBtn")
    if btn <> invalid then btn.setFocus(true)
    updateExpiredVisualState()
end sub

sub updateExpiredVisualState()
    checkBtn = m.top.findNode("expiredCheckBtn")
    checkCard = m.top.findNode("expiredCheckCard")
    checkOutline = m.top.findNode("expiredCheckOutline")
    exitBtn = m.top.findNode("expiredExitBtn")
    exitCard = m.top.findNode("expiredExitCard")
    exitOutline = m.top.findNode("expiredExitOutline")
    if checkCard <> invalid
        if checkBtn <> invalid and checkBtn.hasFocus() then checkCard.color = "0xF02AAEFF" else checkCard.color = "0x0B38BEFF"
    end if
    if checkOutline <> invalid
        if checkBtn <> invalid and checkBtn.hasFocus() then checkOutline.color = "0xC677FFFF" else checkOutline.color = "0x414F77FF"
    end if
    if exitCard <> invalid
        if exitBtn <> invalid and exitBtn.hasFocus() then exitCard.color = "0x2E3854FF" else exitCard.color = "0x252C43EE"
    end if
    if exitOutline <> invalid
        if exitBtn <> invalid and exitBtn.hasFocus() then exitOutline.color = "0xC677FFFF" else exitOutline.color = "0x414F77FF"
    end if
end sub

sub showAccountInfo()
    if m.xtream = invalid
        showAccount()
        return
    end if

    hideMainGroups()
    m.clockTimer.control = "stop"
    m.currentScreen = "accountinfo"
    m.pollTimer.control = "stop"
    if m.accountInfoGroup <> invalid then m.accountInfoGroup.visible = true

    if m.activeAccountSlot > 0
        m.selectedAccountSlot = m.activeAccountSlot
    else
        m.selectedAccountSlot = 1
    end if

    provider = m.providerName
    if provider = "" then provider = m.providerId
    if provider = "" then provider = "--"

    server = "--"
    username = "--"
    passwordText = "********"
    if m.xtream <> invalid
        if m.xtream.base <> invalid and sVal(m.xtream.base) <> "" then server = sVal(m.xtream.base)
        if m.xtream.user <> invalid and sVal(m.xtream.user) <> "" then username = sVal(m.xtream.user)
        if m.xtream.pass <> invalid and sVal(m.xtream.pass) <> "" then passwordText = maskPassword(sVal(m.xtream.pass))
    end if

    expiry = m.currentExpiryText
    if expiry = "" then expiry = "Vencimento da lista: --"
    expiryPrefix = "Vencimento da lista: "
    if Left(expiry, Len(expiryPrefix)) = expiryPrefix then expiry = Mid(expiry, Len(expiryPrefix) + 1)

    n = m.top.findNode("accountInfoProvider") : if n <> invalid then n.text = provider
    n = m.top.findNode("accountInfoServer") : if n <> invalid then n.text = server
    n = m.top.findNode("accountInfoUsername") : if n <> invalid then n.text = username
    n = m.top.findNode("accountInfoPassword") : if n <> invalid then n.text = passwordText
    n = m.top.findNode("accountInfoExpiry") : if n <> invalid then n.text = expiry
    n = m.top.findNode("accountInfoState") : if n <> invalid then n.text = "Conectado"
    n = m.top.findNode("accountInfoKey") : if n <> invalid then n.text = sVal(m.deviceKey)
    n = m.top.findNode("accountInfoDeviceId") : if n <> invalid then n.text = sVal(m.deviceKey)
    n = m.top.findNode("accountInfoVersion") : if n <> invalid then n.text = m.appVersion

    btn = m.top.findNode("accountInfoDeleteBtn")
    if btn <> invalid then btn.setFocus(true)
    updateAccountInfoVisualState()
end sub

sub showAccount()
    if not m.loginConfigLoaded and not m.loginConfigRequested then requestAppConfig()
    hideMainGroups()
    m.clockTimer.control = "stop"
    m.currentScreen = "account"
    m.pollTimer.control = "stop"
    m.pollTimer.duration = 5
    m.pollTimer.control = "start"
    m.accountGroup.visible = true
    m.selectedAccountSlot = 1
    m.providerId = m.defaultProvider
    if m.providerId = "" then m.providerId = "awplay"
    m.providerName = "Strimo VU"
    ' Login sempre abre limpo: nunca reaproveita usuário/senha antigos.
    m.username = ""
    m.password = ""
    setLoginStatusDefault()
    updateAccountButtons()
    versionNode = m.top.findNode("loginAppVersion")
    if versionNode <> invalid then versionNode.text = "Versão do aplicativo: " + m.appVersion
    m.top.findNode("usernameField").setFocus(true)
    updateAccountVisualState()
end sub

sub updateAccountVisualState()
    defs = [
        { btn: "providerField", card: "providerFieldCard", label: "providerFieldLabel", outline: "providerFieldOutline", normal: "0x252C43EE", focused: "0x252C43EE" },
        { btn: "usernameField", card: "usernameFieldCard", label: "usernameFieldLabel", outline: "usernameFieldOutline", normal: "0x252C43EE", focused: "0x252C43EE" },
        { btn: "passwordField", card: "passwordFieldCard", label: "passwordFieldLabel", outline: "passwordFieldOutline", normal: "0x252C43EE", focused: "0x252C43EE" },
        { btn: "saveAccountBtn", card: "saveAccountBtnCard", label: "saveAccountBtnLabel", outline: "saveAccountBtnOutline", normal: "0x144FFFFF", focused: "0x3668FFFF" }
    ]
    for each item in defs
        btn = m.top.findNode(item.btn)
        card = m.top.findNode(item.card)
        label = m.top.findNode(item.label)
        outline = m.top.findNode(item.outline)
        focused = (btn <> invalid and btn.hasFocus())
        if card <> invalid
            if focused then card.color = item.focused else card.color = item.normal
        end if
        if outline <> invalid
            outline.visible = true
            if focused then outline.color = "0xC677FFFF" else outline.color = "0x414F77FF"
        end if
        if label <> invalid then label.color = "0xFFFFFFFF"
    end for
end sub

sub showSettings()
    hideMainGroups()
    m.clockTimer.control = "stop"
    m.pollTimer.control = "stop"
    m.currentScreen = "settings"
    m.settingsGroup.visible = true
    updateSettingsInfo()
    m.top.findNode("settingsAccounts").setFocus(true)
    updateSettingsVisualState()
end sub


sub updateSettingsVisualState()
    items = [
        { btn: "settingsAccounts", card: "settingsCardAccounts", label: "settingsLabelAccounts" },
        { btn: "settingsRefresh", card: "settingsCardRefresh", label: "settingsLabelRefresh" },
        { btn: "settingsClearProgress", card: "settingsCardProgress", label: "settingsLabelProgress" },
        { btn: "settingsClearFavorites", card: "settingsCardFavorites", label: "settingsLabelFavorites" },
        { btn: "settingsPrivacy", card: "settingsCardPrivacy", label: "settingsLabelPrivacy" },
        { btn: "settingsAbout", card: "settingsCardAbout", label: "settingsLabelAbout" },
        { btn: "settingsBack", card: "settingsCardBack", label: "settingsLabelBack" },
        { btn: "settingsOutputFormat", card: "settingsCardFormat", label: "settingsLabelFormat" }
    ]
    for each item in items
        btn = m.top.findNode(item.btn)
        card = m.top.findNode(item.card)
        label = m.top.findNode(item.label)
        focused = (btn <> invalid and btn.hasFocus())
        if card <> invalid
            if focused then card.color = "0xF1F3F7FF" else card.color = "0x121621E8"
        end if
        if label <> invalid
            if focused then label.color = "0x121621FF" else label.color = "0xFFFFFFFF"
        end if
    end for
end sub

sub updateSettingsInfo()
    statusText = "Desconectado"
    if m.xtream <> invalid then statusText = "Conectado"
    m.top.findNode("settingsStatus").text = statusText

    accountText = "Nenhuma conta ativa"
    if m.xtream <> invalid
        accountText = "Conta conectada"
        if m.providerName <> ""
            accountText = m.providerName
        else if m.providerId <> ""
            accountText = m.providerId
        end if
    end if
    m.top.findNode("settingsAccountInfo").text = accountText
    m.top.findNode("settingsDeviceId").text = m.deviceId
    if m.top.findNode("settingsDeviceKey") <> invalid then m.top.findNode("settingsDeviceKey").text = m.deviceKey
    m.top.findNode("settingsVersion").text = m.appVersion
    fmtLabel = m.top.findNode("settingsLabelFormat")
    if fmtLabel <> invalid then fmtLabel.text = "Formatos de saída · " + m.outputFormat
    fmtHint = m.top.findNode("settingsFormatHint")
    if fmtHint <> invalid then fmtHint.text = "Saída: " + m.outputFormat
end sub

sub refreshContentNow()
    if m.xtream = invalid
        toast("Nenhuma conta conectada.")
        return
    end if
    m.refreshingContent = true
    m.homeRecentLoaded = false
    m.homeRecentLoading = false
    m.homeRecentMoviesLoaded = false
    m.homeRecentMoviesLoading = false
    m.homeRecentSeriesLoaded = false
    m.homeRecentSeriesLoading = false
    m.categories = []
    m.items = []
    m.allItems = []
    m.renderedItems = []
    m.catalogSearchQuery = ""
    showLoading("Atualizando conteúdo...")
    checkStatus()
end sub

sub clearAllPlaybackHistory()
    clearContinue()
    m.progressEntries = []
    reg = CreateObject("roRegistrySection", "awplay_progress")
    reg.Delete("items")
    reg.Flush()
    toast("Histórico e progresso apagados.")
    updateSettingsInfo()
end sub

sub clearAllFavorites()
    m.favoriteLive = []
    m.favoriteMovies = []
    m.favoriteSeries = []
    reg = CreateObject("roRegistrySection", "awplay_favorites")
    reg.Delete("items")
    reg.Flush()
    toast("Favoritos apagados desta TV.")
end sub

sub showSettingsDialog(kind as string)
    dialog = CreateObject("roSGNode", "Dialog")
    if kind = "privacy"
        dialog.title = "Privacidade e Termos"
        dialog.message = "O Strimo VU usa um identificador local para ativação e funcionamento. Política: https://zenix.ativaapps.shop/privacy.php  ·  Termos: https://zenix.ativaapps.shop/terms.php"
    else
        dialog.title = "Strimo VU"
        dialog.message = "Versão " + m.appVersion + "  ·  Plataforma Roku  ·  Chave do dispositivo: " + m.deviceKey
    end if
    dialog.buttons = ["OK"]
    dialog.observeField("buttonSelected", "onSettingsDialogSelected")
    m.top.dialog = dialog
end sub

sub onSettingsDialogSelected(event as object)
    dialog = event.getRoSGNode()
    dialog.close = true
    if m.currentScreen = "settings" then m.top.findNode("settingsAccounts").setFocus(true)
end sub

sub showOutputFormatDialog()
    dialog = CreateObject("roSGNode", "Dialog")
    dialog.title = "Formato de saída"
    dialog.message = "Formato de saída selecionado. DEFAULT usa o modo automático do Roku. M3U8 força HLS. TS força MPEG-TS direto."
    dialog.buttons = ["DEFAULT", "M3U8", "TS", "Cancelar"]
    dialog.observeField("buttonSelected", "onOutputFormatSelected")
    m.top.dialog = dialog
end sub

sub onOutputFormatSelected(event as object)
    dialog = event.getRoSGNode()
    idx = event.getData()
    if idx >= 0 and idx <= 2
        choices = ["DEFAULT", "M3U8", "TS"]
        m.outputFormat = choices[idx]
        reg = CreateObject("roRegistrySection", "awplay_settings")
        reg.Write("output_format", m.outputFormat)
        reg.Flush()
        updateSettingsInfo()
        toast("Formato de saída: " + m.outputFormat)
    end if
    dialog.close = true
    if m.currentScreen = "settings" then m.top.findNode("settingsOutputFormat").setFocus(true)
end sub

sub showInfoScreen()
    hideMainGroups()
    m.clockTimer.control = "stop"
    m.currentScreen = "info"
    m.infoGroup.visible = true

    providerText = "Strimo VU"
    if m.providerName <> ""
        providerText = m.providerName
    else if m.providerId <> ""
        providerText = m.providerId
    end if
    m.top.findNode("infoProviderName").text = shortText(providerText, 24)

    userText = "--"
    passText = "------"
    if m.xtream <> invalid
        if m.xtream.user <> invalid and m.xtream.user <> "" then userText = m.xtream.user
        if m.xtream.pass <> invalid and m.xtream.pass <> "" then passText = maskPassword(m.xtream.pass)
    else
        if m.username <> "" then userText = m.username
        if m.password <> "" then passText = maskPassword(m.password)
    end if
    m.top.findNode("infoUsername").text = shortText(userText, 24)
    m.top.findNode("infoPassword").text = passText
    m.top.findNode("infoPlaylistExpiry").text = shortText(m.currentExpiryText, 28)
    m.top.findNode("infoDeviceStatus").text = "Ativo"
    m.top.findNode("infoAccountStatus").text = "Active"
    m.top.findNode("infoDeviceExpiry").text = "Gerenciado pelo painel"
    m.top.findNode("infoDeviceKey").text = m.deviceKey
    m.top.findNode("infoVersion").text = "Versão do aplicativo: " + m.appVersion
    m.top.findNode("infoAccountBtn").setFocus(true)
end sub

sub showOutputFormatScreen()
    hideMainGroups()
    m.clockTimer.control = "stop"
    m.currentScreen = "format"
    m.outputFormatGroup.visible = true
    updateOutputFormatVisualState()
    if m.outputFormat = "M3U8"
        m.top.findNode("fmtM3U8Btn").setFocus(true)
    else if m.outputFormat = "TS"
        m.top.findNode("fmtTSBtn").setFocus(true)
    else
        m.top.findNode("fmtDefaultBtn").setFocus(true)
    end if
    updateOutputFormatVisualState()
end sub

sub setOutputFormat(fmt as string)
    if fmt <> "DEFAULT" and fmt <> "M3U8" and fmt <> "TS" then return
    m.outputFormat = fmt
    reg = CreateObject("roRegistrySection", "awplay_settings")
    reg.Write("output_format", m.outputFormat)
    reg.Flush()
    updateSettingsInfo()
    updateOutputFormatVisualState()
    toast("Formato de saída: " + m.outputFormat)
end sub

sub updateOutputFormatVisualState()
    defs = [
        {fmt:"DEFAULT", btn:"fmtDefaultBtn", card:"fmtDefaultCard", check:"fmtDefaultCheck"},
        {fmt:"M3U8", btn:"fmtM3U8Btn", card:"fmtM3U8Card", check:"fmtM3U8Check"},
        {fmt:"TS", btn:"fmtTSBtn", card:"fmtTSCard", check:"fmtTSCheck"}
    ]
    for each d in defs
        b = m.top.findNode(d.btn)
        c = m.top.findNode(d.card)
        check = m.top.findNode(d.check)
        selected = (m.outputFormat = d.fmt)
        focused = (b <> invalid and b.hasFocus())
        if c <> invalid
            if focused then
                c.color = "0x5A314CF2"
            else if selected
                c.color = "0x2F3855EA"
            else
                c.color = "0x242C42E8"
            end if
        end if
        if check <> invalid then check.visible = selected
    end for
end sub

function liveStreamUrl(streamId as dynamic) as string
    sid = sVal(streamId)
    suffix = ".m3u8"
    if m.outputFormat = "TS" then suffix = ".ts"
    return m.xtream.base + "/live/" + enc(m.xtream.user) + "/" + enc(m.xtream.pass) + "/" + sid + suffix
end function

sub applyLiveStreamFormat(content as object)
    if content = invalid then return
    if m.outputFormat = "TS"
        content.streamFormat = "ts"
    else
        content.streamFormat = "hls"
    end if
end sub

sub showHome()
    hideMainGroups()
    m.currentScreen = "home"
    m.currentSection = ""
    m.pollTimer.control = "stop"
    m.pollTimer.duration = 15
    m.pollTimer.control = "start"
    m.homeGroup.visible = true
    updateClock()
    updateHomeExpiryLabel()
    m.clockTimer.control = "start"
    m.top.findNode("homeLive").setFocus(true)
    updateHomeMenuVisualState()
    refreshContinueCard()
    ' A Home launcher não usa mais o rail recente. Evita baixar e processar
    ' catálogos grandes toda vez que o cliente volta para esta tela.
    resetHomeHero()
end sub

sub showWhatsappSupport()
    if not m.supportWhatsappEnabled or m.supportQrUrl = ""
        toast("Atendimento pelo WhatsApp não está disponível agora.")
        return
    end if
    hideMainGroups()
    m.currentScreen = "support"
    m.supportGroup.visible = true
    m.top.findNode("supportPhoneLabel").text = "WhatsApp: +" + m.supportWhatsapp
    m.top.findNode("supportQrPoster").uri = m.supportQrUrl + "?cb=" + CreateObject("roDateTime").AsSeconds().ToStr()
    m.top.findNode("supportBack").setFocus(true)
end sub

sub refreshHomeHeroAndRecent()
    ' Mantido apenas como compatibilidade interna. O launcher não consulta mais
    ' filmes ou séries recentes em segundo plano.
    resetHomeHero()
end sub

sub updateHomeMenuVisualState()
    defs = [
        { btn: "homeLive", card: "homeCardLive", label: "homeLabelLive", normal: "0x151A27EE" },
        { btn: "homeMovies", card: "homeCardMovies", label: "homeLabelMovies", normal: "0x151A27EE" },
        { btn: "homeSeries", card: "homeCardSeries", label: "homeLabelSeries", normal: "0x151A27EE" },
        { btn: "homeKids", card: "homeCardKids", label: "homeLabelKids", normal: "0x221830EE" },
        { btn: "homeSports", card: "homeCardSports", label: "homeLabelSports", normal: "0x151A27EE" },
        { btn: "homeAccount", card: "homeCardAccount", label: "homeLabelAccount", normal: "0x151A27EE" },
        { btn: "homeSettings", card: "homeCardSettings", label: "homeLabelSettings", normal: "0x151A27EE" },
        { btn: "homeRefresh", card: "homeCardRefresh", label: "homeLabelRefresh", normal: "0x121624EE" },
        { btn: "homeSupport", card: "homeCardSupport", label: "homeLabelSupport", normal: "0x140F24EE" }
    ]

    for each item in defs
        btn = m.top.findNode(item.btn)
        card = m.top.findNode(item.card)
        label = m.top.findNode(item.label)
        focused = (btn <> invalid and btn.hasFocus())
        if card <> invalid
            if focused then card.color = "0xE720A5FF" else card.color = item.normal
        end if
        if label <> invalid
            if focused then label.color = "0xFFFFFFFF" else label.color = "0xE3E7EFFF"
        end if
    end for

    ' Ao navegar em Filmes/Séries, o hero já antecipa o conteúdo mais recente
    ' daquela seção sem obrigar o usuário a abrir o catálogo.
    moviesBtn = m.top.findNode("homeMovies")
    seriesBtn = m.top.findNode("homeSeries")
    kidsBtn = m.top.findNode("homeKids")
    if moviesBtn <> invalid and moviesBtn.hasFocus() and m.homeRecent.Count() > 0
        showHomeHeroEntry(m.homeRecent[0], "movies")
    else if seriesBtn <> invalid and seriesBtn.hasFocus() and m.homeRecentSeries.Count() > 0
        showHomeHeroEntry(m.homeRecentSeries[0], "series")
    else if kidsBtn <> invalid and kidsBtn.hasFocus()
        m.homeHeroEntry = invalid
        m.homeHeroSection = "kids"
        m.top.findNode("homeHeroBadge").text = "KIDS PREMIUM"
        m.top.findNode("homeHeroTitle").text = "Diversão para toda a família"
        m.top.findNode("homeHeroGenres").text = "Animação  ·  Aventura  ·  Fantasia"
        m.top.findNode("homeHeroFacts").text = "CONTEÚDO INFANTIL EM UM SÓ LUGAR"
        m.top.findNode("homeHeroOverview").text = "Uma seleção especial com categorias infantis e familiares do seu catálogo."
        m.top.findNode("homeHeroPoster").visible = false
        m.top.findNode("homeHeroBackdrop").uri = "pkg:/images/home_hero.png"
        m.top.findNode("homeHeroPlayLabel").text = "Abrir Kids"
    end if
end sub

sub loadHomeRecent()
    if m.xtream = invalid then return
    if m.homeRecentLoaded then return

    if not m.homeRecentMoviesLoaded and not m.homeRecentMoviesLoading
        m.homeRecentMoviesLoading = true
        m.homeRecentLoading = true
        m.top.findNode("recentHint").text = "Atualizando..."
        startRequest("home_recent_movies", xapi("get_vod_streams"), "GET", "")
    end if

    if not m.homeRecentSeriesLoaded and not m.homeRecentSeriesLoading
        m.homeRecentSeriesLoading = true
        m.homeRecentLoading = true
        m.top.findNode("recentSeriesHint").text = "Atualizando..."
        startRequest("home_recent_series", xapi("get_series"), "GET", "")
    end if
end sub

function pickRecentItems(data as dynamic, kind as string) as object
    topItems = []
    if data = invalid then return topItems
    for each row in data
        if row <> invalid
            validRow = false
            if kind = "movie" and row.stream_id <> invalid then validRow = true
            if kind = "series" and row.series_id <> invalid then validRow = true
            if validRow
                title = "Conteúdo"
                if row.name <> invalid and row.name <> "" then title = sVal(row.name)
                poster = ""
                if kind = "movie" and row.stream_icon <> invalid and row.stream_icon <> "" then poster = sVal(row.stream_icon)
                if kind = "series"
                    if row.cover <> invalid and row.cover <> "" then poster = sVal(row.cover)
                    if poster = "" and row.stream_icon <> invalid and row.stream_icon <> "" then poster = sVal(row.stream_icon)
                end if
                addedValue = 0
                if row.added <> invalid then addedValue = Val(sVal(row.added))
                if kind = "series" and row.last_modified <> invalid then addedValue = Val(sVal(row.last_modified))
                item = { title:title, poster:poster, added:addedValue, raw:row }
                if topItems.Count() < 6
                    topItems.Push(item)
                else
                    minIndex = 0
                    minAdded = topItems[0].added
                    for j = 1 to topItems.Count() - 1
                        if topItems[j].added < minAdded
                            minAdded = topItems[j].added
                            minIndex = j
                        end if
                    end for
                    if addedValue > minAdded then topItems[minIndex] = item
                end if
            end if
        end if
    end for

    if topItems.Count() > 1
        for a = 0 to topItems.Count() - 2
            for b = a + 1 to topItems.Count() - 1
                if topItems[b].added > topItems[a].added
                    tempItem = topItems[a]
                    topItems[a] = topItems[b]
                    topItems[b] = tempItem
                end if
            end for
        end for
    end if
    return topItems
end function

sub handleHomeRecent(data as object)
    m.homeRecentMoviesLoading = false
    m.homeRecent = pickRecentItems(data, "movie")
    m.homeRecentMoviesLoaded = true

    recentRoot = CreateObject("roSGNode", "ContentNode")
    for each recentItem in m.homeRecent
        recentChild = recentRoot.CreateChild("ContentNode")
        displayRecentTitle = shortText(recentItem.title, 24)
        recentChild.title = displayRecentTitle
        recentChild.shortDescriptionLine1 = displayRecentTitle
        recentChild.shortDescriptionLine2 = homeRatingStars(recentItem.raw)
        if recentItem.poster <> ""
            recentChild.hdPosterUrl = recentItem.poster
            recentChild.hdGridPosterUrl = recentItem.poster
            recentChild.sdGridPosterUrl = recentItem.poster
        end if
    end for
    m.recentGrid.content = recentRoot
    if m.homeRecent.Count() > 0
        m.top.findNode("recentHint").text = m.homeRecent.Count().ToStr() + " destaques"
        seriesBtn = m.top.findNode("homeSeries")
        if seriesBtn = invalid or not seriesBtn.hasFocus() then showHomeHeroEntry(m.homeRecent[0], "movies")
    else
        m.top.findNode("recentHint").text = "Nenhum filme"
    end if
    finalizeHomeRecentLoad()
end sub

sub handleHomeRecentSeries(data as object)
    m.homeRecentSeriesLoading = false
    m.homeRecentSeries = pickRecentItems(data, "series")
    m.homeRecentSeriesLoaded = true

    ' Mantemos o conteúdo no nó oculto por compatibilidade e para poder
    ' pré-visualizar séries instantaneamente ao focar o menu Séries.
    root = CreateObject("roSGNode", "ContentNode")
    for each item in m.homeRecentSeries
        child = root.CreateChild("ContentNode")
        child.title = shortText(item.title, 24)
        if item.poster <> ""
            child.hdGridPosterUrl = item.poster
            child.sdGridPosterUrl = item.poster
        end if
    end for
    m.recentSeriesGrid.content = root
    if m.homeRecentSeries.Count() > 0
        m.top.findNode("recentSeriesHint").text = m.homeRecentSeries.Count().ToStr() + " séries"
        seriesBtn = m.top.findNode("homeSeries")
        if seriesBtn <> invalid and seriesBtn.hasFocus() then showHomeHeroEntry(m.homeRecentSeries[0], "series")
    else
        m.top.findNode("recentSeriesHint").text = "Nenhuma série"
    end if
    finalizeHomeRecentLoad()
end sub

sub finalizeHomeRecentLoad()
    if not m.homeRecentMoviesLoaded or not m.homeRecentSeriesLoaded then return
    m.homeRecentLoaded = true
    m.homeRecentLoading = false
    if m.refreshingContent
        m.refreshingContent = false
        hideLoading()
        toast("Conteúdo atualizado com sucesso.")
    end if
end sub

function homeRatingStars(row as dynamic) as string
    if row = invalid then return ""
    if row.rating <> invalid and sVal(row.rating) <> "" then return ratingStars(row.rating)
    if row.rating_5based <> invalid and sVal(row.rating_5based) <> "" then return ratingStars(row.rating_5based)
    return ""
end function

sub resetHomeHero()
    m.homeHeroEntry = invalid
    m.homeHeroSection = "movies"
    m.homeHeroRequestKey = ""
    bg = m.top.findNode("homeHeroBackdrop")
    if bg <> invalid then bg.uri = "pkg:/images/home_hero.png"
    p = m.top.findNode("homeHeroPoster")
    if p <> invalid then p.visible = false
    m.top.findNode("homeHeroBadge").text = "DESTAQUE"
    m.top.findNode("homeHeroTitle").text = "Strimo VU"
    m.top.findNode("homeHeroGenres").text = ""
    m.top.findNode("homeHeroFacts").text = ""
    m.top.findNode("homeHeroOverview").text = "Preparando uma seleção especial para você..."
    playLabel = m.top.findNode("homeHeroPlayLabel")
    if playLabel <> invalid then playLabel.text = "Assistir agora"
    updateHomeHeroPlayVisualState()
end sub

sub onHomeRecentFocused(event as object)
    idx = event.getData()
    if idx < 0 or idx >= m.homeRecent.Count() then return
    showHomeHeroEntry(m.homeRecent[idx], "movies")
end sub

sub showHomeHeroEntry(entry as dynamic, section as string)
    if entry = invalid then return
    m.homeHeroEntry = entry
    m.homeHeroSection = section
    row = entry.raw

    badge = "FILME EM DESTAQUE"
    if section = "series" then badge = "SÉRIE EM DESTAQUE"
    m.top.findNode("homeHeroBadge").text = badge
    m.top.findNode("homeHeroTitle").text = entry.title
    playLabel = m.top.findNode("homeHeroPlayLabel")
    if playLabel <> invalid
        if section = "movies" then playLabel.text = "Assistir agora" else playLabel.text = "Ver série"
    end if
    updateHomeHeroPlayVisualState()

    genres = ""
    if row <> invalid and row.genre <> invalid then genres = sVal(row.genre)
    m.top.findNode("homeHeroGenres").text = genres

    facts = ""
    if row <> invalid and row.rating <> invalid and sVal(row.rating) <> ""
        facts = ratingStars(row.rating) + "  " + sVal(row.rating) + "/10"
    end if
    yearText = ""
    if row <> invalid and row.year <> invalid then yearText = sVal(row.year)
    if yearText = "" and row <> invalid and row.releaseDate <> invalid then yearText = sVal(row.releaseDate)
    if yearText <> ""
        if facts <> "" then facts = facts + "  ·  "
        facts = facts + yearText
    end if
    m.top.findNode("homeHeroFacts").text = facts

    overview = ""
    if row <> invalid and row.plot <> invalid then overview = sVal(row.plot)
    if overview = "" and row <> invalid and row.description <> invalid then overview = sVal(row.description)
    if overview = "" then overview = "Buscando sinopse e detalhes deste conteúdo..."
    m.top.findNode("homeHeroOverview").text = overview

    heroBg = m.top.findNode("homeHeroBackdrop")
    heroPoster = m.top.findNode("homeHeroPoster")
    heroBg.uri = "pkg:/images/home_hero.png"
    heroPoster.visible = false
    if entry.poster <> ""
        heroPoster.uri = entry.poster
        heroPoster.visible = true
    end if

    if m.xtream = invalid or row = invalid then return
    contentId = ""
    if section = "movies" and row.stream_id <> invalid then contentId = sVal(row.stream_id)
    if section = "series" and row.series_id <> invalid then contentId = sVal(row.series_id)
    if contentId = "" then return
    requestKey = section + ":" + contentId
    if m.homeHeroRequestKey = requestKey then return
    m.homeHeroRequestKey = requestKey
    if section = "movies"
        startRequest("home_hero_movie|" + contentId, xapi("get_vod_info") + "&vod_id=" + enc(contentId), "GET", "")
    else
        startRequest("home_hero_series|" + contentId, xapi("get_series_info") + "&series_id=" + enc(contentId), "GET", "")
    end if
end sub

sub handleHomeHeroInfo(section as string, contentId as string, data as object)
    if m.homeHeroRequestKey <> section + ":" + contentId then return
    if data = invalid then return
    info = providerInfoObject(data)
    if info = invalid then return

    title = ""
    if info.name <> invalid then title = sVal(info.name)
    if title = "" and info.title <> invalid then title = sVal(info.title)
    if title <> "" then m.top.findNode("homeHeroTitle").text = title

    genres = ""
    if info.genre <> invalid then genres = sVal(info.genre)
    if genres <> "" then m.top.findNode("homeHeroGenres").text = genres

    rating = ""
    if info.rating <> invalid then rating = sVal(info.rating)
    dateText = ""
    if info.releasedate <> invalid then dateText = sVal(info.releasedate)
    if dateText = "" and info.releaseDate <> invalid then dateText = sVal(info.releaseDate)
    durationText = ""
    if info.duration <> invalid then durationText = sVal(info.duration)
    facts = ""
    if rating <> "" then facts = ratingStars(rating) + "  " + rating + "/10"
    if dateText <> ""
        if facts <> "" then facts = facts + "  ·  "
        facts = facts + dateText
    end if
    if durationText <> ""
        if facts <> "" then facts = facts + "  ·  "
        facts = facts + durationText
    end if
    if facts <> "" then m.top.findNode("homeHeroFacts").text = facts

    plot = ""
    if info.plot <> invalid then plot = sVal(info.plot)
    if plot = "" and info.description <> invalid then plot = sVal(info.description)
    if plot <> "" then m.top.findNode("homeHeroOverview").text = plot

    backdrop = ""
    if info.backdrop_path <> invalid
        bp = info.backdrop_path
        if GetInterface(bp, "ifArray") <> invalid
            if bp.Count() > 0 then backdrop = sVal(bp[0])
        else
            backdrop = sVal(bp)
        end if
    end if
    if backdrop = "" and info.backdrop <> invalid then backdrop = sVal(info.backdrop)
    if backdrop <> ""
        m.top.findNode("homeHeroBackdrop").uri = backdrop
        m.top.findNode("homeHeroPoster").visible = false
    else
        providerPoster = ""
        if info.movie_image <> invalid then providerPoster = sVal(info.movie_image)
        if providerPoster = "" and info.cover <> invalid then providerPoster = sVal(info.cover)
        if providerPoster <> ""
            m.top.findNode("homeHeroPoster").uri = providerPoster
            m.top.findNode("homeHeroPoster").visible = true
        end if
    end if
end sub

sub playHomeHeroDirect()
    if m.homeHeroEntry = invalid
        showCatalog("movies")
        return
    end if

    entry = m.homeHeroEntry
    row = entry.raw
    item = {name:entry.title, logo:entry.poster, plot:"", year:"", rating:"", genre:"", raw:row}
    if row <> invalid
        if row.plot <> invalid then item.plot = sVal(row.plot)
        if row.rating <> invalid then item.rating = sVal(row.rating)
        if row.year <> invalid then item.year = sVal(row.year)
        if row.genre <> invalid then item.genre = sVal(row.genre)
    end if

    ' Séries precisam da escolha de temporada/episódio.
    if m.homeHeroSection = "series"
        showMediaDetail(item, "series")
        return
    end if

    ' Respeita o bloqueio adulto. Neste caso abre o detalhe protegido em vez
    ' de pular diretamente para o player.
    if adultLockNeededForItem(item)
        showMediaDetail(item, "movies")
        return
    end if

    url = movieUrlForItem(item)
    if url = ""
        showMediaDetail(item, "movies")
        return
    end if
    m.currentVideoPoster = entry.poster
    playVideo(url, entry.title, "movie", 0)
end sub

sub updateHomeHeroPlayVisualState()
    btn = m.top.findNode("homeHeroPlayBtn")
    border = m.top.findNode("homeHeroPlayBorder")
    fill = m.top.findNode("homeHeroPlayFill")
    label = m.top.findNode("homeHeroPlayLabel")
    focused = (btn <> invalid and btn.hasFocus())
    if border <> invalid
        if focused then border.color = "0xBB69F6FF" else border.color = "0x3A6BFFFF"
    end if
    if fill <> invalid
        if focused then fill.color = "0x144FFFFF" else fill.color = "0x0C43E8FF"
    end if
    if label <> invalid then label.color = "0xFFFFFFFF"
end sub

sub playHero()
    if m.homeHeroEntry = invalid
        showCatalog("movies")
        return
    end if
    entry = m.homeHeroEntry
    row = entry.raw
    item = {name:entry.title, logo:entry.poster, plot:"", year:"", rating:"", genre:"", raw:row}
    if row <> invalid
        if row.plot <> invalid then item.plot = sVal(row.plot)
        if row.rating <> invalid then item.rating = sVal(row.rating)
        if row.year <> invalid then item.year = sVal(row.year)
        if row.genre <> invalid then item.genre = sVal(row.genre)
    end if
    showMediaDetail(item, m.homeHeroSection)
end sub

sub onHomeRecentSelected(event as object)
    idx = event.getData()
    if idx < 0 or idx >= m.homeRecent.Count() then return
    recent = m.homeRecent[idx]
    row = recent.raw
    item = {name:recent.title, logo:recent.poster, plot:"", year:"", rating:"", genre:"", raw:row}
    if row.plot <> invalid then item.plot = sVal(row.plot)
    if row.rating <> invalid then item.rating = sVal(row.rating)
    if row.year <> invalid then item.year = sVal(row.year)
    if row.genre <> invalid then item.genre = sVal(row.genre)
    showMediaDetail(item, "movies")
end sub

sub onHomeRecentSeriesSelected(event as object)
    idx = event.getData()
    if idx < 0 or idx >= m.homeRecentSeries.Count() then return
    recent = m.homeRecentSeries[idx]
    row = recent.raw
    item = {name:recent.title, logo:recent.poster, plot:"", year:"", rating:"", genre:"", raw:row}
    if row.plot <> invalid then item.plot = sVal(row.plot)
    if row.rating <> invalid then item.rating = sVal(row.rating)
    if row.year <> invalid then item.year = sVal(row.year)
    if row.genre <> invalid then item.genre = sVal(row.genre)
    showMediaDetail(item, "series")
end sub

function shortText(value as string, maxLen as integer) as string
    if Len(value) <= maxLen then return value
    if maxLen < 4 then return Left(value, maxLen)
    return Left(value, maxLen - 3) + "..."
end function

sub showCatalog(section as string)
    m.kidsMode = false
    if m.vodGrid <> invalid then m.itemGrid = m.vodGrid
    hideMainGroups()
    m.clockTimer.control = "start"
    updateClock()
    m.currentScreen = "catalog"
    m.currentSection = section
    m.catalogSearchQuery = ""
    m.currentCategoryId = ""
    m.currentCategoryName = ""
    m.catalogPage = 0
    m.renderedItems = []
    m.catalogGroup.visible = true
    m.liveLayout.visible = (section = "live")
    m.vodLayout.visible = (section = "movies" or section = "series")
    if m.kidsLayout <> invalid then m.kidsLayout.visible = false
    m.episodeLayout.visible = false
    m.categoryList.visible = true
    m.top.findNode("catalogBack").text = "Início"
    m.top.findNode("catalogBack").visible = false
    if m.catalogPageGrid <> invalid then m.catalogPageGrid.visible = false
    m.top.findNode("catalogLiveTab").visible = false
    m.top.findNode("catalogMoviesTab").visible = false
    m.top.findNode("catalogSeriesTab").visible = false
    m.top.findNode("catalogSearch").visible = false

    title = "Categorias"
    if section = "live" then title = "Canais ao vivo"
    if section = "movies" then title = "Filmes"
    if section = "series" then title = "Séries"
    m.top.findNode("catalogTitle").text = title
    headerTitle = "Explore seu catálogo"
    if section = "live" then headerTitle = "TV ao vivo · escolha uma categoria"
    if section = "movies" then headerTitle = "Cinema · encontre seu próximo filme"
    if section = "series" then headerTitle = "Séries · escolha sua próxima história"
    m.top.findNode("catalogItemsTitle").text = headerTitle
    m.top.findNode("catalogLiveTab").text = "Ao vivo"
    m.top.findNode("catalogMoviesTab").text = "Filmes"
    m.top.findNode("catalogSeriesTab").text = "Séries"
    m.top.findNode("catalogSearch").text = "Buscar"
    m.top.findNode("vodSearchBtn").visible = false
    if section = "movies" then m.top.findNode("vodSearchBtn").text = "Buscar filmes"
    if section = "series" then m.top.findNode("vodSearchBtn").text = "Buscar séries"
    m.top.findNode("catalogFavorite").visible = false
    m.top.findNode("catalogFavorite").text = "Favoritar"
    m.top.findNode("catalogPrevPage").visible = false
    m.top.findNode("catalogNextPage").visible = false
    if m.top.findNode("catalogPaginationGroup") <> invalid then m.top.findNode("catalogPaginationGroup").visible = false
    m.top.findNode("catalogCount").text = "Carregando"
    m.top.findNode("previewPlaceholder").visible = true
    m.top.findNode("previewPlaceholder").text = "Selecione um canal e pressione OK"
    m.top.findNode("liveHelp").visible = false
    m.top.findNode("liveChannelLogo").uri = ""
    m.top.findNode("liveChannelTitle").text = "Canal"
    m.top.findNode("liveChannelCategory").text = ""
    m.top.findNode("liveNow").text = "Programação não informada"
    m.top.findNode("liveNext").text = "Programação não informada"
    m.top.findNode("liveNowTime").text = ""
    m.top.findNode("liveNextTime").text = ""
    m.top.findNode("liveFavoriteBtn").text = "Favoritar"
    favState = m.top.findNode("liveFavoriteState")
    if favState <> invalid
        favState.text = "★  Tecla * para favoritar"
        favState.color = "0xC677FFFF"
    end if
    m.top.findNode("vodHelp").text = "OK para abrir · use Favoritar para salvar"

    m.categories = []
    m.items = []
    m.allItems = []
    setListContent(m.categoryList, [])
    setListContent(m.itemList, [])
    setListContent(m.episodeList, [])
    setListContent(m.seasonList, [])
    m.itemGrid.content = CreateObject("roSGNode", "ContentNode")
    requestCategories(section)
end sub

sub showKidsCatalog()
    showCatalog("movies")
    m.kidsMode = true
    m.vodLayout.visible = false
    if m.kidsLayout <> invalid then m.kidsLayout.visible = true
    if m.kidsGrid <> invalid
        m.itemGrid = m.kidsGrid
        m.itemGrid.content = CreateObject("roSGNode", "ContentNode")
    end if
    m.top.findNode("catalogTitle").text = "Kids Premium"
    m.top.findNode("catalogItemsTitle").text = "Kids · diversão para toda a família"
    m.top.findNode("catalogCount").text = "Carregando"
end sub

sub showSports()
    hideMainGroups()
    m.clockTimer.control = "stop"
    m.currentScreen = "sports"
    m.currentSection = "sports"
    m.sportsGroup.visible = true
    m.sportsGames = []
    m.sportsChannelNames = []
    m.sportsGrid.content = CreateObject("roSGNode", "ContentNode")
    setListContent(m.sportsChannels, [])
    m.top.findNode("sportsSelectedTitle").text = "Selecione um jogo"
    m.top.findNode("sportsSelectedMeta").text = ""
    m.top.findNode("sportsLeagueLogo").uri = ""
    m.top.findNode("sportsHint").text = "Selecione um jogo para ver os canais."
    showLoading("Carregando jogos de hoje...")
    startRequest("sports", m.apiBase + "sports.php", "GET", "")
end sub

sub showLoading(text as string)
    m.top.findNode("loadingText").text = text
    spinner = m.top.findNode("loadingSpinner")
    if spinner <> invalid then spinner.control = "start"
    m.loadingGroup.visible = true
end sub

sub hideLoading()
    spinner = m.top.findNode("loadingSpinner")
    if spinner <> invalid then spinner.control = "stop"
    m.loadingGroup.visible = false
end sub

sub toast(text as string)
    m.toastText.text = text
    m.toastGroup.visible = true
    m.toastTimer.control = "start"
end sub

sub onToastTimer()
    m.toastGroup.visible = false
end sub

sub onButtonSelected(event as object)
    node = event.getRoSGNode()
    id = node.id
    if id = "consentAccept"
        reg = CreateObject("roRegistrySection", "awplay")
        reg.Write("consent_version", "1")
        reg.Flush()
        initDevice()
        startRegistration()
    else if id = "consentExit"
        m.top.close = true
    else if id = "providerActivationBtn"
        showAccount()
    else if id = "activationRefreshBtn"
        if m.activationQrReady
            checkStatus()
        else
            startRegistration()
        end if
    else if id = "accountSlot1"
        m.selectedAccountSlot = 1
        if accountConfigured(1) and (m.activeAccountSlot <> 1 or m.xtream = invalid)
            switchAccountSlot(1)
        else
            selectAccountSlot(1)
        end if
    else if id = "accountSlot2"
        m.selectedAccountSlot = 2
        if accountConfigured(2) and (m.activeAccountSlot <> 2 or m.xtream = invalid)
            switchAccountSlot(2)
        else
            selectAccountSlot(2)
        end if
    else if id = "switchAccountBtn"
        switchAccountSlot(m.selectedAccountSlot)
    else if id = "providerField"
        loadProviderOptions()
    else if id = "usernameField"
        openPremiumLoginKeyboard("username", "Nome de usuário", m.username, false)
    else if id = "passwordField"
        openPremiumLoginKeyboard("password", "Senha", m.password, false)
    else if id = "saveAccountBtn"
        submitAccount()
    else if id = "expiredCheckBtn"
        n = m.top.findNode("expiredAutoStatus")
        if n <> invalid then n.text = "Verificando renovação agora..."
        if m.xtream <> invalid then checkXtreamAccountState("expired") else checkStatus()
    else if id = "expiredExitBtn"
        m.top.close = true
    else if id = "disconnectAccountBtn"
        disconnectCurrentAccount()
    else if id = "cancelAccountBtn"
        if m.xtream <> invalid then showHome() else m.top.close = true
    else if id = "heroPlay"
        playHero()
    else if id = "heroInfo"
        playHero()
    else if id = "homeHeroPlayBtn"
        playHomeHeroDirect()
    else if id = "homeLive"
        showCatalog("live")
    else if id = "homeMovies"
        showCatalog("movies")
    else if id = "homeSeries"
        showCatalog("series")
    else if id = "homeKids"
        showKidsCatalog()
    else if id = "homeSports"
        showSports()
    else if id = "homeAccount"
        if m.xtream <> invalid
            showAccountInfo()
        else
            showAccount()
        end if
    else if id = "homeSettings"
        showSettings()
    else if id = "accountInfoDeleteBtn"
        if m.activeAccountSlot > 0
            m.selectedAccountSlot = m.activeAccountSlot
        else
            m.selectedAccountSlot = 1
        end if
        disconnectCurrentAccount()
    else if id = "accountInfoBackBtn"
        showHome()
    else if id = "settingsAccounts"
        if m.xtream <> invalid
            showAccountInfo()
        else
            showAccount()
        end if
    else if id = "settingsRefresh"
        refreshContentNow()
    else if id = "settingsClearProgress"
        clearAllPlaybackHistory()
    else if id = "settingsClearFavorites"
        clearAllFavorites()
    else if id = "settingsPrivacy"
        showSettingsDialog("privacy")
    else if id = "settingsAbout"
        showInfoScreen()
    else if id = "settingsOutputFormat"
        showOutputFormatScreen()
    else if id = "settingsBack"
        showHome()
    else if id = "homeRefresh"
        m.adultUnlocked = false
        m.loginConfigRequested = false
        requestAppConfig()
        m.homeRecentLoaded = false
        m.homeRecentLoading = false
        m.homeRecentMoviesLoaded = false
        m.homeRecentMoviesLoading = false
        m.homeRecentSeriesLoaded = false
        m.homeRecentSeriesLoading = false
        showLoading("Atualizando conteúdo...")
        checkStatus()
    else if id = "homeSupport"
        showWhatsappSupport()
    else if id = "supportBack"
        showHome()
    else if id = "continueBtn"
        playContinue()
    else if id = "catalogBack"
        if m.currentSection = "episodes"
            restoreMediaDetail()
        else
            showHome()
        end if
    else if id = "catalogLiveTab"
        showCatalog("live")
    else if id = "catalogMoviesTab"
        showCatalog("movies")
    else if id = "catalogSeriesTab"
        showCatalog("series")
    else if id = "catalogSearch" or id = "vodSearchBtn"
        openInstantSearch(m.currentSection)
    else if id = "catalogFavorite" or id = "liveFavoriteBtn"
        toggleFavoriteForCurrent()
    else if id = "catalogPrevPage"
        changeCatalogPage(-1)
    else if id = "catalogNextPage"
        changeCatalogPage(1)
    else if id = "pagePrevBottom"
        changeCatalogPage(-1)
    else if id = "pageNextBottom"
        changeCatalogPage(1)
    else if id = "pageNum1"
        jumpCatalogWindowPage(1)
    else if id = "pageNum2"
        jumpCatalogWindowPage(2)
    else if id = "pageNum3"
        jumpCatalogWindowPage(3)
    else if id = "pageNum4"
        jumpCatalogWindowPage(4)
    else if id = "pageNum5"
        jumpCatalogWindowPage(5)
    else if id = "infoAccountBtn"
        showAccount()
    else if id = "infoBack"
        showSettings()
    else if id = "fmtDefaultBtn"
        setOutputFormat("DEFAULT")
    else if id = "fmtM3U8Btn"
        setOutputFormat("M3U8")
    else if id = "fmtTSBtn"
        setOutputFormat("TS")
    else if id = "fmtBackBtn"
        showSettings()
    else if id = "detailBack"
        restoreCatalogFromDetail()
    else if id = "detailPrimary"
        activateDetailPrimary()
    else if id = "detailContinue"
        activateDetailContinue()
    else if id = "detailFavorite"
        toggleDetailFavorite()
    else if id = "seriesStartBtn"
        startSeriesFirstEpisode()
    else if id = "seriesFavoriteBtn"
        toggleDetailFavorite()
        if isFavoriteItem(m.selectedMedia, "series")
            m.top.findNode("seriesFavoriteBtn").text = "Remover favorito"
        else
            m.top.findNode("seriesFavoriteBtn").text = "Favoritar"
        end if
        updateSeriesEpisodeVisualState()
    else if id = "searchBack"
        closeInstantSearch()
    else if id = "resumeContinueBtn"
        startResumePlayback(true)
    else if id = "resumeRestartBtn"
        startResumePlayback(false)
    else if id = "resumeCancelBtn"
        closeResumeChoice()
    else if id = "sportsBack"
        showHome()
    end if
end sub

sub openPremiumLoginKeyboard(target as string, title as string, value as string, secure as boolean)
    ' Teclado SceneGraph dentro de modal opaco. A senha nunca é exibida em texto aberto.
    if m.loginKeyboardGroup = invalid or m.loginKeyboard = invalid then
        openKeyboard(target, title, value, secure)
        return
    end if
    m.loginKeyboardTarget = target
    m.loginEditing = true
    m.pollTimer.control = "stop"
    m.loginKeyboardValueText = value
    m.loginKeyboardSecure = secure
    m.loginKeyboard.text = value
    if m.loginKeyboard.textEditBox <> invalid
        m.loginKeyboard.textEditBox.secureMode = secure
        m.loginKeyboard.textEditBox.maxTextLength = 80
    end if
    titleNode = m.top.findNode("loginKeyboardTitle")
    modeNode = m.top.findNode("loginKeyboardModeLabel")
    valueNode = m.top.findNode("loginKeyboardValue")
    if titleNode <> invalid then titleNode.text = title
    if modeNode <> invalid
        if target = "password" then modeNode.text = "SENHA VISÍVEL" else modeNode.text = "CAMPO DE USUÁRIO"
    end if
    if valueNode <> invalid
        preview = value
        if secure then preview = maskPassword(value)
        if preview = ""
            if target = "password" then preview = "Digite sua senha" else preview = "Digite seu usuário"
            valueNode.color = "0x57699EFF"
        else
            valueNode.color = "0xFFFFFFFF"
        end if
        valueNode.text = shortText(preview, 48)
    end if
    m.loginKeyboardGroup.visible = true
    m.loginKeyboard.setFocus(true)
end sub

sub onLoginKeyboardTextChanged(event as object)
    if m.loginKeyboardGroup = invalid or not m.loginKeyboardGroup.visible then return
    value = sVal(event.getData())
    m.loginKeyboardValueText = value
    valueNode = m.top.findNode("loginKeyboardValue")
    if valueNode <> invalid
        preview = value
        if m.loginKeyboardSecure then preview = maskPassword(value)
        if preview = ""
            if m.loginKeyboardTarget = "password" then preview = "Digite sua senha" else preview = "Digite seu usuário"
            valueNode.color = "0x57699EFF"
        else
            valueNode.color = "0xFFFFFFFF"
        end if
        valueNode.text = shortText(preview, 48)
    end if
end sub

sub commitPremiumLoginKeyboard()
    target = m.loginKeyboardTarget
    value = m.loginKeyboardValueText
    if m.loginKeyboard <> invalid then value = sVal(m.loginKeyboard.text)
    if target = "username" then m.username = trimText(value)
    if target = "password" then m.password = value
    hidePremiumLoginKeyboard()
    updateAccountButtons()
    if target = "username"
        m.top.findNode("passwordField").setFocus(true)
    else if target = "password"
        m.top.findNode("saveAccountBtn").setFocus(true)
    end if
    updateAccountVisualState()
end sub

sub closePremiumLoginKeyboard(saveValue as boolean)
    target = m.loginKeyboardTarget
    if saveValue
        value = m.loginKeyboardValueText
        if m.loginKeyboard <> invalid then value = sVal(m.loginKeyboard.text)
        if target = "username" then m.username = trimText(value)
        if target = "password" then m.password = value
    end if
    hidePremiumLoginKeyboard()
    updateAccountButtons()
    ' BACK fecha o teclado e mantém o foco no mesmo campo, como no vídeo de referência.
    if target = "password"
        m.top.findNode("passwordField").setFocus(true)
    else
        m.top.findNode("usernameField").setFocus(true)
    end if
    updateAccountVisualState()
end sub

sub hidePremiumLoginKeyboard()
    if m.loginKeyboardGroup <> invalid then m.loginKeyboardGroup.visible = false
    m.loginKeyboardTarget = ""
    m.loginEditing = false
    if m.currentScreen = "account"
        m.pollTimer.duration = 5
        m.pollTimer.control = "start"
    end if
end sub

sub openKeyboard(target as string, title as string, value as string, secure as boolean)
    m.keyboardTarget = target
    if target = "username" or target = "password"
        m.loginEditing = true
        m.pollTimer.control = "stop"
    end if
    dialog = CreateObject("roSGNode", "StandardKeyboardDialog")
    dialog.title = title
    dialog.text = value
    dialog.buttons = ["OK", "Cancelar"]
    if dialog.textEditBox <> invalid
        dialog.textEditBox.hintText = title
        if secure
            dialog.textEditBox.secureMode = true
            dialog.textEditBox.secureLastCharacter = true
        end if
    end if
    dialog.observeField("buttonSelected", "onKeyboardResult")
    m.top.dialog = dialog
end sub

sub onKeyboardResult(event as object)
    dialog = event.getRoSGNode()
    selected = event.getData()
    if m.keyboardTarget = "adultpin"
        enteredPin = ""
        if selected = 0 then enteredPin = trimText(dialog.text)
        dialog.close = true
        if selected = 0 then handleAdultPinEntered(enteredPin) else clearPendingAdultAction()
        return
    end if
    if selected = 0
        if m.keyboardTarget = "provider" then m.providerId = trimText(dialog.text)
        if m.keyboardTarget = "username" then m.username = trimText(dialog.text)
        if m.keyboardTarget = "password" then m.password = dialog.text
        if m.keyboardTarget = "catalogsearch"
            m.catalogSearchQuery = trimText(dialog.text)
            applyCatalogSearch(m.catalogSearchQuery)
        else if m.keyboardTarget = "instantsearch"
            applyInstantLocalSearch(trimText(dialog.text))
        else
            updateAccountButtons()
        end if
    end if
    dialog.close = true
    if m.keyboardTarget = "username" or m.keyboardTarget = "password"
        m.loginEditing = false
        if m.currentScreen = "account"
            m.pollTimer.duration = 5
            m.pollTimer.control = "start"
        end if
    end if
end sub

sub loadProviderOptions()
    m.top.findNode("accountStatus").text = "Carregando Providers disponíveis..."
    showLoading("Carregando Providers...")
    url = m.apiBase + "providers.php?device_id=" + enc(m.deviceId) + "&device_key=" + enc(m.deviceKey)
    startRequest("providers", url, "GET", "")
end sub

sub showProviderPicker(data as dynamic)
    hideLoading()
    m.providerOptions = []
    root = CreateObject("roSGNode", "ContentNode")
    if data <> invalid and data.providers <> invalid
        for each p in data.providers
            available = true
            if p.available <> invalid then available = p.available
            if available
                pid = trimText(sVal(p.id))
                pname = trimText(sVal(p.name))
                if pid <> ""
                    if pname = "" then pname = pid
                    m.providerOptions.Push({id:pid, name:pname})
                    node = root.CreateChild("ContentNode")
                    node.title = pname
                    node.addField("subtitle", "string", true)
                    node.addField("providerId", "string", true)
                    node.addField("isCurrent", "boolean", true)
                    node.providerId = pid
                    node.subtitle = "Provider ID: " + pid
                    node.isCurrent = (LCase(pid) = LCase(m.providerId))
                end if
            end if
        end for
    end if
    if m.providerOptions.Count() = 0
        m.top.findNode("accountStatus").text = "Nenhum Provider ativo/disponível no painel."
        return
    end if
    if m.providerPickerGrid = invalid or m.providerPickerGroup = invalid then return
    m.providerPickerGrid.content = root
    countLabel = m.top.findNode("providerPickerCount")
    if countLabel <> invalid
        if m.providerOptions.Count() = 1
            countLabel.text = "1 PROVEDOR DISPONÍVEL"
        else
            countLabel.text = m.providerOptions.Count().ToStr() + " PROVEDORES DISPONÍVEIS"
        end if
    end if
    m.providerPickerGroup.visible = true
    focusIndex = 0
    for i = 0 to m.providerOptions.Count() - 1
        if LCase(sVal(m.providerOptions[i].id)) = LCase(m.providerId) then focusIndex = i : exit for
    end for
    m.providerPickerGrid.jumpToItem = focusIndex
    m.providerPickerGrid.setFocus(true)
end sub

sub closeProviderPicker()
    if m.providerPickerGroup <> invalid then m.providerPickerGroup.visible = false
    if m.providerPickerGrid <> invalid then m.providerPickerGrid.content = invalid
    if m.top.findNode("providerField") <> invalid then m.top.findNode("providerField").setFocus(true)
    updateAccountVisualState()
end sub

sub onProviderGridSelected(event as object)
    idx = event.getData()
    if idx >= 0 and idx < m.providerOptions.Count()
        opt = m.providerOptions[idx]
        m.providerId = sVal(opt.id)
        m.providerName = sVal(opt.name)
        m.top.findNode("accountStatus").text = "Provider selecionado: " + m.providerName
        updateAccountButtons()
    end if
    closeProviderPicker()
end sub

sub submitAccount()
    m.providerId = "auto"
    if m.username = "" or m.password = ""
        m.top.findNode("accountStatus").text = "Preencha usuário e senha para continuar."
        return
    end if
    m.top.findNode("accountStatus").text = "Validando suas credenciais..."
    ' Primeiro deixa a própria Roku testar cada DNS. Isso contorna provedores que bloqueiam o IP da hospedagem.
    m.loginProviderCandidates = []
    m.loginProviderIndex = 0
    m.loginProbeProviderId = ""
    showLoading("Localizando seu servidor...")
    url = m.apiBase + "providers.php?device_id=" + enc(m.deviceId) + "&device_key=" + enc(m.deviceKey)
    startRequest("login_providers", url, "GET", "")
end sub

sub saveAccountWithProvider(providerId as string)
    m.providerId = providerId
    payload = {
        device_id: m.deviceId,
        device_key: m.deviceKey,
        platform: "roku",
        login_type: "provider",
        playlist_name: "Strimo VU",
        slot: 1,
        provider_id: m.providerId,
        username: m.username,
        password: m.password
    }
    showLoading("Conectando Provider...")
    startRequest("save_account", m.apiBase + "save-account.php", "POST", FormatJson(payload))
end sub

sub tryNextLoginProvider()
    if m.loginProviderCandidates = invalid or m.loginProviderIndex >= m.loginProviderCandidates.Count()
        hideLoading()
        m.accountGroup.visible = true
        m.top.findNode("accountStatus").text = "Usuário ou senha não foram aceitos nos servidores disponíveis."
        return
    end if
    candidate = m.loginProviderCandidates[m.loginProviderIndex]
    m.loginProviderIndex = m.loginProviderIndex + 1
    m.loginProbeProviderId = sVal(candidate.id)
    dns = sVal(candidate.dns)
    if dns = ""
        tryNextLoginProvider()
        return
    end if
    if Right(dns, 1) = "/" then dns = Left(dns, Len(dns) - 1)
    m.top.findNode("accountStatus").text = "Localizando servidor " + m.loginProviderIndex.ToStr() + " de " + m.loginProviderCandidates.Count().ToStr() + "..."
    url = dns + "/player_api.php?username=" + enc(m.username) + "&password=" + enc(m.password)
    startRequest("login_probe", url, "GET", "")
end sub

sub checkStatus()
    if m.statusRequestPending then return
    m.statusRequestPending = true
    now = CreateObject("roDateTime")
    url = m.apiBase + "status.php?device_code=" + enc(m.deviceKey) + "&device_id=" + enc(m.deviceId) + "&cb=" + now.AsSeconds().ToStr()
    startRequest("status_bridge", url, "GET", "")
end sub

sub onPollTimer()
    if m.currentScreen = "activation"
        checkStatus()
    else if m.currentScreen = "expired"
        if m.xtream <> invalid then checkXtreamAccountState("expired") else checkStatus()
    else if m.currentScreen = "account"
        ' Enquanto ninguém está digitando, recebe automaticamente a ativação feita pelo revendedor.
        if not m.loginEditing and m.username = "" and m.password = "" then checkStatus()
    else if m.currentScreen = "home"
        ' Mantém a TV sincronizada quando uma conta é trocada ou excluída pelo portal.
        checkStatus()
    end if
end sub

sub startRequest(tag as string, url as string, method as string, body as string)
    task = CreateObject("roSGNode", "NetworkTask")
    task.tag = tag
    task.url = url
    task.method = method
    task.body = body
    task.observeField("response", "onNetworkResponse")
    task.observeField("error", "onNetworkError")
    m.taskContainer.appendChild(task)
    task.control = "RUN"
end sub

sub startFilteredRequest(tag as string, url as string, query as string, maxResults as integer)
    task = CreateObject("roSGNode", "NetworkTask")
    task.tag = tag
    task.url = url
    task.method = "GET"
    task.body = ""
    task.filterQuery = query
    task.filterLimit = maxResults
    task.observeField("response", "onNetworkResponse")
    task.observeField("error", "onNetworkError")
    m.taskContainer.appendChild(task)
    task.control = "RUN"
end sub

sub onNetworkError(event as object)
    task = event.getRoSGNode()
    err = event.getData()
    if err = invalid or err = "" then return
    hideLoading()
    if isRuntimeProviderRequest(task.tag) and (err = "HTTP 401" or err = "HTTP 403" or err = "HTTP 404" or err = "HTTP 410" or err = "HTTP 422")
        ' A conta pode vencer ou ser bloqueada enquanto o cliente já está navegando.
        ' Confirma o estado no endpoint da conta antes de mostrar qualquer erro técnico.
        checkXtreamAccountState("runtime")
        return
    end if
    if task.tag = "app_config"
        if not m.appConfigFallbackTried
            m.appConfigFallbackTried = true
            startRequest("app_config_fallback", m.panelBase + "/app-config.php", "GET", "")
            return
        end if
        m.loginConfigRequested = false
        return
    else if task.tag = "app_config_fallback"
        m.loginConfigRequested = false
        return
    else if task.tag = "status_bridge" or task.tag = "status" or task.tag = "status_fallback"
        m.statusRequestPending = false
        m.statusFallbackTried = false
        if m.xtream <> invalid
            mode = "initial"
            if m.currentScreen = "expired" then mode = "expired"
            checkXtreamAccountState(mode)
        else if m.currentScreen = "expired"
            n = m.top.findNode("expiredAutoStatus")
            if n <> invalid then n.text = "Não foi possível verificar agora. Tentaremos novamente."
        else if m.currentScreen = "activation"
            showAccount()
            m.top.findNode("accountStatus").text = "Sem resposta do painel. Tente entrar novamente."
        else
            showAccount()
            m.top.findNode("accountStatus").text = "Não foi possível consultar sua conta agora."
        end if
        return
    else if Left(task.tag, 13) = "xtream_state|"
        mode = Mid(task.tag, 14)
        if err = "HTTP 401" or err = "HTTP 403"
            payload = { account: m.currentAccountData }
            showExpiredAccount(payload, "playlist_blocked")
        else if err = "HTTP 404" or err = "HTTP 410" or err = "HTTP 422"
            payload = { account: m.currentAccountData }
            showExpiredAccount(payload, "playlist_expired")
        else if mode = "initial"
            showHome()
        else
            n = m.top.findNode("expiredAutoStatus")
            if n <> invalid then n.text = "Sem resposta do servidor agora. Nova tentativa automática em breve."
        end if
        return
    else if task.tag = "register"
        showAccount()
        m.top.findNode("accountStatus").text = "Falha ao reconhecer a TV: " + err
    else if task.tag = "delete_account"
        if m.currentScreen = "accountinfo"
            if m.accountInfoGroup <> invalid then m.accountInfoGroup.visible = true
            toast(err)
        else
            m.top.findNode("accountStatus").text = err
            m.accountGroup.visible = true
        end if
    else if task.tag = "save_account" or task.tag = "switch_account" or task.tag = "disconnect_account"
        m.top.findNode("accountStatus").text = err
        m.accountGroup.visible = true
    else if task.tag = "login_providers"
        m.top.findNode("accountStatus").text = "Não foi possível carregar os servidores cadastrados."
        m.accountGroup.visible = true
    else if task.tag = "login_probe"
        ' Um Provider indisponível não encerra o login; testa automaticamente o próximo.
        showLoading("Procurando outro servidor...")
        tryNextLoginProvider()
    else if Left(task.tag, 10) = "recentcat_"
        ' Uma categoria indisponível não cancela a montagem dos recentes.
        requestNextRecentCategory()
    else if task.tag = "providers"
        m.top.findNode("accountStatus").text = "Não foi possível carregar os Providers: " + err
        m.accountGroup.visible = true
    else if task.tag = "adult_pin"
        clearPendingAdultAction()
        toast("Não foi possível validar o PIN adulto.")
    else if task.tag = "home_recent_movies"
        m.homeRecentMoviesLoading = false
        m.homeRecentLoading = false
        m.top.findNode("recentHint").text = "Não foi possível carregar"
    else if task.tag = "home_recent_series"
        m.homeRecentSeriesLoading = false
        m.homeRecentLoading = false
        m.top.findNode("recentSeriesHint").text = "Não foi possível carregar"
    else if Left(task.tag, 16) = "home_hero_movie|" or Left(task.tag, 17) = "home_hero_series|"
        ' Preview é um enriquecimento visual. Em caso de falha mantém o poster/dados da lista.
        return
    else if task.tag = "series_continue_info"
        m.openSeriesContinueAfterLoad = false
        toast("Não foi possível abrir o episódio salvo.")
    else if Left(task.tag, 16) = "provider_detail|"
        if Mid(task.tag, 17) = m.detailRequestKey then requestDetailMetadata(m.detailProviderTmdbId)
    else if Left(task.tag, 16) = "metadata_detail|"
        ' Sem mensagem técnica: preserva silenciosamente os dados do provedor/lista.
        if Mid(task.tag, 17) = m.detailRequestKey then updateDetailVisualState()
    else if Left(task.tag, 17) = "episode_metadata|"
        ' Imagens do TMDB são enriquecimento visual; nunca interrompa a navegação por timeout.
        return
    else if Left(task.tag, 4) = "epg|"
        if Mid(task.tag, 5) = m.epgFocusedKey
            m.top.findNode("liveNow").text = "Programação não informada"
            m.top.findNode("liveNext").text = "Programação não informada"
            m.top.findNode("liveNowTime").text = ""
            m.top.findNode("liveNextTime").text = ""
        end if
    else
        toast(err)
    end if
end sub

function isRuntimeProviderRequest(tag as string) as boolean
    if m.xtream = invalid then return false
    if Left(tag, 5) = "cats_" then return true
    if Left(tag, 6) = "items_" then return true
    if Left(tag, 10) = "favorites_" then return true
    if Left(tag, 9) = "continue_" then return true
    if Left(tag, 7) = "recent_" then return true
    if Left(tag, 7) = "search_" then return true
    if Left(tag, 15) = "instant_search_" then return true
    if tag = "home_recent_movies" or tag = "home_recent_series" then return true
    if tag = "series_info" or tag = "series_continue_info" then return true
    if Left(tag, 16) = "provider_detail|" then return true
    if Left(tag, 16) = "home_hero_movie|" then return true
    if Left(tag, 17) = "home_hero_series|" then return true
    return false
end function

sub onNetworkResponse(event as object)
    task = event.getRoSGNode()
    raw = event.getData()
    if raw = invalid or raw = "" then return
    data = ParseJson(raw)
    tag = task.tag

    if tag = "app_config" or tag = "app_config_fallback"
        m.appConfigFallbackTried = false
        applyAppConfig(data)
        return
    end if

    if tag = "login_providers"
        m.loginProviderCandidates = []
        m.loginProviderIndex = 0
        if data <> invalid and data.providers <> invalid and type(data.providers) = "roArray"
            for each provider in data.providers
                available = true
                if provider.available <> invalid then available = provider.available
                if available and provider.dns <> invalid and sVal(provider.dns) <> ""
                    m.loginProviderCandidates.Push(provider)
                end if
            end for
        end if
        if m.loginProviderCandidates.Count() = 0
            hideLoading()
            m.accountGroup.visible = true
            m.top.findNode("accountStatus").text = "Nenhum servidor está disponível no painel."
        else
            tryNextLoginProvider()
        end if
        return
    end if

    if tag = "login_probe"
        accepted = false
        if data <> invalid and data.user_info <> invalid
            if data.user_info.auth = invalid or sVal(data.user_info.auth) = "1" then accepted = true
        end if
        if accepted
            saveAccountWithProvider(m.loginProbeProviderId)
        else
            tryNextLoginProvider()
        end if
        return
    end if

    if tag = "register"
        hideLoading()
        if data <> invalid and data.status <> invalid and sVal(data.status) = "pending"
            showAccount()
            setLoginStatusDefault()
        else if data <> invalid and data.status <> invalid and sVal(data.status) = "active"
            checkStatus()
        else
            showAccount()
            m.top.findNode("accountStatus").text = "Não foi possível preparar o login. Tente novamente."
        end if
        return
    end if

    if tag = "providers"
        showProviderPicker(data)
        return
    end if

    if tag = "adult_pin"
        hideLoading()
        if data <> invalid and data.ok <> invalid and data.ok = true
            m.adultUnlocked = true
            toast("Conteúdo +18 liberado nesta sessão.")
            executePendingAdultAction()
        else
            msg = "PIN adulto incorreto."
            if data <> invalid and data.error <> invalid and sVal(data.error) <> "" then msg = sVal(data.error)
            clearPendingAdultAction()
            toast(msg)
        end if
        return
    end if

    if Left(tag, 13) = "xtream_state|"
        handleXtreamAccountState(data, Mid(tag, 14))
        return
    end if

    if tag = "status_bridge" or tag = "status" or tag = "status_fallback"
        m.statusRequestPending = false
        m.statusFallbackTried = false
        hideLoading()
        handleStatus(data)
        return
    end if

    if tag = "save_account"
        hideLoading()
        saveAccountHints()
        m.top.findNode("accountStatus").text = "Conta salva. Carregando servidor..."
        checkStatus()
        return
    end if

    if tag = "disconnect_account"
        hideLoading()
        m.xtream = invalid
        m.activeAccountSlot = 0
        updateAccountSlotButtons()
        startRegistration()
        return
    end if

    if tag = "delete_account"
        hideLoading()
        m.xtream = invalid
        m.currentAccountData = invalid
        m.activeAccountSlot = 0
        m.selectedAccountSlot = 1
        m.providerId = ""
        m.providerName = ""
        m.username = ""
        m.password = ""
        clearAccountHints()
        if data <> invalid and data.accounts <> invalid then m.accountSlots = data.accounts
        updateAccountSlotButtons()
        startRegistration()
        return
    end if

    if tag = "switch_account"
        hideLoading()
        checkStatus()
        return
    end if

    if Left(tag, 5) = "cats_"
        hideLoading()
        handleCategories(Mid(tag, 6), data)
        return
    end if

    if Left(tag, 6) = "items_"
        hideLoading()
        handleItems(Mid(tag, 7), data)
        return
    end if

    if Left(tag, 10) = "favorites_"
        hideLoading()
        handleFavoriteSource(Mid(tag, 11), data)
        return
    end if

    if Left(tag, 9) = "continue_"
        hideLoading()
        handleContinueSource(Mid(tag, 10), data)
        return
    end if

    if Left(tag, 10) = "recentcat_"
        mergeRecentCategory(data)
        return
    end if

    if Left(tag, 7) = "recent_"
        hideLoading()
        handleRecentSource(Mid(tag, 8), data)
        return
    end if

    if Left(tag, 14) = "inline_source_"
        handleInlineSearchSource(Mid(tag, 15), data)
        return
    end if

    if Left(tag, 15) = "instant_search_"
        if task.filterQuery = m.instantSearchQuery then handleInstantSearchResults(Mid(tag, 16), data)
        return
    end if

    if Left(tag, 7) = "search_"
        hideLoading()
        handleSearchResults(Mid(tag, 8), data)
        return
    end if

    if Left(tag, 4) = "epg|"
        handleLiveEpg(tag, data)
        return
    end if

    if Left(tag, 16) = "home_hero_movie|"
        handleHomeHeroInfo("movies", Mid(tag, 17), data)
        return
    end if

    if Left(tag, 17) = "home_hero_series|"
        handleHomeHeroInfo("series", Mid(tag, 18), data)
        return
    end if

    if Left(tag, 16) = "provider_detail|"
        if Mid(tag, 17) = m.detailRequestKey then handleProviderDetailInfo(data)
        return
    end if

    if Left(tag, 16) = "metadata_detail|"
        if Mid(tag, 17) = m.detailRequestKey then handleDetailMetadata(data)
        return
    end if

    if Left(tag, 17) = "episode_metadata|"
        episodeTag = Mid(tag, 18)
        if Left(episodeTag, Len(m.selectedSeriesId)) = m.selectedSeriesId then handleEpisodeMetadata(data)
        return
    end if

    if tag = "series_info" or tag = "series_continue_info"
        hideLoading()
        handleSeriesInfo(data)
        return
    end if

    if tag = "sports"
        hideLoading()
        handleSports(data)
        return
    end if

    if tag = "sports_live_search"
        hideLoading()
        handleSportsLiveSearch(data)
        return
    end if

    if tag = "home_recent_movies"
        handleHomeRecent(data)
        return
    end if

    if tag = "home_recent_series"
        handleHomeRecentSeries(data)
        return
    end if
end sub

sub handleStatus(data as object)
    ' Uma consulta iniciada antes de abrir o teclado não pode redesenhar o login.
    if m.loginEditing then return
    if data = invalid
        toast("Resposta inválida do painel.")
        return
    end if
    m.accountSlots = []
    if data.accounts <> invalid then m.accountSlots = data.accounts
    m.activeAccountSlot = 0
    if data.active_slot <> invalid then m.activeAccountSlot = Int(data.active_slot)
    m.selectedAccountSlot = 1
    if data.adult_lock_enabled <> invalid then m.adultLockEnabled = data.adult_lock_enabled
    if data.adult_keywords <> invalid and sVal(data.adult_keywords) <> "" then m.adultKeywords = sVal(data.adult_keywords)

    status = "pending"
    reason = ""
    if data.status <> invalid then status = sVal(data.status)
    if data.reason <> invalid then reason = sVal(data.reason)
    ' O antigo passe vitalício do provider awplay só ignora vencimento do aplicativo/painel.
    ' Vencimento real da LISTA XTREAM sempre bloqueia o conteúdo.
    if status = "expired" and reason <> "playlist_expired" and allowAwplayAppLifetime(data) then status = "active"
    if status = "active" and m.currentScreen = "home" and m.currentAccountData <> invalid and data.account <> invalid
        oldUrl = "" : newUrl = ""
        if m.currentAccountData.playlist_url <> invalid then oldUrl = sVal(m.currentAccountData.playlist_url)
        if data.account.playlist_url <> invalid then newUrl = sVal(data.account.playlist_url)
        if oldUrl <> "" and oldUrl = newUrl
            m.currentAccountData = data.account
            return
        end if
    end if
    if status = "active" and data.account <> invalid and data.account.playlist_url <> invalid and data.account.playlist_url <> ""
        m.currentAccountData = data.account
        m.xtream = parseXtream(data.account.playlist_url)
        if m.xtream = invalid
            showAccount()
            m.top.findNode("accountStatus").text = "Conta ativa, mas não foi possível ler as credenciais."
            return
        end if
        if data.account.provider_id <> invalid and data.account.provider_id <> "" then m.providerId = data.account.provider_id
        m.providerName = ""
        if data.account.provider_name <> invalid then m.providerName = sVal(data.account.provider_name)
        m.username = m.xtream.user
        m.currentExpiryText = buildExpiryText(data.account)
        saveAccountHints()
        m.homeRecentLoaded = false
        m.homeRecentLoading = false
        m.homeRecentMoviesLoaded = false
        m.homeRecentMoviesLoading = false
        m.homeRecentSeriesLoaded = false
        m.homeRecentSeriesLoading = false
        m.allItems = []
        m.catalogSearchQuery = ""
        m.currentCategoryName = ""
        m.videoMode = ""
        m.previewStreamId = ""
        m.currentVideoPoster = ""
        accountName = "Conta " + m.activeAccountSlot.ToStr()
        if data.account.provider_name <> invalid and sVal(data.account.provider_name) <> ""
            accountName = sVal(data.account.provider_name)
        else if data.account.name <> invalid and data.account.name <> ""
            accountName = data.account.name
        end if
        m.top.findNode("homeStatus").text = "Conectado · " + accountName
        updateHomeExpiryLabel()
        mode = "initial"
        if m.currentScreen = "expired" then mode = "expired"
        checkXtreamAccountState(mode)
    else if status = "blocked"
        if data.account <> invalid then m.currentAccountData = data.account
        showExpiredAccount(data, "device_blocked")
    else if status = "expired"
        if data.account <> invalid then m.currentAccountData = data.account
        if data.account <> invalid and data.account.playlist_url <> invalid and sVal(data.account.playlist_url) <> ""
            m.xtream = parseXtream(sVal(data.account.playlist_url))
        end if
        showExpiredAccount(data, reason)
    else
        m.currentAccountData = invalid
        m.xtream = invalid
        showAccount()
        setLoginStatusDefault()
    end if
end sub

sub checkXtreamAccountState(mode as string)
    if m.xtream = invalid
        if mode = "initial" then showHome()
        return
    end if
    if m.xtream.base = invalid or m.xtream.user = invalid or m.xtream.pass = invalid
        if mode = "initial" then showHome()
        return
    end if
    m.xtreamCheckMode = mode
    url = m.xtream.base + "/player_api.php?username=" + enc(m.xtream.user) + "&password=" + enc(m.xtream.pass)
    startRequest("xtream_state|" + mode, url, "GET", "")
end sub

sub handleXtreamAccountState(data as dynamic, mode as string)
    if data = invalid or data.user_info = invalid
        if mode = "initial"
            showHome()
        else
            n = m.top.findNode("expiredAutoStatus")
            if n <> invalid then n.text = "Resposta do servidor inválida. Tentaremos novamente automaticamente."
        end if
        return
    end if

    ui = data.user_info
    auth = ""
    accountState = ""
    expRaw = ""
    if ui.auth <> invalid then auth = sVal(ui.auth)
    if ui.status <> invalid then accountState = LCase(trimText(sVal(ui.status)))
    if ui.exp_date <> invalid then expRaw = trimText(sVal(ui.exp_date))

    expTs = 0
    if expRaw <> ""
        expTs = Val(expRaw)
        niceExpiry = formatExpiryValue(expRaw)
        if niceExpiry <> "" and niceExpiry <> "--"
            m.currentExpiryText = "Vencimento da lista: " + niceExpiry
            updateHomeExpiryLabel()
        end if
    end if

    nowTs = CreateObject("roDateTime").AsSeconds()
    expiredByDate = (expTs > 0 and expTs <= nowTs)
    inactive = false
    if auth <> "" and auth <> "1" then inactive = true
    if accountState <> "" and accountState <> "active" and accountState <> "enabled" then inactive = true

    if expiredByDate or inactive
        if m.currentAccountData = invalid then m.currentAccountData = {}
        if expRaw <> "" then m.currentAccountData.playlist_expires_at = expRaw
        payload = { account: m.currentAccountData }
        reason = "playlist_blocked"
        if expiredByDate or accountState = "expired" then reason = "playlist_expired"
        showExpiredAccount(payload, reason)
        return
    end if

    ' Resposta Xtream válida e ativa. Se a conta estava vencida, a renovação já libera imediatamente.
    if m.pollTimer <> invalid then m.pollTimer.control = "stop"
    if mode = "expired"
        toast("Conta renovada. Acesso liberado!")
    end if
    if mode = "runtime" then return
    if mode = "runtime_video"
        stopVideoAndReturn()
        toast("Este conteúdo não está disponível agora.")
        return
    end if
    showHome()
end sub

function parseXtream(url as string) as object
    baseRx = CreateObject("roRegex", "^(https?://[^/]+)", "i")
    bm = baseRx.Match(url)
    uRx = CreateObject("roRegex", "[?&]username=([^&]+)", "i")
    pRx = CreateObject("roRegex", "[?&]password=([^&]+)", "i")
    um = uRx.Match(url)
    pm = pRx.Match(url)
    if bm.Count() < 2 or um.Count() < 2 or pm.Count() < 2 then return invalid
    return { base: bm[1], user: urlDecode(um[1]), pass: urlDecode(pm[1]) }
end function

function sVal(value as dynamic) as string
    if value = invalid then return ""

    t = type(value)
    if t = "String" or t = "roString" then return value

    ' Alguns painéis Xtream devolvem campos como genre/backdrop em arrays.
    ' Arrays não possuem ToStr() no BrightScript; convertemos de forma segura.
    if t = "roArray"
        out = ""
        for each entry in value
            piece = sVal(entry)
            if piece <> ""
                if out <> "" then out = out + ", "
                out = out + piece
            end if
        end for
        return out
    end if

    ' Também aceita arrays de objetos, por exemplo [{name:"Drama"}].
    if t = "roAssociativeArray"
        if value.name <> invalid then return sVal(value.name)
        if value.title <> invalid then return sVal(value.title)
        if value.label <> invalid then return sVal(value.label)
        if value.value <> invalid then return sVal(value.value)
        return ""
    end if

    return value.ToStr()
end function

function hexNibble(ch as string) as integer
    if ch = "" then return -1
    c = Asc(UCase(ch))
    if c >= 48 and c <= 57 then return c - 48
    if c >= 65 and c <= 70 then return c - 55
    return -1
end function

function urlDecode(value as dynamic) as string
    s = sVal(value)
    out = ""
    i = 1
    while i <= Len(s)
        ch = Mid(s, i, 1)
        if ch = "+"
            out = out + " "
            i = i + 1
        else if ch = "%" and i + 2 <= Len(s)
            hi = hexNibble(Mid(s, i + 1, 1))
            lo = hexNibble(Mid(s, i + 2, 1))
            if hi >= 0 and lo >= 0
                out = out + Chr((hi * 16) + lo)
                i = i + 3
            else
                out = out + ch
                i = i + 1
            end if
        else
            out = out + ch
            i = i + 1
        end if
    end while
    return out
end function

function byteToHex(value as integer) as string
    digits = "0123456789ABCDEF"
    hi = Int(value / 16)
    lo = value mod 16
    return Mid(digits, hi + 1, 1) + Mid(digits, lo + 1, 1)
end function

function enc(value as dynamic) as string
    s = sVal(value)
    out = ""
    for i = 1 to Len(s)
        ch = Mid(s, i, 1)
        c = Asc(ch)
        isAlphaNum = (c >= 48 and c <= 57) or (c >= 65 and c <= 90) or (c >= 97 and c <= 122)
        if isAlphaNum or ch = "-" or ch = "_" or ch = "." or ch = "~"
            out = out + ch
        else
            out = out + "%" + byteToHex(c)
        end if
    end for
    return out
end function

function xapi(action as string, categoryId = invalid as dynamic) as string
    if m.xtream = invalid then return ""
    url = m.xtream.base + "/player_api.php?username=" + enc(m.xtream.user) + "&password=" + enc(m.xtream.pass)
    if action <> "" then url = url + "&action=" + action
    if categoryId <> invalid and sVal(categoryId) <> "" then url = url + "&category_id=" + enc(categoryId)
    return url
end function

sub requestCategories(section as string)
    if m.xtream = invalid
        toast("Conta indisponível.")
        showHome()
        return
    end if
    action = "get_live_categories"
    if section = "movies" then action = "get_vod_categories"
    if section = "series" then action = "get_series_categories"
    showLoading("Recuperando categorias da lista...")
    startRequest("cats_" + section, xapi(action), "GET", "")
end sub

function isKidsCategoryName(value as string) as boolean
    name = LCase(value)
    return Instr(1, name, "animacao") > 0 or Instr(1, name, "animação") > 0 or Instr(1, name, "aventura") > 0 or Instr(1, name, "fantasia") > 0 or Instr(1, name, "familia") > 0 or Instr(1, name, "família") > 0 or Instr(1, name, "kids") > 0 or Instr(1, name, "infantil") > 0 or Instr(1, name, "crianca") > 0 or Instr(1, name, "criança") > 0
end function

sub handleCategories(section as string, data as object)
    m.categories = []
    titles = []

    if section = "movies" and m.kidsMode
        ' A área Kids mostra somente categorias familiares do servidor.
    else if section = "movies" or section = "series"
        titles.Push("Procurar")
        m.categories.Push({id:"__search_button__", name:"Procurar"})
        titles.Push("Favoritos")
        m.categories.Push({id:"__favorites__", name:"Favoritos"})
        titles.Push("Continue assistindo")
        m.categories.Push({id:"__continue__", name:"Continue assistindo"})
        titles.Push("Adicionados recentemente")
        m.categories.Push({id:"__recent__", name:"Adicionados recentemente"})
    end if

    if not m.kidsMode
        titles.Push("Todos")
        m.categories.Push({id:"", name:"Todos"})
    end if

    if data <> invalid
        for each row in data
            id = ""
            name = "Sem categoria"
            if row.category_id <> invalid then id = sVal(row.category_id)
            if row.category_name <> invalid and row.category_name <> "" then name = cleanProviderLabel(row.category_name)
            if not m.kidsMode or isKidsCategoryName(name)
                m.categories.Push({id:id, name:name})
                titles.Push(name)
            end if
        end for
    end if
    setListContent(m.categoryList, titles)
    if m.kidsMode
        m.top.findNode("catalogCount").text = m.categories.Count().ToStr() + " categorias"
        if m.categories.Count() > 0
            m.categoryList.jumpToItem = 0
            continueCategorySelection(0)
        else
            m.top.findNode("catalogItemsTitle").text = "Nenhuma categoria Kids encontrada no servidor"
            m.categoryList.setFocus(true)
        end if
    else if section = "movies" or section = "series"
        ' Filmes e séries abrem com os quatro atalhos sempre visíveis.
        if m.categories.Count() > 5
            ' Mantém a janela no início para Procurar/Favoritos/Continue ficarem visíveis.
            m.categoryList.jumpToItem = 0
            ' Abre a primeira categoria real. Pedir todos os filmes apenas para
            ' montar Recentes pode ultrapassar a memória de aparelhos Roku.
            continueCategorySelection(5)
        else if m.categories.Count() > 3
            m.categoryList.jumpToItem = 0
            continueCategorySelection(3)
        else
            m.categoryList.setFocus(true)
        end if
    else
        m.categoryList.setFocus(true)
    end if
end sub

sub setupQuickMenu()
    if m.quickMenuList = invalid then return
    root = CreateObject("roSGNode", "ContentNode")
    for each label in ["Procurar", "Favoritos", "Continue assistindo", "Adicionados recentemente"]
        child = root.CreateChild("ContentNode")
        child.title = label
    end for
    m.quickMenuList.content = root
end sub

sub showQuickMenu()
    if m.quickMenuGroup = invalid or m.kidsMode then return
    m.quickMenuActive = true
    m.categoryList.visible = false
    m.quickMenuGroup.visible = true
    m.quickMenuList.jumpToItem = 3
    m.quickMenuList.setFocus(true)
end sub

sub hideQuickMenu()
    if not m.quickMenuActive then return
    m.quickMenuActive = false
    m.quickMenuGroup.visible = false
    m.categoryList.visible = true
    m.categoryList.setFocus(true)
end sub

sub onQuickMenuSelected(event as object)
    idx = event.getData()
    m.quickMenuActive = false
    m.quickMenuGroup.visible = false
    m.categoryList.visible = true
    if idx = 0
        openInstantSearch(m.currentSection)
    else if idx = 1
        m.currentCategoryId = "__favorites__"
        m.currentCategoryName = "Favoritos"
        showFavoriteCategory(m.currentSection)
    else if idx = 2
        m.currentCategoryId = "__continue__"
        m.currentCategoryName = "Continue assistindo"
        master = masterItems(m.currentSection)
        if master.Count() = 0
            showLoading("Carregando Continue assistindo...")
            startRequest("continue_" + m.currentSection, xapi(sectionAction(m.currentSection)), "GET", "")
        else
            filterContinueFromMaster(m.currentSection)
        end if
    else if idx = 3
        m.currentCategoryId = "__recent__"
        m.currentCategoryName = "Adicionados recentemente"
        startRecentCategoryScan(m.currentSection)
    end if
end sub

sub onCategorySelected(event as object)
    idx = event.getData()
    if idx < 0 or idx >= m.categories.Count() then return
    cat = m.categories[idx]
    if adultLockNeededForText(cat.name)
        m.pendingAdultAction = "category"
        m.pendingAdultIndex = idx
        m.pendingAdultItem = invalid
        m.pendingAdultSection = m.currentSection
        promptAdultPin()
        return
    end if
    continueCategorySelection(idx)
end sub

sub continueCategorySelection(idx as integer)
    if idx < 0 or idx >= m.categories.Count() then return
    cat = m.categories[idx]
    markSelectedCategory(idx)
    m.top.findNode("catalogItemsTitle").text = shortText(cat.name, 38)
    if cat.id = "__search_button__"
        title = "Buscar"
        if m.currentSection = "movies" then title = "Buscar filmes"
        if m.currentSection = "series" then title = "Buscar séries"
        openInstantSearch(m.currentSection)
        return
    end if

    if cat.id = "__continue__"
        m.currentCategoryName = "Continue"
        m.currentCategoryId = "__continue__"
        m.catalogSearchQuery = ""
        m.catalogPage = 0
        master = masterItems(m.currentSection)
        if master.Count() = 0
            showLoading("Carregando seu Continue...")
            startRequest("continue_" + m.currentSection, xapi(sectionAction(m.currentSection)), "GET", "")
        else
            filterContinueFromMaster(m.currentSection)
        end if
        return
    end if

    if cat.id = "__recent__"
        m.currentCategoryName = "Adicionados Recentemente"
        m.currentCategoryId = "__recent__"
        m.catalogSearchQuery = ""
        m.catalogPage = 0
        startRecentCategoryScan(m.currentSection)
        return
    end if

    m.currentCategoryName = cat.name
    m.currentCategoryId = cat.id
    m.catalogSearchQuery = ""
    m.catalogPage = 0
    m.top.findNode("catalogSearch").text = "Buscar"
    if m.currentSection = "movies" then m.top.findNode("vodSearchBtn").text = "Buscar filmes"
    if m.currentSection = "series" then m.top.findNode("vodSearchBtn").text = "Buscar séries"

    if cat.id = "__favorites__"
        showFavoriteCategory(m.currentSection)
        return
    end if

    action = "get_live_streams"
    if m.currentSection = "movies" then action = "get_vod_streams"
    if m.currentSection = "series" then action = "get_series"
    showLoading("Recuperando dados da lista de reprodução...")
    startRequest("items_" + m.currentSection, xapi(action, cat.id), "GET", "")
end sub

sub markSelectedCategory(selectedIndex as integer)
    if m.categoryList = invalid or m.categoryList.content = invalid then return
    root = m.categoryList.content
    for i = 0 to root.getChildCount() - 1
        item = root.getChild(i)
        if i = selectedIndex
            item.shortDescriptionLine1 = "selected"
        else
            item.shortDescriptionLine1 = ""
        end if
    end for
end sub

sub handleItems(section as string, data as object)
    m.catalogPage = 0
    m.allItems = buildCatalogItems(section, data)
    if m.currentCategoryId = "" then setMasterItems(section, m.allItems)
    m.items = m.allItems
    renderCatalogItems()
end sub

function buildCatalogItems(section as string, data as object) as object
    result = []
    if data = invalid then return result
    limit = data.Count()
    for i = 0 to limit - 1
        row = data[i]
        item = {name:"Conteúdo", logo:"", epgId:"", plot:"", year:"", rating:"", genre:"", raw:row}
        if row.name <> invalid and row.name <> "" then item.name = cleanProviderLabel(row.name)
        if section = "series"
            if row.cover <> invalid then item.logo = optimizeGridPosterUrl(sVal(row.cover))
        else
            if row.stream_icon <> invalid then item.logo = optimizeGridPosterUrl(sVal(row.stream_icon))
        end if
        if section = "live" and row.epg_channel_id <> invalid then item.epgId = sVal(row.epg_channel_id)
        if row.plot <> invalid then item.plot = sVal(row.plot)
        if row.genre <> invalid then item.genre = sVal(row.genre)
        if row.rating <> invalid then item.rating = sVal(row.rating)
        if row.year <> invalid and sVal(row.year) <> ""
            item.year = sVal(row.year)
        else if row.releaseDate <> invalid and sVal(row.releaseDate) <> ""
            item.year = Left(sVal(row.releaseDate), 4)
        else if row.release_date <> invalid and sVal(row.release_date) <> ""
            item.year = Left(sVal(row.release_date), 4)
        end if
        result.Push(item)
    end for
    return result
end function

function optimizeGridPosterUrl(value as string) as string
    url = value
    if url = "" then return ""
    url = url.Replace("image.tmdb.org/t/p/w500/", "image.tmdb.org/t/p/w342/")
    url = url.Replace("image.tmdb.org/t/p/original/", "image.tmdb.org/t/p/w342/")
    return url
end function

sub onItemFocused(event as object)
    if m.currentSection = "live" then updateCatalogFocus(event.getData())
end sub

sub updateCatalogFocus(idx as integer)
    if idx < 0 or idx >= m.items.Count() then return
    item = m.items[idx]
    m.top.findNode("liveChannelLogo").uri = item.logo
    m.top.findNode("liveChannelTitle").text = shortText(item.name, 24)
    m.top.findNode("liveChannelCategory").text = shortText(m.currentCategoryName, 24)
    updateFavoriteButtons()
    requestLiveEpg(item)
end sub

sub onItemSelected(event as object)
    if m.currentSection <> "live" then return
    openCatalogItem(event.getData())
end sub

sub handleSeriesInfo(data as object)
    episodes = []
    seasons = []
    seenSeasons = {}
    seriesPoster = m.selectedSeriesPoster
    seriesPlot = ""
    seriesBackdrop = ""
    seriesGenres = ""
    seriesFacts = ""

    ' Reaproveita os metadados já carregados na tela de detalhes.
    detailBackdropNode = m.top.findNode("detailBackdrop")
    if detailBackdropNode <> invalid and detailBackdropNode.uri <> invalid
        db = sVal(detailBackdropNode.uri)
        if db <> "" and Instr(1, db, "pkg:/images/zenix_bg.png") = 0 then seriesBackdrop = db
    end if
    detailGenresNode = m.top.findNode("detailGenres")
    if detailGenresNode <> invalid then seriesGenres = sVal(detailGenresNode.text)
    detailFactsNode = m.top.findNode("detailFacts")
    if detailFactsNode <> invalid then seriesFacts = sVal(detailFactsNode.text)
    detailOverviewNode = m.top.findNode("detailOverview")
    if detailOverviewNode <> invalid then seriesPlot = sVal(detailOverviewNode.text)

    seriesTmdbId = ""
    if m.detailMeta <> invalid and m.detailMeta.tmdb_id <> invalid then seriesTmdbId = sVal(m.detailMeta.tmdb_id)
    m.episodeMetaRequested = {}

    info = providerInfoObject(data)
    if info <> invalid
        if info.tmdb_id <> invalid and sVal(info.tmdb_id) <> "" then seriesTmdbId = sVal(info.tmdb_id)
        if seriesTmdbId = "" and info.tmdb <> invalid and sVal(info.tmdb) <> "" then seriesTmdbId = sVal(info.tmdb)
        if info.cover <> invalid and info.cover <> "" then seriesPoster = sVal(info.cover)
        if info.movie_image <> invalid and info.movie_image <> "" then seriesPoster = sVal(info.movie_image)
        if info.plot <> invalid and info.plot <> "" then seriesPlot = sVal(info.plot)
        if info.genre <> invalid and sVal(info.genre) <> "" then seriesGenres = sVal(info.genre)

        if info.backdrop_path <> invalid
            bp = info.backdrop_path
            if GetInterface(bp, "ifArray") <> invalid
                if bp.Count() > 0 then seriesBackdrop = sVal(bp[0])
            else
                candidateBackdrop = sVal(bp)
                if candidateBackdrop <> "" then seriesBackdrop = candidateBackdrop
            end if
        end if
        if seriesBackdrop = "" and info.backdrop <> invalid then seriesBackdrop = sVal(info.backdrop)

        infoRating = ""
        infoDate = ""
        infoDuration = ""
        if info.rating <> invalid then infoRating = sVal(info.rating)
        if info.releasedate <> invalid then infoDate = sVal(info.releasedate)
        if infoDate = "" and info.releaseDate <> invalid then infoDate = sVal(info.releaseDate)
        if info.duration <> invalid then infoDuration = sVal(info.duration)
        if seriesFacts = ""
            if infoRating <> "" then seriesFacts = ratingStars(infoRating) + "  " + infoRating + "/10"
            if infoDate <> ""
                if seriesFacts <> "" then seriesFacts = seriesFacts + "  ·  "
                seriesFacts = seriesFacts + infoDate
            end if
            if infoDuration <> ""
                if seriesFacts <> "" then seriesFacts = seriesFacts + "  ·  "
                seriesFacts = seriesFacts + infoDuration
            end if
        end if
    end if

    m.seriesTmdbId = seriesTmdbId

    if seriesBackdrop = "" then seriesBackdrop = seriesPoster
    if seriesBackdrop = "" then seriesBackdrop = "pkg:/images/zenix_bg.png"

    if data <> invalid and data.episodes <> invalid
        for each seasonKey in data.episodes
            seasonRows = data.episodes[seasonKey]
            seasonNum = Val(sVal(seasonKey))
            if seasonNum <= 0 then seasonNum = 1
            skey = seasonNum.ToStr()
            if seenSeasons[skey] = invalid
                seenSeasons[skey] = true
                seasons.Push(seasonNum)
            end if
            if seasonRows <> invalid
                for each ep in seasonRows
                    eid = ""
                    if ep.id <> invalid then eid = sVal(ep.id)
                    if eid = "" and ep.stream_id <> invalid then eid = sVal(ep.stream_id)
                    if eid <> ""
                        ext = "mp4"
                        if ep.container_extension <> invalid and ep.container_extension <> "" then ext = sVal(ep.container_extension)
                        epNum = 0
                        if ep.episode_num <> invalid then epNum = Val(sVal(ep.episode_num))
                        if epNum <= 0 then epNum = episodes.Count() + 1
                        title = "E" + pad2(epNum)
                        if ep.title <> invalid and ep.title <> "" then title = title + " · " + cleanProviderLabel(sVal(ep.title))
                        epLogo = pickEpisodeImage(ep, seriesPoster, seriesBackdrop)
                        epPlot = pickEpisodePlot(ep)
                        url = m.xtream.base + "/series/" + enc(m.xtream.user) + "/" + enc(m.xtream.pass) + "/" + eid + "." + ext
                        episodes.Push({name:title, url:url, logo:epLogo, plot:epPlot, season:seasonNum, number:epNum, stream_id:eid})
                    end if
                end for
            end if
        end for
    end if

    ' Ordena temporadas numericamente.
    if seasons.Count() > 1
        for a = 0 to seasons.Count() - 2
            for b = a + 1 to seasons.Count() - 1
                if seasons[b] < seasons[a]
                    tmp = seasons[a]
                    seasons[a] = seasons[b]
                    seasons[b] = tmp
                end if
            end for
        end for
    end if

    m.seriesEpisodes = episodes
    m.seriesSeasons = seasons
    m.currentSeasonEpisodes = []
    m.selectedSeriesPoster = seriesPoster
    m.selectedSeriesBackdrop = seriesBackdrop

    m.detailGroup.visible = false
    m.catalogGroup.visible = true
    m.currentScreen = "catalog"
    m.currentSection = "episodes"
    m.vodLayout.visible = false
    m.liveLayout.visible = false
    m.episodeLayout.visible = true
    m.categoryList.visible = false

    ' O novo layout cobre a tela inteira; mantemos os nós antigos ocultos só por compatibilidade.
    m.top.findNode("catalogBack").text = "Voltar à série"
    m.top.findNode("catalogLiveTab").visible = false
    m.top.findNode("catalogMoviesTab").visible = false
    m.top.findNode("catalogSeriesTab").visible = false
    m.top.findNode("catalogSearch").visible = false
    m.top.findNode("vodSearchBtn").visible = false
    m.top.findNode("catalogFavorite").visible = false
    m.top.findNode("catalogPrevPage").visible = false
    m.top.findNode("catalogNextPage").visible = false
    if m.top.findNode("catalogPaginationGroup") <> invalid then m.top.findNode("catalogPaginationGroup").visible = false

    cleanSeriesTitle = cleanProviderLabel(m.selectedSeriesName)
    if cleanSeriesTitle = "" then cleanSeriesTitle = "Série"
    m.top.findNode("seriesBackdrop").uri = seriesBackdrop
    m.top.findNode("seriesTitleBig").text = cleanSeriesTitle
    m.top.findNode("seriesGenresBig").text = shortText(seriesGenres, 70)
    m.top.findNode("seriesFactsBig").text = shortText(seriesFacts, 72)
    if seriesPlot = "" or seriesPlot = "Carregando sinopse..." then seriesPlot = "Sinopse não informada."
    m.top.findNode("seriesPlotBig").text = shortText(seriesPlot, 310)
    m.top.findNode("seriesStartBtn").text = "Iniciar"
    if isFavoriteItem(m.selectedMedia, "series")
        m.top.findNode("seriesFavoriteBtn").text = "Remover favorito"
    else
        m.top.findNode("seriesFavoriteBtn").text = "Favoritar"
    end if
    updateSeriesEpisodeVisualState()

    ' Compatibilidade com os nós anteriores.
    m.top.findNode("catalogTitle").text = shortText(cleanSeriesTitle, 34)
    m.top.findNode("catalogItemsTitle").text = "Temporadas e episódios"
    m.top.findNode("catalogCount").text = episodes.Count().ToStr() + " episódios"
    m.top.findNode("catalogPoster").uri = seriesPoster
    m.top.findNode("seriesEpisodeSeriesTitle").text = cleanSeriesTitle
    infoText = seasons.Count().ToStr() + " temporadas" + Chr(10) + episodes.Count().ToStr() + " episódios"
    m.top.findNode("catalogInfo").text = infoText

    seasonTitles = []
    for each seasonNum in seasons
        seasonTitles.Push("Temporada " + seasonNum.ToStr())
    end for
    setListContent(m.seasonList, seasonTitles)
    m.episodeList.content = CreateObject("roSGNode", "ContentNode")

    if seasons.Count() > 0
        renderSeasonByIndex(0)
        requestEpisodeMetadataForSeason(0)
        m.seasonList.setFocus(true)
        if m.openSeriesContinueAfterLoad
            m.openSeriesContinueAfterLoad = false
            entry = latestSeriesProgress(m.selectedSeriesId)
            targetUrl = ""
            if entry <> invalid and entry.url <> invalid then targetUrl = sVal(entry.url)
            foundSeason = -1 : foundEpisode = -1
            if targetUrl <> ""
                for i = 0 to episodes.Count() - 1
                    if episodes[i].url = targetUrl
                        targetSeasonNum = episodes[i].season
                        for si = 0 to seasons.Count() - 1
                            if seasons[si] = targetSeasonNum then foundSeason = si
                        end for
                    end if
                end for
            end if
            if foundSeason >= 0
                m.seasonList.jumpToItem = foundSeason
                renderSeasonByIndex(foundSeason)
                for ei = 0 to m.currentSeasonEpisodes.Count() - 1
                    if m.currentSeasonEpisodes[ei].url = targetUrl then foundEpisode = ei
                end for
                if foundEpisode >= 0
                    m.episodeList.jumpToItem = foundEpisode
                    m.episodeList.setFocus(true)
                    updateEpisodeFocus(foundEpisode)
                end if
            end if
        end if
    else
        m.top.findNode("episodesHeading").text = "Episódios"
        m.top.findNode("seriesEpisodeStatus").text = "Nenhum episódio encontrado"
        toast("Nenhum episódio encontrado.")
    end if
end sub

sub handleSports(data as object)
    m.sportsGames = []
    root = CreateObject("roSGNode", "ContentNode")
    if data <> invalid and data.games <> invalid
        for each g in data.games
            m.sportsGames.Push(g)
            d = CreateObject("roSGNode", "SportsGameItemData")
            competition = "Esporte"
            if g.competicao <> invalid and g.competicao <> "" then competition = sVal(g.competicao)
            d.gameCompetition = shortText(competition, 22)
            if g.img_competicao_url <> invalid then d.gameCompetitionLogo = sVal(g.img_competicao_url)
            dateText = "Hoje"
            if g.data_jogo <> invalid and g.data_jogo <> "" then dateText = sVal(g.data_jogo)
            if g.horario <> invalid and g.horario <> "" then dateText = dateText + " · " + sVal(g.horario)
            d.gameDateTime = shortText(dateText, 24)
            d.gameTeam1 = "Time 1"
            d.gameTeam2 = "Time 2"
            if g.time1 <> invalid and g.time1 <> "" then d.gameTeam1 = shortText(sVal(g.time1), 22)
            if g.time2 <> invalid and g.time2 <> "" then d.gameTeam2 = shortText(sVal(g.time2), 22)
            if g.img_time1_url <> invalid then d.gameTeam1Logo = sVal(g.img_time1_url)
            if g.img_time2_url <> invalid then d.gameTeam2Logo = sVal(g.img_time2_url)
            score1 = ""
            score2 = ""
            if g.placar_time1 <> invalid then score1 = sVal(g.placar_time1)
            if g.placar_time2 <> invalid then score2 = sVal(g.placar_time2)
            if score1 <> "" or score2 <> ""
                if score1 = "" then score1 = "0"
                if score2 = "" then score2 = "0"
                d.gameScore = score1 + " - " + score2
            else
                d.gameScore = "x"
            end if
            statusText = "Agendado"
            if g.status <> invalid and g.status <> "" then statusText = sVal(g.status)
            d.gameStatusText = shortText(statusText, 12)
            channelCount = 0
            if g.canais <> invalid and type(g.canais) = "roArray" then channelCount = g.canais.Count()
            d.gameChannelsText = channelCount.ToStr() + " canais"
            root.appendChild(d)
        end for
    end if
    m.sportsGrid.content = root
    if m.sportsGames.Count() > 0
        m.sportsGrid.setFocus(true)
        updateSportsFocus(0)
    else
        toast("Nenhum jogo informado para hoje.")
        m.top.findNode("sportsBack").setFocus(true)
    end if
end sub

sub onSportsGameSelected(event as object)
    idx = event.getData()
    if idx < 0 or idx >= m.sportsGames.Count() then return
    updateSportsFocus(idx)
    g = m.sportsGames[idx]
    names = []
    if g.canais <> invalid
        for each ch in g.canais
            n = sportsChannelName(ch)
            if n <> "" then names.Push(n)
        end for
    end if
    m.sportsChannelNames = names
    setListContent(m.sportsChannels, names)
    if names.Count() > 0
        m.top.findNode("sportsHint").text = "Escolha um canal para abrir na sua lista."
        m.sportsChannels.setFocus(true)
    else
        m.top.findNode("sportsHint").text = "Este jogo não informou canais."
        toast("Este jogo não informou canais.")
    end if
end sub

sub onSportsGameFocused(event as object)
    updateSportsFocus(event.getData())
end sub

sub updateSportsFocus(idx as integer)
    if idx < 0 or idx >= m.sportsGames.Count() then return
    g = m.sportsGames[idx]
    t1 = "Time 1"
    t2 = "Time 2"
    if g.time1 <> invalid and g.time1 <> "" then t1 = sVal(g.time1)
    if g.time2 <> invalid and g.time2 <> "" then t2 = sVal(g.time2)
    m.top.findNode("sportsSelectedTitle").text = shortText(t1 + " x " + t2, 42)
    comp = ""
    if g.competicao <> invalid then comp = sVal(g.competicao)
    meta = comp
    if g.data_jogo <> invalid and g.data_jogo <> "" then meta = meta + Chr(10) + sVal(g.data_jogo)
    if g.horario <> invalid and g.horario <> "" then meta = meta + " · " + sVal(g.horario)
    m.top.findNode("sportsSelectedMeta").text = meta
    logo = ""
    if g.img_competicao_url <> invalid then logo = sVal(g.img_competicao_url)
    m.top.findNode("sportsLeagueLogo").uri = logo
end sub

function sportsChannelName(ch as dynamic) as string
    if type(ch) = "roString" or type(ch) = "String" then return trimText(ch)
    if ch = invalid then return ""
    if ch.nome <> invalid then return trimText(sVal(ch.nome))
    if ch.name <> invalid then return trimText(sVal(ch.name))
    if ch.title <> invalid then return trimText(sVal(ch.title))
    if ch.canal <> invalid then return trimText(sVal(ch.canal))
    if ch.titulo <> invalid then return trimText(sVal(ch.titulo))
    return ""
end function

sub onSportsChannelSelected(event as object)
    idx = event.getData()
    if idx < 0 or idx >= m.sportsChannelNames.Count() then return
    m.sportsTargetChannel = m.sportsChannelNames[idx]
    showLoading("Procurando canal " + m.sportsTargetChannel + "...")
    startRequest("sports_live_search", xapi("get_live_streams"), "GET", "")
end sub

sub handleSportsLiveSearch(data as object)
    targetAliases = sportsChannelAliases(m.sportsTargetChannel)
    best = invalid
    bestScore = 0
    if data <> invalid
        for each row in data
            actual = ""
            if row.name <> invalid then actual = normalizeName(sVal(row.name))
            if actual <> ""
                for each wanted in targetAliases
                    score = channelMatchScore(actual, wanted)
                    if score > bestScore
                        bestScore = score
                        best = row
                    end if
                end for
            end if
        end for
    end if
    if best = invalid or best.stream_id = invalid or bestScore < 60
        toast("Canal não encontrado na sua lista.")
        return
    end if
    url = liveStreamUrl(best.stream_id)
    title = m.sportsTargetChannel
    if best.name <> invalid and best.name <> "" then title = sVal(best.name)
    playVideo(url, title, "live", 0)
end sub

function sportsChannelAliases(name as string) as object
    result = []
    n = normalizeName(name)
    if n <> "" then result.Push(n)
    if n = "PFC" or n = "PREMIERE"
        result.Push("PFC")
        result.Push("PREMIERE")
        result.Push("PREMIEREFC")
    else if n = "SPORTV"
        result.Push("SPORTV1")
    else if n = "ESPN"
        result.Push("ESPN1")
    else if n = "BANDSPORTS"
        result.Push("BANDSPORTS")
    else if n = "XSPORTS"
        result.Push("XSPORTS")
    end if
    return result
end function

function channelMatchScore(actual as string, wanted as string) as integer
    if wanted = "" or actual = "" then return 0
    if actual = wanted then return 100
    if Len(wanted) >= 4 and Instr(1, actual, wanted) > 0 then return 85
    if Len(actual) >= 5 and Instr(1, wanted, actual) > 0 then return 70
    return 0
end function

function replacePlainAll(source as string, needle as string, replacement as string) as string
    if needle = "" then return source
    out = ""
    startAt = 1
    foundAt = Instr(startAt, source, needle)
    while foundAt > 0
        if foundAt > startAt then out = out + Mid(source, startAt, foundAt - startAt)
        out = out + replacement
        startAt = foundAt + Len(needle)
        foundAt = Instr(startAt, source, needle)
    end while
    if startAt <= Len(source) then out = out + Mid(source, startAt)
    return out
end function

function isSafeProviderLeadingChar(ch as string) as boolean
    if ch = "" then return false
    code = Asc(ch)
    if code >= 48 and code <= 57 then return true
    if code >= 65 and code <= 90 then return true
    if code >= 97 and code <= 122 then return true

    ' Preserve common Portuguese/Latin accented letters.
    accentChars = "ÁÀÂÃÄÅÇÉÈÊËÍÌÎÏÑÓÒÔÕÖÚÙÛÜáàâãäåçéèêëíìîïñóòôõöúùûü"
    if Instr(1, accentChars, ch) > 0 then return true

    ' On Roku builds where Mid() walks UTF-8 bytes, Latin accents normally start with C2/C3.
    ' Keep those prefixes; emoji/symbol prefixes such as E2/EF/F0 continue to be removed.
    if code = 194 or code = 195 then return true
    return false
end function

function cleanProviderLabel(value as dynamic) as string
    text = trimText(value)
    if text = "" then return text

    ' Remove only unsupported decorative prefixes (emoji/symbols) before the real label.
    ' No global Trim() call is used here; trimText() is compatible with this Roku codebase.
    guard = 0
    while Len(text) > 0 and guard < 32
        ch = Left(text, 1)
        if isSafeProviderLeadingChar(ch) then exit while
        text = Mid(text, 2)
        text = trimText(text)
        guard = guard + 1
    end while

    return text
end function

function normalizeName(value as string) as string
    s = UCase(trimText(value))
    out = ""
    for i = 1 to Len(s)
        ch = foldAsciiChar(Mid(s, i, 1))
        if ch <> ""
            c = Asc(ch)
            if (c >= 48 and c <= 57) or (c >= 65 and c <= 90) then out = out + ch
        end if
    end for
    return out
end function

function foldAsciiChar(ch as string) as string
    u = UCase(ch)
    if Instr(1, "ÁÀÂÃÄÅ", u) > 0 then return "A"
    if Instr(1, "ÉÈÊË", u) > 0 then return "E"
    if Instr(1, "ÍÌÎÏ", u) > 0 then return "I"
    if Instr(1, "ÓÒÔÕÖ", u) > 0 then return "O"
    if Instr(1, "ÚÙÛÜ", u) > 0 then return "U"
    if u = "Ç" then return "C"
    if u = "Ñ" then return "N"
    return u
end function

function adultLockNeededForText(value as dynamic) as boolean
    if not m.adultLockEnabled or m.adultUnlocked then return false
    return isAdultText(value)
end function

function adultLockNeededForItem(item as dynamic) as boolean
    if not m.adultLockEnabled or m.adultUnlocked then return false
    if item = invalid then return false
    if m.currentCategoryName <> invalid and isAdultText(m.currentCategoryName) then return true
    if item.name <> invalid and isAdultText(item.name) then return true
    if item.genre <> invalid and isAdultText(item.genre) then return true
    if item.rating <> invalid
        r = LCase(trimText(item.rating))
        if r = "18" or r = "18+" or r = "+18" then return true
    end if
    if item.raw <> invalid
        if item.raw.category_name <> invalid and isAdultText(item.raw.category_name) then return true
        if item.raw.genre <> invalid and isAdultText(item.raw.genre) then return true
        if item.raw.category_id <> invalid
            rawCategory = categoryNameForId(sVal(item.raw.category_id))
            if rawCategory <> "" and isAdultText(rawCategory) then return true
        end if
    end if
    return false
end function

function categoryNameForId(categoryId as string) as string
    if categoryId = "" or m.categories = invalid then return ""
    for each cat in m.categories
        if cat <> invalid and cat.id <> invalid and sVal(cat.id) = categoryId
            if cat.name <> invalid then return sVal(cat.name)
        end if
    end for
    return ""
end function

function isAdultText(value as dynamic) as boolean
    hay = LCase(trimText(value))
    if hay = "" then return false
    keywords = m.adultKeywords
    if keywords = invalid or trimText(keywords) = "" then keywords = "adult,adulto,adultos,xxx,18+,+18,porn,porno,pornô,erotico,erótico"
    startAt = 1
    total = Len(keywords)
    while startAt <= total
        commaPos = Instr(startAt, keywords, ",")
        token = ""
        if commaPos = 0
            token = Mid(keywords, startAt)
            startAt = total + 1
        else
            token = Mid(keywords, startAt, commaPos - startAt)
            startAt = commaPos + 1
        end if
        needle = LCase(trimText(token))
        if needle <> "" and Instr(1, hay, needle) > 0 then return true
    end while
    return false
end function

sub promptAdultPin()
    if not m.adultLockEnabled or m.adultUnlocked
        executePendingAdultAction()
        return
    end if
    toast("Conteúdo +18 protegido por PIN.")
    openKeyboard("adultpin", "Conteúdo +18 · Digite o PIN", "", true)
end sub

sub handleAdultPinEntered(pin as string)
    if pin = ""
        toast("Informe o PIN adulto.")
        clearPendingAdultAction()
        return
    end if
    showLoading("Verificando PIN adulto...")
    payload = { device_id: m.deviceId, device_key: m.deviceKey, pin: pin }
    startRequest("adult_pin", m.apiBase + "adult-pin.php", "POST", FormatJson(payload))
end sub

sub executePendingAdultAction()
    action = m.pendingAdultAction
    idx = m.pendingAdultIndex
    item = m.pendingAdultItem
    section = m.pendingAdultSection
    clearPendingAdultAction()
    if action = "category"
        continueCategorySelection(idx)
    else if action = "catalogitem"
        openCatalogItemUnlocked(idx)
    else if action = "detail"
        showMediaDetailUnlocked(item, section)
    end if
end sub

sub clearPendingAdultAction()
    m.pendingAdultAction = ""
    m.pendingAdultIndex = -1
    m.pendingAdultItem = invalid
    m.pendingAdultSection = ""
end sub

function trimText(value as dynamic) as string
    s = sVal(value)
    first = 1
    last = Len(s)
    while first <= last and isWhitespace(Mid(s, first, 1))
        first = first + 1
    end while
    while last >= first and isWhitespace(Mid(s, last, 1))
        last = last - 1
    end while
    if last < first then return ""
    return Mid(s, first, last - first + 1)
end function

function isWhitespace(ch as string) as boolean
    if ch = "" then return false
    c = Asc(ch)
    return c = 32 or c = 9 or c = 10 or c = 13
end function

sub playVideo(url as string, title as string, kind as string, seekPos as integer)
    if url = ""
        toast("URL de reprodução indisponível.")
        return
    end if
    if m.video.visible then m.video.control = "stop"
    m.currentVideoUrl = url
    m.currentVideoTitle = title
    m.currentVideoKind = kind
    cancelLiveRetry()
    if kind <> "episode" then m.currentVideoSeriesId = ""
    m.pendingSeek = seekPos
    m.resumeApplied = false
    m.videoMode = "fullscreen"
    content = CreateObject("roSGNode", "ContentNode")
    content.url = url
    content.title = title
    if kind = "live" then applyLiveStreamFormat(content)
    m.video.translation = [0,0]
    m.video.width = 1280
    m.video.height = 720
    m.video.content = content
    m.video.visible = true
    m.video.setFocus(true)
    m.video.control = "play"
end sub

sub onVideoState(event as object)
    state = event.getData()

    if state = "playing"
        if m.currentVideoKind = "live"
            m.liveRetryCount = 0
            m.liveRetryPending = false
            if m.liveRetryTimer <> invalid then m.liveRetryTimer.control = "stop"
            if m.liveStallTimer <> invalid then m.liveStallTimer.control = "stop"
        end if
        if m.pendingSeek > 0 and not m.resumeApplied
            m.video.seek = m.pendingSeek
            m.resumeApplied = true
        end if
        return
    end if

    if state = "buffering" and m.currentVideoKind = "live"
        if m.liveStallTimer <> invalid
            m.liveStallTimer.control = "stop"
            m.liveStallTimer.control = "start"
        end if
        return
    end if

    if state = "finished"
        if m.currentVideoKind = "live"
            scheduleLiveRetry("finished")
            return
        end if
        if m.videoMode = "fullscreen"
            savePlaybackProgress(true)
            clearContinue()
            m.skipProgressSave = true
        end if
        stopVideoAndReturn()
        m.skipProgressSave = false
        return
    end if

    if state = "error"
        videoError = ""
        if m.video.errorMsg <> invalid then videoError = LCase(sVal(m.video.errorMsg))
        if m.video.errorCode <> invalid then videoError = videoError + " " + sVal(m.video.errorCode)
        if Instr(1, videoError, "404") > 0 or Instr(1, videoError, "401") > 0 or Instr(1, videoError, "403") > 0
            m.video.control = "stop"
            m.video.visible = false
            checkXtreamAccountState("runtime_video")
            return
        end if
        if m.currentVideoKind = "live"
            scheduleLiveRetry("error")
            return
        end if
        if m.videoMode = "preview"
            stopEmbeddedPreview()
            toast("Não foi possível abrir o preview deste canal.")
        else
            toast("Não foi possível reproduzir este conteúdo.")
        end if
    end if
end sub

sub scheduleLiveRetry(reason as string)
    if m.currentVideoKind <> "live" or m.currentVideoUrl = "" then return
    if m.liveRetryPending then return

    m.liveRetryPending = true
    if m.liveStallTimer <> invalid then m.liveStallTimer.control = "stop"
    m.liveRetryCount = m.liveRetryCount + 1

    delay = 1.0
    if m.liveRetryCount = 2 then delay = 2.0
    if m.liveRetryCount = 3 then delay = 3.5
    if m.liveRetryCount >= 4 then delay = 6.0

    if m.liveRetryCount = 1
        toast("Sinal interrompido. Reconectando o canal...")
    else if m.liveRetryCount = 4
        toast("Canal instável. Continuarei tentando reconectar.")
    end if

    if m.liveRetryTimer <> invalid
        m.liveRetryTimer.control = "stop"
        m.liveRetryTimer.duration = delay
        m.liveRetryTimer.control = "start"
    else
        retryCurrentLiveChannel()
    end if
end sub

sub onLiveRetryTimer()
    if not m.liveRetryPending then return
    retryCurrentLiveChannel()
end sub

sub onLiveStallTimer()
    if m.currentVideoKind <> "live" then return
    if m.video <> invalid and m.video.state = "playing" then return
    scheduleLiveRetry("buffering")
end sub

sub retryCurrentLiveChannel()
    if m.currentVideoKind <> "live" or m.currentVideoUrl = ""
        cancelLiveRetry()
        return
    end if

    m.liveRetryPending = false

    content = CreateObject("roSGNode", "ContentNode")
    content.url = m.currentVideoUrl
    content.title = m.currentVideoTitle
    applyLiveStreamFormat(content)

    ' Mantém exatamente o modo/tela em que o usuário estava.
    if m.videoMode = "preview"
        m.video.translation = [790,100]
        m.video.width = 458
        m.video.height = 286
    else
        m.videoMode = "fullscreen"
        m.video.translation = [0,0]
        m.video.width = 1280
        m.video.height = 720
    end if

    m.video.control = "stop"
    m.video.content = content
    m.video.visible = true
    if m.videoMode = "fullscreen" then m.video.setFocus(true)
    m.video.control = "play"
end sub

sub cancelLiveRetry()
    m.liveRetryPending = false
    m.liveRetryCount = 0
    if m.liveRetryTimer <> invalid then m.liveRetryTimer.control = "stop"
    if m.liveStallTimer <> invalid then m.liveStallTimer.control = "stop"
end sub

sub stopVideoAndReturn()
    cancelLiveRetry()
    if m.video.visible
        if m.videoMode = "fullscreen" and m.currentVideoKind <> "live" and not m.skipProgressSave then saveContinue()
        m.video.control = "stop"
        m.video.visible = false
    end if
    m.videoMode = ""
    if m.currentScreen = "catalog"
        if m.currentSection = "live"
            m.itemList.setFocus(true)
        else if m.currentSection = "episodes"
            if m.episodeList.content <> invalid and m.episodeList.content.getChildCount() > 0 then m.episodeList.setFocus(true) else m.seasonList.setFocus(true)
        else
            m.itemGrid.setFocus(true)
        end if
    else if m.currentScreen = "search"
        m.searchGroup.visible = true
        if m.searchResultsGrid.content <> invalid and m.searchResultsGrid.content.getChildCount() > 0 then m.searchResultsGrid.setFocus(true) else m.searchKeyGrid.setFocus(true)
    else if m.currentScreen = "detail"
        m.detailGroup.visible = true
        updateDetailProgress()
        m.top.findNode("detailPrimary").setFocus(true)
    else if m.currentScreen = "sports"
        m.sportsChannels.setFocus(true)
    else
        showHome()
    end if
end sub

sub saveContinue()
    playbackPos = 0
    if m.video.position <> invalid then playbackPos = Int(m.video.position)
    if playbackPos < 5 then return
    reg = CreateObject("roRegistrySection", "awplay_continue")
    reg.Write("url", m.currentVideoUrl)
    reg.Write("title", m.currentVideoTitle)
    reg.Write("kind", m.currentVideoKind)
    reg.Write("position", playbackPos.ToStr())
    reg.Write("poster", m.currentVideoPoster)
    reg.Flush()
    savePlaybackProgress(false)
end sub

sub clearContinue()
    reg = CreateObject("roRegistrySection", "awplay_continue")
    reg.Delete("url")
    reg.Delete("title")
    reg.Delete("kind")
    reg.Delete("position")
    reg.Delete("poster")
    reg.Flush()
end sub

sub refreshContinueCard()
    reg = CreateObject("roRegistrySection", "awplay_continue")
    url = reg.Read("url")
    title = reg.Read("title")
    poster = reg.Read("poster")
    playbackPos = Val(reg.Read("position"))
    btn = m.top.findNode("continueBtn")
    m.top.findNode("continuePoster").uri = poster
    if url <> "" and title <> ""
        m.top.findNode("continueTitle").text = shortText(title, 18)
        m.top.findNode("continueProgress").text = "Continuar em " + formatTime(playbackPos)
        btn.visible = true
    else
        m.top.findNode("continueTitle").text = ""
        m.top.findNode("continueProgress").text = ""
        btn.visible = false
    end if
end sub

sub playContinue()
    reg = CreateObject("roRegistrySection", "awplay_continue")
    url = reg.Read("url")
    title = reg.Read("title")
    kind = reg.Read("kind")
    m.currentVideoPoster = reg.Read("poster")
    playbackPos = Val(reg.Read("position"))
    if url = "" then return
    playVideo(url, title, kind, playbackPos)
end sub

function formatTime(total as integer) as string
    h = Int(total / 3600)
    mnt = Int((total mod 3600) / 60)
    sec = total mod 60
    if h > 0 then return pad2(h) + ":" + pad2(mnt) + ":" + pad2(sec)
    return pad2(mnt) + ":" + pad2(sec)
end function

function pad2(v as integer) as string
    s = v.ToStr()
    if Len(s) < 2 then s = "0" + s
    return s
end function

sub updateHomeExpiryLabel()
    n = m.top.findNode("homeExpiry")
    if n <> invalid then n.text = m.currentExpiryText
end sub

function buildExpiryText(account as dynamic) as string
    if account <> invalid
        keys = ["playlist_expires_at", "expires_at", "expire_date", "expiration", "expires", "valid_until", "validade", "expiry_date"]
        for each k in keys
            val = invalid
            if account.DoesExist(k) then val = account.Lookup(k)
            txt = formatExpiryValue(val)
            if txt <> "" then return "Vencimento da lista: " + txt
        end for
    end if
    return "Vencimento da lista: --"
end function

function formatExpiryValue(value as dynamic) as string
    raw = trimText(sVal(value))
    if raw = "" then return ""
    numericOnly = true
    for i = 1 to Len(raw)
        c = Mid(raw, i, 1)
        if c < "0" or c > "9" then numericOnly = false : exit for
    end for
    if numericOnly and Len(raw) >= 9
        epoch = Val(raw)
        dt = CreateObject("roDateTime")
        dt.FromSeconds(epoch)
        dt.ToLocalTime()
        return pad2(dt.GetDayOfMonth()) + "/" + pad2(dt.GetMonth()) + "/" + dt.GetYear().ToStr()
    end if
    return raw
end function

function allowAwplayAppLifetime(data as dynamic) as boolean
    if data = invalid or data.account = invalid then return false
    provider = ""
    if data.account.provider_id <> invalid then provider = LCase(trimText(sVal(data.account.provider_id)))
    if provider <> "awplay" then return false
    if data.account.playlist_url = invalid then return false
    return trimText(sVal(data.account.playlist_url)) <> ""
end function

function maskPassword(value as string) as string
    out = ""
    for i = 1 to Len(value)
        out = out + "*"
    end for
    return out
end function

sub setListContent(listNode as object, titles as object)
    root = CreateObject("roSGNode", "ContentNode")
    for each title in titles
        child = root.CreateChild("ContentNode")
        child.title = title
    end for
    listNode.content = root
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if not press then return false

    if m.providerPickerGroup <> invalid and m.providerPickerGroup.visible
        if key = "back"
            closeProviderPicker()
            return true
        end if
        return false
    end if

    if m.loginKeyboardGroup <> invalid and m.loginKeyboardGroup.visible
        if key = "back"
            closePremiumLoginKeyboard(true)
            return true
        end if
        return false
    end if

    ' Roku sends the physical * button as "options". In the live catalog it toggles
    ' the currently focused channel. Full-screen playback keeps Roku's native options menu.
    if key = "options" and m.currentScreen = "catalog" and m.currentSection = "live"
        if m.videoMode <> "fullscreen" and m.itemList <> invalid and m.itemList.hasFocus()
            toggleFavoriteForCurrent()
            return true
        end if
    end if

    if m.resumeGroup <> invalid and m.resumeGroup.visible
        if key = "back" then closeResumeChoice() : return true
        if key = "right" and m.top.findNode("resumeContinueBtn").hasFocus() then m.top.findNode("resumeRestartBtn").setFocus(true) : return true
        if key = "left" and m.top.findNode("resumeRestartBtn").hasFocus() then m.top.findNode("resumeContinueBtn").setFocus(true) : return true
        if key = "down" and (m.top.findNode("resumeContinueBtn").hasFocus() or m.top.findNode("resumeRestartBtn").hasFocus()) then m.top.findNode("resumeCancelBtn").setFocus(true) : return true
        if key = "up" and m.top.findNode("resumeCancelBtn").hasFocus() then m.top.findNode("resumeContinueBtn").setFocus(true) : return true
        return false
    end if

    if m.video.visible
        if key = "back"
            if m.videoMode = "fullscreen" and m.currentScreen = "catalog" and m.currentSection = "live" and m.previewStreamId <> ""
                restoreLivePreview()
            else if m.videoMode = "preview"
                stopEmbeddedPreview()
                showHome()
            else
                stopVideoAndReturn()
            end if
            return true
        end if
        if m.videoMode = "fullscreen" then return false
    end if

    if m.currentScreen = "expired"
        if key = "right" and m.top.findNode("expiredCheckBtn").hasFocus()
            m.top.findNode("expiredExitBtn").setFocus(true) : updateExpiredVisualState() : return true
        else if key = "left" and m.top.findNode("expiredExitBtn").hasFocus()
            m.top.findNode("expiredCheckBtn").setFocus(true) : updateExpiredVisualState() : return true
        else if key = "back"
            return true
        end if
    else if m.currentScreen = "consent"
        if key = "right" and m.top.findNode("consentAccept").hasFocus()
            m.top.findNode("consentExit").setFocus(true) : return true
        else if key = "left" and m.top.findNode("consentExit").hasFocus()
            m.top.findNode("consentAccept").setFocus(true) : return true
        end if
    else if m.currentScreen = "activation"
        if key = "right" and m.top.findNode("providerActivationBtn").hasFocus()
            m.top.findNode("activationRefreshBtn").setFocus(true) : updateActivationVisualState() : return true
        else if key = "left" and m.top.findNode("activationRefreshBtn").hasFocus()
            m.top.findNode("providerActivationBtn").setFocus(true) : updateActivationVisualState() : return true
        end if
    else if m.currentScreen = "account"
        if key = "back"
            if m.xtream <> invalid then showHome() else m.top.close = true
            return true
        end if
        return handleAccountNavigation(key)
    else if m.currentScreen = "accountinfo"
        if key = "back"
            showHome()
            return true
        end if
        delBtn = m.top.findNode("accountInfoDeleteBtn")
        backBtn = m.top.findNode("accountInfoBackBtn")
        if delBtn <> invalid and delBtn.hasFocus() and key = "down"
            if backBtn <> invalid then backBtn.setFocus(true)
            updateAccountInfoVisualState()
            return true
        else if backBtn <> invalid and backBtn.hasFocus() and key = "up"
            if delBtn <> invalid then delBtn.setFocus(true)
            updateAccountInfoVisualState()
            return true
        end if
        return true
    else if m.currentScreen = "info"
        if key = "back" then showSettings() : return true
        if key = "down" and m.top.findNode("infoAccountBtn").hasFocus() then m.top.findNode("infoBack").setFocus(true) : return true
        if key = "up" and m.top.findNode("infoBack").hasFocus() then m.top.findNode("infoAccountBtn").setFocus(true) : return true
        return false
    else if m.currentScreen = "format"
        if key = "back" then showSettings() : return true
        ids = ["fmtDefaultBtn", "fmtM3U8Btn", "fmtTSBtn", "fmtBackBtn"]
        current = -1
        for i = 0 to ids.Count() - 1
            if m.top.findNode(ids[i]).hasFocus() then current = i : exit for
        end for
        if current >= 0
            if key = "down" and current < ids.Count() - 1 then m.top.findNode(ids[current + 1]).setFocus(true) : updateOutputFormatVisualState() : return true
            if key = "up" and current > 0 then m.top.findNode(ids[current - 1]).setFocus(true) : updateOutputFormatVisualState() : return true
        end if
        return false
    else if m.currentScreen = "settings"
        if key = "back" then showHome() : return true
        handled = handleSettingsNavigation(key)
        updateSettingsVisualState()
        return handled
    else if m.currentScreen = "support"
        if key = "back" then showHome() : return true
        return true
    else if m.currentScreen = "home"
        if key = "back"
            m.top.close = true
            return true
        end if
        return handleHomeNavigation(key)
    else if m.currentScreen = "catalog"
        if m.quickMenuActive
            quickIdx = m.quickMenuList.itemFocused
            if key = "back" then hideQuickMenu() : return true
            if key = "down" and quickIdx >= 3 then hideQuickMenu() : return true
            if key = "right"
                m.quickMenuActive = false
                m.quickMenuGroup.visible = false
                m.categoryList.visible = true
                if m.currentSection = "live"
                    if m.itemList.content <> invalid and m.itemList.content.getChildCount() > 0 then m.itemList.setFocus(true)
                else
                    if m.itemGrid.content <> invalid and m.itemGrid.content.getChildCount() > 0 then m.itemGrid.setFocus(true)
                end if
                return true
            end if
            if key = "left" or (key = "up" and quickIdx <= 0) then return true
        end if
        if m.inlineSearchActive
            if key = "back" then closeInlineSearch() : return true
            if key = "right" and m.inlineSearchKeyboard.hasFocus()
                idx = m.inlineSearchKeyboard.itemFocused
                if idx >= 0 and (idx mod 6) = 5
                    if m.currentSection = "live"
                        if m.itemList.content <> invalid and m.itemList.content.getChildCount() > 0 then m.itemList.setFocus(true)
                    else
                        if m.itemGrid.content <> invalid and m.itemGrid.content.getChildCount() > 0 then m.itemGrid.setFocus(true)
                    end if
                    return true
                end if
            end if
            if key = "left"
                if m.currentSection = "live" and m.itemList.hasFocus()
                    m.inlineSearchKeyboard.setFocus(true) : return true
                else if (m.currentSection = "movies" or m.currentSection = "series") and m.itemGrid.hasFocus()
                    focusedSearchItem = m.itemGrid.itemFocused
                    if focusedSearchItem < 0 then focusedSearchItem = 0
                    if (focusedSearchItem mod 4) = 0 then m.inlineSearchKeyboard.setFocus(true) : return true
                end if
            end if
        end if
        if key = "back"
            if m.currentSection = "episodes"
                restoreMediaDetail()
            else
                showHome()
            end if
            return true
        end if

        if m.currentSection = "episodes"
            startBtn = m.top.findNode("seriesStartBtn")
            favBtn = m.top.findNode("seriesFavoriteBtn")
            if key = "right" and startBtn.hasFocus()
                favBtn.setFocus(true)
                updateSeriesEpisodeVisualState()
                return true
            else if key = "left" and favBtn.hasFocus()
                startBtn.setFocus(true)
                updateSeriesEpisodeVisualState()
                return true
            else if key = "down" and (startBtn.hasFocus() or favBtn.hasFocus())
                if m.seasonList.content <> invalid and m.seasonList.content.getChildCount() > 0 then m.seasonList.setFocus(true)
                updateSeriesEpisodeVisualState()
                return true
            else if key = "up" and m.seasonList.hasFocus()
                startBtn.setFocus(true)
                updateSeriesEpisodeVisualState()
                return true
            else if key = "down" and m.seasonList.hasFocus()
                if m.episodeList.content <> invalid and m.episodeList.content.getChildCount() > 0 then m.episodeList.setFocus(true)
                return true
            else if key = "up" and m.episodeList.hasFocus()
                m.seasonList.setFocus(true)
                return true
            end if
            return false
        end if

        if m.currentSection = "live"
            if key = "up" and m.categoryList.hasFocus() and m.categoryList.itemFocused <= 0
                return true
            else if key = "left" and m.categoryList.hasFocus()
                return true
            else if key = "right" and m.categoryList.hasFocus()
                if m.itemList.content <> invalid and m.itemList.content.getChildCount() > 0 then m.itemList.setFocus(true)
                return true
            else if key = "left" and m.itemList.hasFocus()
                m.categoryList.setFocus(true) : return true
            else if key = "right" and m.itemList.hasFocus()
                ' The right panel is informational; keep focus on the channel list.
                return true
            else if key = "up" and (m.categoryList.hasFocus() or m.itemList.hasFocus())
                return true
            end if
        else if m.currentSection = "movies" or m.currentSection = "series"
            if key = "up" and m.categoryList.hasFocus() and m.categoryList.itemFocused <= 0
                return true
            else if key = "left" and m.categoryList.hasFocus()
                return true
            else if key = "right" and m.categoryList.hasFocus()
                if m.itemGrid.content <> invalid and m.itemGrid.content.getChildCount() > 0 then m.itemGrid.setFocus(true)
                return true
            else if m.itemGrid.hasFocus()
                focused = m.itemGrid.itemFocused
                if focused < 0 then focused = 0
                renderedCount = m.renderedItems.Count()

                if key = "left" and (focused mod 4) = 0
                    m.categoryList.setFocus(true)
                    return true
                else if key = "up" and focused < 4
                    if m.catalogPage > 0
                        changeCatalogPage(-1)
                    else
                        m.categoryList.setFocus(true)
                    end if
                    return true
                else if key = "down" and focused + 4 >= renderedCount
                    totalPages = Int((m.items.Count() - 1) / m.catalogPageSize) + 1
                    if m.catalogPage < totalPages - 1 then changeCatalogPage(1)
                    return true
                end if
            end if
        end if
    else if m.currentScreen = "search"
        if key = "back" then closeInstantSearch() : return true
        if key = "left" and m.searchResultsGrid.hasFocus() then m.searchKeyGrid.setFocus(true) : return true
        if key = "right" and m.searchKeyGrid.hasFocus()
            idx = m.searchKeyGrid.itemFocused
            if idx >= 0 and (idx mod 6) = 5 and m.searchResultsGrid.content <> invalid and m.searchResultsGrid.content.getChildCount() > 0
                m.searchResultsGrid.setFocus(true) : return true
            end if
        end if
        if key = "up" and m.searchKeyGrid.hasFocus()
            idx = m.searchKeyGrid.itemFocused
            if idx >= 0 and idx < 6 then return true
        end if
    else if m.currentScreen = "detail"
        pbtn = m.top.findNode("detailPrimary")
        cbtn = m.top.findNode("detailContinue")
        fbtn = m.top.findNode("detailFavorite")
        if key = "back"
            restoreCatalogFromDetail() : return true
        else if m.detailSimilarGrid <> invalid and m.detailSimilarGrid.hasFocus()
            if key = "up"
                pbtn.setFocus(true) : updateDetailVisualState() : return true
            end if
        else if key = "right" and pbtn.hasFocus()
            if cbtn.visible then cbtn.setFocus(true) else fbtn.setFocus(true)
            updateDetailVisualState() : return true
        else if key = "right" and cbtn.visible and cbtn.hasFocus()
            fbtn.setFocus(true) : updateDetailVisualState() : return true
        else if key = "left" and fbtn.hasFocus()
            if cbtn.visible then cbtn.setFocus(true) else pbtn.setFocus(true)
            updateDetailVisualState() : return true
        else if key = "left" and cbtn.visible and cbtn.hasFocus()
            pbtn.setFocus(true) : updateDetailVisualState() : return true
        else if key = "down" and (pbtn.hasFocus() or fbtn.hasFocus() or (cbtn.visible and cbtn.hasFocus()))
            if m.detailSimilarGrid <> invalid and m.detailSimilarGrid.content <> invalid and m.detailSimilarGrid.content.getChildCount() > 0
                m.detailSimilarGrid.setFocus(true) : updateDetailVisualState() : return true
            end if
            return true
        else if key = "up" and (pbtn.hasFocus() or fbtn.hasFocus() or (cbtn.visible and cbtn.hasFocus()))
            return true
        end if
    else if m.currentScreen = "sports"
        if key = "back"
            showHome() : return true
        else if key = "right" and m.sportsGrid.hasFocus()
            if m.sportsChannels.content <> invalid and m.sportsChannels.content.getChildCount() > 0 then m.sportsChannels.setFocus(true) else m.top.findNode("sportsBack").setFocus(true)
            return true
        else if key = "left" and m.sportsChannels.hasFocus()
            m.sportsGrid.setFocus(true) : return true
        else if key = "left" and m.sportsGrid.hasFocus()
            m.top.findNode("sportsBack").setFocus(true) : return true
        else if key = "right" and m.top.findNode("sportsBack").hasFocus()
            m.sportsGrid.setFocus(true) : return true
        end if
    end if
    return false
end function


sub onClockTimer()
    updateClock()
end sub

sub updateClock()
    dt = CreateObject("roDateTime")
    dt.ToLocalTime()
    clockText = pad2(dt.GetHours()) + ":" + pad2(dt.GetMinutes())
    m.top.findNode("homeClock").text = clockText
    m.top.findNode("homeDate").text = pad2(dt.GetDayOfMonth()) + "/" + pad2(dt.GetMonth()) + "/" + dt.GetYear().ToStr()
    cclock = m.top.findNode("catalogClock")
    if cclock <> invalid then cclock.text = clockText
    sclock = m.top.findNode("searchClock")
    if sclock <> invalid then sclock.text = clockText
end sub

sub renderCatalogItems()
    if m.currentSection = "live"
        m.top.findNode("catalogCount").text = m.items.Count().ToStr() + " canais"
        rootLive = CreateObject("roSGNode", "ContentNode")
        channelIndex = 1
        for each item in m.items
            childLive = rootLive.CreateChild("ContentNode")
            childLive.title = shortText(item.name, 30)
            childLive.shortDescriptionLine2 = channelIndex.ToStr()
            if item.logo <> ""
                childLive.hdPosterUrl = item.logo
                childLive.hdGridPosterUrl = item.logo
                childLive.sdGridPosterUrl = item.logo
            end if
            channelIndex = channelIndex + 1
        end for
        m.itemList.content = rootLive
        if m.items.Count() = 0
            m.top.findNode("previewPlaceholder").text = "Nenhum canal encontrado"
            m.categoryList.setFocus(true)
        else
            m.itemList.setFocus(true)
            updateCatalogFocus(0)
        end if
        return
    end if

    if m.currentSection = "movies" or m.currentSection = "series"
        ' Catálogo em janelas pequenas: MarkupGrid virtualiza a tela, mas cada
        ' ContentNode ainda pode manter sua textura. Renderizar milhares de capas
        ' grandes provoca EXIT_CHANNEL_MEM_LIMIT_FG em aparelhos com pouca RAM.
        total = m.items.Count()
        m.renderedItems = []
        root = CreateObject("roSGNode", "ContentNode")

        if total > 0
            pageCount = Int((total - 1) / m.catalogPageSize) + 1
            if m.catalogPage < 0 then m.catalogPage = 0
            if m.catalogPage >= pageCount then m.catalogPage = pageCount - 1
            firstIndex = m.catalogPage * m.catalogPageSize
            lastIndex = firstIndex + m.catalogPageSize - 1
            if lastIndex >= total then lastIndex = total - 1
            for i = firstIndex to lastIndex
                item = m.items[i]
                m.renderedItems.Push(item)
                child = root.CreateChild("ContentNode")
                displayTitle = shortText(item.name, 18)
                child.title = displayTitle
                child.shortDescriptionLine1 = displayTitle
                child.shortDescriptionLine2 = ratingStars(item.rating)
                if item.logo <> ""
                    child.hdPosterUrl = item.logo
                    child.hdGridPosterUrl = item.logo
                    child.sdGridPosterUrl = item.logo
                end if
            end for
        end if

        m.itemGrid.content = root
        m.top.findNode("catalogPrevPage").visible = false
        m.top.findNode("catalogNextPage").visible = false
        if m.catalogPageGrid <> invalid
            m.catalogPageGrid.visible = false
            m.catalogPageGrid.content = CreateObject("roSGNode", "ContentNode")
        end if
        if m.top.findNode("catalogPaginationGroup") <> invalid then m.top.findNode("catalogPaginationGroup").visible = false
        countLabel = total.ToStr() + " títulos"
        if m.currentSection = "movies" then countLabel = total.ToStr() + " filmes"
        if m.currentSection = "series" then countLabel = total.ToStr() + " séries"
        if m.kidsMode then countLabel = total.ToStr() + " títulos Kids"
        if total > m.catalogPageSize then countLabel = countLabel + " · " + (m.catalogPage + 1).ToStr() + "/" + pageCount.ToStr()
        m.top.findNode("catalogCount").text = countLabel

        if m.renderedItems.Count() > 0
            m.itemGrid.jumpToItem = 0
            m.itemGrid.setFocus(true)
            updateVodFocus(0)
            updateFavoriteButtons()
        else
            m.top.findNode("vodHelp").text = "Nenhum conteúdo encontrado"
            m.categoryList.setFocus(true)
        end if
    end if
end sub

sub changeCatalogPage(delta as integer)
    if m.currentSection <> "movies" and m.currentSection <> "series" then return
    total = m.items.Count()
    if total <= 0 then return
    pageCount = Int((total - 1) / m.catalogPageSize) + 1
    newPage = m.catalogPage + delta
    if newPage < 0 or newPage >= pageCount then return
    m.catalogPage = newPage
    renderCatalogItems()
    if m.renderedItems.Count() > 0
        m.itemGrid.jumpToItem = 0
        m.itemGrid.setFocus(true)
    else
        focusCurrentPageButton()
    end if
    toast("Página " + (m.catalogPage + 1).ToStr() + " de " + pageCount.ToStr())
end sub

sub jumpCatalogWindowPage(position as integer)
    if m.currentSection <> "movies" and m.currentSection <> "series" then return
    total = m.items.Count()
    if total <= 0 then return
    pageCount = Int((total - 1) / m.catalogPageSize) + 1
    windowStart = Int(m.catalogPage / m.catalogPageWindowSize) * m.catalogPageWindowSize
    targetPage = windowStart + position - 1
    if targetPage < 0 or targetPage >= pageCount then return
    m.catalogPage = targetPage
    renderCatalogItems()
    if m.renderedItems.Count() > 0
        m.itemGrid.jumpToItem = 0
        m.itemGrid.setFocus(true)
    else
        focusCurrentPageButton()
    end if
    toast("Página " + (m.catalogPage + 1).ToStr() + " de " + pageCount.ToStr())
end sub

sub updateTopPagination(pageCount as integer, total as integer)
    if m.catalogPageGrid = invalid then return
    m.pageGridActions = []
    showPages = pageCount > 1 and (m.currentSection = "movies" or m.currentSection = "series")
    m.catalogPageGrid.visible = showPages
    if not showPages
        m.catalogPageGrid.content = CreateObject("roSGNode", "ContentNode")
        return
    end if

    root = CreateObject("roSGNode", "ContentNode")
    windowStart = Int(m.catalogPage / m.catalogPageWindowSize) * m.catalogPageWindowSize
    if m.catalogPage > 0
        ch = root.CreateChild("ContentNode")
        ch.title = "<"
        m.pageGridActions.Push({kind:"prev", page:m.catalogPage - 1})
    end if

    lastWindowPage = windowStart + m.catalogPageWindowSize - 1
    if lastWindowPage >= pageCount then lastWindowPage = pageCount - 1
    for pageIndex = windowStart to lastWindowPage
        ch = root.CreateChild("ContentNode")
        ch.title = (pageIndex + 1).ToStr()
        if pageIndex = m.catalogPage then ch.shortDescriptionLine2 = "active"
        m.pageGridActions.Push({kind:"page", page:pageIndex})
    end for

    if m.catalogPage < pageCount - 1
        ch = root.CreateChild("ContentNode")
        ch.title = ">"
        m.pageGridActions.Push({kind:"next", page:m.catalogPage + 1})
    end if
    m.catalogPageGrid.content = root
end sub

sub onCatalogPageSelected(event as object)
    if m.currentSection <> "movies" and m.currentSection <> "series" then return
    idx = event.getData()
    if idx < 0 or idx >= m.pageGridActions.Count() then return
    action = m.pageGridActions[idx]
    targetPage = action.page
    total = m.items.Count()
    if total <= 0 then return
    pageCount = Int((total - 1) / m.catalogPageSize) + 1
    if targetPage < 0 or targetPage >= pageCount then return
    m.catalogPage = targetPage
    renderCatalogItems()
    if m.renderedItems.Count() > 0
        m.itemGrid.jumpToItem = 0
        m.itemGrid.setFocus(true)
    end if
    toast("Página " + (m.catalogPage + 1).ToStr() + " de " + pageCount.ToStr())
end sub

sub updateBottomPagination(pageCount as integer, total as integer)
    g = m.top.findNode("catalogPaginationGroup")
    if g = invalid then return
    hasPages = pageCount > 1 and (m.currentSection = "movies" or m.currentSection = "series")
    g.visible = hasPages
    if not hasPages then return

    windowStart = Int(m.catalogPage / m.catalogPageWindowSize) * m.catalogPageWindowSize
    for i = 1 to 5
        b = m.top.findNode("pageNum" + i.ToStr())
        pageIndex = windowStart + i - 1
        if pageIndex < pageCount
            b.visible = true
            label = (pageIndex + 1).ToStr()
            if pageIndex = m.catalogPage then label = "[" + label + "]"
            b.text = label
        else
            b.visible = false
        end if
    end for

    prev = m.top.findNode("pagePrevBottom")
    nextb = m.top.findNode("pageNextBottom")
    prev.visible = (m.catalogPage > 0)
    nextb.visible = (m.catalogPage < pageCount - 1)
    hint = m.top.findNode("pageRangeHint")
    if hint <> invalid then hint.text = (m.catalogPage + 1).ToStr() + "/" + pageCount.ToStr()
end sub

sub focusCurrentPageButton()
    if m.currentSection <> "movies" and m.currentSection <> "series" then return
    windowStart = Int(m.catalogPage / m.catalogPageWindowSize) * m.catalogPageWindowSize
    pageButtonPos = (m.catalogPage - windowStart) + 1
    b = m.top.findNode("pageNum" + pageButtonPos.ToStr())
    if b <> invalid and b.visible
        b.setFocus(true)
    else if m.top.findNode("pageNextBottom").visible
        m.top.findNode("pageNextBottom").setFocus(true)
    else
        m.itemGrid.setFocus(true)
    end if
end sub

sub applyCatalogSearch(query as string)
    if m.currentScreen <> "catalog" or m.currentSection = "episodes" then return
    q = trimText(query)
    m.catalogSearchQuery = q
    if q = ""
        m.top.findNode("catalogSearch").text = "Buscar"
        if m.currentSection = "movies" then m.top.findNode("vodSearchBtn").text = "Buscar filmes"
        if m.currentSection = "series" then m.top.findNode("vodSearchBtn").text = "Buscar séries"
        if m.currentCategoryId = "__favorites__"
            showFavoriteCategory(m.currentSection)
        else
            m.currentCategoryId = ""
            m.currentCategoryName = "Tudo"
            action = sectionAction(m.currentSection)
            showLoading("Atualizando conteúdo...")
            startRequest("items_" + m.currentSection, xapi(action), "GET", "")
        end if
        return
    end if
    m.top.findNode("catalogSearch").text = "Buscar: " + shortText(q, 14)
    if m.currentSection = "movies" then m.top.findNode("vodSearchBtn").text = "Buscar: " + shortText(q, 12)
    if m.currentSection = "series" then m.top.findNode("vodSearchBtn").text = "Buscar: " + shortText(q, 12)
    m.currentCategoryId = "__search__"
    m.currentCategoryName = "Busca"
    m.top.findNode("catalogItemsTitle").text = ""
    showLoading("Buscando " + q + "...")
    startFilteredRequest("search_" + m.currentSection, xapi(sectionAction(m.currentSection)), q, 240)
end sub

function sectionAction(section as string) as string
    if section = "movies" then return "get_vod_streams"
    if section = "series" then return "get_series"
    return "get_live_streams"
end function

sub handleSearchResults(section as string, data as object)
    m.catalogPage = 0
    filtered = buildCatalogItems(section, data)
    m.allItems = filtered
    m.items = filtered
    renderCatalogItems()
    if filtered.Count() = 0
        toast("Nenhum resultado encontrado.")
    else if filtered.Count() >= 240
        toast("Mostrando os primeiros 240 resultados. Refine a busca se necessário.")
    end if
end sub


sub openInstantSearch(section as string)
    if section <> "movies" and section <> "series" and section <> "live" then return
    if m.video <> invalid and m.video.visible and m.videoMode = "preview" then stopEmbeddedPreview()
    m.catalogGroup.visible = false
    m.detailGroup.visible = false
    m.searchGroup.visible = true
    m.resumeGroup.visible = false
    m.currentScreen = "search"
    m.instantSearchSection = section
    m.instantSearchQuery = ""
    m.instantSearchResults = []
    if section = "movies"
        m.top.findNode("searchTitle").text = "Buscar filmes"
    else if section = "series"
        m.top.findNode("searchTitle").text = "Buscar séries"
    else
        m.top.findNode("searchTitle").text = "Buscar canais"
    end if
    m.top.findNode("searchQueryText").text = "Digite para buscar..."
    m.top.findNode("searchStatus").text = "Digite uma letra para começar"
    m.searchResultsGrid.content = CreateObject("roSGNode", "ContentNode")
    keys = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9","DEL","ESP","CLR","SAIR"]
    root = CreateObject("roSGNode", "ContentNode")
    for each keyText in keys
        child = root.CreateChild("ContentNode")
        child.title = keyText
    end for
    m.searchKeyGrid.content = root
    m.searchKeyGrid.jumpToItem = 0
    m.searchKeyGrid.setFocus(true)
end sub

sub handleInlineSearchSource(section as string, data as object)
    if section <> m.instantSearchSection then return
    completeSource = buildCatalogItems(section, data)
    setMasterItems(section, completeSource)
    m.instantSearchSource = completeSource
    buildInstantSearchIndex()
    if m.inlineSearchActive
        applyInstantLocalSearch(m.instantSearchQuery)
        m.inlineSearchKeyboard.setFocus(true)
    end if
end sub

sub buildInlineSearchKeyboard(mode as string)
    m.searchKeyboardMode = mode
    if mode = "upper"
        keys = ["abc","ABC","#+-","1","2","3","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","4","5","6","7","8","9","0","DEL","ESP","LIM"]
    else if mode = "symbols"
        keys = ["abc","ABC","#+-","1","2","3","@","#","$","%","&","*","+","-","_",".","/",":",";","?","!","(",")","[","]","=","'","4","5","6","7","8","9","0","DEL","ESP","LIM","<",">",",","\\","|"]
    else
        keys = ["abc","ABC","#+-","1","2","3","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","4","5","6","7","8","9","0","DEL","ESP","LIM"]
    end if
    root = CreateObject("roSGNode", "ContentNode")
    for each keyText in keys
        ch = root.CreateChild("ContentNode")
        ch.title = keyText
    end for
    m.inlineSearchKeyboard.content = root
end sub

sub onInlineSearchKeySelected(event as object)
    idx = event.getData()
    if m.inlineSearchKeyboard.content = invalid or idx < 0 or idx >= m.inlineSearchKeyboard.content.getChildCount() then return
    keyText = m.inlineSearchKeyboard.content.getChild(idx).title
    if keyText = "abc"
        buildInlineSearchKeyboard("lower") : m.inlineSearchKeyboard.jumpToItem = 0 : return
    else if keyText = "ABC"
        buildInlineSearchKeyboard("upper") : m.inlineSearchKeyboard.jumpToItem = 1 : return
    else if keyText = "#+-"
        buildInlineSearchKeyboard("symbols") : m.inlineSearchKeyboard.jumpToItem = 2 : return
    else if keyText = "DEL"
        if Len(m.instantSearchQuery) > 0 then m.instantSearchQuery = Left(m.instantSearchQuery, Len(m.instantSearchQuery) - 1)
    else if keyText = "ESP"
        if Len(m.instantSearchQuery) < 40 then m.instantSearchQuery = m.instantSearchQuery + " "
    else if keyText = "LIM"
        m.instantSearchQuery = ""
    else
        if Len(m.instantSearchQuery) < 40 then m.instantSearchQuery = m.instantSearchQuery + keyText
    end if
    q = trimText(m.instantSearchQuery)
    if q = "" then m.top.findNode("inlineSearchQuery").text = "Digite para pesquisar" else m.top.findNode("inlineSearchQuery").text = shortText(m.instantSearchQuery, 24)
    applyInstantLocalSearch(m.instantSearchQuery)
    m.inlineSearchKeyboard.setFocus(true)
end sub

sub onInlineSearchExitRight(event as object)
    if not m.inlineSearchActive then return
    if m.currentSection = "live"
        if m.itemList.content <> invalid and m.itemList.content.getChildCount() > 0 then m.itemList.setFocus(true)
    else
        if m.itemGrid.content <> invalid and m.itemGrid.content.getChildCount() > 0 then m.itemGrid.setFocus(true)
    end if
end sub

sub closeInlineSearch()
    if not m.inlineSearchActive then return
    m.inlineSearchActive = false
    m.inlineSearchGroup.visible = false
    m.categoryList.visible = true
    m.catalogSearchQuery = ""
    m.instantSearchQuery = ""
    if m.instantSearchOriginalItems <> invalid then m.items = m.instantSearchOriginalItems
    if m.instantSearchCategoryName <> invalid then m.currentCategoryName = m.instantSearchCategoryName
    m.currentCategoryId = m.instantSearchCategoryId
    m.top.findNode("catalogItemsTitle").text = shortText(m.currentCategoryName, 38)
    renderCatalogItems()
    m.categoryList.setFocus(true)
end sub

sub applyInstantLocalSearch(query as string)
    q = trimText(query)
    source = m.instantSearchSource
    if source = invalid then source = m.allItems
    if source = invalid then source = []
    m.catalogSearchQuery = q
    m.catalogPage = 0

    if q = ""
        if m.instantSearchOriginalItems <> invalid then m.items = m.instantSearchOriginalItems else m.items = []
        if m.instantSearchCategoryName <> invalid then m.currentCategoryName = m.instantSearchCategoryName
        m.top.findNode("catalogItemsTitle").text = shortText(m.currentCategoryName, 38)
        m.top.findNode("catalogSearch").text = "Buscar"
        if m.currentSection = "movies" then m.top.findNode("vodSearchBtn").text = "Buscar filmes"
        if m.currentSection = "series" then m.top.findNode("vodSearchBtn").text = "Buscar séries"
        renderCatalogItems()
        return
    end if

    needle = normalizeName(q)
    if Len(needle) < 2
        if m.instantSearchOriginalItems <> invalid then m.items = m.instantSearchOriginalItems else m.items = []
        m.currentCategoryName = "Digite mais uma letra"
        m.top.findNode("catalogItemsTitle").text = "Digite pelo menos 2 caracteres"
        renderCatalogItems()
        return
    end if

    if m.instantSearchIndex = invalid or m.instantSearchIndex.Count() = 0 then buildInstantSearchIndex()
    filtered = []
    for each indexed in m.instantSearchIndex
        if Instr(1, indexed.key, needle) > 0
            filtered.Push(indexed.item)
            if filtered.Count() >= 24 then exit for
        end if
    end for

    m.items = filtered
    m.currentCategoryId = "__local_search__"
    m.currentCategoryName = "Busca: " + shortText(q, 24)
    m.top.findNode("catalogItemsTitle").text = m.currentCategoryName
    m.top.findNode("catalogSearch").text = "Buscar: " + shortText(q, 14)
    if m.currentSection = "movies" then m.top.findNode("vodSearchBtn").text = "Busca: " + shortText(q, 13)
    if m.currentSection = "series" then m.top.findNode("vodSearchBtn").text = "Busca: " + shortText(q, 13)
    renderCatalogItems()
    if not m.inlineSearchActive
        if filtered.Count() = 0 then toast("Nenhum resultado nesta categoria.") else toast(filtered.Count().ToStr() + " resultados encontrados.")
    end if
end sub

sub buildInstantSearchIndex()
    m.instantSearchIndex = []
    source = m.instantSearchSource
    if source = invalid then return
    for each item in source
        searchable = ""
        if item.name <> invalid then searchable = searchable + " " + sVal(item.name)
        if item.genre <> invalid then searchable = searchable + " " + sVal(item.genre)
        if item.year <> invalid then searchable = searchable + " " + sVal(item.year)
        m.instantSearchIndex.Push({key:normalizeName(searchable), item:item})
    end for
end sub

sub buildSearchKeyboard(mode as string)
    m.searchKeyboardMode = mode
    keys = []
    if mode = "upper"
        keys = ["abc","ABC","#+-","1","2","3","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","4","5","6","7","8","9","0","DEL","ESP","CLR"]
    else if mode = "symbols"
        keys = ["abc","ABC","#+-","1","2","3","@","#","$","%","&","*","+","-","_",".","/",":",";","?","!","(",")","[","]","=","'","4","5","6","7","8","9","0","DEL","ESP","CLR","<",">",",","\","|"]
    else
        keys = ["abc","ABC","#+-","1","2","3","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","4","5","6","7","8","9","0","DEL","ESP","CLR"]
    end if
    root = CreateObject("roSGNode", "ContentNode")
    for each keyText in keys
        ch = root.CreateChild("ContentNode")
        ch.title = keyText
    end for
    m.searchKeyGrid.content = root
end sub

sub closeInstantSearch()
    m.searchGroup.visible = false
    m.catalogGroup.visible = true
    m.currentScreen = "catalog"
    m.currentSection = m.instantSearchSection
    m.liveLayout.visible = (m.currentSection = "live")
    m.vodLayout.visible = (m.currentSection = "movies" or m.currentSection = "series")
    if m.currentSection = "live"
        if m.itemList.content <> invalid and m.itemList.content.getChildCount() > 0 then m.itemList.setFocus(true) else m.categoryList.setFocus(true)
    else
        if m.itemGrid.content <> invalid and m.itemGrid.content.getChildCount() > 0 then m.itemGrid.setFocus(true) else m.categoryList.setFocus(true)
    end if
end sub

sub onSearchKeySelected(event as object)
    idx = event.getData()
    if m.searchKeyGrid.content = invalid or idx < 0 or idx >= m.searchKeyGrid.content.getChildCount() then return
    keyText = m.searchKeyGrid.content.getChild(idx).title
    if keyText = "SAIR"
        closeInstantSearch() : return
    else if keyText = "DEL"
        if Len(m.instantSearchQuery) > 0 then m.instantSearchQuery = Left(m.instantSearchQuery, Len(m.instantSearchQuery)-1)
    else if keyText = "ESP"
        if Len(m.instantSearchQuery) < 40 then m.instantSearchQuery = m.instantSearchQuery + " "
    else if keyText = "CLR"
        m.instantSearchQuery = ""
    else
        if Len(m.instantSearchQuery) < 40 then m.instantSearchQuery = m.instantSearchQuery + keyText
    end if
    updateInstantSearchQuery()
end sub

sub updateInstantSearchQuery()
    q = trimText(m.instantSearchQuery)
    if q = ""
        m.top.findNode("searchQueryText").text = "Digite para buscar..."
        m.top.findNode("searchStatus").text = "Digite uma letra para começar"
        m.instantSearchResults = []
        m.searchResultsGrid.content = CreateObject("roSGNode", "ContentNode")
        m.searchDebounce.control = "stop"
        return
    end if
    m.top.findNode("searchQueryText").text = shortText(m.instantSearchQuery, 38)
    m.top.findNode("searchStatus").text = "Buscando..."
    m.searchDebounce.control = "stop"
    m.searchDebounce.control = "start"
end sub

sub onSearchDebounce()
    q = trimText(m.instantSearchQuery)
    if q = "" then return
    startFilteredRequest("instant_search_" + m.instantSearchSection, xapi(sectionAction(m.instantSearchSection)), q, 30)
end sub

sub handleInstantSearchResults(section as string, data as object)
    if m.currentScreen <> "search" or section <> m.instantSearchSection then return
    rows = buildCatalogItems(section, data)
    m.instantSearchResults = rows
    root = CreateObject("roSGNode", "ContentNode")
    count = rows.Count()
    maxShow = count
    if maxShow > 24 then maxShow = 24
    if maxShow > 0
        for i = 0 to maxShow - 1
            item = rows[i]
            child = root.CreateChild("ContentNode")
            displayTitle = shortText(item.name, 18)
            child.title = displayTitle
            child.shortDescriptionLine1 = displayTitle
            if section = "movies" or section = "series" then child.shortDescriptionLine2 = ratingStars(item.rating)
            if item.logo <> ""
                child.hdPosterUrl = item.logo
                child.hdGridPosterUrl = item.logo
                child.sdGridPosterUrl = item.logo
            end if
        end for
    end if
    m.searchResultsGrid.content = root
    if count = 0 then m.top.findNode("searchStatus").text = "Nenhum resultado" else m.top.findNode("searchStatus").text = count.ToStr() + " resultados"
end sub

sub onInstantSearchSelected(event as object)
    idx = event.getData()
    if idx < 0 or idx >= m.instantSearchResults.Count() then return
    item = m.instantSearchResults[idx]
    if m.instantSearchSection = "live"
        m.searchGroup.visible = false
        m.catalogGroup.visible = true
        m.currentScreen = "catalog"
        m.currentSection = "live"
        m.liveLayout.visible = true
        m.vodLayout.visible = false
        m.currentCategoryId = "__search__"
        m.currentCategoryName = "Busca: " + shortText(m.instantSearchQuery, 18)
        m.items = m.instantSearchResults
        m.allItems = m.instantSearchResults
        renderCatalogItems()
        if idx < m.items.Count()
            m.itemList.jumpToItem = idx
            updateCatalogFocus(idx)
            openCatalogItem(idx)
        end if
    else
        m.detailFromSearch = true
        m.searchGroup.visible = false
        showMediaDetail(item, m.instantSearchSection)
    end if
end sub

sub onInstantSearchFocused(event as object)
    idx = event.getData()
    if idx >= 0 and idx < m.instantSearchResults.Count() then m.top.findNode("searchStatus").text = shortText(m.instantSearchResults[idx].name, 30)
end sub

sub onSearchKeyboardExitRight(event as object)
    if m.currentScreen <> "search" then return
    if m.searchResultsGrid.content <> invalid and m.searchResultsGrid.content.getChildCount() > 0 then m.searchResultsGrid.setFocus(true)
end sub

sub onSearchResultsExitLeft(event as object)
    if m.currentScreen <> "search" then return
    m.searchKeyGrid.setFocus(true)
end sub

sub onPageGridExitDown(event as object)
    if m.currentScreen <> "catalog" then return
    if m.itemGrid.content <> invalid and m.itemGrid.content.getChildCount() > 0 then m.itemGrid.setFocus(true)
end sub

sub onPageGridExitLeft(event as object)
    if m.currentScreen <> "catalog" then return
    if m.categoryList <> invalid then m.categoryList.setFocus(true)
end sub

function progressEntryForUrl(url as string) as dynamic
    if url = "" then return invalid
    for each row in m.progressEntries
        if row <> invalid and row.url <> invalid and sVal(row.url) = url then return row
    end for
    return invalid
end function

function latestSeriesProgress(seriesId as string) as dynamic
    if seriesId = "" then return invalid
    best = invalid
    bestUpdated = 0
    for each row in m.progressEntries
        if row <> invalid and row.series_id <> invalid and sVal(row.series_id) = seriesId
            u = 0
            if row.updated <> invalid then u = Val(sVal(row.updated))
            if best = invalid or u >= bestUpdated
                best = row : bestUpdated = u
            end if
        end if
    end for
    return best
end function

sub loadPlaybackProgress()
    m.progressEntries = []
    reg = CreateObject("roRegistrySection", "awplay_progress")
    raw = reg.Read("items")
    if raw <> ""
        rows = ParseJson(raw)
        if rows <> invalid and type(rows) = "roArray" then m.progressEntries = rows
    end if
end sub

sub persistPlaybackProgress()
    if m.progressEntries.Count() > 80
        trimmed = []
        startAt = m.progressEntries.Count() - 80
        for i = startAt to m.progressEntries.Count() - 1
            trimmed.Push(m.progressEntries[i])
        end for
        m.progressEntries = trimmed
    end if
    reg = CreateObject("roRegistrySection", "awplay_progress")
    reg.Write("items", FormatJson(m.progressEntries))
    reg.Flush()
end sub

sub savePlaybackProgress(completed as boolean)
    if m.currentVideoUrl = "" or m.currentVideoKind = "live" then return
    playbackPos = 0
    duration = 0
    if m.video.position <> invalid then playbackPos = Int(m.video.position)
    if m.video.duration <> invalid then duration = Int(m.video.duration)
    if completed and duration > 0 then playbackPos = duration
    fresh = []
    for each row in m.progressEntries
        keepRow = true
        if row <> invalid and row.url <> invalid and sVal(row.url) = m.currentVideoUrl then keepRow = false
        if keepRow then fresh.Push(row)
    end for
    if playbackPos >= 5 or completed
        dt = CreateObject("roDateTime")
        fresh.Push({url:m.currentVideoUrl,title:m.currentVideoTitle,kind:m.currentVideoKind,position:playbackPos,duration:duration,poster:m.currentVideoPoster,series_id:m.currentVideoSeriesId,completed:completed,updated:dt.AsSeconds().ToStr()})
    end if
    m.progressEntries = fresh
    persistPlaybackProgress()
end sub

function progressPercent(entry as dynamic) as integer
    if entry = invalid then return 0
    if entry.completed <> invalid and entry.completed = true then return 100
    p = 0 : d = 0
    if entry.position <> invalid then p = Val(sVal(entry.position))
    if entry.duration <> invalid then d = Val(sVal(entry.duration))
    if d <= 0 or p <= 0 then return 0
    pct = Int((p * 100) / d)
    if pct < 0 then pct = 0
    if pct > 100 then pct = 100
    return pct
end function

sub updateDetailProgress()
    entry = invalid
    if m.detailType = "movies" then entry = progressEntryForUrl(m.selectedMovieUrl)
    if m.detailType = "series" then entry = latestSeriesProgress(m.selectedSeriesId)
    pct = progressPercent(entry)
    track = m.top.findNode("detailProgressTrack")
    fill = m.top.findNode("detailProgressFill")
    label = m.top.findNode("detailProgressLabel")
    continueBtn = m.top.findNode("detailContinue")
    completed = false
    if entry <> invalid and entry.completed <> invalid and entry.completed = true then completed = true
    if entry = invalid or pct <= 0 or completed
        track.visible = false : fill.visible = false : label.text = ""
        if continueBtn <> invalid then continueBtn.visible = false
        updateDetailVisualState()
        return
    end if
    track.visible = true : fill.visible = true
    fill.width = Int(580 * pct / 100)
    if continueBtn <> invalid
        continueBtn.visible = true
        if m.detailType = "movies"
            resumePosition = 0
            if entry.position <> invalid then resumePosition = Val(sVal(entry.position))
            continueBtn.text = "Continuar " + formatTime(resumePosition)
        else
            continueBtn.text = "Continuar série"
        end if
    end if
    if pct >= 98 then label.text = "Assistido · 100%" else label.text = "Progresso · " + pct.ToStr() + "%"
    updateDetailVisualState()
end sub

sub updateEpisodeProgress(ep as object)
    entry = progressEntryForUrl(ep.url)
    pct = progressPercent(entry)
    track = m.top.findNode("episodeProgressTrack")
    fill = m.top.findNode("episodeProgressFill")
    label = m.top.findNode("episodeProgressLabel")
    if track = invalid or fill = invalid or label = invalid then return
    if entry = invalid or pct <= 0
        track.visible = false : fill.visible = false : label.text = ""
        return
    end if
    track.visible = true : fill.visible = true
    fill.width = Int(290 * pct / 100)
    if pct >= 98 then label.text = "Episódio assistido" else label.text = "Assistido " + pct.ToStr() + "% · OK para continuar"
end sub

sub clearPlaybackProgressForUrl(url as string)
    if url = "" then return
    fresh = []
    for each row in m.progressEntries
        keepRow = true
        if row <> invalid and row.url <> invalid and sVal(row.url) = url then keepRow = false
        if keepRow then fresh.Push(row)
    end for
    m.progressEntries = fresh
    persistPlaybackProgress()
end sub

sub offerPlayback(url as string, title as string, kind as string, poster as string, seriesId as string)
    entry = progressEntryForUrl(url)
    if entry <> invalid and entry.completed <> invalid and entry.completed = true then entry = invalid
    position = 0
    if entry <> invalid and entry.position <> invalid then position = Val(sVal(entry.position))
    if position < 5
        m.currentVideoPoster = poster
        m.currentVideoSeriesId = seriesId
        playVideo(url, title, kind, 0)
        return
    end if
    m.resumeUrl = url : m.resumeTitleText = title : m.resumeKind = kind : m.resumePoster = poster : m.resumeSeriesId = seriesId : m.resumePosition = position
    m.resumeGroup.visible = true
    m.top.findNode("resumeTitle").text = shortText(title, 48)
    m.top.findNode("resumeInfo").text = "Você parou em " + formatTime(position) + ". Escolha como deseja assistir."
    pct = progressPercent(entry)
    m.top.findNode("resumeProgressFill").width = Int(610 * pct / 100)
    m.top.findNode("resumeContinueBtn").text = "Continuar em " + formatTime(position)
    m.top.findNode("resumeContinueBtn").setFocus(true)
end sub

sub startResumePlayback(continueFromSaved as boolean)
    resumePos = 0
    if continueFromSaved
        resumePos = m.resumePosition
    else
        clearPlaybackProgressForUrl(m.resumeUrl)
    end if
    m.resumeGroup.visible = false
    m.currentVideoPoster = m.resumePoster
    m.currentVideoSeriesId = m.resumeSeriesId
    playVideo(m.resumeUrl, m.resumeTitleText, m.resumeKind, resumePos)
end sub

sub closeResumeChoice()
    m.resumeGroup.visible = false
    if m.currentScreen = "detail"
        m.top.findNode("detailPrimary").setFocus(true)
    else if m.currentScreen = "catalog" and m.currentSection = "episodes"
        m.episodeList.setFocus(true)
    end if
end sub

sub loadFavorites()
    reg = CreateObject("roRegistrySection", "awplay_favorites")
    raw = reg.Read("items")
    data = invalid
    if raw <> "" then data = ParseJson(raw)
    if data <> invalid
        if data.live <> invalid and type(data.live) = "roArray" then m.favoriteLive = data.live
        if data.movies <> invalid and type(data.movies) = "roArray" then m.favoriteMovies = data.movies
        if data.series <> invalid and type(data.series) = "roArray" then m.favoriteSeries = data.series
    end if
end sub

sub saveFavorites()
    reg = CreateObject("roRegistrySection", "awplay_favorites")
    reg.Write("items", FormatJson({live:m.favoriteLive, movies:m.favoriteMovies, series:m.favoriteSeries}))
    reg.Flush()
end sub

function favoriteKey(item as object, section as string) as string
    if item = invalid then return ""
    if item.raw = invalid then return ""
    row = item.raw
    if section = "series" and row.series_id <> invalid then return "series:" + sVal(row.series_id)
    if row.stream_id <> invalid then return section + ":" + sVal(row.stream_id)
    return section + ":" + normalizeName(item.name)
end function

function favoriteArray(section as string) as object
    if section = "movies" then return m.favoriteMovies
    if section = "series" then return m.favoriteSeries
    return m.favoriteLive
end function

sub setFavoriteArray(section as string, arr as object)
    if section = "movies"
        m.favoriteMovies = arr
    else if section = "series"
        m.favoriteSeries = arr
    else
        m.favoriteLive = arr
    end if
end sub

function isFavoriteItem(item as object, section as string) as boolean
    key = favoriteKey(item, section)
    if key = "" then return false
    arr = favoriteArray(section)
    for each saved in arr
        if sVal(saved) = key then return true
    end for
    return false
end function

sub toggleFavoriteForCurrent()
    if m.currentScreen <> "catalog" then return
    section = m.currentSection
    idx = -1
    if section = "live"
        idx = m.itemList.itemFocused
    else if section = "movies" or section = "series"
        idx = m.itemGrid.itemFocused
    end if
    item = invalid
    if section = "live"
        if idx < 0 or idx >= m.items.Count() then return
        item = m.items[idx]
    else
        if idx < 0 or idx >= m.renderedItems.Count() then return
        item = m.renderedItems[idx]
    end if
    key = favoriteKey(item, section)
    if key = "" then return
    old = favoriteArray(section)
    found = false
    fresh = []
    for each saved in old
        if sVal(saved) = key
            found = true
        else
            fresh.Push(saved)
        end if
    end for
    if not found then fresh.Push(key)
    setFavoriteArray(section, fresh)
    saveFavorites()
    if found then toast("Removido dos favoritos.") else toast("Adicionado aos favoritos.")
    if m.currentCategoryId = "__favorites__"
        filterFavoritesFromMaster(section)
    else if section <> "live"
        renderCatalogItems()
    end if
    updateFavoriteButtons()
end sub

sub updateFavoriteButtons()
    if m.currentScreen <> "catalog" then return
    section = m.currentSection
    idx = -1
    if section = "live"
        idx = m.itemList.itemFocused
    else if section = "movies" or section = "series"
        idx = m.itemGrid.itemFocused
    end if
    item = invalid
    if section = "live"
        if idx < 0 or idx >= m.items.Count() then return
        item = m.items[idx]
    else
        if idx < 0 or idx >= m.renderedItems.Count() then return
        item = m.renderedItems[idx]
    end if
    fav = isFavoriteItem(item, section)
    text = "Favoritar"
    if fav then text = "Remover favorito"
    if section = "live"
        m.top.findNode("liveFavoriteBtn").text = text
        favState = m.top.findNode("liveFavoriteState")
        if favState <> invalid
            if fav
                favState.text = "FAVORITO   |   Tecla *: remover"
                favState.color = "0xFF6BCEFF"
            else
                favState.text = "Tecla *: favoritar"
                favState.color = "0xC677FFFF"
            end if
        end if
    end if
    if section = "movies" or section = "series" then m.top.findNode("catalogFavorite").text = text
end sub

function masterItems(section as string) as object
    if section = "movies" then return m.masterMovies
    if section = "series" then return m.masterSeries
    return m.masterLive
end function

sub setMasterItems(section as string, items as object)
    if section = "movies"
        m.masterMovies = items
    else if section = "series"
        m.masterSeries = items
    else
        m.masterLive = items
    end if
end sub

function movieUrlForItem(item as object) as string
    if item = invalid or item.raw = invalid or m.xtream = invalid then return ""
    row = item.raw
    if row.stream_id = invalid then return ""
    ext = "mp4"
    if row.container_extension <> invalid and sVal(row.container_extension) <> "" then ext = sVal(row.container_extension)
    return m.xtream.base + "/movie/" + enc(m.xtream.user) + "/" + enc(m.xtream.pass) + "/" + sVal(row.stream_id) + "." + ext
end function

function continueEntryForItem(item as object, section as string) as dynamic
    if item = invalid then return invalid
    if section = "movies"
        return progressEntryForUrl(movieUrlForItem(item))
    end if
    if section = "series" and item.raw <> invalid and item.raw.series_id <> invalid
        return latestSeriesProgress(sVal(item.raw.series_id))
    end if
    return invalid
end function

sub handleContinueSource(section as string, data as object)
    all = buildCatalogItems(section, data)
    setMasterItems(section, all)
    filterContinueFromMaster(section)
end sub

sub filterContinueFromMaster(section as string)
    m.catalogPage = 0
    master = masterItems(section)
    filtered = []
    for each item in master
        entry = continueEntryForItem(item, section)
        keep = false
        if entry <> invalid
            done = false
            if entry.completed <> invalid and entry.completed = true then done = true
            resumePosition = 0
            if entry.position <> invalid then resumePosition = Val(sVal(entry.position))
            if not done and resumePosition >= 5 then keep = true
        end if
        if keep
            item.continueUpdated = 0
            if entry.updated <> invalid then item.continueUpdated = Val(sVal(entry.updated))
            filtered.Push(item)
        end if
    end for

    ' Mais recente primeiro.
    if filtered.Count() > 1
        for a = 0 to filtered.Count() - 2
            for b = a + 1 to filtered.Count() - 1
                ua = 0 : ub = 0
                if filtered[a].continueUpdated <> invalid then ua = filtered[a].continueUpdated
                if filtered[b].continueUpdated <> invalid then ub = filtered[b].continueUpdated
                if ub > ua
                    tmp = filtered[a]
                    filtered[a] = filtered[b]
                    filtered[b] = tmp
                end if
            end for
        end for
    end if

    m.allItems = master
    m.items = filtered
    renderCatalogItems()
    if filtered.Count() = 0 then toast("Nenhum conteúdo em andamento nesta seção.")
end sub

sub showFavoriteCategory(section as string)
    master = masterItems(section)
    if master.Count() = 0
        showLoading("Carregando favoritos...")
        startRequest("favorites_" + section, xapi(sectionAction(section)), "GET", "")
        return
    end if
    filterFavoritesFromMaster(section)
end sub

sub handleFavoriteSource(section as string, data as object)
    all = buildCatalogItems(section, data)
    setMasterItems(section, all)
    filterFavoritesFromMaster(section)
end sub

sub filterFavoritesFromMaster(section as string)
    m.catalogPage = 0
    master = masterItems(section)
    filtered = []
    for each item in master
        if isFavoriteItem(item, section) then filtered.Push(item)
    end for
    m.allItems = master
    m.items = filtered
    renderCatalogItems()
end sub

function ratingStars(value as dynamic) as string
    if value = invalid then return ""
    txt = sVal(value)
    if txt = "" then return ""
    score = Val(txt)
    if score <= 0 then return ""
    stars = 0
    if score <= 5
        stars = Int(score + 0.5)
    else
        stars = Int((score / 2.0) + 0.5)
    end if
    if stars < 1 then stars = 1
    if stars > 5 then stars = 5
    out = ""
    for i = 1 to stars
        out = out + "★"
    end for
    return out
end function

function recentSortValue(row as dynamic, section as string) as integer
    if row = invalid then return 0
    if section = "series" and row.last_modified <> invalid then return Val(sVal(row.last_modified))
    if row.added <> invalid then return Val(sVal(row.added))
    return 0
end function

sub startRecentCategoryScan(section as string)
    m.recentScanSection = section
    m.recentScanCategories = []
    m.recentScanIndex = 0
    m.recentScanRanked = []
    for each cat in m.categories
        cid = sVal(cat.id)
        cname = LCase(sVal(cat.name))
        if cid <> "" and Left(cid, 2) <> "__" and Instr(1, cname, "todos") = 0 and Instr(1, cname, "all") = 0
            m.recentScanCategories.Push(cid)
        end if
    end for
    if m.recentScanCategories.Count() = 0
        hideLoading()
        m.top.findNode("vodHelp").text = "Nenhuma categoria disponível"
        return
    end if
    showLoading("Buscando os 10 títulos mais recentes...")
    requestNextRecentCategory()
end sub

sub requestNextRecentCategory()
    if m.recentScanIndex >= m.recentScanCategories.Count()
        rawRows = []
        ranked = m.recentScanRanked
        if ranked.Count() > 1
            for a = 0 to ranked.Count() - 2
                for b = a + 1 to ranked.Count() - 1
                    if ranked[b].score > ranked[a].score
                        temp = ranked[a] : ranked[a] = ranked[b] : ranked[b] = temp
                    end if
                end for
            end for
        end if
        for each entry in ranked
            rawRows.Push(entry.raw)
        end for
        hideLoading()
        handleRecentSource(m.recentScanSection, rawRows)
        m.recentScanCategories = []
        m.recentScanRanked = []
        return
    end if
    cid = m.recentScanCategories[m.recentScanIndex]
    m.recentScanIndex = m.recentScanIndex + 1
    action = sectionAction(m.recentScanSection)
    startRequest("recentcat_" + m.recentScanSection, xapi(action, cid), "GET", "")
end sub

sub mergeRecentCategory(data as dynamic)
    if data <> invalid
        for each row in data
            item = {score:recentSortValue(row, m.recentScanSection), raw:row}
            if m.recentScanRanked.Count() < 10
                m.recentScanRanked.Push(item)
            else
                minIndex = 0
                minScore = m.recentScanRanked[0].score
                for j = 1 to m.recentScanRanked.Count() - 1
                    if m.recentScanRanked[j].score < minScore
                        minScore = m.recentScanRanked[j].score
                        minIndex = j
                    end if
                end for
                if item.score > minScore then m.recentScanRanked[minIndex] = item
            end if
        end for
    end if
    requestNextRecentCategory()
end sub

sub handleRecentSource(section as string, data as object)
    ranked = []
    if data <> invalid
        for each row in data
            item = {score:recentSortValue(row, section), raw:row}
            if ranked.Count() < 10
                ranked.Push(item)
            else
                minIndex = 0
                minScore = ranked[0].score
                for j = 1 to ranked.Count() - 1
                    if ranked[j].score < minScore
                        minScore = ranked[j].score
                        minIndex = j
                    end if
                end for
                if item.score > minScore then ranked[minIndex] = item
            end if
        end for
    end if

    if ranked.Count() > 1
        for a = 0 to ranked.Count() - 2
            for b = a + 1 to ranked.Count() - 1
                if ranked[b].score > ranked[a].score
                    temp = ranked[a]
                    ranked[a] = ranked[b]
                    ranked[b] = temp
                end if
            end for
        end for
    end if

    rawRows = []
    for each r in ranked
        rawRows.Push(r.raw)
    end for
    m.catalogPage = 0
    m.allItems = buildCatalogItems(section, rawRows)
    m.items = m.allItems
    m.currentCategoryId = "__recent__"
    m.currentCategoryName = "Adicionados Recentemente"
    renderCatalogItems()
end sub

sub requestLiveEpg(item as object)
    if m.currentSection <> "live" or item = invalid then return
    key = favoriteKey(item, "live")
    m.epgFocusedKey = key
    m.top.findNode("liveNow").text = "Carregando programação..."
    m.top.findNode("liveNext").text = ""
    m.top.findNode("liveNowTime").text = ""
    m.top.findNode("liveNextTime").text = ""
    streamId = ""
    if item.raw <> invalid and item.raw.stream_id <> invalid then streamId = sVal(item.raw.stream_id)
    url = m.apiBase + "epg.php?device_id=" + enc(m.deviceId) + "&device_key=" + enc(m.deviceKey) + "&channel=" + enc(item.epgId) + "&name=" + enc(item.name) + "&stream_id=" + enc(streamId)
    startRequest("epg|" + key, url, "GET", "")
end sub

sub handleLiveEpg(tag as string, data as object)
    key = Mid(tag, 5)
    if key <> m.epgFocusedKey then return
    nowTitle = "Programação não informada"
    nextTitle = "Programação não informada"
    nowTime = ""
    nextTime = ""
    if data <> invalid
        if data.now <> invalid
            if data.now.title <> invalid and data.now.title <> "" then nowTitle = sVal(data.now.title)
            if data.now.time <> invalid then nowTime = sVal(data.now.time)
        end if
        if data.next <> invalid
            if data.next.title <> invalid and data.next.title <> "" then nextTitle = sVal(data.next.title)
            if data.next.time <> invalid then nextTime = sVal(data.next.time)
        end if
    end if
    m.top.findNode("liveNow").text = shortText(nowTitle, 72)
    m.top.findNode("liveNext").text = shortText(nextTitle, 72)
    m.top.findNode("liveNowTime").text = nowTime
    m.top.findNode("liveNextTime").text = nextTime
end sub


sub onVodGridExitDown(event as object)
    ' Continuous grid: DOWN scrolls inside MarkupGrid until the final row.
    ' At the end we intentionally keep the user in the content area.
end sub

sub onVodGridExitUp(event as object)
    if m.currentScreen <> "catalog" then return
    if m.currentSection <> "movies" and m.currentSection <> "series" then return
    if m.categoryList <> invalid then m.categoryList.setFocus(true)
end sub

sub onGridItemFocused(event as object)
    updateVodFocus(event.getData())
    updateFavoriteButtons()
end sub

sub updateVodFocus(idx as integer)
    if idx < 0 or idx >= m.renderedItems.Count() then return
    item = m.renderedItems[idx]
    favText = "Favoritar"
    if isFavoriteItem(item, m.currentSection) then favText = "Remover favorito"
    m.top.findNode("catalogFavorite").text = favText
    helpText = shortText(item.name, 58) + "   ·   OK abrir   ·   * favoritar"
    if m.kidsMode
        kidsHelp = m.top.findNode("kidsHelp")
        if kidsHelp <> invalid then kidsHelp.text = helpText
    else
        m.top.findNode("vodHelp").text = helpText
    end if
end sub

sub onGridItemSelected(event as object)
    if m.currentSection = "movies" or m.currentSection = "series" then openCatalogItem(event.getData())
end sub

function fallbackOverview(item as dynamic) as string
    if item = invalid then return ""
    if item.plot <> invalid and item.plot <> "" then return sVal(item.plot)
    return ""
end function

function detailMetaForItem(item as object, section as string) as string
    text = ""
    if item.year <> invalid and item.year <> "" then text = sVal(item.year)
    if item.rating <> invalid and item.rating <> ""
        if text <> "" then text = text + "  ·  "
        text = text + "Nota " + sVal(item.rating)
    end if
    return text
end function

function detailKeyForItem(item as object, section as string) as string
    if item = invalid then return section + ":unknown"
    row = item.raw
    if row <> invalid
        if section = "movies" and row.stream_id <> invalid then return "movie:" + sVal(row.stream_id)
        if section = "series" and row.series_id <> invalid then return "series:" + sVal(row.series_id)
    end if
    return section + ":" + LCase(sVal(item.name))
end function

sub showMediaDetail(item as object, section as string)
    if item = invalid then return
    if adultLockNeededForItem(item)
        m.pendingAdultAction = "detail"
        m.pendingAdultIndex = -1
        m.pendingAdultItem = item
        m.pendingAdultSection = section
        promptAdultPin()
        return
    end if
    showMediaDetailUnlocked(item, section)
end sub

sub showMediaDetailUnlocked(item as object, section as string)
    if item = invalid then return
    m.selectedMedia = item
    m.detailType = section
    m.detailMeta = invalid
    m.detailProviderTmdbId = ""
    m.detailRequestKey = detailKeyForItem(item, section)
    m.selectedMovieUrl = ""
    m.selectedSeriesId = ""
    m.selectedSeriesName = item.name
    m.selectedSeriesPoster = item.logo

    row = item.raw
    if section = "movies" and row <> invalid and row.stream_id <> invalid
        ext = "mp4"
        if row.container_extension <> invalid and row.container_extension <> "" then ext = sVal(row.container_extension)
        m.selectedMovieUrl = m.xtream.base + "/movie/" + enc(m.xtream.user) + "/" + enc(m.xtream.pass) + "/" + sVal(row.stream_id) + "." + ext
    else if section = "series" and row <> invalid and row.series_id <> invalid
        m.selectedSeriesId = sVal(row.series_id)
    end if

    hideMainGroups()
    m.currentScreen = "detail"
    m.currentSection = section
    m.detailGroup.visible = true
    m.top.findNode("detailTitle").text = item.name
    m.top.findNode("detailGenres").text = sVal(item.genre)
    m.top.findNode("detailFacts").text = ratingStars(item.rating)
    m.top.findNode("detailMeta").text = detailMetaForItem(item, section)
    overview = fallbackOverview(item)
    if overview = "" then overview = "Carregando sinopse..."
    m.top.findNode("detailOverview").text = overview

    ' Não estoura o poster na tela inteira. Enquanto o backdrop real não chega,
    ' usa o fundo Zenix e apresenta o cartaz discretamente à direita.
    m.top.findNode("detailBackdrop").uri = "pkg:/images/zenix_bg.png"
    m.top.findNode("detailPoster").uri = item.logo
    m.top.findNode("detailPoster").visible = (item.logo <> "")
    m.top.findNode("detailTmdbExtra").text = ""
    m.top.findNode("detailHint").text = ""
    m.top.findNode("detailContinue").visible = false
    if section = "series"
        m.top.findNode("detailPrimary").text = "Ver temporadas"
    else
        m.top.findNode("detailPrimary").text = "Iniciar"
    end if
    if isFavoriteItem(item, section)
        m.top.findNode("detailFavorite").text = "Remover favorito"
    else
        m.top.findNode("detailFavorite").text = "Favoritar"
    end if

    buildDetailSimilar()
    updateDetailProgress()
    m.top.findNode("detailPrimary").setFocus(true)
    updateDetailVisualState()

    ' Primeiro pede o detalhe ao próprio Xtream. Normalmente ele traz tmdb_id,
    ' plot, backdrop e data mais confiáveis do que get_vod_streams/get_series.
    if row <> invalid and section = "movies" and row.stream_id <> invalid
        startRequest("provider_detail|" + m.detailRequestKey, xapi("get_vod_info") + "&vod_id=" + enc(sVal(row.stream_id)), "GET", "")
    else if row <> invalid and section = "series" and row.series_id <> invalid
        startRequest("provider_detail|" + m.detailRequestKey, xapi("get_series_info") + "&series_id=" + enc(sVal(row.series_id)), "GET", "")
    else
        requestDetailMetadata("")
    end if
end sub

sub handleProviderDetailInfo(data as object)
    if m.selectedMedia = invalid then return
    info = providerInfoObject(data)
    if info = invalid
        requestDetailMetadata("")
        return
    end if

    plot = ""
    if info.plot <> invalid then plot = sVal(info.plot)
    if plot = "" and info.description <> invalid then plot = sVal(info.description)
    if plot <> "" then m.top.findNode("detailOverview").text = plot

    genres = ""
    if info.genre <> invalid then genres = sVal(info.genre)
    if genres <> "" then m.top.findNode("detailGenres").text = genres

    rating = ""
    if info.rating <> invalid then rating = sVal(info.rating)
    dateText = ""
    if info.releasedate <> invalid then dateText = sVal(info.releasedate)
    if dateText = "" and info.releaseDate <> invalid then dateText = sVal(info.releaseDate)
    durationText = ""
    if info.duration <> invalid then durationText = sVal(info.duration)
    facts = ""
    if rating <> "" then facts = ratingStars(rating) + "  " + rating + "/10"
    if dateText <> ""
        if facts <> "" then facts = facts + "  ·  "
        facts = facts + dateText
    end if
    if durationText <> ""
        if facts <> "" then facts = facts + "  ·  "
        facts = facts + durationText
    end if
    if facts <> "" then m.top.findNode("detailFacts").text = facts

    providerPoster = ""
    if info.movie_image <> invalid then providerPoster = sVal(info.movie_image)
    if providerPoster = "" and info.cover <> invalid then providerPoster = sVal(info.cover)
    if providerPoster <> ""
        m.top.findNode("detailPoster").uri = providerPoster
        m.top.findNode("detailPoster").visible = true
        if m.detailType = "series" then m.selectedSeriesPoster = providerPoster
    end if

    backdrop = ""
    if info.backdrop_path <> invalid
        bp = info.backdrop_path
        if GetInterface(bp, "ifArray") <> invalid
            if bp.Count() > 0 then backdrop = sVal(bp[0])
        else
            backdrop = sVal(bp)
        end if
    end if
    if backdrop = "" and info.backdrop <> invalid then backdrop = sVal(info.backdrop)
    if backdrop <> ""
        m.top.findNode("detailBackdrop").uri = backdrop
        m.top.findNode("detailPoster").visible = false
    end if

    tmdbId = ""
    if info.tmdb_id <> invalid then tmdbId = sVal(info.tmdb_id)
    if tmdbId = "" and info.tmdb <> invalid then tmdbId = sVal(info.tmdb)
    m.detailProviderTmdbId = tmdbId
    requestDetailMetadata(tmdbId)
end sub

function providerInfoObject(data as dynamic) as dynamic
    if data = invalid or GetInterface(data, "ifAssociativeArray") = invalid then return invalid
    if data.info <> invalid and GetInterface(data.info, "ifAssociativeArray") <> invalid then return data.info
    ' Alguns Xtreams retornam info=[] e colocam os dados válidos em movie_data.
    if data.movie_data <> invalid and GetInterface(data.movie_data, "ifAssociativeArray") <> invalid then return data.movie_data
    return invalid
end function

sub requestDetailMetadata(tmdbId = "" as string)
    if m.selectedMedia = invalid then return
    payloadItem = {name:m.selectedMedia.name, type:m.detailType, year:m.selectedMedia.year, tmdb_id:tmdbId}
    payload = {items:[payloadItem]}
    startRequest("metadata_detail|" + m.detailRequestKey, m.apiBase + "metadata.php", "POST", FormatJson(payload))
end sub

sub handleDetailMetadata(data as object)
    if m.selectedMedia = invalid then return
    meta = invalid
    if data <> invalid and data.items <> invalid and data.items.Count() > 0 then meta = data.items[0]
    if meta = invalid then return
    if meta.matched <> invalid and meta.matched <> true then return
    if (meta.tmdb_id = invalid or sVal(meta.tmdb_id) = "") and (meta.overview = invalid or sVal(meta.overview) = "") and (meta.backdrop = invalid or sVal(meta.backdrop) = "") then return

    m.detailMeta = meta
    title = m.selectedMedia.name
    if meta.title <> invalid and meta.title <> "" then title = sVal(meta.title)
    m.top.findNode("detailTitle").text = title

    genres = ""
    if meta.genres <> invalid then genres = sVal(meta.genres)
    if genres <> "" then m.top.findNode("detailGenres").text = genres

    facts = ""
    if meta.rating <> invalid and sVal(meta.rating) <> "" then facts = ratingStars(meta.rating) + "  " + sVal(meta.rating) + "/10"
    if meta.release_date <> invalid and sVal(meta.release_date) <> ""
        if facts <> "" then facts = facts + "  ·  "
        facts = facts + sVal(meta.release_date)
    end if
    if meta.runtime_text <> invalid and sVal(meta.runtime_text) <> ""
        if facts <> "" then facts = facts + "  ·  "
        facts = facts + sVal(meta.runtime_text)
    end if
    if facts <> "" then m.top.findNode("detailFacts").text = facts

    tagline = ""
    if meta.tagline <> invalid then tagline = sVal(meta.tagline)
    if tagline <> "" then m.top.findNode("detailMeta").text = shortText(tagline, 86) else m.top.findNode("detailMeta").text = ""

    if meta.overview <> invalid and meta.overview <> "" then m.top.findNode("detailOverview").text = sVal(meta.overview)
    if meta.poster <> invalid and meta.poster <> ""
        m.top.findNode("detailPoster").uri = sVal(meta.poster)
        if m.detailType = "series" then m.selectedSeriesPoster = sVal(meta.poster)
    end if
    if meta.backdrop <> invalid and meta.backdrop <> ""
        m.top.findNode("detailBackdrop").uri = sVal(meta.backdrop)
        m.top.findNode("detailPoster").visible = false
    else if m.top.findNode("detailPoster").uri <> ""
        m.top.findNode("detailPoster").visible = true
    end if
    if m.detailType = "series" then m.selectedSeriesName = title
    updateDetailProgress()
    updateDetailVisualState()
end sub

sub buildDetailSimilar()
    m.detailSimilarItems = []
    root = CreateObject("roSGNode", "ContentNode")
    source = m.items
    if source = invalid then source = []
    selectedKey = favoriteKey(m.selectedMedia, m.detailType)
    for each candidate in source
        if m.detailSimilarItems.Count() >= 6 then exit for
        if candidate <> invalid
            candidateKey = favoriteKey(candidate, m.detailType)
            if candidateKey <> selectedKey
                m.detailSimilarItems.Push(candidate)
                child = root.CreateChild("ContentNode")
                child.title = shortText(candidate.name, 24)
                child.shortDescriptionLine2 = ratingStars(candidate.rating)
                if candidate.logo <> invalid and candidate.logo <> ""
                    child.hdPosterUrl = candidate.logo
                    child.hdGridPosterUrl = candidate.logo
                    child.sdGridPosterUrl = candidate.logo
                end if
            end if
        end if
    end for
    if m.detailSimilarGrid <> invalid then m.detailSimilarGrid.content = root
    titleNode = m.top.findNode("detailSimilarTitle")
    if titleNode <> invalid
        if m.detailType = "series" then titleNode.text = "Séries semelhantes" else titleNode.text = "Filmes semelhantes"
        titleNode.visible = (m.detailSimilarItems.Count() > 0)
    end if
    if m.detailSimilarGrid <> invalid then m.detailSimilarGrid.visible = (m.detailSimilarItems.Count() > 0)
end sub

sub onDetailSimilarSelected(event as object)
    idx = event.getData()
    if idx < 0 or idx >= m.detailSimilarItems.Count() then return
    item = m.detailSimilarItems[idx]
    showMediaDetail(item, m.detailType)
end sub

sub updateDetailVisualState()
    defs = [
        {btn:"detailPrimary", outline:"detailPrimaryOutline", card:"detailPrimaryCard", label:"detailPrimaryLabel", icon:""},
        {btn:"detailContinue", outline:"detailContinueOutline", card:"detailContinueCard", label:"detailContinueLabel", icon:""},
        {btn:"detailFavorite", outline:"detailFavoriteOutline", card:"detailFavoriteCard", label:"detailFavoriteLabel", icon:""}
    ]
    for each d in defs
        btn = m.top.findNode(d.btn)
        outline = m.top.findNode(d.outline)
        card = m.top.findNode(d.card)
        label = m.top.findNode(d.label)
        visible = (btn <> invalid and btn.visible)
        if outline <> invalid then outline.visible = visible
        if card <> invalid then card.visible = visible
        if label <> invalid
            label.visible = visible
            if visible then label.text = d.icon + btn.text
        end if
        if visible
            focused = btn.hasFocus()
            if outline <> invalid
                if focused then outline.color = "0xE61FA4FF" else outline.color = "0x5E71ABFF"
            end if
            if card <> invalid
                if focused then card.color = "0xE61FA4F2" else card.color = "0x111522E8"
            end if
            if label <> invalid then label.color = "0xFFFFFFFF"
        end if
    end for
end sub

sub restoreCatalogFromDetail()
    m.detailGroup.visible = false
    if m.detailFromSearch
        m.searchGroup.visible = true
        m.currentScreen = "search"
        if m.searchResultsGrid.content <> invalid and m.searchResultsGrid.content.getChildCount() > 0 then m.searchResultsGrid.setFocus(true) else m.searchKeyGrid.setFocus(true)
        return
    end if
    m.catalogGroup.visible = true
    m.currentScreen = "catalog"
    m.currentSection = m.detailType
    m.vodLayout.visible = not m.kidsMode
    if m.kidsLayout <> invalid then m.kidsLayout.visible = m.kidsMode
    m.liveLayout.visible = false
    m.episodeLayout.visible = false
    m.categoryList.visible = true
    m.top.findNode("catalogBack").text = "Início"
    m.top.findNode("catalogBack").visible = false
    if m.catalogPageGrid <> invalid then m.catalogPageGrid.visible = false
    m.top.findNode("catalogLiveTab").visible = false
    m.top.findNode("catalogMoviesTab").visible = false
    m.top.findNode("catalogSeriesTab").visible = false
    m.top.findNode("catalogSearch").visible = false
    m.top.findNode("vodSearchBtn").visible = false
    if m.detailType = "movies" then m.top.findNode("vodSearchBtn").text = "Buscar filmes"
    if m.detailType = "series" then m.top.findNode("vodSearchBtn").text = "Buscar séries"
    m.top.findNode("catalogFavorite").visible = false
    m.top.findNode("catalogPrevPage").visible = false
    m.top.findNode("catalogNextPage").visible = false
    if m.catalogPageGrid <> invalid then m.catalogPageGrid.visible = false
    if m.top.findNode("catalogPaginationGroup") <> invalid then m.top.findNode("catalogPaginationGroup").visible = false
    if m.itemGrid.content <> invalid and m.itemGrid.content.getChildCount() > 0
        m.itemGrid.setFocus(true)
    else
        m.categoryList.setFocus(true)
    end if
end sub

sub restoreMediaDetail()
    m.catalogGroup.visible = false
    m.detailGroup.visible = true
    m.currentScreen = "detail"
    m.currentSection = m.detailType
    m.top.findNode("detailPrimary").setFocus(true)
    updateDetailVisualState()
end sub

sub activateDetailContinue()
    if m.selectedMedia = invalid then return
    if m.detailType = "movies"
        entry = progressEntryForUrl(m.selectedMovieUrl)
        if entry = invalid
            activateDetailPrimary()
            return
        end if
        resumePosition = 0
        if entry.position <> invalid then resumePosition = Val(sVal(entry.position))
        m.currentVideoPoster = m.top.findNode("detailPoster").uri
        m.currentVideoSeriesId = ""
        playVideo(m.selectedMovieUrl, m.top.findNode("detailTitle").text, "movie", resumePosition)
    else if m.detailType = "series"
        if m.selectedSeriesId = "" then return
        m.openSeriesContinueAfterLoad = true
        showLoading("Abrindo de onde você parou...")
        startRequest("series_continue_info", xapi("get_series_info") + "&series_id=" + enc(m.selectedSeriesId), "GET", "")
    end if
end sub

sub activateDetailPrimary()
    if m.selectedMedia = invalid then return
    if m.detailType = "movies"
        if m.selectedMovieUrl = ""
            toast("URL do filme indisponível.")
            return
        end if
        m.currentVideoPoster = m.top.findNode("detailPoster").uri
        m.currentVideoSeriesId = ""
        playVideo(m.selectedMovieUrl, m.top.findNode("detailTitle").text, "movie", 0)
    else if m.detailType = "series"
        if m.selectedSeriesId = ""
            toast("Série sem identificador.")
            return
        end if
        showLoading("Carregando temporadas...")
        startRequest("series_info", xapi("get_series_info") + "&series_id=" + enc(m.selectedSeriesId), "GET", "")
    end if
end sub

sub toggleDetailFavorite()
    if m.selectedMedia = invalid then return
    section = m.detailType
    key = favoriteKey(m.selectedMedia, section)
    if key = "" then return
    old = favoriteArray(section)
    found = false
    fresh = []
    for each saved in old
        if sVal(saved) = key
            found = true
        else
            fresh.Push(saved)
        end if
    end for
    if not found then fresh.Push(key)
    setFavoriteArray(section, fresh)
    saveFavorites()
    if found
        m.top.findNode("detailFavorite").text = "Favoritar"
        toast("Removido dos favoritos.")
    else
        m.top.findNode("detailFavorite").text = "Remover favorito"
        toast("Adicionado aos favoritos.")
    end if
    updateDetailVisualState()
end sub

sub openCatalogItem(idx as integer)
    item = invalid
    if m.currentSection = "live"
        if idx < 0 or idx >= m.items.Count() then return
        item = m.items[idx]
    else if m.currentSection = "movies" or m.currentSection = "series"
        if idx < 0 or idx >= m.renderedItems.Count() then return
        item = m.renderedItems[idx]
    else
        return
    end if
    if adultLockNeededForItem(item)
        m.pendingAdultAction = "catalogitem"
        m.pendingAdultIndex = idx
        m.pendingAdultItem = invalid
        m.pendingAdultSection = m.currentSection
        promptAdultPin()
        return
    end if
    openCatalogItemUnlocked(idx)
end sub

sub openCatalogItemUnlocked(idx as integer)
    item = invalid
    if m.currentSection = "live"
        if idx < 0 or idx >= m.items.Count() then return
        item = m.items[idx]
    else if m.currentSection = "movies" or m.currentSection = "series"
        if idx < 0 or idx >= m.renderedItems.Count() then return
        item = m.renderedItems[idx]
    else
        return
    end if
    row = item.raw
    if m.currentSection = "live"
        if row.stream_id = invalid then return
        sid = sVal(row.stream_id)
        url = liveStreamUrl(sid)
        if m.video.visible and m.videoMode = "preview" and m.previewStreamId = sid
            expandLivePreview()
        else
            playLivePreview(url, item.name, item.logo, sid)
        end if
    else if m.currentSection = "movies" or m.currentSection = "series"
        m.detailFromSearch = false
        showMediaDetail(item, m.currentSection)
    end if
end sub

function imageValue(v as dynamic) as string
    if v = invalid then return ""
    if GetInterface(v, "ifArray") <> invalid
        for each one in v
            candidate = imageValue(one)
            if candidate <> "" then return candidate
        end for
        return ""
    end if
    text = sVal(v)
    if text = "" then return ""
    if Left(text, 1) = "/" then return "https://image.tmdb.org/t/p/w342" + text
    if Left(LCase(text), 4) = "http" then return text
    return ""
end function

function pickEpisodeImage(ep as dynamic, seriesPoster as string, seriesBackdrop as string) as string
    candidate = ""
    if ep <> invalid
        if ep.info <> invalid
            info = ep.info
            keys = ["movie_image", "cover_big", "cover", "image", "image_url", "thumbnail", "thumb", "still_path", "backdrop_path"]
            for each key in keys
                if info[key] <> invalid
                    candidate = imageValue(info[key])
                    if candidate <> "" then return candidate
                end if
            end for
        end if
        keys2 = ["movie_image", "cover_big", "cover", "image", "image_url", "thumbnail", "thumb", "still_path", "backdrop_path"]
        for each key in keys2
            if ep[key] <> invalid
                candidate = imageValue(ep[key])
                if candidate <> "" then return candidate
            end if
        end for
    end if
    if seriesBackdrop <> "" then return seriesBackdrop
    if seriesPoster <> "" then return seriesPoster
    return "pkg:/images/zenix_bg.png"
end function

function pickEpisodePlot(ep as dynamic) as string
    if ep = invalid then return ""
    if ep.info <> invalid
        keys = ["plot", "overview", "description"]
        for each key in keys
            if ep.info[key] <> invalid and sVal(ep.info[key]) <> "" then return sVal(ep.info[key])
        end for
    end if
    keys2 = ["plot", "overview", "description"]
    for each key in keys2
        if ep[key] <> invalid and sVal(ep[key]) <> "" then return sVal(ep[key])
    end for
    return ""
end function

sub requestEpisodeMetadataForSeason(seasonIndex as integer)
    if m.seriesTmdbId = "" then return
    if m.seriesSeasons = invalid or seasonIndex < 0 or seasonIndex >= m.seriesSeasons.Count() then return
    seasonNum = m.seriesSeasons[seasonIndex]
    reqKey = m.selectedSeriesId + "|" + seasonNum.ToStr()
    if m.episodeMetaRequested <> invalid and m.episodeMetaRequested[reqKey] <> invalid then return
    if m.episodeMetaRequested = invalid then m.episodeMetaRequested = {}
    m.episodeMetaRequested[reqKey] = true
    payload = { type:"season_episodes", tmdb_id:m.seriesTmdbId, season:seasonNum }
    startRequest("episode_metadata|" + reqKey, m.apiBase + "metadata.php", "POST", FormatJson(payload))
end sub

sub handleEpisodeMetadata(data as object)
    if data = invalid or data.items = invalid or m.seriesEpisodes = invalid then return
    changed = false
    for each meta in data.items
        if meta <> invalid and meta.matched = true
            seasonNum = 0
            episodeNum = 0
            if meta.season <> invalid then seasonNum = Val(sVal(meta.season))
            if meta.episode <> invalid then episodeNum = Val(sVal(meta.episode))
            if seasonNum > 0 and episodeNum > 0
                for i = 0 to m.seriesEpisodes.Count() - 1
                    ep = m.seriesEpisodes[i]
                    if ep.season = seasonNum and ep.number = episodeNum
                        still = ""
                        if meta.still <> invalid then still = imageValue(meta.still)
                        if still = "" and meta.poster <> invalid then still = imageValue(meta.poster)
                        if still <> ""
                            m.seriesEpisodes[i].logo = still
                            changed = true
                        end if
                        if meta.overview <> invalid and sVal(meta.overview) <> "" then m.seriesEpisodes[i].plot = sVal(meta.overview)
                        if meta.title <> invalid and sVal(meta.title) <> ""
                            niceTitle = cleanProviderLabel(sVal(meta.title))
                            if niceTitle <> "" then m.seriesEpisodes[i].name = "E" + pad2(episodeNum) + " · " + niceTitle
                        end if
                        exit for
                    end if
                end for
            end if
        end if
    end for
    if changed and m.currentSection = "episodes" and m.currentSeasonIndex >= 0
        focusIndex = 0
        if m.episodeList.itemFocused <> invalid then focusIndex = m.episodeList.itemFocused
        renderSeasonByIndex(m.currentSeasonIndex)
        if focusIndex >= 0 and focusIndex < m.currentSeasonEpisodes.Count()
            m.episodeList.jumpToItem = focusIndex
            updateEpisodeFocus(focusIndex)
        end if
    end if
end sub

sub onSeasonSelected(event as object)
    idx = event.getData()
    renderSeasonByIndex(idx)
    requestEpisodeMetadataForSeason(idx)
    if m.currentSeasonEpisodes.Count() > 0 then m.episodeList.setFocus(true)
end sub

sub onSeasonFocused(event as object)
    idx = event.getData()
    renderSeasonByIndex(idx)
    requestEpisodeMetadataForSeason(idx)
end sub

sub renderSeasonByIndex(idx as integer)
    if idx < 0 or idx >= m.seriesSeasons.Count() then return
    seasonNum = m.seriesSeasons[idx]
    current = []
    for each ep in m.seriesEpisodes
        if ep.season = seasonNum then current.Push(ep)
    end for

    ' Ordena os episódios pelo número dentro da temporada.
    if current.Count() > 1
        for a = 0 to current.Count() - 2
            for b = a + 1 to current.Count() - 1
                if current[b].number < current[a].number
                    tmp = current[a]
                    current[a] = current[b]
                    current[b] = tmp
                end if
            end for
        end for
    end if

    m.currentSeasonEpisodes = current
    m.currentSeasonIndex = idx
    if m.seasonList.content <> invalid
        seasonChildCount = m.seasonList.content.getChildCount()
        if seasonChildCount > 0
            for si = 0 to seasonChildCount - 1
                seasonChild = m.seasonList.content.getChild(si)
                if si = idx then seasonChild.shortDescriptionLine1 = "selected" else seasonChild.shortDescriptionLine1 = ""
            end for
        end if
    end if
    heading = "Episódios"
    m.top.findNode("episodesHeading").text = heading
    m.top.findNode("episodesTitle").text = "Temporada " + seasonNum.ToStr() + " · " + current.Count().ToStr() + " episódios"
    m.top.findNode("seriesEpisodeStatus").text = "Temporada " + seasonNum.ToStr() + " · " + current.Count().ToStr() + " episódios"

    root = CreateObject("roSGNode", "ContentNode")
    for each ep in current
        child = root.CreateChild("ZenixEpisodeItemData")
        child.title = "Episódio " + ep.number.ToStr()
        child.shortDescriptionLine1 = shortText(ep.name, 34)
        pct = progressPercent(progressEntryForUrl(ep.url))
        if pct > 0 then child.shortDescriptionLine2 = pct.ToStr() else child.shortDescriptionLine2 = ""
        posterUri = ""
        if ep.logo <> invalid then posterUri = sVal(ep.logo)
        if posterUri = "" then posterUri = m.selectedSeriesBackdrop
        if posterUri = "" then posterUri = m.selectedSeriesPoster
        if posterUri = "" then posterUri = "pkg:/images/zenix_bg.png"
        child.episodeImage = posterUri
        child.hdPosterUrl = posterUri
        child.hdGridPosterUrl = posterUri
        child.sdGridPosterUrl = posterUri
    end for
    m.episodeList.content = root

    if current.Count() > 0
        m.episodeList.jumpToItem = 0
        updateEpisodeFocus(0)
    else
        m.top.findNode("seriesEpisodeStatus").text = "Temporada " + seasonNum.ToStr() + " · sem episódios"
        m.top.findNode("episodeDetailTitle").text = "Nenhum episódio"
        m.top.findNode("episodeDetailMeta").text = ""
        m.top.findNode("episodeDetailPlot").text = ""
        m.top.findNode("episodePoster").uri = ""
    end if
end sub

sub startSeriesFirstEpisode()
    if m.seriesSeasons = invalid or m.seriesSeasons.Count() = 0 or m.seriesEpisodes = invalid or m.seriesEpisodes.Count() = 0
        toast("Nenhum episódio disponível.")
        return
    end if
    firstSeason = m.seriesSeasons[0]
    chosen = invalid
    for each ep in m.seriesEpisodes
        if ep.season = firstSeason
            if chosen = invalid or ep.number < chosen.number then chosen = ep
        end if
    end for
    if chosen = invalid
        toast("Nenhum episódio disponível.")
        return
    end if
    m.currentVideoPoster = chosen.logo
    m.currentVideoSeriesId = m.selectedSeriesId
    offerPlayback(chosen.url, chosen.name, "episode", chosen.logo, m.selectedSeriesId)
end sub

sub updateSeriesEpisodeVisualState()
    startBtn = m.top.findNode("seriesStartBtn")
    favBtn = m.top.findNode("seriesFavoriteBtn")
    defs = [
        {btn:startBtn, outline:m.top.findNode("seriesStartOutline"), card:m.top.findNode("seriesStartCard"), label:m.top.findNode("seriesStartLabel")},
        {btn:favBtn, outline:m.top.findNode("seriesFavoriteOutline"), card:m.top.findNode("seriesFavoriteCard"), label:m.top.findNode("seriesFavoriteLabel")}
    ]
    for each d in defs
        if d.btn <> invalid
            focused = d.btn.hasFocus()
            if d.outline <> invalid
                if focused then d.outline.color = "0xE61FA4FF" else d.outline.color = "0x5E71ABFF"
            end if
            if d.card <> invalid
                if focused then d.card.color = "0xE61FA4F2" else d.card.color = "0x111522E8"
            end if
            if d.label <> invalid
                d.label.text = d.btn.text
                d.label.color = "0xFFFFFFFF"
            end if
        end if
    end for
end sub

sub onEpisodeSelected(event as object)
    idx = event.getData()
    if idx < 0 or idx >= m.currentSeasonEpisodes.Count() then return
    ep = m.currentSeasonEpisodes[idx]
    m.currentVideoPoster = ep.logo
    m.currentVideoSeriesId = m.selectedSeriesId
    offerPlayback(ep.url, ep.name, "episode", ep.logo, m.selectedSeriesId)
end sub

sub onEpisodeFocused(event as object)
    updateEpisodeFocus(event.getData())
end sub

sub updateEpisodeFocus(idx as integer)
    if idx < 0 or idx >= m.currentSeasonEpisodes.Count() then return
    ep = m.currentSeasonEpisodes[idx]
    m.top.findNode("episodePoster").uri = ep.logo
    m.top.findNode("episodeDetailTitle").text = ep.name
    m.top.findNode("episodeDetailMeta").text = "Temporada " + ep.season.ToStr() + " · Episódio " + ep.number.ToStr()
    plot = ep.plot
    if plot = invalid or plot = "" then plot = "Sinopse do episódio não informada."
    m.top.findNode("episodeDetailPlot").text = plot
    updateEpisodeProgress(ep)
end sub

sub playLivePreview(url as string, title as string, logo as string, streamId as string)
    if m.video.visible then m.video.control = "stop"
    content = CreateObject("roSGNode", "ContentNode")
    content.url = url
    content.title = title
    applyLiveStreamFormat(content)
    m.currentVideoUrl = url
    m.currentVideoTitle = title
    m.currentVideoKind = "live"
    cancelLiveRetry()
    m.currentVideoPoster = logo
    m.pendingSeek = 0
    m.previewStreamId = streamId
    m.videoMode = "preview"
    m.video.translation = [790,100]
    m.video.width = 458
    m.video.height = 286
    m.video.content = content
    m.video.visible = true
    m.top.findNode("previewPlaceholder").visible = false
    m.top.findNode("liveHelp").visible = true
    m.video.control = "play"
    m.itemList.setFocus(true)
end sub

sub expandLivePreview()
    if not m.video.visible or m.videoMode <> "preview" then return
    m.videoMode = "fullscreen"
    m.video.translation = [0,0]
    m.video.width = 1280
    m.video.height = 720
    m.video.setFocus(true)
end sub

sub restoreLivePreview()
    if not m.video.visible then return
    m.videoMode = "preview"
    m.video.translation = [790,100]
    m.video.width = 458
    m.video.height = 286
    m.itemList.setFocus(true)
end sub

sub stopEmbeddedPreview()
    cancelLiveRetry()
    if m.video <> invalid and m.video.visible
        m.video.control = "stop"
        m.video.visible = false
    end if
    m.videoMode = ""
    m.previewStreamId = ""
    p = m.top.findNode("previewPlaceholder")
    if p <> invalid then p.visible = true
    h = m.top.findNode("liveHelp")
    if h <> invalid then h.visible = false
end sub

function handleAccountNavigation(key as string) as boolean
    u = m.top.findNode("usernameField")
    pw = m.top.findNode("passwordField")
    s = m.top.findNode("saveAccountBtn")

    if key = "down"
        if u.hasFocus() then pw.setFocus(true) : updateAccountVisualState() : return true
        if pw.hasFocus() then s.setFocus(true) : updateAccountVisualState() : return true
    else if key = "up"
        if pw.hasFocus() then u.setFocus(true) : updateAccountVisualState() : return true
        if s.hasFocus() then pw.setFocus(true) : updateAccountVisualState() : return true
    end if
    return false
end function

function handleSettingsNavigation(key as string) as boolean
    topIds = ["settingsAccounts", "settingsRefresh", "settingsClearProgress", "settingsClearFavorites"]
    bottomIds = ["settingsPrivacy", "settingsAbout", "settingsBack", "settingsOutputFormat"]

    idx = -1
    for i = 0 to topIds.Count() - 1
        if m.top.findNode(topIds[i]).hasFocus() then idx = i : exit for
    end for
    if idx >= 0
        if key = "left" and idx > 0 then m.top.findNode(topIds[idx - 1]).setFocus(true) : return true
        if key = "right" and idx < topIds.Count() - 1 then m.top.findNode(topIds[idx + 1]).setFocus(true) : return true
        if key = "down" then m.top.findNode(bottomIds[idx]).setFocus(true) : return true
        return true
    end if

    idx = -1
    for i = 0 to bottomIds.Count() - 1
        if m.top.findNode(bottomIds[i]).hasFocus() then idx = i : exit for
    end for
    if idx >= 0
        if key = "left" and idx > 0 then m.top.findNode(bottomIds[idx - 1]).setFocus(true) : return true
        if key = "right" and idx < bottomIds.Count() - 1 then m.top.findNode(bottomIds[idx + 1]).setFocus(true) : return true
        if key = "up" then m.top.findNode(topIds[idx]).setFocus(true) : return true
        return true
    end if
    return false
end function

function isBottomPaginationFocused() as boolean
    ids = ["pagePrevBottom", "pageNum1", "pageNum2", "pageNum3", "pageNum4", "pageNum5", "pageNextBottom"]
    for each id in ids
        b = m.top.findNode(id)
        if b <> invalid and b.visible and b.hasFocus() then return true
    end for
    return false
end function

function moveBottomPaginationFocus(direction as integer) as boolean
    ids = ["pagePrevBottom", "pageNum1", "pageNum2", "pageNum3", "pageNum4", "pageNum5", "pageNextBottom"]
    current = -1
    for i = 0 to ids.Count() - 1
        b = m.top.findNode(ids[i])
        if b <> invalid and b.visible and b.hasFocus() then current = i : exit for
    end for
    if current < 0 then return false
    i = current + direction
    while i >= 0 and i < ids.Count()
        b = m.top.findNode(ids[i])
        if b <> invalid and b.visible
            b.setFocus(true)
            return true
        end if
        i = i + direction
    end while
    return true
end function

function handleHomeNavigation(key as string) as boolean
    liveBtn = m.top.findNode("homeLive")
    moviesBtn = m.top.findNode("homeMovies")
    seriesBtn = m.top.findNode("homeSeries")
    kidsBtn = m.top.findNode("homeKids")
    sportsBtn = m.top.findNode("homeSports")
    accountBtn = m.top.findNode("homeAccount")
    settingsBtn = m.top.findNode("homeSettings")
    refreshBtn = m.top.findNode("homeRefresh")
    supportBtn = m.top.findNode("homeSupport")
    ' Linha principal inspirada em launcher: TV, Filmes, Séries, Kids e Esportes.
    primary = [liveBtn, moviesBtn, seriesBtn, kidsBtn, sportsBtn]
    for i = 0 to primary.Count() - 1
        if primary[i].hasFocus()
            if key = "left" and i > 0 then primary[i - 1].setFocus(true)
            if key = "right" and i < primary.Count() - 1 then primary[i + 1].setFocus(true)
            if key = "down"
                if i < 2
                    accountBtn.setFocus(true)
                else if i < 4
                    settingsBtn.setFocus(true)
                else
                    if supportBtn <> invalid and supportBtn.visible then supportBtn.setFocus(true) else refreshBtn.setFocus(true)
                end if
            end if
            updateHomeMenuVisualState() : return true
        end if
    end for

    secondary = [accountBtn, settingsBtn, refreshBtn]
    if supportBtn <> invalid and supportBtn.visible then secondary.Push(supportBtn)
    for i = 0 to secondary.Count() - 1
        if secondary[i].hasFocus()
            if key = "left" and i > 0 then secondary[i - 1].setFocus(true)
            if key = "right" and i < secondary.Count() - 1 then secondary[i + 1].setFocus(true)
            if key = "up"
                if i = 0 then moviesBtn.setFocus(true)
                if i = 1 then seriesBtn.setFocus(true)
                if i = 2 then sportsBtn.setFocus(true)
                if i = 3 then sportsBtn.setFocus(true)
            end if
            updateHomeMenuVisualState() : return true
        end if
    end for
    return false
end function
