-----------------------------------------------------------------------------------------
--
-- story
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
print("story innovated")
local storyTextflag = 0
local chapterZeroBuflag = 0
local storyflag = 0
--------------------------------------------------------------------------------
---------------------------------create
--------------------------------------------------------------------------------
function scene:create(event)
	local sceneGroup = self.view

function chapterZeroFunction(event)
	chapterZeroBu:removeSelf()
	VeryBigButton:removeSelf()
	timeStopRect:removeSelf()
	storyProgress = 1--新手訓練範圍在0~10
	temp = 0--跑劇情用
	audio.play(s1,{channel=3})
	storyRectBackground = display.newRect(W/2,H*12/13,W,H*2/13)
	storyRectBackground:setFillColor(0.1,0.1,0.1,0.85)
	chapterZeroImage = display.newImage("Kanban1.png",W*6/7,H*11/13)
	chapterZeroImage:scale(0.8,0.8)
	chapterZeroImage:setFillColor(0.5,0.5,0.5,0.85)
	chapterZeroText = display.newText
	{
    text = "看板娘：\n「看到這周圍這四個位子了嗎？這代表著四大類型的魂之碎片。」",     
    x = W*3.5/7,
    y = H*12/13,
    width = W*6/7,
	height = H*2/13,
    font = native.systemFont,
    fontSize = 40,
    align = "left"  -- Alignment parameter
	}
	chapterZeroFunctionBu = widget.newButton
	{
		x = W/2,
		y = H/2,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = " ",
		fontSize = "5000",
		onRelease = function(event)
			temp = temp+1
			if(temp==1)then
				chapterZeroText.text = "看板娘：\n「分別是『傲嬌』、『腹黑』、『療育』、『天然』。」"
			elseif(temp==2)then
				chapterZeroText.text = "看板娘：\n「我們要不斷地收集這些碎片，並且累積它們。」"
			elseif(temp==3)then
				chapterZeroText.text = "看板娘：\n「方法是點擊畫面中央的人物時，就能開始收集。」"
			elseif(temp==4)then
				chapterZeroText.text = "點擊畫面中央的人物。\n並收集45魂"
				chapterZeroFunctionBu:removeSelf()
			end
		end
	}
	chapterZeroFunctionBu:setFillColor( 1, 1, 1, 0)
	composer.gotoScene("home",{effect="slideLeft",time=500})---- 轉到home之後再來講解劇情  內容設全域 寫在story裡面
end	

function storyTimerFunction	(event)
if(storyProgress==0)then-- 一開始功能什麼都沒有只能點序章       注:可以加點提醒
	if(chapterZeroBuflag==1)then
		chapterZeroBu:removeSelf()
		VeryBigButton:removeSelf()
		timeStopRect:removeSelf()
		chapterZeroBuflag=0
	end
	if(chapterZeroBuflag==0)then
		Time_Stop()--除了序章按鈕 其他鎖住
		timeStopRect:setFillColor(0.1,0.1,0.1,0)
		chapterZeroBu = widget.newButton
		{
		x = W*1/7,
		y = H*2/13,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = "序章",
		fontSize = "40",
		onPress = chapterZeroFunction
		}
		chapterZeroBu:setFillColor( 1, 1, 1, 0)
		chapterZeroBuflag=1
	end
elseif(storyProgress==1)then
	if(soul>=45)then  ---  第一階段45魂之後
		storyProgress=2--- 到合成    劇情內容一樣設全域 寫在story
		composer.gotoScene("craft",{effect="slideLeft",time=500})
		chapterZeroText.text = "看板娘：\n「累積到一定量的時候，便要做下一步的『合成』了。」"
		chapter1Button = widget.newButton
		{
		x = W*3.5/7,
		y = H*6.5/13,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = " ",
		fontSize = "2500",
		onPress = function(event) 
			storyProgress=storyProgress+1
		end
		}
		chapter1Button:setFillColor( 1, 1, 1, 0)
	end
elseif(storyProgress==3)then
	chapterZeroText.text = "看板娘：\n「選取各要加入的四種屬性的量，按下合成。」"
elseif(storyProgress==4)then
	chapterZeroText.text = "看板娘：\n「並等待時間，就能夠看到全新的靈魂角色了！」"
elseif(storyProgress==5)then
	chapterZeroText.text = "選取各要加入的四種屬性的量，按下合成。"
elseif(storyProgress==6)then
	chapter1Button:removeSelf()
	storyProgress=7
elseif(storyProgress==10)then
	shopbu:setEnabled(true)
	settingbu:setEnabled(true)
	characterbu:setEnabled(true)
	homebu:setEnabled(true)
	craftbu:setEnabled(true)
	storybu:setEnabled(true)
	chapterZeroText:removeSelf()
	storyRectBackground:removeSelf()
	chapterZeroImage:removeSelf()
	storyProgress=11
end
end
--timer
storyTimer = timer.performWithDelay(100,storyTimerFunction,0) 

storyTitleText = display.newText("Chapter",W*3/7,H*1/13,native.systemFont,50)
sceneGroup:insert(storyTitleText)

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
