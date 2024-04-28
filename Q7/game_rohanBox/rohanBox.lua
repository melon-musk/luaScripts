function online()
  if g_game.getFeature(GameSpellList) then
    rohanBoxWindow:show()
  else
    rohanBoxWindow:hide()
  end

end

function offline()

end

function toggle()
	print("Calling toggle")
  if rohanBoxButton:isOn() then
    rohanBoxButton:setOn(false)
	print("hidding")
    rohanBoxWindow:hide()
  else
    rohanBoxButton:setOn(true)
    rohanBoxWindow:show()
    rohanBoxWindow:raise()
	print("showing")
    rohanBoxWindow:focus()
  end
end

function moveButton()
    local pos = movingButton.getPoint('window-pos')
	movingButton.move(10,20)
end

function init()
  connect(g_game, { onGameStart = online,
                    onGameEnd   = offline })

  rohanBoxWindow = g_ui.displayUI('rohanBox', modules.game_interface.getRightPanel())
  rohanBoxWindow:hide()

  rohanBoxButton = modules.client_topmenu.addRightGameToggleButton('rohanBoxButton', tr('rohanBoxButton'), '/images/topbuttons/viplist', toggle)
  rohanBoxButton:setOn(false)
  
  movingButton = rohanBoxWindow:getChildById('jumpButton')


end

function terminate()
  disconnect(g_game, { onGameStart = online,
                       onGameEnd   = offline })

  rohanBoxWindow:destroy()
  rohanBoxWindow:destroy()
end

