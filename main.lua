-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
W = display.contentWidth
H = display.contentHeight
Load = display.newText("Loading.....",W/2,H/2,native.systemFont,40)
widget = require "widget"
local function Delay(event)

------------------------------save load-------------------------------------------------
local json = require("json")
function saveTable(myTable, filename)
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local file = io.open(path, "w")
    if file then
        local sTable = json.encode(myTable)--encode the table to string
        file:write( sTable )
        io.close( file )
        return true
    else
        return false
    end
end
 
function loadTable(filename)
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local contents = ""
    local myTable = {}
    local file = io.open( path, "r" )
    if file then        
         local sTable = file:read( "*a" )-- read the entire contents of the file
         myTable = json.decode(sTable)--decode the string back to table
         io.close( file )
         file = nil
         return myTable 
    end
    return nil
end
----------------------------------------------------------------------------------
-----------------------------table-----------------------------------------------
-----table.print------
table.print = function( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end


---table.push------
table.push = function(t,element)
table.insert(t,element)
end

---table.pop-------
table.pop = function(t)
return table.remove(t)
end

---table.unshift-----
table.unshift = function(t,element)
table.insert(t,1,element)
end

---table.shift-----
table.shift = function(t,element)
return table.remove(t,1,element)
end

---table.reverse----
table.reverse = function(t)
local _t = {}
while(#t > 0 )do
table.insert(temp_t,table.remove(t))
end
for k , v in pairs(temp_t)do
t[k] = v
end
temp_t = nil
end
----------------------------------getlevel--------------------------------------
getlevel = function(t,element)
local temp = table.remove(t,element)
table.insert(t,element,temp)
return temp
end
---------------------------------levelup----------------------------------------------
levelup = function(t,element)
flag = table.remove(t,element)
if(flag < 5) then
print(flag)
flag = flag + 1 
end
	table.insert(t,element,flag)
return flag
end
---------------------------------Time_Stop---------------------------------------

Time_Stop = function()
	timeStopRect = display.newRect(W/2,H/2,W,H)
	timeStopRect:setFillColor(0.1,0.1,0.1,0.95)
 VeryBigButton = widget.newButton
	{	
		x = W/2,
		y = H/2,
		labelColor = { default = {1,1,1} , over = {0,0,0}},
		label = " ",
		fontSize = "2500",
		onRelease = function()
		if(StopFlag == 1) then
		VeryBigButton:removeSelf()
		timeStopRect:removeSelf()
		end
		end
		}
		StopFlag = 0
VeryBigButton:setFillColor( 1, 1, 1, 0)
	end	

    
		
	
		
-----------------------------------------------------------------
m1 = audio.loadStream("bgm_maoudamashii_healing17.mp3")
m2 = audio.loadStream("bgm_maoudamashii_piano_feels_happiness.mp3")
s1 = audio.loadStream("se_maoudamashii_se_pc03.mp3") 
s2 = audio.loadStream("se_maoudamashii_magical21.mp3")
-----------------------------------------------------------------
soul = 0
SPC = 1
HeroLevel = 1
--Soul per click-----------
-------------------
a = 15
b = 15
c = 15
d = 15
------------------
firstflag = 0
------------------
aIPS = 1
bIPS = 1
cIPS = 1
dIPS = 1
------------------
home_flag = 0
----------------------
StopFlag = 0
------------------------
Mysave = loadTable("save.json")
if(Mysave == nil or Mysave.character == nil or Mysave.Point == nil or Mysave.BgmVolum == nil or Mysave.SeVolum == nil or Mysave.Channel == nil or  Mysave.Story == nil or Mysave.RLflag  == nil or Mysave.Craft == nil or Mysave.Soul == nil or Mysave.Hero == nil) then
Mysave = {}   
Mysave.character = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,}
Mysave.Point = {0,0,0,0,}
Mysave.Craft = {0,0,0,0,}
Mysave.Soul = 0
Mysave.Hero = 0

--*10/7--依序為 有沒有進入合成，Type，合成時的時間----
RemLevel = 0
StarLevel = 0
MinLevel = 0
FishLevel = 0
firstflag = 1
---------------------------
backgroundMusicVolume = 1
soundEffectVolume = 1
musicChannelNum  = 1
--------------------------
storyProgress = 0
RLflag = 0
------*10/7--宣告---------------
confirmFlag = 0
confirmType = 0
crafttime = 0
countdownTime = 0

else
-----------soul-----------------
soul = Mysave.Soul

-----------point--------------
a = getlevel(Mysave.Point,1)
b = getlevel(Mysave.Point,2)
c = getlevel(Mysave.Point,3)
d = getlevel(Mysave.Point,4)
-----------music--------------
backgroundMusicVolume = Mysave.BgmVolum
soundEffectVolume = Mysave.SeVolum
musicChannelNum = Mysave.Channel
audio.setVolume(backgroundMusicVolume,{channel=1})
audio.setVolume(backgroundMusicVolume,{channel=2})
audio.setVolume(soundEffectVolume,{channel=3})
audio.setVolume(soundEffectVolume,{channel=4})
-----------story------------------
storyProgress = Mysave.Story
RLflag = Mysave.RLflag
-----------10/30  hero level 主角等級 -----------------------
HeroLevel = Mysave.Hero
SPC = HeroLevel 
-------------------暫定SPC公式----------------
------------10/30 Character level  IPS的算法更正-------------------

RemLevel  = getlevel(Mysave.character,1)

StarLevel = getlevel(Mysave.character,2)

MinLevel = getlevel(Mysave.character,3)

FishLevel  = getlevel(Mysave.character,4)

--------------10/7 Load Craft--------------------
confirmFlag = getlevel(Mysave.Craft,1)
confirmType = getlevel(Mysave.Craft,2)
crafttime =   getlevel(Mysave.Craft,3)
countdownTime = getlevel(Mysave.Craft,4)
------------------------------------
table.print(Mysave)
end


characterNum = 0
--------------------------

math.randomseed(os.time())



local autosave
function saveTimer(event)
---------10/30------------
Mysave.Soul = soul
Mysave.Hero = HeroLevel
--------------------------------
table.push(Mysave.Point,a)
table.push(Mysave.Point,b)
table.push(Mysave.Point,c)
table.push(Mysave.Point,d)
table.shift(Mysave.Point)
table.shift(Mysave.Point)
table.shift(Mysave.Point)
table.shift(Mysave.Point)
---------------------------------------
Mysave.BgmVolum = backgroundMusicVolume 
Mysave.SeVolum = soundEffectVolume 
Mysave.Channel = musicChannelNum 
----------------------------------------
Mysave.Story = storyProgress 
Mysave.RLflag = RLflag
----------------------------------------
table.push(Mysave.Craft,confirmFlag)
table.push(Mysave.Craft,confirmType)
table.push(Mysave.Craft,crafttime)
table.push(Mysave.Craft,countdownTime)
table.shift(Mysave.Craft)
table.shift(Mysave.Craft)
table.shift(Mysave.Craft)
table.shift(Mysave.Craft)
----------------------------------------
table.print(Mysave)
saveTable(Mysave,"save.json")
end
autosave = timer.performWithDelay(1000,saveTimer,0) 
local composer = require("composer")
composer.gotoScene("prelude")

end
timer.performWithDelay(1000,Delay,1) 