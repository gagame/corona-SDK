-----------------------------------------------------------------------------------------
--
-- craft
--
-----------------------------------------------------------------------------------------
-----Bug紀錄 10/30 離線合成時介面異常-----------------

local composer = require( "composer" )
local scene = composer.newScene()
print("craft innovated")
--------------------------------------------------------------------------------
---------------------------------create
--------------------------------------------------------------------------------
function scene:create(event)
	local sceneGroup = self.view

---------------------------------------------------------
local aCost,bCost,cCost,dCost,magicFlag = 0,0,0,0,0
local AMflag,APflag,BMflag,BPflag,CMflag,CPflag,DMflag,DPflag = 0,0,0,0,0,0,0,0,0,0,0,0
Soulcost=1
---------------------------------------------------------

------------先宣告合成-----------------------------------
Craft = function(Type)
    confirmFlag = 0
	if (Type == 2)then
	rectBackground1 = display.newRect(W/2,H/2,W,H)
	rectBackground1:setFillColor(0.1,0.1,0.1,0.95)
	rectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
	rectBackground2:setFillColor(0,0,0)
	getNothingText = display.newText("殘念蘿莉召喚失敗",W/2,H/2,native.systemFont,40)
	sceneGroup:insert(rectBackground1)
	sceneGroup:insert(rectBackground2)
	sceneGroup:insert(getNothingText)
	getNothingBu = widget.newButton
	{
		x = W/2,
		y = H/2,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = " ",
		fontSize = "2500",
		onRelease = function(event)
		getNothingText:removeSelf()
		getNothingBu:removeSelf()
		rectBackground1:removeSelf()
		rectBackground2:removeSelf()
		end
	}
	getNothingBu:setFillColor( 1, 1, 1, 0)
	sceneGroup:insert(getNothingBu)
	
	else if (Type == 1)then
	
	characterNum = math.random(4)
	if(storyProgress<10)then-----------------------2/10 SAI 第一次合成接續 阿要幹嘛就交給你了ww
		characterNum=1
		storyProgress=10
	end-------------------------------------------搞定之後要 storyProgress=10
	if(characterNum == 1) then
---------------Rem------------------------------------------------------------------	
	levelup(Mysave.character,characterNum)
	RemLevel = getlevel(Mysave.character,characterNum)
	
	---cIPS = RemLevel * 0.5--- 10/30 IPS的算法重寫(代表制)----------
	
	rectBackground1 = display.newRect(W/2,H/2,W,H)
	rectBackground1:setFillColor(0.1,0.1,0.1,0.95)
	rectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
	rectBackground2:setFillColor(0,0,0)
	if(RemLevel == 1)then
	getRemText = display.newText("成功召喚雷姆>W<",W/2,H*10/13,native.systemFont,40)
	getRemImage = display.newImage("Rem1.png",W/2,H/2)
	elseif (RemLevel == 2)then
	getRemText = display.newText("雷姆變大拉",W/2,H*10/13,native.systemFont,40)
	getRemImage = display.newImage("Rem2.png",W/2,H/2)
	elseif (RemLevel == 3)then
	getRemText = display.newText("喔喔喔喔雷姆喔喔喔",W/2,H*10/13,native.systemFont,40)
	getRemImage = display.newImage("Rem3.png",W/2,H/2)
	elseif (RemLevel == 4)then
	getRemText = display.newText("雷姆雷姆雷姆",W/2,H*10/13,native.systemFont,40)
	getRemImage = display.newImage("Rem4.png",W/2,H/2)
	elseif (RemLevel == 5)then
	getRemText = display.newText("青眼究極雷姆",W/2,H*10/13,native.systemFont,40)
	getRemImage = display.newImage("Rem5.png",W/2,H/2)
	if(RLFlag~=6)then
	RLFlag=5
	timer.performWithDelay(1000,RemLiberateFunction,1)
	end
	end
	getText = display.newText("得到",W/2,H*9/26,native.systemFontBold,40)
	sceneGroup:insert(rectBackground1)
	sceneGroup:insert(rectBackground2)
	sceneGroup:insert(getText)
	sceneGroup:insert(getRemText)
	sceneGroup:insert(getRemImage)
	getRemBu = widget.newButton
	{
		x = W/2,
		y = H/2,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = " ",
		fontSize = "2500",
		onRelease = function(event)
		if(storyProgress==0)then            --中秋太無聊之跟新 9/17   第一次得到角色會進入任務界面
			composer.gotoScene("story",{effect="slideRight",time=700})
			screenFlag=1
			storyProgress=1
		end
		getRemText:removeSelf()
		getRemBu:removeSelf()
		getRemImage:removeSelf()
		rectBackground1:removeSelf()
		rectBackground2:removeSelf()
		getText:removeSelf()
		end
	}
	getRemBu:setFillColor( 1, 1, 1, 0)
	sceneGroup:insert(getRemBu)

