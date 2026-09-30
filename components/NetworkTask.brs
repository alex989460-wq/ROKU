sub init()
    m.top.functionName = "executeRequest"
end sub

sub executeRequest()
    transfer = CreateObject("roUrlTransfer")
    port = CreateObject("roMessagePort")
    transfer.SetMessagePort(port)
    transfer.SetUrl(m.top.url)
    transfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    transfer.InitClientCertificates()
    transfer.RetainBodyOnError(true)
    transfer.AddHeader("Accept", "application/json,text/plain,*/*")
    transfer.AddHeader("User-Agent", "YOUCINEMA-Roku/5.11.0")

    started = false
    if UCase(m.top.method) = "POST"
        transfer.AddHeader("Content-Type", "application/json")
        started = transfer.AsyncPostFromString(m.top.body)
    else
        started = transfer.AsyncGetToString()
    end if

    if started <> true
        m.top.httpCode = 0
        m.top.error = "Nao foi possivel iniciar a comunicacao com o servidor."
        return
    end if

    msg = wait(30000, port)
    if msg = invalid
        transfer.AsyncCancel()
        m.top.httpCode = 0
        m.top.error = "Tempo limite de comunicacao com o servidor."
        return
    end if

    if type(msg) <> "roUrlEvent"
        transfer.AsyncCancel()
        m.top.httpCode = 0
        m.top.error = "Resposta de rede invalida."
        return
    end if

    code = msg.GetResponseCode()
    result = msg.GetString()
    m.top.httpCode = code

    if code < 0
        reason = msg.GetFailureReason()
        if reason = invalid or reason = "" then reason = "Falha de comunicacao com o servidor."
        m.top.error = reason
        return
    end if

    if result = invalid then result = ""

    if code < 200 or code >= 300
        err = "HTTP " + code.ToStr()
        ' Nginx/Apache podem devolver HTML em 404/500. Não tente ParseJson em HTML.
        if result <> ""
            firstChar = Left(result, 1)
            if firstChar = "{" or firstChar = "["
                parsed = ParseJson(result)
                if parsed <> invalid and parsed.error <> invalid then err = parsed.error
            end if
        end if
        m.top.error = err
        return
    end if

    ' Optional catalog filtering runs on the Task thread so huge playlists do not freeze the UI.
    if m.top.filterQuery <> "" and result <> ""
        parsedRows = ParseJson(result)
        if parsedRows <> invalid and type(parsedRows) = "roArray"
            filteredRows = []
            q = UCase(m.top.filterQuery)
            maxRows = m.top.filterLimit
            for each row in parsedRows
                nm = ""
                if row <> invalid and row.name <> invalid then nm = taskString(row.name)
                if Instr(1, UCase(nm), q) > 0
                    filteredRows.Push(row)
                    if maxRows > 0 and filteredRows.Count() >= maxRows then exit for
                end if
            end for
            result = FormatJson(filteredRows)
        end if
    end if

    m.top.response = result
end sub

function taskString(value as dynamic) as string
    if value = invalid then return ""
    t = type(value)
    if t = "String" or t = "roString" then return value
    return value.ToStr()
end function
