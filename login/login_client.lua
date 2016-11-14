local screenWidth, screenHeight = guiGetScreenSize()

resourceRoot = getResourceRootElement( getThisResource( ) )
localPlayer = getLocalPlayer()
infoTable = {}
Login_Edit = {}
marwinButtons = {}
font = {}
font[-1] = guiCreateFont( "font2.ttf", 8 )
font[0] = guiCreateFont( "font.ttf", 12 )
font[1] = guiCreateFont( "font.ttf", 16 )
font[2] = guiCreateFont( "font.ttf", 20 )
font[3] = guiCreateFont( "font.ttf", 24 )

--Button
function createMarwinButton(x,y,widht,height,text,bool,parent,info)
button = guiCreateStaticImage(x,y,widht,height,"images/button_standart.png", bool,parent or nil)
table.insert(marwinButtons,button)
guiBringToFront(button)
label = guiCreateLabel(0,0,1,1,text,bool,button)
guiBringToFront(label)
setElementData(label,"parent",button)
setElementData(button,"info",info)
guiSetFont(label,font[1])
guiLabelSetVerticalAlign (label, "center")
guiLabelSetHorizontalAlign (label, "center")
addEventHandler("onClientMouseEnter",label,markButton,false)
addEventHandler("onClientMouseLeave",label,unmarkButton,false)
return label
end

function markButton ()
parent = getElementData(source,"parent")
guiStaticImageLoadImage (parent,"images/button_mouse.png")
setElementData(getLocalPlayer(),"clickedButton",parent)
end

function unmarkButton (b,s)
parent = getElementData(source,"parent")
guiStaticImageLoadImage (parent,"images/button_standart.png")
setElementData(getLocalPlayer(),"clickedButton",false)
end
--Button end