-----------------Star--------------------------------------------------------------------------------		
	else if (characterNum == 2)then
	
	levelup(Mysave.character,characterNum)
	StarLevel = getlevel(Mysave.character,characterNum)

	--aIPS = StarLevel * 0.5 --- 10/30 IPS的算法重寫(代表制)----------
	
	rectBackground1 = display.newRect(W/2,H/2,W,H)
	rectBackground1:setFillColor(0.1,0.1,0.1,0.95)
	rectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
	rectBackground2:setFillColor(0,0,0)
	if(StarLevel ==1)then
	getStarText = display.newText("阿有變態",W/2,H*10/13,native.systemFont,40)
	getStarImage = display.newImage("Star1.png",W/2,H/2)
	elseif (StarLevel ==2)then
	getStarText = display.newText("喔原來是下巴",W/2,H*10/13,native.systemFont,40)
	getStarImage = display.newImage("Star2.png",W/2,H/2)
	elseif (StarLevel ==3)then
	getStarText = display.newText("下巴又變得更尖了",W/2,H*10/13,native.systemFont,40)
	getStarImage = display.newImage("Star3.png",W/2,H/2)
	elseif (StarLevel ==4)then
	getStarText = display.newText("下巴下巴下巴",W/2,H*10/13,native.systemFont,40)
	getStarImage = display.newImage("Star4.png",W/2,H/2)
	elseif (StarLevel ==5)then
	getStarText = display.newText("青眼究極下巴",W/2,H*10/13,native.systemFont,40)
	getStarImage = display.newImage("Star5.png",W/2,H/2)
	end
	getText = display.newText("得到",W/2,H*9/26,native.systemFontBold,40)
	getStarBu = widget.newButton
	{
		x = W/2,
		y = H/2,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = " ",
		fontSize = "2500",
		onRelease = function(event)
		if(storyProgress==0)then            --中秋太無聊之跟新 9/17   第一次得到角色會進入任務界面
			composer.gotoScene("story",{effect="slideRight",time=700})
			screenFlag=1
			storyProgress=1
		end
		getStarText:removeSelf()
		getStarImage:removeSelf()
		getStarBu:removeSelf()
		rectBackground1:removeSelf()
		rectBackground2:removeSelf()
		getText:removeSelf()
		end
	}
	getStarBu:setFillColor( 1, 1, 1, 0)
	sceneGroup:insert(rectBackground1)
	sceneGroup:insert(rectBackground2)
	sceneGroup:insert(getText)
	sceneGroup:insert(getStarText)
	sceneGroup:insert(getStarImage) 
	sceneGroup:insert(getStarBu)
	

