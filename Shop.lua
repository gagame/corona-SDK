local composer = require( "composer" )
local scene = composer.newScene()
print("Shop innovated")
shopGoodFlag=0
----------create----------------            
--11/20 sai  shopGoodFlag=1 是在展示商品的時候其他的按鈕都關掉 轉場狀態欄動畫還沒用好 魂的顯示會一直砍掉刷新 圖片按鈕失敗Q
function scene:create( event )
	local sceneGroup = self.view
	
	local function shopGoodFunction(event)
	if(shopGoodFlag==0)then
	shopGoodFlag=1
		shopRectBackground1 = display.newRect(W/2,H/2,W,H)
		shopRectBackground1:setFillColor(0.1,0.1,0.1,0.95)
		shopRectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
		shopRectBackground2:setFillColor(0,0,0)
		sceneGroup:insert(shopRectBackground1)
		sceneGroup:insert(shopRectBackground2)
		bigShopGoodImage = display.newImage("Icon.png",W*2/7,H/2)
		bigShopGoodImage:scale(3,3)
		sceneGroup:insert(bigShopGoodImage)
		shopGoodSellText = display.newText
		{
			text = "天真獵奇可愛看板娘的頭出售中 要價1魂",
			x = W*5/7,
			y = H*6/13,
			width = W*3/7,
			height = H*2/13,
			font = native.systemFont,
			fontSize = 40,
			align = "left"
		}
		sceneGroup:insert(shopGoodSellText)
		shopGoodSellButton = widget.newButton
		{
			x = W*5/7,
			y = H*8/13,
			label = "購買",
			labelColor = { default = {1,1,1} , over = {0,0,0}},
			fontSize = "40",
			onRelease = function(event) soul=soul-1 end
		}
		shopGoodSellButton:setFillColor( 1, 1, 1, 0)
		sceneGroup:insert(shopGoodSellButton)
		shopGoodSellCancelButton = widget.newButton
		{
			x = W/2,
			y = H*2/13,
			label = "         ",
			labelColor = { default = {1,1,1} , over = {0,0,0}},
			fontSize = "330",
			onRelease = function(event)
				shopRectBackground1:removeSelf()
				shopRectBackground2:removeSelf()
				bigShopGoodImage:removeSelf()
				shopGoodSellText:removeSelf()
				shopGoodSellButton:removeSelf()
				shopGoodSellCancelButton:removeSelf()
				shopGoodSellCancelButton2:removeSelf()
				shopGoodFlag=0
			end
		}
		shopGoodSellCancelButton:setFillColor( 1, 1, 1, 0)
		sceneGroup:insert(shopGoodSellCancelButton)
		shopGoodSellCancelButton2 = widget.newButton
		{
			x = W/2,
			y = H*11/13,
			label = "         ",
			labelColor = { default = {1,1,1} , over = {0,0,0}},
			fontSize = "330",
			onRelease = function(event)
				shopRectBackground1:removeSelf()
				shopRectBackground2:removeSelf()
				bigShopGoodImage:removeSelf()
				shopGoodSellText:removeSelf()
				shopGoodSellButton:removeSelf()
				shopGoodSellCancelButton:removeSelf()
				shopGoodSellCancelButton2:removeSelf()
				shopGoodFlag=0
			end
		}
		shopGoodSellCancelButton2:setFillColor( 1, 1, 1, 0)
		sceneGroup:insert(shopGoodSellCancelButton2)
	end
	end
	
	local function shopGood2Function(event)
	if(shopGoodFlag==0)then
	shopGoodFlag=1
		shopRectBackground1 = display.newRect(W/2,H/2,W,H)
		shopRectBackground1:setFillColor(0.1,0.1,0.1,0.95)
		shopRectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
		shopRectBackground2:setFillColor(0,0,0)
		sceneGroup:insert(shopRectBackground1)
		sceneGroup:insert(shopRectBackground2)
		bigShopGoodImage = display.newImage("Icon.png",W*2/7,H/2)
		bigShopGoodImage:scale(3,3)
		sceneGroup:insert(bigShopGoodImage)
		shopGoodSellText = display.newText
		{
			text = "天真獵奇可愛看板娘的頭出售中 要價2魂",
			x = W*5/7,
			y = H*6/13,
			width = W*3/7,
			height = H*2/13,
			font = native.systemFont,
			fontSize = 40,
			align = "left"
		}
		sceneGroup:insert(shopGoodSellText)
		shopGoodSellButton = widget.newButton
		{
			x = W*5/7,
			y = H*8/13,
			label = "購買",
			labelColor = { default = {1,1,1} , over = {0,0,0}},
			fontSize = "40",
			onRelease = function(event) soul=soul-2 end
		}
		shopGoodSellButton:setFillColor( 1, 1, 1, 0)
		sceneGroup:insert(shopGoodSellButton)
		shopGoodSellCancelButton = widget.newButton
		{
			x = W/2,
			y = H*2/13,
			label = "         ",
			labelColor = { default = {1,1,1} , over = {0,0,0}},
			fontSize = "330",
			onRelease = function(event)
				shopRectBackground1:removeSelf()
				shopRectBackground2:removeSelf()
				bigShopGoodImage:removeSelf()
				shopGoodSellText:removeSelf()
				shopGoodSellButton:removeSelf()
				shopGoodSellCancelButton:removeSelf()
				shopGoodSellCancelButton2:removeSelf()
				shopGoodFlag=0
			end
		}
		shopGoodSellCancelButton:setFillColor( 1, 1, 1, 0)
		sceneGroup:insert(shopGoodSellCancelButton)
		shopGoodSellCancelButton2 = widget.newButton
		{
			x = W/2,
			y = H*11/13,
			label = "         ",
			labelColor = { default = {1,1,1} , over = {0,0,0}},
			fontSize = "330",
			onRelease = function(event)
				shopRectBackground1:removeSelf()
				shopRectBackground2:removeSelf()
				bigShopGoodImage:removeSelf()
				shopGoodSellText:removeSelf()
				shopGoodSellButton:removeSelf()
				shopGoodSellCancelButton:removeSelf()
				shopGoodSellCancelButton2:removeSelf()
				shopGoodFlag=0
			end
		}
		shopGoodSellCancelButton2:setFillColor( 1, 1, 1, 0)
		sceneGroup:insert(shopGoodSellCancelButton2)
	end
	end
	
	local function shopGood3Function(event)
	if(shopGoodFlag==0)then
	shopGoodFlag=1
		shopRectBackground1 = display.newRect(W/2,H/2,W,H)
		shopRectBackground1:setFillColor(0.1,0.1,0.1,0.95)
		shopRectBackground2 = display.newRect(W/2,H/2,W,H*5/13)
		shopRectBackground2:setFillColor(0,0,0)
		sceneGroup:insert(shopRectBackground1)
		sceneGroup:insert(shopRectBackground2)
		bigShopGoodImage = display.newImage("Icon.png",W*2/7,H/2)
		bigShopGoodImage:scale(3,3)
		sceneGroup:insert(bigShopGoodImage)
		shopGoodSellText = display.newText
		{
			text = "天真獵奇可愛看板娘的頭出售中 要價3魂",
			x = W*5/7,
			y = H*6/13,
			width = W*3/7,
			height = H*2/13,
			font = native.systemFont,
			fontSize = 40,
			align = "left"
		}
		sceneGroup:insert(shopGoodSellText)
		shopGoodSellButton = widget.newButton
		{
			x = W*5/7,
			y = H*8/13,
			label = "購買",
			labelColor = { default = {1,1,1} , over = {0,0,0}},
			fontSize = "40",
			onRelease = function(event)
			soul=soul-3 end
		}
		shopGoodSellButton:setFillColor( 1, 1, 1, 0)
		sceneGroup:insert(shopGoodSellButton)
		shopGoodSellCancelButton = widget.newButton
		{
			x = W/2,
			y = H*2/13,
			label = "         ",
			labelColor = { default = {1,1,1} , over = {0,0,0}},
			fontSize = "330",
			onRelease = function(event)
				shopRectBackground1:removeSelf()
				shopRectBackground2:removeSelf()
				bigShopGoodImage:removeSelf()
				shopGoodSellText:removeSelf()
				shopGoodSellButton:removeSelf()
				shopGoodSellCancelButton:removeSelf()
				shopGoodSellCancelButton2:removeSelf()
				shopGoodFlag=0
			end
		}
		shopGoodSellCancelButton:setFillColor( 1, 1, 1, 0)
		sceneGroup:insert(shopGoodSellCancelButton)
		shopGoodSellCancelButton2 = widget.newButton
		{
			x = W/2,
			y = H*11/13,
			label = "         ",
			labelColor = { default = {1,1,1} , over = {0,0,0}},
			fontSize = "330",
			onRelease = function(event)
				shopRectBackground1:removeSelf()
				shopRectBackground2:removeSelf()
				bigShopGoodImage:removeSelf()
				shopGoodSellText:removeSelf()
				shopGoodSellButton:removeSelf()
				shopGoodSellCancelButton:removeSelf()
				shopGoodSellCancelButton2:removeSelf()
				shopGoodFlag=0
			end
		}
		shopGoodSellCancelButton2:setFillColor( 1, 1, 1, 0)
		sceneGroup:insert(shopGoodSellCancelButton2)
	end
	end
	
	shopSoulText = display.newText(math.floor(soul), W/2 , 67*H/100 , native.systemFont, 35)
	sceneGroup:insert(shopSoulText)
	shopSoulText2 = display.newText("魂" ,(55 + 60 * math.log(soul) / 100 ) * W/100,67 * H/100,native.systemFont,35)
	sceneGroup:insert(shopSoulText2)
	local function Refresh(event)
		shopSoulText:removeSelf()
		shopSoulText2:removeSelf()
		shopSoulText = display.newText(math.floor(soul), W/2 , 67*H/100 , native.systemFont, 35)sceneGroup:insert(shopSoulText)
		sceneGroup:insert(shopSoulText)
		shopSoulText2 = display.newText("魂" ,(55 + 60 * math.log(soul) / 100 ) * W/100,67 * H/100,native.systemFont,35)
		sceneGroup:insert(shopSoulText2)
	end
	timer.performWithDelay(100,Refresh,0) 
	
	local shopGoodImage = display.newImage("Icon.png",W*1.5/7,H*5/13)
	sceneGroup:insert(shopGoodImage)
	local shopGoodButton = widget.newButton
	{
		default = "Icon.png",
		over = "Icon.png",
		x = W*1.5/7,
		y = H*5/13,
		label = " ",
		fontSize = "80",
		onRelease = shopGoodFunction
	}
	sceneGroup:insert(shopGoodButton)
	shopGoodButton:setFillColor( 1, 1, 1, 0)
	
	local shopGood2Image = display.newImage("Icon.png",W*3.5/7,H*5/13)
	sceneGroup:insert(shopGood2Image)
	local shopGood2Button = widget.newButton
	{
		default = "Icon.png",
		over = "Icon.png",
		x = W*3.5/7,
		y = H*5/13,
		label = " ",
		fontSize = "80",
		onRelease = shopGood2Function
	}
	sceneGroup:insert(shopGood2Button)
	shopGood2Button:setFillColor( 1, 1, 1, 0)
	
	local shopGood3Image = display.newImage("Icon.png",W*5.5/7,H*5/13)
	sceneGroup:insert(shopGood3Image)
	local shopGood3Button = widget.newButton
	{
		default = "Icon.png",
		over = "Icon.png",
		x = W*5.5/7,
		y = H*5/13,
		label = " ",
		fontSize = "80",
		onRelease = shopGood3Function
	}
	sceneGroup:insert(shopGood3Button)
	shopGood3Button:setFillColor( 1, 1, 1, 0)
	
	local function home(event)
	if(shopGoodFlag==0)then
		composer.gotoScene("home",{effect="fade",time=500})
		screenFlag=2
	end
	end
	local homebu = widget.newButton
	{
		x = W/2,
		y = 20*H/26,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = "返回",
		fontSize = "40",
		onRelease = home,
	}
	homebu:setFillColor( 1, 1, 1, 0)
	sceneGroup:insert(homebu)
end

-----------show----------------
function scene:show( event )
end

-----------hide-------------------
function scene:hide( event )
end

----------destory------------------
function scene:destroy( event )
end

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene