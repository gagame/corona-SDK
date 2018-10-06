local composer = require( "composer" )
local scene = composer.newScene()
local beginnerFlag=0
composer.removeScene("prelude")
beginnerMusic = audio.loadSound("bgm_maoudamashii_acoustic46.mp3")
beginnerMusicChannel = audio.play(beginnerMusic)

trainDialogBox = display.newRect(W/2,H*9/13,W,H*3/13)
trainDialogBox:setFillColor(0.1,0.1,0.1,0.95)
train = display.newText
{
    text = "看板娘：\n「這裡是死後的世界。」",     
    x = W*3/7,
    y = H*9/13,
    width = W*5/7,
	height = H*3/13,
    font = native.systemFont,
    fontSize = 40,
    align = "left"  -- Alignment parameter
}
trainImage = display.newImage("Kanban1.png",W*6/7,H*6.5/13)
trainButton = widget.newButton
{
	x = W/2,
	y = H/2,
	labelColor = { default = {1,1,1} , over = {0,0,0}},
	label = " ",
	fontSize = "2500",
	onPress = function(event)
		if(beginnerFlag==25)then beginnerFlag=99 end 
		beginnerFlag=beginnerFlag+1
	end
}
trainButton:setFillColor( 1, 1, 1, 0)
lightUp = function (lightness)  --打光特效function
	if(lightness==0)then
		lightUpRect = display.newRect(W/2,H/2,W,H)
		Time_Stop()------------------------這鬼總算派上用場ˊˇˋ
		timeStopRect:setFillColor(0.1,0.1,0.1,0)
	end
	if(lightness<12)then
		lightUpRect:setFillColor(1,1,1,lightness/10)
	end
	if(lightness>=12)then 
		VeryBigButton:removeSelf()
		timeStopRect:removeSelf()
		lightUpRect:removeSelf() 
		beginnerFlag=beginnerFlag+1
	end
end
local function beginnerFunction(event)
if(beginnerFlag==0)then
train.text = "看板娘：\n「這裡是死後的世界。」"
elseif(beginnerFlag==1)then
train.text = "看板娘：\n「所謂的冥界、地獄等，都是指這個地方。」"
elseif(beginnerFlag==2)then
train.text = "看板娘：\n「那些都是人類對我們這裡的稱呼。」"
elseif(beginnerFlag==3)then
train.text = "看板娘：\n「世界上隨時都有大量的靈魂逝去。」"
elseif(beginnerFlag==4)then
train.text = "看板娘：\n「但是，人類的靈魂脫離身體的時候，並不是完整的，而是會破碎。」"
elseif(beginnerFlag==5)then
train.text = "看板娘：\n「因此，身為使者的我要去收集，並且再重新創造它們。」"
elseif(beginnerFlag==6)then
train.text = "看板娘：\n「這工作非常繁雜、非常大量、非常非常多……」"
elseif(beginnerFlag==7)then
train.text = "看板娘：\n「無論每天都是一樣，日復一日……」（閉眼凝重貌）"
elseif(beginnerFlag==8)then
train.text = "看板娘：\n「總之，今天工作也好多啊，我好想死啊……」（無神）"
elseif(beginnerFlag==9)then
train.text = "看板娘：\n「雖然這樣說，還是要工作……」（淚光苦笑）"
elseif(beginnerFlag==10)then
train.text = "看板娘：\n「啊啊，怎麼……？」（歪頭疑惑）"
temp=0
elseif(beginnerFlag==11)then  --2/6 亮光特效 前制temp歸0
train.text = "一陣亮光！"
if(temp==0)then -----------------可以設定初始亮度和亮光的速度(lightness)
	lightness=0
end
temp=temp+1
if(temp==3)then
	lightUp(lightness)
	lightness = lightness+0.5
	temp=1
end-------------------------------------
elseif(beginnerFlag==12)then
train.text = "看板娘：\n「嗚喔喔？！這是甚麼？！」（驚愕臉）"
elseif(beginnerFlag==13)then
train.text = "看板娘：\n「嗯嗯……這，好奇怪啊？」"
elseif(beginnerFlag==14)then
train.text = "看板娘：\n「明明有外形，為什麼沒有性格在裡面？」（凝神）"
elseif(beginnerFlag==15)then
train.text = "看板娘：\n「算了，我沒有時間去思考。」"
elseif(beginnerFlag==16)then
train.text = "看板娘：\n「總之，你是我不知道怎地製作出來的……」"
elseif(beginnerFlag==17)then
train.text = "看板娘：\n「就先送給上頭吧。」"
temp=0
elseif(beginnerFlag==18)then
train.text = "換場，亮光！"
if(temp==0)then -----------------可以設定初始亮度和亮光的速度(lightness)
	lightness=0
end
temp=temp+1
if(temp==3)then
	lightUp(lightness)
	lightness = lightness+0.5
	temp=1
end-------------------------------------
elseif(beginnerFlag==19)then
train.text = "上司沉思。。。。\n。。。。。。"
temp=0
elseif(beginnerFlag==20)then
train.text = "轉場，亮光！"
if(temp==0)then -----------------可以設定初始亮度和亮光的速度(lightness)
	lightness=0
end
temp=temp+1
if(temp==3)then
	lightUp(lightness)
	lightness = lightness+0.5
	temp=1
end-------------------------------------
elseif(beginnerFlag==21)then
train.text = "看板娘：\n「咦咦！？你怎麼又回來了？」"
elseif(beginnerFlag==22)then
train.text = "看板娘：\n「是上司退貨了？！」（驚愕臉）"
elseif(beginnerFlag==23)then
train.text = "看板娘：\n「好吧，沒辦法，那只好將你留在身邊了。」"
elseif(beginnerFlag==24)then
train.text = "看板娘：\n「對了，你就幫忙我工作吧！」（微笑）"
elseif(beginnerFlag==25)then
train.text = "看板娘：\n「那現在我就來跟你講工作內容吧。」"
elseif(beginnerFlag==100)then
train:removeSelf()
trainDialogBox:removeSelf()
trainButton:removeSelf()
trainImage:removeSelf()
timer.cancel(beginnertimer)
audio.stop(beginnerMusicChannel)
audio.dispose(beginnerMusic)
composer.removeScene("beginner")
composer.gotoScene("home")-----先去home 在轉story跳劇情
shopbu:setEnabled(false)
settingbu:setEnabled(false)
characterbu:setEnabled(false)--- 把home的按鈕全部關掉
homebu:setEnabled(false)
craftbu:setEnabled(false)
storybu:setEnabled(false)
composer.gotoScene("story",{effect="slideRight",time=500})
end
end
beginnertimer = timer.performWithDelay(10,beginnerFunction,0)




return scene