-------------------------------------Min---------------------------------------------------------------	
	else if (characterNum == 3)then
	
	levelup(Mysave.character,characterNum)
	MinLevel = getlevel(Mysave.character,characterNum)

	---bIPS = MinLevel * 0.5--- 10/30 IPS的算法重寫(代表制)----------
	
	rectBackground1 = display.newRect(W/2,H/2,W,H)
	rectBackground1:setFillColor(0.1,0.1,0.1,0.95)
	rectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
	rectBackground2:setFillColor(0,0,0)
	if(MinLevel ==1)then
	getMinText = display.newText("沒有反應，只是個火材人",W/2,H*10/13,native.systemFont,40)
	getMinImage = display.newImage("min1.png",W/2,H/2)
	elseif (MinLevel ==2)then
	getMinText = display.newText("長出頭髮看起來更禿",W/2,H*10/13,native.systemFont,40)
	getMinImage = display.newImage("min2.png",W/2,H/2)
	elseif (MinLevel ==3)then
	getMinText = display.newText("＝　＝臉",W/2,H*10/13,native.systemFont,40)
	getMinImage = display.newImage("min3.png",W/2,H/2)
	elseif (MinLevel ==4)then
	getMinText = display.newText("發光ㄌ，什麼鬼阿",W/2,H*10/13,native.systemFont,40)
	getMinImage = display.newImage("min4.png",W/2,H/2)
	elseif (MinLevel ==5)then
	getMinText = display.newText("我已經懶得吐槽了",W/2,H*10/13,native.systemFont,40)
	getMinImage = display.newImage("min5.png",W/2,H/2)
	end
	getText = display.newText("得到",W/2,H*9/26,native.systemFontBold,40)
	getMinBu = widget.newButton
	{
		x = W/2,
		y = H/2,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = " ",
		fontSize = "2500",
		onRelease = function(event)
		if(storyProgress==0)then            --中秋太無聊之跟新 9/17   第一次得到角色會進入任務界面
			composer.gotoScene("story",{effect="slideRight",time=700})
			screenFlag=1
			storyProgress=1
		end
		getMinText:removeSelf()
		getMinImage:removeSelf()
		getMinBu:removeSelf()
		rectBackground1:removeSelf()
		rectBackground2:removeSelf()
		getText:removeSelf()
		end
	}
	getMinBu:setFillColor( 1, 1, 1, 0)
	sceneGroup:insert(rectBackground1)
	sceneGroup:insert(rectBackground2)
	sceneGroup:insert(getText)
	sceneGroup:insert(getMinText)
	sceneGroup:insert(getMinImage) 
	sceneGroup:insert(getMinBu)
	
--------------------------FISH-------------------------------------------	
	else if (characterNum == 4) then
	levelup(Mysave.character,characterNum)
	FishLevel = getlevel(Mysave.character,characterNum)

	---dIPS = FishLevel * 0.5--- 10/30 IPS的算法重寫(代表制)----------
	
	rectBackground1 = display.newRect(W/2,H/2,W,H)
	rectBackground1:setFillColor(0.1,0.1,0.1,0.95)
	rectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
	rectBackground2:setFillColor(0,0,0)
	if(FishLevel ==1)then
	getFishText = display.newText("魚",W/2,H*10/13,native.systemFont,40)
	getFishImage = display.newImage("fish1.png",W/2,H/2)
	elseif (FishLevel ==2)then
	getFishText = display.newText("有眼睛的魚",W/2,H*10/13,native.systemFont,40)
	getFishImage = display.newImage("fish2.png",W/2,H/2)
	elseif (FishLevel ==3)then
	getFishText = display.newText("頭上長角的魚",W/2,H*10/13,native.systemFont,40)
	getFishImage = display.newImage("fish3.png",W/2,H/2)
	elseif (FishLevel ==4)then
	getFishText = display.newText("有鰓的魚",W/2,H*10/13,native.systemFont,40)
	getFishImage = display.newImage("fish4.png",W/2,H/2)
	elseif (FishLevel ==5)then
	getFishText = display.newText("金色閃光魚",W/2,H*10/13,native.systemFont,40)
	getFishImage = display.newImage("fish5.png",W/2,H/2)
	end
	getText = display.newText("得到",W/2,H*9/26,native.systemFontBold,40)
	getFishBu = widget.newButton
	{
		x = W/2,
		y = H/2,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = " ",
		fontSize = "2500",
		onRelease = function(event)
		if(storyProgress==0)then            --中秋太無聊之跟新 9/17   第一次得到角色會進入任務界面
			composer.gotoScene("story",{effect="slideRight",time=700})
			screenFlag=1
			storyProgress=1
		end
		getFishText:removeSelf()
		getFishImage:removeSelf()
		getFishBu:removeSelf()
		rectBackground1:removeSelf()
		rectBackground2:removeSelf()
		getText:removeSelf()
		end
	}
	getFishBu:setFillColor( 1, 1, 1, 0)
	sceneGroup:insert(rectBackground1)
	sceneGroup:insert(rectBackground2)
	sceneGroup:insert(getText)
	sceneGroup:insert(getFishText)
	sceneGroup:insert(getFishImage) 
	sceneGroup:insert(getFishBu)
	end
	end
	end
	end
end

Mysave.a = a
Mysave.b = b
Mysave.c = c
Mysave.d = d
table.print(Mysave)
saveTable(Mysave,"save.json")
	end
	end
	