function build_loginWin()
    guiSetInputMode("no_binds_when_editing")
    showCursor(true)
    confFile = xmlLoadFile("preferencesL.xml")
    if (confFile) then
        infoTable["account"] = xmlNodeGetAttribute(confFile,"username")
        infoTable["pass"] = xmlNodeGetAttribute(confFile,"pass")
    else
        confFile = xmlCreateFile("preferencesL.xml","user")
        xmlNodeSetAttribute(confFile,"username","")
        xmlNodeSetAttribute(confFile,"pass","")
        
        infoTable["account"] = getPlayerName(localPlayer)
        infoTable["pass"] = ""
    end
    xmlSaveFile(confFile)
    confFile = xmlLoadFile("preferences.xml")
    if (confFile) then
        xmlNodeSetAttribute(confFile,"username","")
        xmlNodeSetAttribute(confFile,"pass","")
    end
    --Create Window
        --Background
		tab_front1 = guiCreateStaticImage( 0, 0, screenWidth, screenHeight, "images/bg.png", true )
        background_front = guiCreateStaticImage( 0.2, 0.25, 0.6, 0.5, "images/background_1.png", true ,tab_front1)
        --tab_front = guiCreateStaticImage( 0.2, 76, 0.3, 0.15, "images/tab.png", true ,tab_front1)
            --Header Text
            --headline = guiCreateLabel(0,0.15,1,0.8,"Willkommen auf dem Deutschen DayZ Server",true,tab_front)
            --guiSetFont(headline,font[2])
            --guiLabelSetHorizontalAlign (headline, "center")
        --Login
            --login_box = guiCreateStaticImage( 0.025, 0.1, 0.325, 0.85, "images/box_background.png", true , background_front)
            loginButton = createMarwinButton(0.38,0.4,0.175,0.1,"Einloggen",true,background_front,"login")
            --Text
            --loginInfo = guiCreateLabel(0.025, 0.325, 0.325, 0.175,"Einloggen\noder\nRegistrieren!",true,background_front)
            --guiSetFont(loginInfo,font[1])
            --guiLabelSetHorizontalAlign (loginInfo, "center")
            --guiLabelSetColor ( loginInfo,132,18,18)
                --Username
                --username = guiCreateLabel(0.1, 0.2, 0.325, 0.04,"Benutzername",true,background_front)
                --guiSetFont(username,font[0])
                --guiLabelSetHorizontalAlign (username, "center")
                    --Edit Box
                    Login_Edit[1] = guiCreateEdit(0.25, 0.2, 0.175, 0.05, infoTable["account"], true,background_front)
                --Passwort
                --password = guiCreateLabel(0.1, 0.3, 0.325, 0.04,"Passwort",true,background_front)
                --guiSetFont(password,font[0])
                --guiLabelSetHorizontalAlign (password, "center")
                --loginIcon = guiCreateStaticImage( 0.1, 0.525, 0.04, 0.05, "images/login_icon.png", true , background_front)
                    --Edit Box
                    Login_Edit[2] = guiCreateEdit(0.25, 0.29, 0.175, 0.05, infoTable["pass"], true,background_front)
                    guiEditSetMasked(Login_Edit[2],true)
        --Register
            --register_box = guiCreateStaticImage( 0.375, 0.45, 0.325, 0.5, "images/box_background.png", true , background_front)
            registerButton = createMarwinButton(0.38,0.86,0.175,0.1,"Registrieren",true,background_front,"register")
            --Text
            --registerInfo = guiCreateLabel(0.375, 0.475, 0.325, 0.1,"Regestrieren!",true,background_front)
            --guiSetFont(registerInfo,font[1])
            --guiLabelSetHorizontalAlign (registerInfo, "center")
            --guiLabelSetColor ( registerInfo,132,18,18)
                --Username
                --username = guiCreateLabel(0.375, 0.55, 0.325, 0.04,"Benutzername",true,background_front)
                --guiSetFont(username,font[0])
                --guiLabelSetHorizontalAlign (username, "center")
                    --Edit Box
                    Login_Edit[3] = guiCreateEdit(0.25, 0.645, 0.175, 0.05, "", true,background_front)
                --Passwort
                --password = guiCreateLabel(0.375, 0.675, 0.325, 0.04,"Passwort",true,background_front)
                --guiSetFont(password,font[0])
                --guiLabelSetHorizontalAlign (password, "center")
                --loginIcon = guiCreateStaticImage( 0.45, 0.475, 0.04, 0.05, "images/signup_icon.png", true , background_front)
                    --Edit Box
                    Login_Edit[4] = guiCreateEdit(0.25, 0.735, 0.175, 0.05, "", true,background_front)      
                    guiEditSetMasked(Login_Edit[4],true)
        --Playing as a Guest
            --guest_box = guiCreateStaticImage( 0.375, 0.105, 0.325, 0.3, "images/box_background.png", true , background_front)
            --guestButton = createMarwinButton(0.45,0.275,0.175,0.1,"Guestmode",true,background_front,"guest")
            --guiSetFont(guestButton,font[0])
            --Text
            --guestInfo = guiCreateLabel(0.375, 0.125, 0.325, 0.225,"Der Offizielle Deutsche\nMulti Theft Auto: San Andreas\nDayZ - Zombie Survival Server \n Letztes Update am: \n 07.10.14",true,background_front)
            --guiSetFont(guestInfo,font[1])
            --guiLabelSetHorizontalAlign (guestInfo, "center")
            --guiLabelSetColor ( guestInfo,50,255,50)
        --News/Updates
            --News Headline
                --newsH = guiCreateLabel(0.726, 0.115, 0.25, 0.05,"News:",true,background_front)
                --guiSetFont(newsH,font[0])
                --guiLabelSetHorizontalAlign (newsH, "center")
                --guiLabelSetColor ( newsH,50,255,50)
            --news_box1
            news_box1 = guiCreateStaticImage( 0.58, 0.16, 0.39, 0.2, "images/news.png", true , background_front)
            guiSetAlpha(news_box1,0.8)
            news1 = guiCreateLabel(0.025, 0.125, 0.9, 0.9,"#Update 06.11.2016\nFPS auf 75.",true,news_box1)
            guiSetFont(news1,"default-bold-small")
            --news_box1_new = guiCreateStaticImage( 0, 0, 0.15, 0.1, "images/new.png", true , news_box1)
            guiSetVisible(news_box1_new,false)
            --news_box2
            news_box2 = guiCreateStaticImage( 0.58, 0.36, 0.39, 0.2, "images/news.png", true , background_front)
            guiSetAlpha(news_box2,0.4)
            news2 = guiCreateLabel(0.025, 0.125, 0.9, 0.9,"#Update",true,news_box2)
            guiSetFont(news2,"default-bold-small")
            --news_box2_new = guiCreateStaticImage( 0, 0, 0.15, 0.1, "images/new.png", true , news_box2)
            guiSetVisible(news_box2_new,false)
            --news_box3
            news_box3 = guiCreateStaticImage( 0.58, 0.56, 0.39, 0.2, "images/news.png", true , background_front)
            guiSetAlpha(news_box3,0.8)
            news3 = guiCreateLabel(0.025, 0.125, 0.9, 0.9,"#Update",true,news_box3)
            guiSetFont(news3,"default-bold-small")
            --news_box3_new = guiCreateStaticImage( 0, 0, 0.15, 0.1, "images/new.png", true , news_box3)
            guiSetVisible(news_box3_new,false)
            --news_box4
            news_box4 = guiCreateStaticImage( 0.58, 0.76, 0.39, 0.19, "images/news.png", true , background_front)
            guiSetAlpha(news_box4,0.4)
            news4 = guiCreateLabel(0.025, 0.125, 0.9, 0.9,"#Update",true,news_box4)
            guiSetFont(news4,"default-bold-small")
            --news_box4_new = guiCreateStaticImage( 0, 0, 0.15, 0.1, "images/new.png", true , news_box4)
            guiSetVisible(news_box4_new,false)
            --others
            --news_box = guiCreateStaticImage( 0.626, 0.1, 0.25, 0.85, "images/box_background.png", true , background_front)
            --guiCreateStaticImage(0.77, 0.1075, 0.04, 0.05, "images/on.png", true , background_front)
end



