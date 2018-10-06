-----------------------------------------------------------------------------------------
--
-- character
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
print("character innovated")
--------------------------------------------------------------------------------
---------------------------------create
--------------------------------------------------------------------------------
function scene:create(event)
	local sceneGroup = self.view

-----------zoomInOut---------
----------------------------
local remuflag = 0
local starflag = 0 
local fishflag = 0
local minflag  = 0
local imageflag = 0
local RIFlag = 0
local SIFlag = 0
local FIFlag = 0
local MIFlag = 0
---------------------------
local function clickRemZoomout(event)
if(remuflag == 1) then
remuflag = 0
imageflag = 0
remuText:removeSelf()
cancel:removeSelf()
rectBackground1:removeSelf()
rectBackground2:removeSelf()
bigRemImage:removeSelf()
end
end
local function clickRemZoomin(event)
characterNum = 1
if(getlevel(Mysave.character,characterNum)> 0 ) then
if(imageflag == 0) then
imageflag = 1
remuflag = 1
rectBackground1 = display.newRect(W/2,H/2,W,H)
rectBackground1:setFillColor(0.1,0.1,0.1,0.95)
rectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
rectBackground2:setFillColor(0,0,0)
if(RemLevel == 1) then
bigRemImage = display.newImage("Rem1.png",W/2,H/2)
elseif(RemLevel == 2) then
bigRemImage = display.newImage("Rem2.png",W/2,H/2)
elseif(RemLevel == 3) then
bigRemImage = display.newImage("Rem3.png",W/2,H/2)
elseif(RemLevel == 4) then
bigRemImage = display.newImage("Rem4.png",W/2,H/2)
elseif(RemLevel == 5) then
bigRemImage = display.newImage("Rem5.png",W/2,H/2)
end
bigRemImage:scale(2,2)
remuText = display.newText("                      レム\n可愛到似乎可以生出療癒點數",W/2,H*10/13,native.systemFont,40)
sceneGroup:insert(rectBackground1)
sceneGroup:insert(rectBackground2)
sceneGroup:insert(remuText)
sceneGroup:insert(bigRemImage)
cancel = widget.newButton
{
	x = W/2,
	y = H/2,
	labelColor = { default = {0,0,0} , over = {1,1,1}},
	label = " ",
	fontSize = "5000",
	onRelease = clickRemZoomout
}
cancel:setFillColor( 1, 1, 1, 0)
end
end
end

local function clickStarZoomout(event)
if(starflag == 1) then
starflag = 0
imageflag = 0
starText:removeSelf()
cancel:removeSelf()
rectBackground1:removeSelf()
rectBackground2:removeSelf()
bigStarImage:removeSelf()
end
end
local function clickStarZoomin(event)
characterNum = 2
if(getlevel(Mysave.character,characterNum)> 0 ) then
if(imageflag == 0) then
imageflag = 1
starflag = 1
rectBackground1 = display.newRect(W/2,H/2,W,H)
rectBackground1:setFillColor(0.1,0.1,0.1,0.95)
rectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
rectBackground2:setFillColor(0,0,0)
if(StarLevel == 1) then
bigStarImage = display.newImage("Star1.png",W/2,H/2)
elseif(StarLevel == 2) then
bigStarImage = display.newImage("Star2.png",W/2,H/2)
elseif(StarLevel == 3) then
bigStarImage = display.newImage("Star3.png",W/2,H/2)
elseif(StarLevel == 4) then
bigStarImage = display.newImage("Star4.png",W/2,H/2)
elseif(StarLevel == 5) then
bigStarImage = display.newImage("Star5.png",W/2,H/2)
end
bigStarImage:scale(2,2)
starText = display.newText("                      スタ\n臉尖到似乎可以生出傲嬌點數",W/2,H*10/13,native.systemFont,40)
sceneGroup:insert(rectBackground1)
sceneGroup:insert(rectBackground2)
sceneGroup:insert(starText)
sceneGroup:insert(bigStarImage)
cancel = widget.newButton
{
	x = W/2,
	y = H/2,
	labelColor = { default = {0,0,0} , over = {1,1,1}},
	label = " ",
	fontSize = "5000",
	onRelease = clickStarZoomout
}
cancel:setFillColor( 1, 1, 1, 0)
end
end
end

