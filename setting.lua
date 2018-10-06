

-----------------------------------------------------------------------------------------
--
-- setting
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
print("setting innovated") 
--volumetimer = timer.performWithDelay(100,onTimer,0)

--------------------------------------------------------------------------------
---------------------------------create
--------------------------------------------------------------------------------
function scene:create(event)
	local sceneGroup = self.view

--function---------------------------------------------------------------
--volume
local function volumedown(event)
	if(backgroundMusicVolume>0.1)then
	backgroundMusicVolume = audio.getVolume({channel=musicChannelNum})-0.25
	end
	audio.setVolume(backgroundMusicVolume,{channel=1})
	audio.setVolume(backgroundMusicVolume,{channel=2})
	audio.play(s1,{channel=3})
end
local function volumeup(event)
	if(backgroundMusicVolume<0.9)then
	backgroundMusicVolume = audio.getVolume({channel=musicChannelNum})+0.25
	end
	audio.setVolume(backgroundMusicVolume,{channel=1})
	audio.setVolume(backgroundMusicVolume,{channel=2})
	audio.play(s1,{channel=3})
end
local function soundEffectVolumeDown(event)
	if(soundEffectVolume>0.1)then
	soundEffectVolume = audio.getVolume({channel=3})-0.25
	end
	audio.setVolume(soundEffectVolume,{channel=3})
	audio.setVolume(soundEffectVolume,{channel=4})
	audio.play(s1,{channel=3})
end
local function soundEffectVolumeUp(event)
	if(soundEffectVolume<0.9)then
	soundEffectVolume = audio.getVolume({channel=3})+0.25
	end
	audio.setVolume(soundEffectVolume,{channel=3})
	audio.setVolume(soundEffectVolume,{channel=4})
	audio.play(s1,{channel=3})
end

--volume---------------------------------------------------------------------------
local soundEffectVolumeText = display.newText("音效音量", W*2/7, H*5/13, native.systemFont, 40)
local volumeText            = display.newText("背景音量", W*2/7, H*7/13, native.systemFont, 40)
local soundEffectVolumeValueText = display.newText(audio.getVolume({channel=3})*4, W*5/7, H*5/13, native.systemFont, 40)
local volumeValueText            = display.newText(audio.getVolume({channel=1})*4, W*5/7, H*7/13, native.systemFont, 40)
local volumedownbu = widget.newButton
	{
	x = W*8/14,
	y = H*7/13,
	labelColor = {default = {1,1,1} , over = {0,0,0}},
	label = "-",
	fontSize = "60",
	onRelease = volumedown
	}
	volumedownbu:setFillColor( 1, 1, 1, 0)
	local volumeupbu = widget.newButton
	{
	x = W*12/14,
	y = H*7/13,
	labelColor = {default = {1,1,1} , over = {0,0,0}},
	label = "+",
	fontSize = "60",
	onRelease = volumeup
	}
	volumeupbu:setFillColor( 1, 1, 1, 0)
--change
local changebu = widget.newButton
{
	x = W/2,
	y = H*9/13,
	labelColor = {default = {1,1,1} , over = {0,0,0}},
	label = "切換歌曲",
	fontSize = "40",
	onRelease = function(event)
	if (musicChannelNum==1)then
	musicChannelNum = 2 
	audio.stop(1)
	audio.play(m2,{channel=2,loops=-1})
	elseif (musicChannelNum==2)then
	musicChannelNum = 1
	audio.stop(2)
	audio.play(m1,{channel=1,loops=-1})
	end
	end
}
changebu:setFillColor( 1, 1, 1, 0)
local soundEffectVolumeUpBu = widget.newButton
	{
	x = W*12/14,
	y = H*5/13,
	labelColor = {default = {1,1,1} , over = {0,0,0}},
	label = "+",
	fontSize = "60",
	onRelease = soundEffectVolumeUp
	}
	soundEffectVolumeUpBu:setFillColor( 1, 1, 1, 0)
local soundEffectVolumeDownBu = widget.newButton
	{
	x = W*8/14,
	y = H*5/13,
	labelColor = {default = {1,1,1} , over = {0,0,0}},
	label = "-",
	fontSize = "60",
	onRelease = soundEffectVolumeDown
	}
	soundEffectVolumeDownBu:setFillColor( 1, 1, 1, 0)
	
---------timer-----------
local volumetimer
local function onTimer(event)
volumeValueText.text = audio.getVolume({channel=1})*4 
soundEffectVolumeValueText.text = audio.getVolume({channel=3})*4 
end
volumetimer = timer.performWithDelay(100,onTimer,0)

	sceneGroup:insert(volumeText)
	sceneGroup:insert(volumedownbu)
	sceneGroup:insert(volumeupbu)
	sceneGroup:insert(volumeValueText)
	sceneGroup:insert(changebu)
	sceneGroup:insert(soundEffectVolumeText)
	sceneGroup:insert(soundEffectVolumeUpBu)
	sceneGroup:insert(soundEffectVolumeDownBu)
	sceneGroup:insert(soundEffectVolumeValueText)
----delete--
function deleteComfirm(event)
Mysave = nil
	saveTable(Mysave,"save.json")
	os.exit()
	end

local Delebuton = widget.newButton
{
	x = 4*W/5,
	y = 20*H/26,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "Del_save",
	fontSize = "20",
	onRelease = function(event)
	rectBackground1 = display.newRect(W/2,H/2,W,H)
	rectBackground1:setFillColor(0.1,0.1,0.1,0.95)
	rectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
	rectBackground2:setFillColor(0,0,0)
	deleteBu = widget.newButton
	{
	x = W/2,
	y = H*3/7,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "確定刪除所有紀錄",
	fontSize = "40",
	onRelease = deleteComfirm,
	}
	deleteBu:setFillColor( 1, 1, 1, 0)
	deleteCancelBu = widget.newButton
	{
	x = W/2,
	y = H*4/7,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "取消",
	fontSize = "30",
	onRelease = function(event)
	rectBackground1:removeSelf()
	rectBackground2:removeSelf()
	deleteBu:removeSelf()
	deleteCancelBu:removeSelf()
	end
	}
	deleteCancelBu:setFillColor( 1, 1, 1, 0)
	sceneGroup:insert(rectBackground1)
	sceneGroup:insert(rectBackground2)
	sceneGroup:insert(deleteBu)
	sceneGroup:insert(deleteCancelBu)
	end
}
Delebuton:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(Delebuton)

--statusbar------------------------------------------------------------------------
--home---
local function settingHome(event)
	homebu:setEnabled(true)
	craftbu:setEnabled(true)
	storybu:setEnabled(true)
	composer.gotoScene("home",{effect="fade",time=500})
	screenFlag=2
end
local settingHomeButton = widget.newButton
{
	x = W/2,
	y = 20*H/26,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "返回",
	fontSize = "40",
	onRelease = settingHome,
}
settingHomeButton:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(settingHomeButton)
end

--------------------------------------------------------------------------------
---------------------------------show
--------------------------------------------------------------------------------

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
	elseif phase == "did" then
	

end
end
--------------------------------------------------------------------------------
---------------------------------hide
--------------------------------------------------------------------------------

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
	elseif phase == "did" then
	end	
end
--------------------------------------------------------------------------------
---------------------------------destroy
--------------------------------------------------------------------------------

function scene:destroy( event )
	local sceneGroup = self.view
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------
return scene