local function aCostMinus(event)
	if(confirmFlag==0)then
	if ( event.phase == "began" ) then
		if (aCost > 0) then
			aCost = aCost - 1                          --先-1
		end
		AMflag = 1
		audio.rewind({channel=3})
		audio.play(s1,{channel=3})
		temp=0                                         --進去前刷新TEMP 拿來做曲線加速
		AMTimer = timer.performWithDelay(200,UPandDOWN,0) 
    elseif(event.phase=="ended" or event.phase=="moved" )then
		if(AMflag==1)then
			timer.cancel(AMTimer)
			if(speedUpTimerFlag==1)then                --加速器1取消
				timer.cancel(speedUpTimer)
				speedUpTimerFlag=0
			end
			if(speedUpTimer2Flag==1)then               --加速器2取消
				timer.cancel(speedUpTimer2)            --阿下面8個一樣所以不加註解
				speedUpTimer2Flag=0
			end
		end
		AMflag = 0
	end
	end
	end
	

local function aCostPlus(event)
	if(confirmFlag==0)then
	if ( event.phase == "began" ) then
		if (aCost < math.floor(a)) then
			aCost = aCost + 1
		end
		APflag = 1
		audio.rewind({channel=3})
		audio.play(s1,{channel=3})
		temp=0
		APTimer = timer.performWithDelay(200,UPandDOWN,0) 
    elseif(event.phase=="ended" or event.phase=="moved" )then
		if(APflag==1)then
			timer.cancel(APTimer)
			if(speedUpTimerFlag==1)then
				timer.cancel(speedUpTimer)
				speedUpTimerFlag=0
			end
			if(speedUpTimer2Flag==1)then
				timer.cancel(speedUpTimer2)
				speedUpTimer2Flag=0
			end
		end
		APflag = 0
	end
	end
	end

local function bCostMinus(event)
	if(confirmFlag==0)then
	if ( event.phase == "began" ) then
		if (bCost > 0) then
			bCost = bCost - 1
		end
		BMflag = 1
		audio.rewind({channel=3})
		audio.play(s1,{channel=3})
		temp=0
		BMTimer = timer.performWithDelay(200,UPandDOWN,0) 
    elseif(event.phase=="ended" or event.phase=="moved" )then
		if(BMflag==1)then
			timer.cancel(BMTimer)
			if(speedUpTimerFlag==1)then
				timer.cancel(speedUpTimer)
				speedUpTimerFlag=0
			end
			if(speedUpTimer2Flag==1)then
				timer.cancel(speedUpTimer2)
				speedUpTimer2Flag=0
			end
		end
		BMflag = 0
	end
	end
	end

local function bCostPlus(event)
	if(confirmFlag==0)then
	if ( event.phase == "began") then
		if (bCost < math.floor(b)) then
			bCost = bCost + 1
		end
		BPflag = 1
		audio.rewind({channel=3})
		audio.play(s1,{channel=3})
		temp=0
		BPTimer = timer.performWithDelay(200,UPandDOWN,0) 
    elseif(event.phase=="ended" or event.phase=="moved")then
		if(BPflag==1)then
			timer.cancel(BPTimer)
			if(speedUpTimerFlag==1)then
				timer.cancel(speedUpTimer)
				speedUpTimerFlag=0
			end
			if(speedUpTimer2Flag==1)then
				timer.cancel(speedUpTimer2)
				speedUpTimer2Flag=0
			end
		end
		BPflag = 0
	end
	end
	end

local function cCostMinus(event)
	if(confirmFlag==0)then
	if ( event.phase == "began") then
		if (cCost > 0) then
			cCost = cCost - 1
		end
		CMflag = 1
		audio.rewind({channel=3})
		audio.play(s1,{channel=3})
		temp=0
		CMTimer = timer.performWithDelay(200,UPandDOWN,0) 
    elseif(event.phase=="ended" or event.phase=="moved")then
		if(CMflag==1)then
			timer.cancel(CMTimer)
			if(speedUpTimerFlag==1)then
				timer.cancel(speedUpTimer)
				speedUpTimerFlag=0
			end
			if(speedUpTimer2Flag==1)then
				timer.cancel(speedUpTimer2)
				speedUpTimer2Flag=0
			end
		end
		CMflag = 0
	end
	end
	end

