resourceRoot = getResourceRootElement(getThisResource())
localPlayer = getLocalPlayer()
versionstring = [[

]]
infoTable = {}
Login_Edit = {}
marwinButtons = {}
sx, sy = guiGetScreenSize()
font = {}
scale = 1
if sx < 1152 then
  scale = sx / 1152
end
if sx < 1024 then
  outputChatBox("Bem Vindo ao Servidor da Supriload!", 255, 0, 0)
end
font[-1] = guiCreateFont("font2.ttf", 8 * scale)
font[0] = guiCreateFont("font.ttf", 14 * scale)
font[1] = guiCreateFont("font.ttf", 18 * scale)
font[2] = guiCreateFont("font.ttf", 20 * scale)
font[3] = guiCreateFont("font.ttf", 24 * scale)
font[5] = guiCreateFont("font3.ttf", 25 * scale)
font[6] = guiCreateFont("font3.ttf", 18 * scale) --registrar
font[7] = guiCreateFont("font3.ttf", 20 * scale) --registrar
function createMarwinButton(x, y, widht, height, text, bool, parent, info)
  button = guiCreateStaticImage(x, y, widht, height, "images/button_standard.png", bool, parent or nil)
  table.insert(marwinButtons, button)
  guiBringToFront(button)
  label = guiCreateLabel(0, 0, 1, 1, text, bool, button)
  guiBringToFront(label)
  setElementData(label, "parent", button)
  setElementData(button, "info", info)
  guiSetFont(label, font[1])
  guiLabelSetVerticalAlign(label, "center")
  guiLabelSetHorizontalAlign(label, "center")
  addEventHandler("onClientMouseEnter", label, markButton, false)
  addEventHandler("onClientMouseLeave", label, unmarkButton, false)
  return label
end

function markButton()
  parent = getElementData(source, "parent")
  guiStaticImageLoadImage(parent, "images/button_mouse.png")
  setElementData(getLocalPlayer(), "clickedButton", parent)
  playSound("sounds/button.mp3")
end
function unmarkButton(b, s)
  parent = getElementData(source, "parent")
  guiStaticImageLoadImage(parent, "images/button_standard.png")
  setElementData(getLocalPlayer(), "clickedButton", false)
end
function build_loginWin()
  guiSetInputMode("no_binds_when_editing")
  showCursor(true)
  oldFile = xmlLoadFile("preferencesL.xml")
  confFile = xmlLoadFile("@preferencesL.xml")
  if not confFile and oldFile then
    confFile = xmlCreateFile("@preferencesL.xml", "user")
    local usr = xmlNodeGetAttribute(oldFile, "username")
    local pass = xmlNodeGetAttribute(oldFile, "pass")
    xmlNodeSetAttribute(confFile, "username", usr)
    xmlNodeSetAttribute(confFile, "pass", pass)
    xmlSaveFile(confFile)
  end
  if oldFile then
    xmlUnloadFile(oldFile)
  end
  confFile = xmlLoadFile("@preferencesL.xml")
  if confFile then
    infoTable.account = xmlNodeGetAttribute(confFile, "username")
    infoTable.pass = xmlNodeGetAttribute(confFile, "pass")
  else
    confFile = xmlCreateFile("@preferencesL.xml", "user")
    xmlNodeSetAttribute(confFile, "username", "")
    xmlNodeSetAttribute(confFile, "pass", "")
    infoTable.account = getPlayerName(localPlayer)
    infoTable.pass = ""
  end

  xmlSaveFile(confFile)
  local randomImage = math.random(1,1)
  staticimage = guiCreateStaticImage(0.00, 0.00, 1.00, 1.00, "images/w1.png", true)
  background_front = guiCreateStaticImage( 0.2, 0.25, 0.6, 0.5, "images/background_"..randomImage..".png", true)
 -- tab_front = guiCreateStaticImage( 0, 0, 1, 0.075, "images/tab.png", true ,background_front)
 -- headline = guiCreateLabel(0, 0.15, 1, 0.8, "", true, tab_front)
 -- guiSetFont(headline, font[5])
  guiLabelSetHorizontalAlign(headline, "center")
  servrInfo = guiCreateLabel(0.025, 0.1, 0.325, 0.3, versionstring, true, background_front)
  guiSetFont(servrInfo, font[1])
  guiLabelSetHorizontalAlign(servrInfo, "center")
  guiLabelSetColor(servrInfo, 77, 253, 0)
  loginButton = createMarwinButton(0.10, 0.83, 0.17, 0.10, "Logar", true, background_front, "login")

  --loginButton = createMarwinButton(0.1, 0.825, 0.175, 0.1, "Logar", true, background_front, "login")
 -- loginInfo = guiCreateLabel(0.03, 0.08, 0.34, 0.10, "LOGAR", true, background_front)
  --loginInfo = guiCreateLabel(0.025, 0.46, 0.325, 0.175, "LOGAR", true, background_front)
  guiSetFont(loginInfo, font[1])
  guiLabelSetHorizontalAlign(loginInfo, "center")
  guiLabelSetColor(loginInfo, 254, 0, 0)
  --username = guiCreateLabel(0.025, 0.55, 0.325, 0.04, "User", true, background_front)
  guiSetFont(username, font[1])
  guiLabelSetHorizontalAlign(username, "center")
 
  Login_Edit[1] = guiCreateEdit(0.10, 0.48, 0.17, 0.05, infoTable.account, true, background_front)
  --Login_Edit[1] = guiCreateEdit(0.1, 0.6, 0.175, 0.055, infoTable.account, true, background_front)
  --password = guiCreateLabel(0.025, 0.675, 0.325, 0.04, "Password", true, background_front)
  guiSetFont(password, font[1])
  guiLabelSetHorizontalAlign(password, "center")
  --loginIcon = guiCreateStaticImage(0.1, 0.46, 0.03, 0.05, "images/login_icon.png", true, background_front)
  Login_Edit[2] = guiCreateEdit(0.10, 0.60, 0.17, 0.05, infoTable.pass, true, background_front)    
  --Login_Edit[2] = guiCreateEdit(0.1, 0.725, 0.175, 0.055, infoTable.pass, true, background_front)
  guiEditSetMasked(Login_Edit[2], true)
  registerButton = createMarwinButton(0.45, 0.825, 0.175, 0.1, "Registre", true, background_front, "register")