local function clickMinZoomout(event)
if(minflag == 1) then
minflag = 0
imageflag = 0
minText:removeSelf()
cancel:removeSelf()
rectBackground1:removeSelf()
rectBackground2:removeSelf()
bigMinImage:removeSelf()
end
end
local function clickMinZoomin(event)
characterNum = 3
if(getlevel(Mysave.character,characterNum)> 0 ) then
if(imageflag == 0) then
imageflag = 1
minflag = 1
rectBackground1 = display.newRect(W/2,H/2,W,H)
rectBackground1:setFillColor(0.1,0.1,0.1,0.95)
rectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
rectBackground2:setFillColor(0,0,0)
if(MinLevel == 1) then
bigMinImage = display.newImage("min1.png",W/2,H/2)
elseif(MinLevel == 2) then
bigMinImage = display.newImage("min2.png",W/2,H/2)
elseif(MinLevel == 3) then
bigMinImage = display.newImage("min3.png",W/2,H/2)
elseif(MinLevel == 4) then
bigMinImage = display.newImage("min4.png",W/2,H/2)
elseif(MinLevel == 5) then
bigMinImage = display.newImage("min5.png",W/2,H/2)
end
bigMinImage:scale(2,2)
minText = display.newText("                      阿明\n頭髮中分到可以使用究極黑魔法",W/2,H*10/13,native.systemFont,40)
sceneGroup:insert(rectBackground1)
sceneGroup:insert(rectBackground2)
sceneGroup:insert(minText)
sceneGroup:insert(bigMinImage)
cancel = widget.newButton
{
	x = W/2,
	y = H/2,
	labelColor = { default = {0,0,0} , over = {1,1,1}},
	label = " ",
	fontSize = "5000",
	onRelease = clickMinZoomout
}
cancel:setFillColor( 1, 1, 1, 0)
end
end
end

local function clickFishZoomout(event)
if(fishflag == 1) then
fishflag = 0
imageflag = 0
fishText:removeSelf()
cancel:removeSelf()
rectBackground1:removeSelf()
rectBackground2:removeSelf()
bigFishImage:removeSelf()
end
end
local function clickFishZoomin(event)
characterNum = 4
if(getlevel(Mysave.character,characterNum)> 0 ) then
if(imageflag == 0) then
imageflag = 1
fishflag = 1
rectBackground1 = display.newRect(W/2,H/2,W,H)
rectBackground1:setFillColor(0.1,0.1,0.1,0.95)
rectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
rectBackground2:setFillColor(0,0,0)
if(FishLevel == 1) then
bigFishImage = display.newImage("fish1.png",W/2,H/2)
elseif(FishLevel == 2) then
bigFishImage = display.newImage("fish2.png",W/2,H/2)
elseif(FishLevel == 3) then
bigFishImage = display.newImage("fish3.png",W/2,H/2)
elseif(FishLevel == 4) then
bigFishImage = display.newImage("fish4.png",W/2,H/2)
elseif(FishLevel == 5) then
bigFishImage = display.newImage("fish5.png",W/2,H/2)
end
bigFishImage:scale(2,2)
fishText = display.newText("                      Fish\n打水打到你滿臉是水 很天然的樣子",W/2,H*10/13,native.systemFont,40)
sceneGroup:insert(rectBackground1)
sceneGroup:insert(rectBackground2)
sceneGroup:insert(fishText)
sceneGroup:insert(bigFishImage)
cancel = widget.newButton
{
	x = W/2,
	y = H/2,
	labelColor = { default = {0,0,0} , over = {1,1,1}},
	label = " ",
	fontSize = "5000",
	onRelease = clickFishZoomout
}
cancel:setFillColor( 1, 1, 1, 0)
end
end
end




local function CharacterImageFunction(event)

if(imageflag == 1 ) then
else
if(RemLevel == 0) then
if(RIFlag~=0)then
remuImage:removeSelf()
end
RIFlag=1
remuImage = display.newImage("3.jpg",W*2/7,H*2/13)
sceneGroup:insert(remuImage)
elseif(RemLevel == 1) then
if(RIFlag~=0)then
remuImage:removeSelf()
end
RIFlag=1
remuImage = display.newImage("Rem1.png",W*2/7,H*2/13)
sceneGroup:insert(remuImage)
elseif(RemLevel == 2) then
if(RIFlag~=0)then
remuImage:removeSelf()
end
RIFlag=1
remuImage = display.newImage("Rem2.png",W*2/7,H*2/13)
sceneGroup:insert(remuImage)
elseif(RemLevel == 3) then
if(RIFlag~=0)then
remuImage:removeSelf()
end
RIFlag=1
remuImage = display.newImage("Rem3.png",W*2/7,H*2/13)
sceneGroup:insert(remuImage)
elseif(RemLevel == 4) then
if(RIFlag~=0)then
remuImage:removeSelf()
end
RIFlag=1
remuImage = display.newImage("Rem4.png",W*2/7,H*2/13)
sceneGroup:insert(remuImage)
elseif(RemLevel == 5) then
if(RIFlag~=0)then
remuImage:removeSelf()
end
RIFlag=1
remuImage = display.newImage("Rem5.png",W*2/7,H*2/13)
sceneGroup:insert(remuImage)
end
end