local function cCostPlus(event)
	if(confirmFlag==0)then
	if ( event.phase == "began" ) then
		if (cCost < math.floor(c)) then
			cCost = cCost + 1
		end
		CPflag = 1
		audio.rewind({channel=3})
		audio.play(s1,{channel=3})
		temp=0
		CPTimer = timer.performWithDelay(200,UPandDOWN,0) 
    elseif(event.phase=="ended" or event.phase=="moved" )then
		if(CPflag==1)then
			timer.cancel(CPTimer)
			if(speedUpTimerFlag==1)then
				timer.cancel(speedUpTimer)
				speedUpTimerFlag=0
			end
			if(speedUpTimer2Flag==1)then
				timer.cancel(speedUpTimer2)
				speedUpTimer2Flag=0
			end
		end
		CPflag = 0
	end
	end
	end

local function dCostMinus(event)
	if(confirmFlag==0)then
	if ( event.phase == "began" ) then
		if (dCost > 0) then
			dCost = dCost - 1
		end
		DMflag = 1
		audio.rewind({channel=3})
		audio.play(s1,{channel=3})
		temp=0
		DMTimer = timer.performWithDelay(200,UPandDOWN,0) 
    elseif(event.phase=="ended" or event.phase=="moved" )then
		if(DMflag==1)then
			timer.cancel(DMTimer)
			if(speedUpTimerFlag==1)then
				timer.cancel(speedUpTimer)
				speedUpTimerFlag=0
			end
			if(speedUpTimer2Flag==1)then
				timer.cancel(speedUpTimer2)
				speedUpTimer2Flag=0
			end
		end
		DMflag = 0
	end
	end
	end

local function dCostPlus(event)
	if(confirmFlag==0)then
	if ( event.phase == "began" ) then
		if (dCost < math.floor(d)) then
			dCost = dCost + 1
		end
		DPflag = 1
		audio.rewind({channel=3})
		audio.play(s1,{channel=3}) 
		temp=0
		DPTimer = timer.performWithDelay(200,UPandDOWN,0) 
	elseif(event.phase=="ended" or event.phase=="moved" )then
		if(DPflag==1)then
			timer.cancel(DPTimer)
			if(speedUpTimerFlag==1)then
				timer.cancel(speedUpTimer)
				speedUpTimerFlag=0
			end
			if(speedUpTimer2Flag==1)then
				timer.cancel(speedUpTimer2)
				speedUpTimer2Flag=0
			end
		end
		DPflag = 0
	end
	end
	end

	function UPandDOWN(event)
if (APflag == 1 and aCost < math.floor(a)) then
aCost = aCost + 1
elseif (AMflag == 1 and aCost > 0) then
aCost = aCost - 1
elseif (BPflag == 1 and bCost < math.floor(b)) then
bCost = bCost + 1
elseif (BMflag == 1 and bCost > 0) then
bCost = bCost - 1
elseif (CPflag == 1 and cCost < math.floor(c)) then
cCost = cCost + 1
elseif (CMflag == 1 and cCost > 0) then
cCost = cCost - 1
elseif (DPflag == 1 and dCost < math.floor(d)) then
dCost = dCost + 1
elseif (DMflag == 1 and dCost > 0) then
dCost = dCost - 1
end
temp=temp+1
if(temp==3)then                                 --加速器1
	speedUpTimer = timer.performWithDelay(200,UPandDOWN,0)
	speedUpTimerFlag=1
end
if(temp==9)then                                 --加速器2
	speedUpTimer2 = timer.performWithDelay(100,UPandDOWN,0)
	speedUpTimer2Flag=1
end
end

crafttimecheck = function(CType,Ctime)
-------------------------記錄按下合成時的時間-------------------------------------------------------

---------------------------------------------------------------------------------------------------

NowTime = math.floor(countdownTime - (os.time() - Ctime))
countdownTimeMinuteText = display.newText(math.floor(NowTime/60), W*3/7, H/2, native.systemFont, 50 )
countdownTimeSecondText = display.newText(math.floor(NowTime%60), W*4/7, H/2, native.systemFont, 50 )
MinuteText = display.newText("分",W*3.5/7,H/2,native.systemFont,40)
SecondText = display.newText("秒",W*4.5/7,H/2,native.systemFont,40)
sceneGroup:insert(countdownTimeMinuteText)
sceneGroup:insert(countdownTimeSecondText)
sceneGroup:insert(MinuteText)
sceneGroup:insert(SecondText)