-- registerInfo = guiCreateLabel(0.37, 0.08, 0.33, 0.10, "REGISTRE", true, background_front) 
-- registerInfo = guiCreateLabel(0.375, 0.33, 0.325, 0.1, "REGISTRE", true, background_front)
  guiSetFont(registerInfo, font[7])
  guiLabelSetHorizontalAlign(registerInfo, "center")
  --guiLabelSetColor(registerInfo, 255, 255, 255)
  guiLabelSetColor(registerInfo, 254, 0, 0)      
  --username = guiCreateLabel(0.375, 0.42, 0.325, 0.07, "Username", true, background_front)
  guiSetFont(username, font[6])
  guiLabelSetHorizontalAlign(username, "center")
  Login_Edit[3] = guiCreateEdit(0.45, 0.48, 0.175, 0.055, "", true, background_front)
  --password = guiCreateLabel(0.375, 0.550, 0.325, 0.06, "Password", true, background_front)
  guiSetFont(password, font[6])
  guiLabelSetHorizontalAlign(password, "center")
  --loginIcon = guiCreateStaticImage(0.40, 0.33, 0.03, 0.05, "images/signup_icon.png", true, background_front)
  Login_Edit[4] = guiCreateEdit(0.45, 0.600, 0.175, 0.055, "", true, background_front)
  guiEditSetMasked(Login_Edit[4], true)
  --password2 = guiCreateLabel(0.375, 0.687, 0.325, 0.06, "Password again", true, background_front)
  guiSetFont(password2, font[6])
  guiLabelSetHorizontalAlign(password2, "center")
  Login_Edit[5] = guiCreateEdit(0.45, 0.75, 0.175, 0.055, "", true, background_front)
  guiEditSetMasked(Login_Edit[5], true)
  
  bebe = guiCreateLabel(0.45, 0.41, 0.17, 0.07, "NOME:", true,background_front)
 guiSetFont(bebe, "default-small")
 guiLabelSetVerticalAlign(bebe, "center") 
 
 kkk = guiCreateLabel(0.10, 0.41, 0.17, 0.07, "NOME:", true,background_front)
 guiSetFont(kkk, "default-small")
 guiLabelSetVerticalAlign(kkk, "center")
 
 mlq = guiCreateLabel(0.45, 0.68, 0.17, 0.07, "REPITA A SENHA:", true,background_front)
 guiSetFont(mlq, "default-small")
 guiLabelSetVerticalAlign(mlq, "center")
 
 ppk = guiCreateLabel(0.10, 0.53, 0.17, 0.07, "SENHA:", true,background_front)
 guiSetFont(ppk, "default-small")
 guiLabelSetVerticalAlign(ppk, "center")
 
 jj = guiCreateLabel(0.45, 0.53, 0.17, 0.07, "SENHA:", true,background_front)
 guiSetFont(jj, "default-small")
 guiLabelSetVerticalAlign(jj, "center")
  --[[newsH = guiCreateLabel(0.726, 0.115, 0.25, 0.05, "Novidades:", true, background_front)
  guiSetFont(newsH, font[0])
  guiLabelSetHorizontalAlign(newsH, "center")
  guiLabelSetColor(newsH, 50, 255, 50)
  news_box1 = guiCreateStaticImage(0.73, 0.16, 0.244, 0.2, "images/news.png", true, background_front)
  guiSetAlpha(news_box1, 0.8)
  news1 = guiCreateLabel(0.025, 0.125, 1, 1, "-", true, news_box1)
  guiSetFont(news1, "default-bold-small")
  news_box1_new = guiCreateStaticImage(0, 0, 0.15, 0.1, "images/new.png", true, news_box1)
  guiSetVisible(news_box1_new, false)
  news_box2 = guiCreateStaticImage(0.73, 0.36, 0.244, 0.2, "images/news.png", true, background_front)
  guiSetAlpha(news_box2, 0.4)
  news2 = guiCreateLabel(0.025, 0.125, 1, 1, "-", true, news_box2)
  guiSetFont(news2, "default-bold-small")
  news_box2_new = guiCreateStaticImage(0, 0, 0.15, 0.1, "images/new.png", true, news_box2)
  guiSetVisible(news_box2_new, false)
  news_box3 = guiCreateStaticImage(0.73, 0.56, 0.244, 0.2, "images/news.png", true, background_front)
  guiSetAlpha(news_box3, 0.8)
  news3 = guiCreateLabel(0.025, 0.125, 1, 1, "-", true, news_box3)
  guiSetFont(news3, "default-bold-small")
  news_box3_new = guiCreateStaticImage(0, 0, 0.15, 0.1, "images/new.png", true, news_box3)
  guiSetVisible(news_box3_new, false)
  news_box4 = guiCreateStaticImage(0.73, 0.76, 0.244, 0.19, "images/news.png", true, background_front)
  guiSetAlpha(news_box4, 0.4)
  news4 = guiCreateLabel(0.025, 0.125, 1, 1, "-", true, news_box4)
  guiSetFont(news4, "default-bold-small")
  news_box4_new = guiCreateStaticImage(0, 0, 0.15, 0.1, "images/new.png", true, news_box4)
  guiSetVisible(news_box4_new, false)
  news_box = guiCreateStaticImage(0.726, 0.1, 0.25, 0.85, "images/box_background.png", true, background_front)
  guiCreateStaticImage(0.79, 0.114, 0.028, 0.045, "images/on.png", true, background_front)]]