if(imageflag == 1 ) then
else
if(StarLevel == 0) then
if(SIFlag~=0)then
starImage:removeSelf()
end
SIFlag=1
starImage = display.newImage("3.jpg",W*5/7,H*2/13)
sceneGroup:insert(starImage)
elseif(StarLevel == 1) then
if(SIFlag~=0)then
starImage:removeSelf()
end
SIFlag=1
starImage = display.newImage("Star1.png",W*5/7,H*2/13)
sceneGroup:insert(starImage)
elseif(StarLevel == 2) then
if(SIFlag~=0)then
starImage:removeSelf()
end
SIFlag=1
starImage = display.newImage("Star2.png",W*5/7,H*2/13)
sceneGroup:insert(starImage)
elseif(StarLevel == 3) then
if(SIFlag~=0)then
starImage:removeSelf()
end
SIFlag=1
starImage = display.newImage("Star3.png",W*5/7,H*2/13)
sceneGroup:insert(starImage)
elseif(StarLevel == 4) then
if(SIFlag~=0)then
starImage:removeSelf()
end
SIFlag=1
starImage = display.newImage("Star4.png",W*5/7,H*2/13)
sceneGroup:insert(starImage)
elseif(StarLevel == 5) then
if(SIFlag~=0)then
starImage:removeSelf()
end
SIFlag=1
starImage = display.newImage("Star5.png",W*5/7,H*2/13)
sceneGroup:insert(starImage)
end
end

if(imageflag == 1 ) then
else
if(MinLevel == 0) then
if(MIFlag~=0)then
minImage:removeSelf()
end
MIFlag=1
minImage = display.newImage("3.jpg",W*2/7,H*5/13)
sceneGroup:insert(minImage)
elseif(MinLevel == 1) then
if(MIFlag~=0)then
minImage:removeSelf()
end
MIFlag=1
minImage = display.newImage("min1.png",W*2/7,H*5/13)
sceneGroup:insert(minImage)
elseif(MinLevel == 2) then
if(MIFlag~=0)then
minImage:removeSelf()
end
MIFlag=1
minImage = display.newImage("min2.png",W*2/7,H*5/13)
sceneGroup:insert(minImage)
elseif(MinLevel == 3) then
if(MIFlag~=0)then
minImage:removeSelf()
end
MIFlag=1
minImage = display.newImage("min3.png",W*2/7,H*5/13)
sceneGroup:insert(minImage)
elseif(MinLevel == 4) then
if(MIFlag~=0)then
minImage:removeSelf()
end
MIFlag=1
minImage = display.newImage("min4.png",W*2/7,H*5/13)
sceneGroup:insert(minImage)
elseif(MinLevel == 5) then
if(MIFlag~=0)then
minImage:removeSelf()
end
MIFlag=1
minImage = display.newImage("min5.png",W*2/7,H*5/13)
sceneGroup:insert(minImage)
end
end


if(imageflag == 1 ) then
else
if(FishLevel == 0) then
if(FIFlag~=0)then
fishImage:removeSelf()
end
FIFlag=1
fishImage = display.newImage("3.jpg",W*5/7,H*5/13)
sceneGroup:insert(fishImage)
elseif(FishLevel == 1) then
if(FIFlag~=0)then
fishImage:removeSelf()
end
FIFlag=1
fishImage = display.newImage("fish1.png",W*5/7,H*5/13)
sceneGroup:insert(fishImage)
elseif(FishLevel == 2) then
if(FIFlag~=0)then
fishImage:removeSelf()
end
FIFlag=1
fishImage = display.newImage("fish2.png",W*5/7,H*5/13)
sceneGroup:insert(fishImage)
elseif(FishLevel == 3) then
if(FIFlag~=0)then
fishImage:removeSelf()
end
FIFlag=1
fishImage = display.newImage("fish3.png",W*5/7,H*5/13)
sceneGroup:insert(fishImage)
elseif(FishLevel == 4) then
if(FIFlag~=0)then
fishImage:removeSelf()
end
FIFlag=1
fishImage = display.newImage("fish4.png",W*5/7,H*5/13)
sceneGroup:insert(fishImage)
elseif(FishLevel == 5) then
if(FIFlag~=0)then
fishImage:removeSelf()
end
FIFlag=1
fishImage = display.newImage("fish5.png",W*5/7,H*5/13)
sceneGroup:insert(fishImage)
end
end
end
timer.performWithDelay(300,CharacterImageFunction,0)


--information--
local informationRamBu = widget.newButton
{
	x = W*2/7,
	y = H*2/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = " ",
	fontSize = "400",
	onRelease = clickRemZoomin
}
informationRamBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(informationRamBu)
local informationStarBu = widget.newButton
{
	x = W*5/7,
	y = H*2/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = " ",
	fontSize = "400",
	onRelease = clickStarZoomin
}
informationStarBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(informationStarBu)
local informationFishBu = widget.newButton
{
	x = W*5/7,
	y = H*5/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = " ",
	fontSize = "400",
	onRelease = clickFishZoomin
}
informationFishBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(informationFishBu)
local informationMinBu = widget.newButton
{
	x = W*2/7,
	y = H*5/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = " ",
	fontSize = "400",
	onRelease = clickMinZoomin
}
informationMinBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(informationMinBu)
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