local CraftTimer
local function CountdownRefresh(event)
	-------------------------------------刷新----------------------------------------------------------------
	NowTime = math.floor(countdownTime - (os.time() - Ctime))
	print("Craftcheck")
	print(NowTime)
	if( NowTime < 1) then
		countdownTimeMinuteText:removeSelf()
		countdownTimeSecondText:removeSelf()
		MinuteText:removeSelf()
		SecondText:removeSelf()
		---------------再製作Button----------------------------------------------------------
		costConfirmBuFunction()
		------------------歸0-------------------------------------------------------------------
		timer.cancel(Crafttimer)
		------------------------進入合成---------------------------------------------------------
		Craft(CType)
          return
		
	end
	if(magicFlag == 1)then
		NowTime = 0
		magicFlag = 0       -----------------------------------我想這個要加八
	end
	if(countdownTimeMinuteText ~=  nil or countdownTimeSecondText:removeSelf() ~= nil) then
		countdownTimeMinuteText:removeSelf()
		countdownTimeSecondText:removeSelf()
	end
	MinuteText:removeSelf()
	SecondText:removeSelf()
	countdownTimeMinuteText = display.newText(math.floor(NowTime/60), W*3/7, H/2, native.systemFont, 50 )
	countdownTimeSecondText = display.newText(math.floor(NowTime%60), W*4/7, H/2, native.systemFont, 50 )
	MinuteText = display.newText("分",W*3.5/7,H/2,native.systemFont,40)
	SecondText = display.newText("秒",W*4.5/7,H/2,native.systemFont,40)
	sceneGroup:insert(countdownTimeMinuteText)
	sceneGroup:insert(countdownTimeSecondText)
	sceneGroup:insert(MinuteText)
	sceneGroup:insert(SecondText)
	
end
Crafttimer = timer.performWithDelay(1000,CountdownRefresh,countdownTime) 

end

local function costConfirm(event)

    confirmFlag = 1
	costConfirmBu:removeSelf()
	Confirmtemp = aCost + bCost + cCost + dCost
	---------------10/30魂消耗--------------------
	Soulcost = (aCost+1) * (bCost+1) * (cCost+1) * (dCost+1) 
	---------------10/30魂消耗--------------------
	a = a - aCost
	aCost = 0
	b = b - bCost
	bCost = 0
	c = c - cCost
	cCost = 0
	d = d - dCost
	dCost = 0
	-------------------阿明幫我修一下這邊ww------------------------------
	
	----------------魂消耗------------------------
	if(soul >= Soulcost) then
		soul = soul - Soulcost
	else
		confirmFlag = 0
		costConfirmBuFunction()
		return
	end
	----------------------------------------------
	------------這裡想要出現一個對話框--------------
	---EX:此次合成會消耗 Soulcost 點靈魂------------
	------          確定要合成嗎         ------------
	---------  是                   否  -------------
	-------------------------------------------------
	-----------------------要加這個2016/11/29-----------------------------------------------
	
	if(Confirmtemp  > 5) then--if(Confirmtemp + math.random( 30 ) > 60) then  比較好測試
		countdownTime = 100
		confirmType = 1
	else
		countdownTime = 5
		confirmType = 2
	end
	crafttime = os.time()
    print(crafttime)
	crafttimecheck(confirmType,crafttime)
	end