end
function clickPanelButton(button, state)
  if button == "left" and state == "up" then
    local element = getElementData(getLocalPlayer(), "clickedButton")
    if element then
      local info = getElementData(element, "info")
      if info and info == "login" then
        do
          local username = guiGetText(Login_Edit[1])
          local password = guiGetText(Login_Edit[2])
          if tostring(username) ~= "" and tostring(password) ~= "" then
            triggerServerEvent("onClientSendLoginDataToServer", getLocalPlayer(), username, password)
          else
            reason = "Missing Password or Username!"
            outputChatBox("[Login]#FF9900 " .. reason, 255, 255, 255, true)
          end
        end
      elseif info and info == "guest" then
        showLoginWindow(false)
      elseif info and info == "register" then
        local username = guiGetText(Login_Edit[3])
        local pass1 = guiGetText(Login_Edit[4])
        local pass2 = guiGetText(Login_Edit[5])
        if tostring(username) ~= "" then
          if tostring(pass1) ~= "" then
            if pass1 == pass2 then
              triggerServerEvent("onClientSendRegisterDataToServer", getLocalPlayer(), username, pass1)
            else
              reason = "Passwords not not match!"
              outputChatBox("[Registrar]#FF9900 " .. reason, 255, 255, 255, true)
            end
          else
            reason = "No password was entered!"
            outputChatBox("[Registrar]#FF9900 " .. reason, 255, 255, 255, true)
          end
        else
          reason = "No username was entered!"
          outputChatBox("[Registrar]#FF9900 " .. reason, 255, 255, 255, true)
        end
      end
    end
  end