--LOGIN
function clickPanelButton (button, state)
    if button == "left" and state == "up" then
    local element = getElementData(getLocalPlayer(),"clickedButton")
        if element then 
            local info = getElementData(element,"info")
                if info and info == "login" then
                    local username = guiGetText(Login_Edit[1])
                    local password = guiGetText(Login_Edit[2])
                    if not (tostring(username) == "") and not (tostring(password) == "") then
                        triggerServerEvent("onClientSendLoginDataToServer", getLocalPlayer(), username, password)
                    else
                        outputChatBox("Kein Benutzername und Passwort gewählt",255,255,255,true)
                    end
                elseif info and info == "guest" then  
                        showLoginWindow(false)
                elseif info and info == "register" then  
                        local username = guiGetText(Login_Edit[3])
                        local pass1 = guiGetText(Login_Edit[4])
                        if not (tostring(username) == "") then
                            if not (tostring(pass1) == "") then
                                    triggerServerEvent("onClientSendRegisterDataToServer", getLocalPlayer(), username, pass1)               
                            else
                                reason = "Kein Passwort eingegeben!"
                                outputChatBox("[Login]#FF9900"..reason,255,255,255,true)
                            end
                        else
                            reason = "Kein Benutzername eingegeben!"
                            outputChatBox("[Login]#FF9900"..reason,255,255,255,true)
                        end 
                    end
                end
        end
end
addEventHandler("onClientClick",getRootElement(),clickPanelButton)

function onClientGetNews(text1,text2,text3,text4,bool1,bool2,bool3,bool4)
guiSetText(news1,text1)
guiSetText(news2,text2)
guiSetText(news3,text3)
guiSetText(news4,text4)
guiSetVisible(news_box1_new,bool1 == "true" and true or false)
guiSetVisible(news_box2_new,bool2 == "true" and true or false)
guiSetVisible(news_box3_new,bool3 == "true" and true or false)
guiSetVisible(news_box4_new,bool4 == "true" and true or false)
end
addEvent("onClientGetNews",true)
addEventHandler("onClientGetNews",getRootElement(),onClientGetNews)

--BUILD WINDOW ON RESOURCE START
addEventHandler("onClientResourceStart", resourceRoot, 
    function ()
         build_loginWin()
        guiSetVisible(background_front,false)
        showLoginWindow(true)
		setPlayerHudComponentVisible ("radar", false ) 
		ped = createPed ( 115, -2239.3713378906,-1746.8660888672,480.82662963867, 485,true )
		setPedAnimation( ped, "ped", "XPRESSscratch",-1,true,true,false,false) -- "ped", "XPRESSscratch" -- default "ped", endchat_01
		thePed = createPed(116, -2240.9713378906,-1744.7660888672,480.82662963867, 485) --- Creates a ped
		setPedAnimation( thePed, "ped", "XPRESSscratch",-1,true,true,false,false) -- "ped", "XPRESSscratch" -- default "ped", endchat_01
		setPedRotation(ped1, -20)
        guiSetInputMode("no_binds_when_editing")
        fadeCamera (true)
        setCameraMatrix(-2241.9584960938,-1747.4710693359,481.54472045898, 2659.0986328125, 2728.521484375, 10.774273872375)
    end
)

--onPlayerDoneLogin
function hideLoginWindow(accountName, pass)
        showLoginWindow(false)
		guiSetVisible(tab_front1,false)
        toggleSavePassword(accountName, pass)
end
addEvent("onPlayerDoneLogin", true)
addEventHandler("onPlayerDoneLogin", getRootElement(), hideLoginWindow)

--toggle save password
function toggleSavePassword(name, pass)
        confFile = xmlLoadFile("preferencesL.xml")
        xmlNodeSetAttribute(confFile, "username", name)
        xmlNodeSetAttribute(confFile, "pass", pass)
        xmlSaveFile(confFile)
end

function showLoginWindow(bool)
setElementData(getLocalPlayer(),"clickedButton",false)
showCursor(bool)
if bool then
    guiSetPosition(background_front,0.2, -0.75,true)
    addEventHandler("onClientRender",getRootElement(),rollLoginPanel)
    position = -0.75
    rollIn = true
    guiSetInputMode("no_binds_when_editing")
else
    guiSetPosition(background_front,0.2, 0.25,true)
    addEventHandler("onClientRender",getRootElement(),rollLoginPanel)
    position = 0.25
    rollIn = false
    guiSetInputMode("allow_binds")
end
end

rollIn = true
rollPosition = 0.0225
function rollLoginPanel ()
    if rollIn then
        local x,y = guiGetPosition(background_front,true)
            if y > 0.25 then
                removeEventHandler("onClientRender",getRootElement(),rollLoginPanel)
                return
            end
        guiSetPosition(background_front,0.2,position+rollPosition,true)
        guiSetVisible(background_front,true)
        position = position+rollPosition
    else
        local x,y = guiGetPosition(background_front,true)
            if y <= -0.75 then
                removeEventHandler("onClientRender",getRootElement(),rollLoginPanel)
                return
            end
        guiSetPosition(background_front,0.2,position-rollPosition,true)
        guiSetVisible(background_front,true)
        position = position-rollPosition
    end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
    setTimer(function()
        playSound("winsound.mp3")
    end, 2000, 1)
end
)