local countdownAccelerateBuFailFunctionFlag = 0
local countdownAccelerateBu = widget.newButton
{
	x = W/2,
	y = H*10/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "加速魔法卡",
	fontSize = "40",
	onRelease = function(event)
	----------------------消耗各100個-------------------------------------------
	if(confirmFlag == 1 and a > 99 and b > 99 and c > 99 and d > 99)then
    audio.play(s2,{channel=4})
	audio.rewind({channel=4})
	a = a - 100
	b = b - 100
	c = c - 100
	d = d - 100

	magicFlag = 1

	elseif(confirmFlag == 1 and (a < 100 or b < 100 or c < 100 or d < 100))then 	------------我隨便加個警告
	
	local function countdownAccelerateBuFailFunction(event)
	if(countdownAccelerateBuFailFunctionFlag==1)then
	countdownAccelerateBuText:removeSelf()
	countdownAccelerateBuFailFunctionFlag=0
	end
	end
	audio.play(s2,{channel=4})
	audio.rewind({channel=4})
	if(countdownAccelerateBuFailFunctionFlag==0)then
	countdownAccelerateBuText = display.newText("需要點數各100才能使用",W/2,H*11/13,native.systemFont,40)
	sceneGroup:insert(countdownAccelerateBuText)
	timer.performWithDelay(1000,countdownAccelerateBuFailFunction,1)
	countdownAccelerateBuFailFunctionFlag=1
	end
	end
	end
}
countdownAccelerateBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(countdownAccelerateBu)
function costConfirmBuFunction(event)------17/1/22----改著改著就變50行的大按扭了 以後再生合成按鈕呼叫此方成
	costConfirmBu = widget.newButton
	{
	x = W/2,
	y = H/2,
	labelColor = { default = {1,1,1} ,over = {0,0,0}},
	label = "合成",
	fontSize = "40",
	onPress = function(event)	
		rectBackground1 = display.newRect(W/2,H/2,W,H)
		rectBackground1:setFillColor(0.1,0.1,0.1,0.95)
		rectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
		rectBackground2:setFillColor(0,0,0)
		costConfirm2Cancle = widget.newButton{
			x = W/2,
			y = H/2,
			labelColor = { default = {1,1,1} ,over = {0,0,0}},
			label = " ",
			fontSize = "5000",
			onEvent = function(event)
				rectBackground1:removeSelf()
				rectBackground2:removeSelf()
				costConfirm2:removeSelf()
				costConfirm2Cancle:removeSelf()
				costConfirmBuFunction()
			end,
		}
		costConfirm2Cancle:setFillColor( 0, 0, 0, 1)
		costConfirm2 = widget.newButton{
			x = W*1/2,
			y = H*1/2,
			labelColor = { default = {1,1,1} ,over = {0,0,0}},
			label = "確定",
			fontSize = "40",
			onPress = costConfirm,
			onRelease = function(event)
				rectBackground1:removeSelf()
				rectBackground2:removeSelf()
				costConfirm2:removeSelf()
				costConfirm2Cancle:removeSelf()
			end
		}
		costConfirm2:setFillColor( 1, 1, 1, 0)
	end,
	onRelease = function(event)	
	costConfirmBu:removeSelf()
	end
	}
	costConfirmBu:setFillColor( 1, 1, 1, 0)
	sceneGroup:insert(costConfirmBu)
end
costConfirmBuFunction()
local aCostMinusBu = widget.newButton
{
	x = W*11/14,
	y = H*1/13,
	labelColor = { default = {1,1,1} ,over = {0,0,0}},
	label = "-",
	fontSize = "80",
	onEvent = aCostMinus,
}
aCostMinusBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(aCostMinusBu)
local aCostPlusBu = widget.newButton
{
	x = W*5/14,
	y = H*1/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "+",
	fontSize = "70",
	onEvent = aCostPlus,
}
aCostPlusBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(aCostPlusBu)
local bCostMinusBu = widget.newButton
{
	x = W*11/14,
	y = H*2/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "-",
	fontSize = "80",
	onEvent = bCostMinus,
}
bCostMinusBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(bCostMinusBu)
local bCostPlusBu = widget.newButton
{
	x = W*5/14,
	y = H*2/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "+",
	fontSize = "70",
	onEvent = bCostPlus,
}
bCostPlusBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(bCostPlusBu)
local cCostMinusBu = widget.newButton
{
	x = W*11/14,
	y = H*3/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "-",
	fontSize = "80",
	onEvent = cCostMinus,
}
cCostMinusBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(cCostMinusBu)
local cCostPlusBu = widget.newButton
{
	x = W*5/14,
	y = H*3/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "+",
	fontSize = "70",
	onEvent = cCostPlus,
}
cCostPlusBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(cCostPlusBu)
local dCostMinusBu = widget.newButton
{
	x = W*11/14,
	y = H*4/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "-",
	fontSize = "80",
	onEvent = dCostMinus,
}
dCostMinusBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(dCostMinusBu)
local dCostPlusBu = widget.newButton
{
	x = W*5/14,
	y = H*4/13,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = "+",
	fontSize = "70",
	onEvent = dCostPlus,
}

