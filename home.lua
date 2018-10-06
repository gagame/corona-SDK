-----------------------------------------------------------------------------------------
--
-- home.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
print("home innovated")

if(musicChannelNum==1)then
audio.play(m1,{channel=1,loops=-1,fadein=2000})
elseif(musicChannelNum==2)then
audio.play(m2,{channel=2,loops=-1,fadein=2000})
end

screenFlag = 2            --10/18 SAI 左右滑介面所需要FLAG STORY=1 HOME=2 CRAFT=3 CHARACTER=4.1,4.2,4.3 SETTING,ELSE=0


--------------------------------------------------------------------------------
---------------------------------create
--------------------------------------------------------------------------------
-----------------------------點集系統的初版-----------------
function scene:create(event)
	local sceneGroup = self.view
	local H_BGI = display.newImage("Home_BGI.png",W/2,H/2)
H_BGI:toBack()
sceneGroup:insert(H_BGI)
local function LoveLove(i)
print("i = ")
print(i)
if( i == 1 and Loveflag1 ~= 1 ) then
Love1 = display.newImage("Love.png",W*1/3,H*2/3)
Loveflag1 = 1

local Fly1 = 1
local function Love1Fly ()
Fly1 = Fly1 + 4
Love1.x = W*1/3 - Fly1 
Love1.y = H*2/3 - 2 * Fly1
Love1.alpha = 1 - (Fly1)/100
end
timer.performWithDelay(50,Love1Fly,35)

sceneGroup:insert(Love1)
print("Enter1")
local function Remove_Love(event)

Love1:removeSelf()
Loveflag1 = 0

end
timer.performWithDelay(2000,Remove_Love,1)

else if( i == 2 and Loveflag2 ~= 1) then
Love2 = display.newImage("Love.png",W*1/3,H*1/3)
Loveflag2 = 1

local Fly2 = 1
local function Love2Fly ()
Fly2 = Fly2 + 4
Love2.x = W*1/3 - Fly2
Love2.y = H*1/3 - 2 * Fly2
Love2.alpha = 1 - (Fly2)/100
end
timer.performWithDelay(50,Love2Fly,35)

sceneGroup:insert(Love2)
print("Enter2")
local function Remove_Love(event)

Love2:removeSelf()
Loveflag2 = 0

end
timer.performWithDelay(2000,Remove_Love,1)

else if( i == 3 and Loveflag3 ~= 1) then
Love3 = display.newImage("Love.png",W*2/3,H*1/3)
Loveflag3 = 1

local Fly3 = 1
local function Love3Fly ()
Fly3 = Fly3 + 4
Love3.x = W*2/3 + Fly3 
Love3.y = H*1/3 - 2 * Fly3
Love3.alpha = 1 - (Fly3)/100
end
timer.performWithDelay(50,Love3Fly,35)

sceneGroup:insert(Love3)
print("Enter3")
local function Remove_Love(event)

Love3:removeSelf()
Loveflag3 = 0

end
timer.performWithDelay(2000,Remove_Love,1)

else if( i == 4 and Loveflag4 ~= 1) then
Love4 = display.newImage("Love.png",W*2/3,H*2/3)
Loveflag4 = 1

local Fly4 = 1
local function Love4Fly ()
Fly4 = Fly4 + 4
Love4.x = W*2/3 + Fly4
Love4.y = H*2/3 - 2 * Fly4
Love4.alpha = 1 - (Fly4)/100
end
timer.performWithDelay(50,Love4Fly,35)

sceneGroup:insert(Love4)
print("Enter4")
local function Remove_Love(event)

Love4:removeSelf()
Loveflag4 = 0

end
timer.performWithDelay(2000,Remove_Love,1)

end
end
end
end



end







local function touchScreen(event)              -------------10/18 SAI 總之滑來滑去 判定會滑去哪裡
if(storyProgress>=10)then------------------------在合成第一隻角色前失效
	if  event.phase == "ended"  then   
		if (event.x - event.xStart) >= 30  then
			print("RIGHT")
			if(screenFlag==3)then
				composer.gotoScene("home",{effect="slideRight",time=500})
				screenFlag=2
			elseif(screenFlag==2)then
				composer.gotoScene("story",{effect="slideRight",time=500})
				screenFlag=1
			elseif(screenFlag==4.2)then
				composer.gotoScene("character",{effect="slideRight",time=500})
				screenFlag=4.1
			elseif(screenFlag==4.3)then
				composer.gotoScene("character-2",{effect="slideRight",time=500})
				screenFlag=4.2
			end
		elseif (event.xStart - event.x) >= 30  then
			print("LEFT")
			if(screenFlag==1)then
				composer.gotoScene("home",{effect="slideLeft",time=500})
				screenFlag=2
			elseif(screenFlag==2)then
				composer.gotoScene("craft",{effect="slideLeft",time=500})
				screenFlag=3
			elseif(screenFlag==4.1)then
				composer.gotoScene("character-2",{effect="slideLeft",time=500})
				screenFlag=4.2
			elseif(screenFlag==4.2)then
				composer.gotoScene("character-3",{effect="slideLeft",time=500})
				screenFlag=4.3
			end
		end
		if (event.y - event.yStart) >= 30  then
			print("DOWN")
		elseif (event.yStart - event.y) >= 30  then
			print("UP")
		end
	end
