local keys = {"@castrocol"} -- write all your choosen passwords in this tab .
local main = gg.prompt({"Ponga El Password :"},nil,{"text"})
if not main then return end
for l , I in pairs(keys) do
if main[1] == I then A = true end
end
if A ~= true then gg.alert("⚠ Error Password⚠ ") return else gg.toast("✅ Correct Password !") end

gg.setVisible(false)
-- Ocultar
function ROSENDO(Lib,Offset, EditHex)
local rosendo = gg
local t = rosendo.getRangesList(Lib)
if #t == 0 then 
return os.exit()
else 
for Lua, Lol in pairs(t) do 
local t = gg.getValues({{address = Lol.start, flags = 4}, {address = Lol.start + 0x12, flags = gg.TYPE_WORD}})
if t[1].value == 0x464C457F then 
Offset = Lol["start"] + Offset 
end 
Code = {}
if type(EditHex) == "number" then 
Lua = "" 
for Lua = 1, EditHex do 
Code[Lua] = {address = (Offset - 1) + Lua, flags = gg.TYPE_BYTE} 
end
for v, Lol in ipairs(gg.getValues(Code)) do 
Lua = Lua .. string.format("%02X", Lol.value & 0xFF) 
end 
return Lua 
end
Byte = {} 
EditHex:gsub("..",     function(x) 
Byte[#Byte + 1] = x Code[#Byte] = {address = (Offset - 1) + #Byte, flags = gg.TYPE_BYTE, value = x .. "h"}
end)
gg.setValues(Code)
end
end
end
gg.toast("𝐂𝐚𝐫𝐠𝐚𝐧𝐝𝐨 𝐒𝐜𝐫𝐢𝐩𝐭 ⏳")    
function CheckProcess()
local Regions = gg.getRangesList()
local LastAddress = Regions[#Regions]["end"]
return (LastAddress >> 32) ~= 0
end
function GetClassName(Letter)
local RegionsToSearch = {
[1] = gg.REGION_C_ALLOC,
[2] = gg.REGION_OTHER,
[3] = gg.REGION_ANONYMOUS
}
local ClassName = {}
for i, Ranges in ipairs(RegionsToSearch) do
gg.setRanges(Ranges)
gg.loadResults(Letter)
gg.searchPointer(0)
ClassName = gg.getResults(gg.getResultsCount())
gg.clearResults()
if #ClassName > 0 then
break
end
end
if #ClassName == 0 then
print("𝐒𝐢𝐧 𝐑𝐞𝐬𝐮𝐥𝐭𝐚𝐝𝐨𝐬 𝐄𝐧𝐜𝐨𝐧𝐭𝐫𝐚𝐝𝐨𝐬... 𝐏𝐨𝐫 𝐅𝐚𝐯𝐨𝐫 𝐀𝐜𝐭𝐢𝐯𝐚𝐫 𝐃𝐞𝐧𝐭𝐫𝐨 𝐃𝐞𝐥 𝐉𝐮𝐞𝐠𝐨.")    
os.exit()
end
return ClassName
end
local x64 = CheckProcess()
local MyOffset = ""
function SearchClassName(Text, Offset64, Offset32, Type)
gg.clearResults(true)
gg.clearList()
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
local Metadata = gg.getRangesList("global-metadata.dat")    
if Metadata == nil then
Region_Start = Metadata[1]["start"] and gg.TYPE_DWORD
Region_End = Metadata[1]["end"]
else
Region_Start = 0
Region_End = -1
end
gg.searchNumber(":" .. string.char(0) .. Text .. string.char(0), gg.TYPE_BYTE)
local Letters = gg.getResults(2)
local ClassFirstLetter = {Letters[2]}
gg.clearResults(true)
gg.loadResults(ClassFirstLetter)
gg.searchPointer(0)
local ClassNamePointer = GetClassName(ClassFirstLetter)
gg.setRanges(gg.REGION_ANONYMOUS)
local ClassInstant = {}
for i,v in ipairs(ClassNamePointer) do
local ClassPointer = {}
table.insert(ClassPointer, {
address = ClassNamePointer[i].address - (x64 and 0x10 or 0x8),
flags = gg.TYPE_DWORD
})
ClassPointer = gg.getValues(ClassPointer)
gg.clearResults()
gg.loadResults(ClassPointer) 
gg.searchPointer(0)
Resultss = gg.getResults(gg.getResultsCount())
if #Resultss >0 then
break
end
end
if #Resultss == 0 then
print("𝐒𝐢𝐧 𝐑𝐞𝐬𝐮𝐥𝐭𝐚𝐝𝐨𝐬 𝐄𝐧𝐜𝐨𝐧𝐭𝐫𝐚𝐝𝐨𝐬... 𝐏𝐨𝐫 𝐅𝐚𝐯𝐨𝐫 𝐀𝐜𝐭𝐢𝐯𝐚𝐫 𝐃𝐞𝐧𝐭𝐫𝐨 𝐃𝐞𝐥 𝐉𝐮𝐞𝐠𝐨.")    
os.exit()
end
if x64 == true then 
MyOffset = MyOffset .. Offset64
else MyOffset = MyOffset .. Offset32
end
gg.addListItems(Resultss)
gg.clearResults()
local GetResultsFromSearch = {}
for j,instance in ipairs(Resultss) do
table.insert(GetResultsFromSearch, {
address = instance.address + MyOffset,
flags = Type,
})
end
GetResultsFromSearch = gg.getValues(GetResultsFromSearch)
gg.loadResults(GetResultsFromSearch)
gg.clearList()
end
SearchClassName("OOIPMACFIFL",    "0x134",     "0xF0",     gg.TYPE_DWORD)
local AllResults = gg.getResults(gg.getResultsCount())
local C30, C20, C7, C4, C5, C15, C12, C6, C2, C8, C3, C50, C42, C100, C10, C35, C22, C80, C60, C18, C25, C9, C16 = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
local Recoil = {}
for Number, Value in ipairs(AllResults) do
if Value.value == 30 or Value.value == 20 or Value.value == 7 or Value.value == 4 or Value.value == 5 or Value.value == 12 or Value.value == 6 or Value.value == 2 or Value.value == 8 or Value.value == 3 or Value.value == 50 or Value.value == 42 or Value.value == 100 or Value.value == 10 or Value.value == 35 or Value.value == 22 or Value.value == 80 or Value.value == 60 or Value.value == 18 or Value.value == 25 then 
Valueee = gg.getValues({{address = Value.address+8, flags = gg.TYPE_FLOAT}})
for i, v in pairs(Valueee) do
Valueee2 = gg.getValues({{address = v.address+8, flags = gg.TYPE_FLOAT}})
for b, c in pairs(Valueee2) do
if v.value == c.value then
Recoil[#Recoil +1] = {address = Value.address+8, flags = gg.TYPE_FLOAT}
end;end;end;end
if Value.value == 30 then
C30[#C30+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 20 then
C20[#C20+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 7 then
C7[#C7+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 4 then
C4[#C4+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 5 then
C5[#C5+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 15 then
C15[#C15+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 12 then
C12[#C12+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 6 then
C6[#C6+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 2 then
C2[#C2+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 8 then
C8[#C8+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 3 then
C3[#C3+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 50 then
C50[#C50+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 42 then
C42[#C42+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 100 then
C100[#C100+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 10 then
C10[#C10+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 35 then
C35[#C35+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 22 then
C22[#C22+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 80 then
C80[#C80+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 60 then
C60[#C60+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 18 then
C18[#C18+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 25 then
C25[#C25+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 9 then
C9[#C9+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 16 then
C16[#C16+1] = {address = Value.address, flags = Value.flags}
end
end
gg.clearResults(gg.getResultsCount())
gg.clearResults(nil)

gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_CODE_APP)
gg.searchNumber("h 8D E5 08 60 8D E5 82 00 8D E8 10 17 02 E3 3C FF 2F E1",     gg.TYPE_BYTE)
gg.getResults(100)
gg.editAll("h 8D E5 08 60 8D E5 82 00 8D E8 10 17 02 E3 00 F0 20 E3",     gg.TYPE_BYTE)
gg.clearResults()

gg.toast("𝐀𝐂𝐓𝐈𝐕𝐀𝐃𝐎✔️")    
gg.sleep(1000)
gg.setVisible(true)

function START()
gg.clearResults(gg.getResultsCount())
menu = gg.multiChoice({
"🔵 𝐅𝐔𝐍𝐂𝐈𝐎𝐍𝐄𝐒 𝐃𝐄𝐋 𝐒𝐂𝐑𝐈𝐏𝐓",       
"✖ 𝐬𝐚𝐥𝐢𝐫 ✖"},nil,[[✪ 𝐒𝐂𝐑𝐈𝐏𝐓-𝐕𝐈𝐏 | 𝐅𝐅-1.106 ✪]])
if menu == nil then else
if menu [1] ==true then menusafe() end
if menu [2] ==true then exit() end
end
XGCK= -1
end

function menusafe()
menus = gg.multiChoice({
"📶 𝐀𝐍𝐓𝐄𝐍𝐀 ",     
"🔥 𝐑𝐄𝐆𝐄𝐃𝐈𝐓 ",      
"📥𝑨𝑴𝑷𝑳𝑰𝑨𝑹 𝑪𝑨𝑹𝑮𝑨𝑫𝑶𝑹",    
"➖𝑵𝑶 𝑹𝑬𝑪𝑶𝑰𝑳",    
"🎯𝐀𝐈𝐌𝐁𝐎𝐓 𝐀𝐖𝐌 (test)",     
"◀ 𝐀𝐭𝐫𝐚𝐬"},nil,"✨️ 𝐒𝐂𝐑𝐈𝐏𝐓 𝐕𝐈𝐏 ✨️")    
if menus == nil then else
if menus [1] ==true then antenas() end
if menus [3] ==true then reg() end
if menus [5] ==true then ampliar() end
if menus [6] ==true then lag() end
if menus [4] ==true then awm() end
if menus [7] ==true then START() end
end
XGCK= -1
end

function antenas()
menua = gg.multiChoice({
"📡 𝐀𝐍𝐓𝐄𝐍𝐀 𝐂𝐔𝐄𝐑𝐏𝐎",    
"◀ 𝐀𝐭𝐫𝐚́𝐬"},nil,"▶ 𝐄𝐋𝐈𝐉𝐄 𝐓𝐔 𝐀𝐍𝐓𝐄𝐍𝐀 𝐅𝐀𝐕𝐎𝐑𝐈𝐓𝐀:")    
if menua == nil then else
if menua [1] ==true then antena11() end
end
XGCK= -1
end

function antena11()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("QDB0A72BE1CFC2FB500000000",     1)
gg.refineNumber("Q00000000",     1)
gg.getResults(gg.getResultsCount())
gg.editAll("Q33F39543",     1)
gg.clearResults(gg.getResultsCount())
gg.searchNumber("QF36D9BBE2B0562B500000000",     1)
gg.refineNumber("Q00000000",     1)
gg.getResults(gg.getResultsCount())
gg.editAll("Q33F39543",     1)
gg.clearResults(gg.getResultsCount())
gg.toast("𝐀𝐂𝐓𝐈𝐕𝐀𝐃𝐎 📡")    
end


function reg()
menureg = gg.choice({
"🔥 ƦƠ𝐒ЄƝƊƠ 𝐕𝐄𝐑𝐒𝐈𝐎́𝐍 #1",     
"◀ 𝐀𝐭𝐫𝐚́𝐬"},nil,"▶ 𝐄𝐋𝐈𝐉𝐄 𝐓𝐔 𝐑𝐄𝐆𝐄𝐃𝐈𝐓 𝐅𝐀𝐕𝐎𝐑𝐈𝐓𝐎:")    
if menureg == 1 then v1() end
if menureg == 6 then menusafe() end
XGCK= -1
end

function v1()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13",     16)
gg.getResults(gg.getResultsCount())
gg.editAll("25;45;60;80",     16)
gg.clearResults(gg.getResultsCount())
gg.toast("𝐀𝐂𝐓𝐈𝐕𝐀𝐃𝐎 🔥")    
end



function lag()
gg.loadResults(Recoil)
gg.getResults(gg.getResultsCount())
gg.editAll("2",     gg.TYPE_FLOAT) 
gg.clearResults(true)
gg.toast("ACTIVADO ➖")    
end

function ampliar()
gg.loadResults(C30)
gg.getResults(gg.getResultsCount())
gg.editAll("50",     gg.TYPE_DWORD) -- 30
gg.clearResults(true)
gg.loadResults(C20)
gg.getResults(gg.getResultsCount())
gg.editAll("40",     gg.TYPE_DWORD) -- 20
gg.clearResults(true)
gg.loadResults(C7)
gg.getResults(gg.getResultsCount())
gg.editAll("10",     gg.TYPE_DWORD) -- 7
gg.clearResults(true)
gg.loadResults(C4)
gg.getResults(gg.getResultsCount())
gg.editAll("8",     gg.TYPE_DWORD) -- 4
gg.clearResults(true)
gg.loadResults(C5)
gg.getResults(gg.getResultsCount())
gg.editAll("10",     gg.TYPE_DWORD) -- 5
gg.clearResults(true)
gg.loadResults(C15)
gg.getResults(gg.getResultsCount())
gg.editAll("30",     gg.TYPE_DWORD) -- 15
gg.clearResults(true)
gg.loadResults(C12)
gg.getResults(gg.getResultsCount())
gg.editAll("22",     gg.TYPE_DWORD) -- 12
gg.clearResults(true)
gg.loadResults(C6)
gg.getResults(gg.getResultsCount())
gg.editAll("12",     gg.TYPE_DWORD) -- 6
gg.clearResults(true)
gg.loadResults(C2)
gg.getResults(gg.getResultsCount())
gg.editAll("4",     gg.TYPE_DWORD) -- 2
gg.clearResults(true)
gg.loadResults(C8)
gg.getResults(gg.getResultsCount())
gg.editAll("16",     gg.TYPE_DWORD) -- 8
gg.clearResults(true)
gg.loadResults(C3)
gg.getResults(gg.getResultsCount())
gg.editAll("6",     gg.TYPE_DWORD) -- 3
gg.clearResults(true)
gg.loadResults(C50)
gg.getResults(gg.getResultsCount())
gg.editAll("80",     gg.TYPE_DWORD) -- 50
gg.clearResults(true)
gg.loadResults(C42)
gg.getResults(gg.getResultsCount())
gg.editAll("62",     gg.TYPE_DWORD) -- 42
gg.clearResults(true)
gg.loadResults(C100)
gg.getResults(gg.getResultsCount())
gg.editAll("120",     gg.TYPE_DWORD) -- 100
gg.clearResults(true)
gg.loadResults(C10)
gg.getResults(gg.getResultsCount())
gg.editAll("20",     gg.TYPE_DWORD) -- 10
gg.clearResults(true)
gg.loadResults(C35)
gg.getResults(gg.getResultsCount())
gg.editAll("55",     gg.TYPE_DWORD) -- 35
gg.clearResults(true)
gg.loadResults(C22)
gg.getResults(gg.getResultsCount())
gg.editAll("42",     gg.TYPE_DWORD) -- 22
gg.clearResults(true)
gg.loadResults(C80)
gg.getResults(gg.getResultsCount())
gg.editAll("100",     gg.TYPE_DWORD) -- 80
gg.clearResults(true)
gg.loadResults(C60)
gg.getResults(gg.getResultsCount())
gg.editAll("80",     gg.TYPE_DWORD) -- 60
gg.clearResults(true)
gg.loadResults(C18)
gg.getResults(gg.getResultsCount())
gg.editAll("28",     gg.TYPE_DWORD) -- 18
gg.clearResults(true)
gg.loadResults(C25)
gg.getResults(gg.getResultsCount())
gg.editAll("45",     gg.TYPE_DWORD) -- 25
gg.clearResults(true)
gg.loadResults(C9)
gg.getResults(gg.getResultsCount())
gg.editAll("19",     gg.TYPE_DWORD) -- 9
gg.clearResults(true)
gg.loadResults(C16)
gg.getResults(gg.getResultsCount())
gg.editAll("26",     gg.TYPE_DWORD) -- 16
gg.clearResults(true)
gg.toast("ACTIVADO 📥")    
end
function awm()
gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_CODE_APP)
gg.searchNumber("h 8C 3F 8F C2 F5 3C CD CC CC 3D 06 00 00 00 00 00 00 00 00 00 00 00 00 00 F0 41 00 00 48 42 00 00 00 3F 33 33 13 40 00 00 B0 3F 00 00 80 3F 01",     gg.TYPE_BYTE)
gg.getResults(100)
gg.editAll("h 8C 3F 8F C2 F5 3C CD CC CC 3D 06 00 00 00 00 00 FF FF 00 00 00 00 00 00 F0 41 00 00 48 42 00 00 00 3F 33 33 13 40 00 00 B0 3F 00 00 80 3F 01",     gg.TYPE_BYTE)
gg.clearResults()
gg.toast("Reemplazo realizado ᴏɴ✔️️")    
end 



function exit()
print("░░░░░░░░░░░░░░░")    
print("░░SCRIPT░JMCVIP░░")   
print("░░░░░░░░░░░░░░░")    
os.exit()
end

while true do if gg.isVisible(true) then XGCK = 1 gg.setVisible(false) end if XGCK == 1 then START() end end