dCostPlusBu:setFillColor( 1, 1, 1, 0)
sceneGroup:insert(dCostPlusBu)
local aCostText = display.newText(aCost,W*4/7,H*1/13,native.systemFont,40)
local bCostText = display.newText(bCost,W*4/7,H*2/13,native.systemFont,40)
local cCostText = display.newText(cCost,W*4/7,H*3/13,native.systemFont,40)
local dCostText = display.newText(dCost,W*4/7,H*4/13,native.systemFont,40)
local soulCostCount = display.newText(Soulcost,W*4/7,H*5/13,native.systemFont,40)
sceneGroup:insert(aCostText)
sceneGroup:insert(bCostText)
sceneGroup:insert(cCostText)
sceneGroup:insert(dCostText)
sceneGroup:insert(soulCostCount)
local etext = display.newText("傲嬌" ,W*3/14,H*1/13,native.systemFont,40)
etext:setFillColor( 1, 1, 1 )
local ftext = display.newText("腹黑" ,W*3/14,H*2/13,native.systemFont,40)
ftext:setFillColor( 1, 1, 1 )
local gtext = display.newText("療癒" ,W*3/14,H*3/13,native.systemFont,40)
gtext:setFillColor( 1, 1, 1 )
local htext = display.newText("天然" ,W*3/14,H*4/13,native.systemFont,40)
htext:setFillColor( 1, 1, 1 )
local soulCostText = display.newText("耗魂" ,W*3/14,H*5/13,native.systemFont,40)
soulCostText:setFillColor( 1, 1, 1 )
sceneGroup:insert(etext)
sceneGroup:insert(ftext)
sceneGroup:insert(gtext)
sceneGroup:insert(htext)
sceneGroup:insert(soulCostText)




local AText = display.newText( a, W/5, 8.5*H/13, native.systemFont, 40 )
AText:setFillColor( 1, 1, 1 )
local atext = display.newText("傲嬌" ,W/5,9*H/13,native.systemFont,40)
atext:setFillColor( 1, 1, 1 )

local BText = display.newText( b, 2*W/5, 8.5*H/13, native.systemFont, 40 )
BText:setFillColor( 1, 1, 1 )
local btext = display.newText("腹黑" ,2*W/5,9*H/13,native.systemFont,40)
btext:setFillColor( 1, 1, 1 )

local CText = display.newText( c, 3*W/5, 8.5*H/13, native.systemFont, 40 )
CText:setFillColor( 1, 1, 1 )
local ctext = display.newText("療癒" ,3*W/5,9*H/13,native.systemFont,40)
ctext:setFillColor( 1, 1, 1 )

local DText = display.newText( d, 4*W/5, 8.5*H/13, native.systemFont, 40 )
DText:setFillColor( 1, 1, 1 )
local dtext = display.newText("天然" ,4*W/5,9*H/13,native.systemFont,40)
dtext:setFillColor( 1, 1, 1 )
------------------10/30+17/1/22-----------------------------------
local SText = display.newText( soul , 3/7*W ,7.5/13*H,native.systemFont,40)
SText:setFillColor( 1, 1, 1 )
local sText = display.newText("魂值" , (55 + math.abs(60 * math.floor((math.log(soul+1)))/ 100)),7.5/13*H,native.systemFont,40)
sText:setFillColor( 1, 1, 1 )

sceneGroup:insert(SText)
sceneGroup:insert(sText)
sceneGroup:insert(AText)
sceneGroup:insert(atext)
sceneGroup:insert(BText)
sceneGroup:insert(btext)
sceneGroup:insert(CText)
sceneGroup:insert(ctext)
sceneGroup:insert(DText)
sceneGroup:insert(dtext)
-- timer-------------------------------------------------------------------
local function Refresh(event)
AText.text = math.floor(a)
BText.text = math.floor(b)
CText.text = math.floor(c)
DText.text = math.floor(d)
sText.x = ((55 + math.abs(60 * math.floor((math.log(soul+1)))/ 100) ) * W/100)
--------10/30----------------------
Soulcost = (aCost+1) * (bCost+1) * (cCost+1) * (dCost+1) 
	if(soul < Soulcost) then
	costConfirmBu:setEnabled(false)
	costConfirmBu:setLabel("魂值不足")
	else
	costConfirmBu:setEnabled(true)
	costConfirmBu:setLabel("合成")
	end
SText.text = math.floor(soul)
aCostText.text = aCost
bCostText.text = bCost
cCostText.text = cCost
dCostText.text = dCost
soulCostCount.text = Soulcost
end
timer.performWithDelay(100,Refresh,0) 
------------進來的時候讀一次合成--------------17/1/22 改成建場完畢 再讀取合成---------------------------------------------
if(confirmFlag == 1)then
costConfirmBu:removeSelf()
crafttimecheck(confirmType,crafttime)
end
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

	if event.phase == "will" then
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