end
end
Runtime:addEventListener("touch", touchScreen)----------------------------10/18  SAI 到這裡得斯

--background--------------------------------------------------------------------

--shop--                                        --11/19 sai
local function shop(event)
	composer.gotoScene("Shop",{effect="fade",time=500})
	screenFlag=0
end
shopbu = widget.newButton
{
	x = 2*W/14,
	y = H/26,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "商店",
	fontSize = "40",
	onRelease = shop,
}
shopbu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(shopbu)   

--setting--
local function setting(event)
	composer.gotoScene("setting",{effect="fade",time=500})
	screenFlag=0
	homebu:setEnabled(false)
	craftbu:setEnabled(false)
	storybu:setEnabled(false)
end
settingbu = widget.newButton
{
	x = 13*W/14,
	y = H/26,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "設定",
	fontSize = "40",
	onRelease = setting,
}
settingbu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(settingbu)

--character--
local function character1ButtonFunction(event)                     ------------SAI 背包頁面  第1頁  10/28
	composer.gotoScene("character",{effect="slideRight",time=500})
	screenFlag=4.1
end
local function character2ButtonFunction(event)                     ------------第2頁
	if(screenFlag==4.1)then
		composer.gotoScene("character-2",{effect="slideLeft",time=500})
	elseif(screenFlag==4.3)then
		composer.gotoScene("character-2",{effect="slideRight",time=500})
	end
	screenFlag=4.2
end 
local function character3ButtonFunction(event)                     ------------第3頁
	composer.gotoScene("character-3",{effect="slideLeft",time=500})
	screenFlag=4.3
end
local function character(event)
	composer.gotoScene("character",{effect="fade",time=500})
	screenFlag=4.1
	homebu:setEnabled(false)
	craftbu:setEnabled(false)
	storybu:setEnabled(false)
	character1Button = widget.newButton--第1頁按鈕
	{
		x = W*1/7,
		y = H/26,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = "1",
		fontSize = "40",
		onRelease = character1ButtonFunction,
	}
	character1Button:setFillColor( 1, 1, 1, 0)
	character2Button = widget.newButton--第2頁按鈕
	{
		x = W*2/7,
		y = H/26,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = "2",
		fontSize = "40",
		onRelease = character2ButtonFunction,
	}
	character2Button:setFillColor( 1, 1, 1, 0)
	character3Button = widget.newButton--第3頁按鈕
	{
		x = W*3/7,
		y = H/26,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = "3",
		fontSize = "40",
		onRelease = character3ButtonFunction,
	}
	character3Button:setFillColor( 1, 1, 1, 0)
	characterHomeButton = widget.newButton
	{
		x = W/2,
		y = 22*H/25,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = "返回",
		fontSize = "40",
		onRelease = characterHome,
	}
	characterHomeButton:setFillColor( 1, 1, 1, 0)
end
characterbu = widget.newButton
{
	x = W*5/7,
	y = H/26,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "角色",
	fontSize = "40",
	onRelease = character,
}
characterbu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(characterbu)
--statusbar------------------------------------------------------------------------
--home---
function home(event)
	if(screenFlag==1)then
	composer.gotoScene("home",{effect="slideLeft",time=500})
	elseif(screenFlag==3)then
	composer.gotoScene("home",{effect="slideRight",time=500})
	end
	screenFlag=2
end
homebu = widget.newButton
{
	x = W/2,
	y = 24*H/25,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = " ",
	fontSize = "400",
	onRelease = home,
}
homebu:setFillColor( 1, 1, 1, 0)
--craft--
function craft(event)
	composer.gotoScene("craft",{effect="slideLeft",time=500})
	screenFlag=3