end
addEventHandler("onClientClick", getRootElement(), clickPanelButton)
function onClientGetNews(text1, text2, text3, text4, bool1, bool2, bool3, bool4)
  local text1 = string.gsub(text1, "<br>", "\n")
  local text2 = string.gsub(text2, "<br>", "\n")
  local text3 = string.gsub(text3, "<br>", "\n")
  local text4 = string.gsub(text4, "<br>", "\n")
  guiSetText(news1, text1)
  guiSetText(news2, text2)
  guiSetText(news3, text3)
  guiSetText(news4, text4)
  if bool1 == "true" then
  else
    -- unhandled boolean indicator
  end
  guiSetVisible(news_box1_new, true)
  if bool2 == "true" then
  else
    -- unhandled boolean indicator
  end
  guiSetVisible(news_box2_new, true)
  if bool3 == "true" then
  else
    -- unhandled boolean indicator
  end
  guiSetVisible(news_box3_new, true)
  if bool4 == "true" then
  else
    -- unhandled boolean indicator
  end
  guiSetVisible(news_box4_new, true)
end
addEvent("onClientGetNews", true)
addEventHandler("onClientGetNews", getRootElement(), onClientGetNews)
addEventHandler("onClientResourceStart", resourceRoot, function()
  build_loginWin()
  guiSetVisible(background_front, false)
  showLoginWindow(true)
  guiSetInputMode("no_binds_when_editing")
  fadeCamera(true)
  setCameraMatrix(200, 1921.0000082813, 24.79999905271, 0, 0, 0)
  triggerServerEvent("requestServerNews", localPlayer)
end)
function hideLoginWindow(accountName, pass)
  showLoginWindow(false)
  toggleSavePassword(accountName, pass)
end
addEvent("onPlayerDoneLogin", true)
addEventHandler("onPlayerDoneLogin", getRootElement(), hideLoginWindow)
function toggleSavePassword(name, pass)
  confFile = xmlLoadFile("@preferencesL.xml")
  xmlNodeSetAttribute(confFile, "username", name)
  xmlNodeSetAttribute(confFile, "pass", pass)
  xmlSaveFile(confFile)
end
function showLoginWindow(bool)
  setElementData(getLocalPlayer(), "clickedButton", false)
  showCursor(bool)
  if bool then
    guiSetPosition(background_front, 0.2, -0.75, true)
    addEventHandler("onClientRender", getRootElement(), rollLoginPanel)
    rollProgress = 1
    rollIn = true
    guiSetInputMode("no_binds_when_editing")
  else
    guiSetPosition(background_front, 0.2, 0.25, true)
    addEventHandler("onClientRender", getRootElement(), rollLoginPanel)
    rollProgress = 0
    rollIn = false
    guiSetInputMode("allow_binds")
  end
  randomDirAnim = math.random() > 0.5 and -1 or 1
  if math.random() > 0.5 then
  else
    -- unhandled boolean indicator
  end
  useXAxis = true
  animType = useXAxis and "InBounce" or "InElastic"
end
function rollLoginPanel()
  local eval
  if rollIn then
    if rollProgress > 0 then
      rollProgress = (rollProgress * 1000 - 15) / 1000
      if rollProgress < 0 then
        rollProgress = 0
      end
      eval = getEasingValue(rollProgress, animType)
    else
      removeEventHandler("onClientRender", getRootElement(), rollLoginPanel)
      return
    end
  elseif rollProgress < 1 then
    rollProgress = (rollProgress * 100 + 3) / 100
    if rollProgress > 1 then
      rollProgress = 1
    end
    eval = getEasingValue(rollProgress, "InQuad")
  else
    removeEventHandler("onClientRender", getRootElement(), rollLoginPanel)
    return
  end
  if useXAxis then
   guiSetPosition(background_front, 0.2, 0.25 + randomDirAnim * eval, true)
	guiSetPosition(staticimage, 0.0, 0.0 + randomDirAnim * eval, true)
  else
    guiSetPosition(background_front, 0.2 + randomDirAnim * eval, 0.25, true)
	--guiSetPosition(staticimage, 0.2 + randomDirAnim * eval, 0.25, true)

  end
  guiSetVisible(background_front, true)
  guiSetVisible(staticimage, true)
end