end
craftbu = widget.newButton
{
	x = W*12/14,
	y = 24*H/25,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = " ",
	fontSize = "400",
	onRelease = craft,
}
craftbu:setFillColor( 1, 1, 1, 0)
--story--
function story(event)
	composer.gotoScene("story",{effect="slideRight",time=500})
	screenFlag=1
end
storybu = widget.newButton
{
	x = W*2/14,
	y = 24*H/25,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = " ",
	fontSize = "400",
	onRelease = story,
}
storybu:setFillColor( 1, 1, 1, 0)
----------------- display----------------------------------------------------------------
local AText = display.newText( a, 3.7*W/16, 7.5*H/26, "DEBONAIR", 70 )
AText:setFillColor( 1, 1, 1 )
local atext = display.newText("傲嬌" ,3.7*W/16,6.2*H/26,"LANENAR",28)
atext:setFillColor( 1, 1, 1 )

local BText = display.newText( b, 5.45*W/7, 7.5*H/26, "DEBONAIR", 70 )
BText:setFillColor( 1, 1, 1 )
local btext = display.newText("腹黑" ,5.45*W/7,6.2*H/26,"LANENAR",28)
btext:setFillColor( 1, 1, 1 )

local CText = display.newText( c, 3.7*W/16, 16.3*H/26, "DEBONAIR", 70 )
CText:setFillColor( 1, 1, 1 )
local ctext = display.newText("天然" ,3.7*W/16,15*H/26,"LANENAR",28)
ctext:setFillColor( 1, 1, 1 )

local DText = display.newText( d, 5.45*W/7, 16.3*H/26, "DEBONAIR", 70 )
DText:setFillColor( 1, 1, 1 )
local dtext = display.newText("治癒" ,5.45*W/7,15*H/26,"LANENAR", 28 )
dtext:setFillColor( 1, 1, 1 )
-----------------------10/30 soul system by melon-----------------------------
local SText = display.newText(soul, 51*W/100 , 17*H/100 , "DEBONAIR", 70)
SText:setFillColor( 0, 0, 0 )

Kanban = display.newImage("Kanban1.png",W/2,H*12/26)



sceneGroup:insert(SText)
sceneGroup:insert(AText)
sceneGroup:insert(atext)
sceneGroup:insert(BText)
sceneGroup:insert(btext)
sceneGroup:insert(CText)
sceneGroup:insert(ctext)
sceneGroup:insert(DText)
sceneGroup:insert(dtext)
sceneGroup:insert(Kanban)

-- click button----------------------------------------------------------------
function clickbutton(event)
	if ( event.phase == "began") then
	Kanban:removeSelf()
	Kanban = display.newImage("Kanban2.png",W/2,H*12/26)
	audio.rewind({channel=3})
	audio.play(s1,{channel=3})
	soul = soul + SPC
	--Time_Stop()--
	LoveLove(math.random(4))
	

	
    elseif(event.phase=="ended" or event.phase=="moved")then
	Kanban:removeSelf()
	Kanban = display.newImage("Kanban1.png",W/2,H*12/26)
	sceneGroup:insert(Kanban)
	end
	
end


-- timer-------------------------------------------------------------------
Maxlim = 100
if(home_flag < 1) then
local function onTimer(event)
if(a < Maxlim) then
	if(a + aIPS > Maxlim)then
	a = Maxlim 
	else
a = a + aIPS 
	end
end
if(b < Maxlim) then
	if(b + bIPS > Maxlim)then
	b = Maxlim 

	else
b = b + bIPS
	end
end
if(c < Maxlim) then
	if(c + cIPS > Maxlim)then
	c = Maxlim 
	else
c = c + cIPS
	end
end
if(d < Maxlim) then
	if(d + dIPS > Maxlim)then
	d = Maxlim 
	else
d = d + dIPS
	end
end
end
timer.performWithDelay(60000,onTimer,0)
end
------可做更改，目前方便但耗能------
local function Refresh(event)
AText.text = math.floor(a)
BText.text = math.floor(b)
CText.text = math.floor(c)
DText.text = math.floor(d)
SText.text = math.floor(soul)
end
timer.performWithDelay(100,Refresh,0) 

------------------------------------------------------------------------------
clickbuton = widget.newButton
{
	x = W/2,
	y = H*12/26,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = " ",
	fontSize = "360",
	onEvent = clickbutton,
}
sceneGroup:insert(clickbuton)
clickbuton:setFillColor( 1, 1, 1, 0)
end

----------------------------------------------------------------------------------
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
	
	if event.phase == "will" then
	elseif phase == "did" then
	home_flag = home_flag + 1 
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