gg.setVisible(false)
-- Ocultar GG
gg.setConfig(2131427463, 2|4)
-- Bypass
gg.setConfig(2131427464, 1)
--liboffset
function NBM(Lib,Offset, EditHex)
local nbm = gg
local t = nbm.getRangesList(Lib)
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
EditHex:gsub("..", function(x) 
Byte[#Byte + 1] = x Code[#Byte] = {address = (Offset - 1) + #Byte, flags = gg.TYPE_BYTE, value = x .. "h"}
end)
gg.setValues(Code)
end
end
end
gg.toast("Cargando Script â³")
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
print("Sin Resultados Encontrados... Por Favor Activar Dentro Del Juego.")
os.exit()
end
return ClassName
end
local MyOffset = ""
local x64 = CheckProcess()
function SearchClassName(Text, Offset, Type)
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
print("Sin Resultados Encontrados... Por Favor Activar Dentro Del Juego.")
os.exit()
end
MyOffset = MyOffset .. Offset
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
if gg.getTargetPackage() == "com.dts.freefireth" then
SearchClassName("OOIPMACFIFL","0x134", gg.TYPE_DWORD)
Guest = "0x2854298"; Female = "0x3EE4058"
FF = "FF-1.106"
elseif gg.getTargetPackage() == "com.dts.freefiremax" then 
SearchClassName("OOIPMACFIFL","0x14C", gg.TYPE_DWORD)
Guest = "0x295BAC8"; Female = "0x4609A9C"
FF = "FF-MAX-2.106"
else gg.alert("No se encuentran datos del juego, por favor ejecute el script despuÃ©s de abrir el juego.") 
os.exit() gg = nil 
end
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
gg.toast("Carga Completada âï¸")
gg.sleep(1000)
gg.setVisible(true)

function tipoff()
local menutipo = gg.choice({"ð¹Free Fire Normal","ð¸Free Fire Max"},nil,[[â¶ SELECCIONA TU VERSIÃN DE FF:]])
if menutipo == 1 then ffn() end
if menutipo == 2 then ffm() end
XGX = -1
end

function ffn()
gg.setVisible(true)
function START()
gg.clearResults(gg.getResultsCount())
menu = gg.multiChoice({
"ðµ OPCIONES SEGURAS",
"ð´ OPCIONES RIESGOSAS", 
"â salir â"},nil,[[âª NBM-VIP | FFNormal v1.106 âª]])
if menu == nil then else
if menu [1] ==true then menusafe() end
if menu [2] ==true then menurisk() end
if menu [3] ==true then exit() end
end
XGCK= -1
end

function menusafe()
menus = gg.multiChoice({
"ð¶ ANTENAS",
"ð¥ CURAR RÃPIDO",
"ð¥ REGEDITS",
"ð´ AYUDA APUNTADO",
"ð¼ BLANCO & NEGRO",
"â SIN RETROCESO ",
"ð¥ MAS CARGADOR",
"â AtrÃ¡s"},nil,"ðµ ACTIVA CON CONFIANZA")
if menus == nil then else
if menus [1] ==true then antenas() end
if menus [2] ==true then curar() end
if menus [3] ==true then reg() end
if menus [4] ==true then aim() end
if menus [5] ==true then blayne() end
if menus [6] ==true then rec() end
if menus [7] ==true then carga() end
if menus [8] ==true then START() end
end
XGCK= -1
end

function antenas()
menua = gg.multiChoice({
"ð¡ ANTENA CUERPO",
"ð¡ ANTENA FINA",
"ð¡ ANTENA HOMBRO",
"ð¡ ANTENA BRAZO",
"ð¡ LASER MONEDAS",
"â AtrÃ¡s"},nil,"â¶ ELIJE TU ANTENA FAVORITA:")
if menua == nil then else
if menua [1] ==true then antena() end
if menua [2] ==true then antenaf() end
if menua [3] ==true then antenah() end
if menua [4] ==true then antenab() end
if menua [5] ==true then item() end
if menua [6] ==true then menusafe() end
end
XGCK= -1
end

function antena()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("QDB0A72BE1CFC2FB500000000", 1)
gg.refineNumber("Q00000000", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("Q33F39543", 1)
gg.clearResults(gg.getResultsCount())
gg.searchNumber("QF36D9BBE2B0562B500000000", 1)
gg.refineNumber("Q00000000", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("Q33F39543", 1)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function antenaf()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";è³°ãã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";è³°ãää", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.searchNumber(";ä¬ãã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";ä¬ãää", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function antenah()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";ã¾ë¼¼ã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";ã¾ë¼¼ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.searchNumber(";íë½ã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";íë½ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function antenab()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";áºë¼ã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";áºë¼ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.searchNumber(";è±«ë¼ã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";è±«ë¼ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function item()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("h 69 00 6E 00 67 00 61 00 6D 00 65 00 2F 00 70 00 69 00 63 00 6B 00 75 00 70 00 2F 00 63 00 61 00 6E 00 64 00 79 00 2F 00 6F 00 62 00 33 00 31 00 2F 00 69 00 6E 00 67 00 61 00 6D 00 65 00 74 00 6F 00 6B 00 65 00 6E 00", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount()) --ingame/pickup/candy/ob31/ingametoken
gg.editAll("h 65 00 66 00 66 00 65 00 63 00 74 00 73 00 2F 00 76 00 66 00 78 00 5F 00 69 00 6E 00 67 00 61 00 6D 00 65 00 5F 00 6C 00 61 00 73 00 65 00 72 00", gg.TYPE_BYTE)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function curar()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";Kä ä", gg.TYPE_WORD)
gg.refineNumber(";ä", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";ä", gg.TYPE_WORD)
gg.clearResults(true)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("25D;2;25D::13", 16)
gg.refineNumber("2", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("1", 16)
gg.clearResults(true)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("3;0.56699997187", 16)
gg.refineNumber("3", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("2.95000004768", 16)
gg.clearResults(true)
gg.toast("ACTIVADO ð¥")
end

function reg()
menureg = gg.choice({
"ð¥ NBM VERSIÃN #1",
"ð¥ NBM VERSIÃN #2",
"ð¥ EDU VERSIÃN #1",
"ð¥ EDU VERSIÃN #2",
"â AtrÃ¡s"},nil,"â¶ ELIJE TU REGEDIT FAVORITO:")
if menureg == 1 then v1() end
if menureg == 2 then v2() end
if menureg == 3 then v3() end
if menureg == 4 then v4() end
if menureg == 5 then menusafe() end
XGCK= -1
end

function v1()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("20;40;35;45", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

function v2()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("30;50;40;60", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

function v3()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("25;45;60;80", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

function v4()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("20;40;55;50", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

function aim()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("3FACCCCD3FACCCCDh", gg.TYPE_QWORD)
gg.getResults(gg.getResultsCount())
gg.editAll("3FACCCCD42B3CCCDh", gg.TYPE_QWORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð´")
end

function blayne()
gg.setRanges(gg.REGION_VIDEO)
gg.searchNumber("1072216622", 4)
gg.getResults(gg.getResultsCount())
gg.editAll("1147786543", 4)
gg.clearResults(gg.getResultsCount())
gg.searchNumber("h 00 00 70 40 00 00 00 3F", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("h 00 00 70 40 66 66 48 42", 1)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¼")
end

function rec()
gg.loadResults(Recoil)
gg.getResults(gg.getResultsCount())
gg.editAll("2", gg.TYPE_FLOAT) 
gg.clearResults(true)
gg.toast("ACTIVADO â")
end

function carga()
gg.loadResults(C30)
gg.getResults(gg.getResultsCount())
gg.editAll("50", gg.TYPE_DWORD) -- 30
gg.clearResults(true)
gg.loadResults(C20)
gg.getResults(gg.getResultsCount())
gg.editAll("40", gg.TYPE_DWORD) -- 20
gg.clearResults(true)
gg.loadResults(C7)
gg.getResults(gg.getResultsCount())
gg.editAll("10", gg.TYPE_DWORD) -- 7
gg.clearResults(true)
gg.loadResults(C4)
gg.getResults(gg.getResultsCount())
gg.editAll("8", gg.TYPE_DWORD) -- 4
gg.clearResults(true)
gg.loadResults(C5)
gg.getResults(gg.getResultsCount())
gg.editAll("10", gg.TYPE_DWORD) -- 5
gg.clearResults(true)
gg.loadResults(C15)
gg.getResults(gg.getResultsCount())
gg.editAll("30", gg.TYPE_DWORD) -- 15
gg.clearResults(true)
gg.loadResults(C12)
gg.getResults(gg.getResultsCount())
gg.editAll("22", gg.TYPE_DWORD) -- 12
gg.clearResults(true)
gg.loadResults(C6)
gg.getResults(gg.getResultsCount())
gg.editAll("12", gg.TYPE_DWORD) -- 6
gg.clearResults(true)
gg.loadResults(C2)
gg.getResults(gg.getResultsCount())
gg.editAll("4", gg.TYPE_DWORD) -- 2
gg.clearResults(true)
gg.loadResults(C8)
gg.getResults(gg.getResultsCount())
gg.editAll("16", gg.TYPE_DWORD) -- 8
gg.clearResults(true)
gg.loadResults(C3)
gg.getResults(gg.getResultsCount())
gg.editAll("6", gg.TYPE_DWORD) -- 3
gg.clearResults(true)
gg.loadResults(C50)
gg.getResults(gg.getResultsCount())
gg.editAll("80", gg.TYPE_DWORD) -- 50
gg.clearResults(true)
gg.loadResults(C42)
gg.getResults(gg.getResultsCount())
gg.editAll("62", gg.TYPE_DWORD) -- 42
gg.clearResults(true)
gg.loadResults(C100)
gg.getResults(gg.getResultsCount())
gg.editAll("120", gg.TYPE_DWORD) -- 100
gg.clearResults(true)
gg.loadResults(C10)
gg.getResults(gg.getResultsCount())
gg.editAll("20", gg.TYPE_DWORD) -- 10
gg.clearResults(true)
gg.loadResults(C35)
gg.getResults(gg.getResultsCount())
gg.editAll("55", gg.TYPE_DWORD) -- 35
gg.clearResults(true)
gg.loadResults(C22)
gg.getResults(gg.getResultsCount())
gg.editAll("42", gg.TYPE_DWORD) -- 22
gg.clearResults(true)
gg.loadResults(C80)
gg.getResults(gg.getResultsCount())
gg.editAll("100", gg.TYPE_DWORD) -- 80
gg.clearResults(true)
gg.loadResults(C60)
gg.getResults(gg.getResultsCount())
gg.editAll("80", gg.TYPE_DWORD) -- 60
gg.clearResults(true)
gg.loadResults(C18)
gg.getResults(gg.getResultsCount())
gg.editAll("28", gg.TYPE_DWORD) -- 18
gg.clearResults(true)
gg.loadResults(C25)
gg.getResults(gg.getResultsCount())
gg.editAll("45", gg.TYPE_DWORD) -- 25
gg.clearResults(true)
gg.loadResults(C9)
gg.getResults(gg.getResultsCount())
gg.editAll("19", gg.TYPE_DWORD) -- 9
gg.clearResults(true)
gg.loadResults(C16)
gg.getResults(gg.getResultsCount())
gg.editAll("26", gg.TYPE_DWORD) -- 16
gg.clearResults(true)
gg.toast("ACTIVADO ð¥")
end

function menurisk()
menur = gg.multiChoice({
"ðª MODO TIENDAS",
"ð MODO AIRDROPS",
"ð² ATRAVESAR GLOO",
"ð CORRER RÃPIDO",
"ð  AYUDA MIRA",
"ð½ CABEZOTAS",
"â¨ BALAS MÃGICAS LITE",
"ð¯ HEADSHOT",
"ð® BORRAR INVITADO",
"â AtrÃ¡s"},nil,"ð´ ACTIVA BAJO TU RIESGO")
if menur == nil then else
if menur [1] == true then tienda() end
if menur [2] == true then airdrop() end
if menur [3] == true then gloo() end
if menur [4] == true then correr() end
if menur [5] == true then aimm() end
if menur [6] == true then cbz() end
if menur [7] == true then bmh1() end
if menur [8] == true then hsmeta() end
if menur [9] == true then inv() end
if menur [10] == true then START() end
end
XGCK= -1
end

function tienda()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "(" 00 00 "ingame/interactionobject/modelingameshop"')
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"',1)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ðª")
end

function airdrop()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "!" 00 00 "ingame/pickup/item/pickup_airdrop" 00 00 00', 1) -- 1
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.searchNumber('Q "%" 00 00 "ingame/pickup/item/pickup_carepackage" 00 00 00', 1) -- 2
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.searchNumber('Q "#" 00 00 "ingame/levelobject/levellockairdrop" 00 00 00', 1) -- 3
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/levelobject/techairdrop" 00 00 00 00 00 00 00 00 00 00', 1) -- 4
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.toast("ACTIVADO ð")
end

function gloo()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "#" 00 00 "ingame/assistantitem/icewall_bunker" 00 00 00', gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "effects/vfx_pet/vfx_petskill_robot"', gg.TYPE_BYTE)
gg.clearResults()
gg.toast("ACTIVADO ð²")
end

function correr()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("2.80259693e-44F;1.20000004768F;0.18000000715F;1.40129846e-45F", 16)
gg.refineNumber("1.20000004768", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("2.2", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð")
end

function aimm()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1075000115;1075000115::489", gg.TYPE_DWORD)
gg.getResults(gg.getResultsCount())
gg.editAll("-15", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("ACTIVADO ð ")
end

function cbz()
gg.setRanges(32)
gg.searchNumber("h 62 00 6F 00 6E 00 65 00 5F 00 4C 00 65 00 66 00 74 00 5F 00 57 00 65 00 61 00 70 00 6F 00 6E 00", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h 62 00 6F 00 6E 00 65 00 5F 00 4E 00 65 00 63 00 6B 00", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("h 23 AA A6 B8 46 0A CD 70", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h 23 AA A6 B8 B2 F7 1F A4", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("h 57 27 13 BE C5 26 27 BC 1F 02 81 B3 D6 2D 8B 29 73 4E D6 34 CB 5F 13 BE BA 55 7D 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h EC 51 B8 BD 3B 64 29 BD 1F 02 81 B3 D6 2D 8B 29 73 4E D6 34 CB 5F 13 BE BA 55 7D 3F 72 1C C7 3F 72 1C C7 3F 72 1C C7 3F", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("h 7B D5 FE BD 6B F1 AE BC DA 65 8F B3 38 C2 15 2A 1F CD 04 35 42 A6 36 BE 0D E5 7B 3F 01 00 80 3F 01 00 80 3F 00 00 80 3F", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h EC 51 B8 BD 3B 64 29 BD DA 65 8F B3 38 C2 15 2A 1F CD 04 35 42 A6 36 BE 0D E5 7B 3F 00 00 C0 3F 00 00 C0 3F 00 00 C0 3F", gg.TYPE_BYTE)
gg.clearResults()
gg.toast("ACTIVADO ð½")
end

function bmh1()
gg.setRanges(32)
gg.searchNumber('Q 2C 00 00 00 "ingame/backweapon/backwp_bulletproofumbrella" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_eagle" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_g18" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_usp45" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_m1917" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_uzi" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_wsp" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1D 00 00 00 "ingame/backweapon/backwp_m500" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_pan" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1F 00 00 00 "ingame/backweapon/backwp_katana" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 20 00 00 00 "ingame/backweapon/backwp_machete" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q "!" 00 00 "ingame/backweapon/backwp_crossbow" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q "$" 00 00 "ingame/backweapon/backwp_baseballbat" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q "&" 00 00 "ingame/backweapon/backwp_superheat_gun" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1F 00 00 00 "ingame/backweapon/backwp_sickle" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.toast("ACTIVADO â¨")
end

function hsmeta()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber(":bone_Neck", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll(":bone_Necs", gg.TYPE_BYTE)
gg.clearResults(true)
gg.searchNumber(":bone_Hips", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll(":bone_Neck", gg.TYPE_BYTE)
gg.clearResults(true)
NBM("libil2cpp.so", Female, "C0035FD6")
gg.toast("ACTIVADO ð¯")
end

function inv()
NBM("libil2cpp.so", Guest, "E0030032C0035FD6")
gg.toast("ELIMINADA ð®")
end

function exit()
gg.toast("Gracias por apoyar mis scipts NBM")
print("ââââââââââââ")
print("ââSCRIPTâVIPââ")
print("ââByâNiverBMââ")
print("ââââââââââââ")
os.exit()
end
while true do if gg.isVisible(true) then XGCK = 1 gg.setVisible(false) end if XGCK == 1 then START() end end
end

function ffm()
gg.setVisible(true)
function START()
gg.clearResults(gg.getResultsCount())
menu = gg.multiChoice({
"ðµ OPCIONES SEGURAS",
"ð´ OPCIONES RIESGOSAS", 
"â salir â"},nil,[[âª NBM-VIP | FFMax v2.106 âª]])
if menu == nil then else
if menu [1] ==true then menusafe() end
if menu [2] ==true then menurisk() end
if menu [3] ==true then exit() end
end
XGCK= -1
end

function menusafe()
menus = gg.multiChoice({
"ð¶ ANTENAS",
"ð¥ CURAR RÃPIDO",
"ð¥ REGEDITS",
"ð´ AYUDA APUNTADO",
"ð¼ BLANCO & NEGRO",
"â SIN RETROCESO ",
"ð¥ MAS CARGADOR",
"â AtrÃ¡s"},nil,"ðµ ACTIVA CON CONFIANZA")
if menus == nil then else
if menus [1] ==true then antenas() end
if menus [2] ==true then curar() end
if menus [3] ==true then reg() end
if menus [4] ==true then aim() end
if menus [5] ==true then blayne() end
if menus [6] ==true then rec() end
if menus [7] ==true then carga() end
if menus [8] ==true then START() end
end
XGCK= -1
end

function antenas()
menua = gg.multiChoice({
"ð¡ ANTENA CUERPO",
"ð¡ ANTENA FINA",
"ð¡ ANTENA HOMBRO",
"ð¡ ANTENA BRAZO",
"ð¡ LASER MONEDAS",
"â AtrÃ¡s"},nil,"â¶ ELIJE TU ANTENA FAVORITA:")
if menua == nil then else
if menua [1] ==true then antena() end
if menua [2] ==true then antenaf() end
if menua [3] ==true then antenah() end
if menua [4] ==true then antenab() end
if menua [5] ==true then item() end
if menua [6] ==true then menusafe() end
end
XGCK= -1
end

function antena()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("QDB0A72BE1CFC2FB500000000", 1)
gg.refineNumber("Q00000000", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("Q33F39543", 1)
gg.clearResults(gg.getResultsCount())
gg.searchNumber("QF36D9BBE2B0562B500000000", 1)
gg.refineNumber("Q00000000", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("Q33F39543", 1)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function antenaf()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";è³°ãã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";è³°ãää", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.searchNumber(";ä¬ãã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";ä¬ãää", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function antenah()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";ã¾ë¼¼ã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";ã¾ë¼¼ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.searchNumber(";íë½ã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";íë½ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function antenab()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";áºë¼ã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";áºë¼ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.searchNumber(";è±«ë¼ã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";è±«ë¼ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function item()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("h 69 00 6E 00 67 00 61 00 6D 00 65 00 2F 00 70 00 69 00 63 00 6B 00 75 00 70 00 2F 00 63 00 61 00 6E 00 64 00 79 00 2F 00 6F 00 62 00 33 00 31 00 2F 00 69 00 6E 00 67 00 61 00 6D 00 65 00 74 00 6F 00 6B 00 65 00 6E 00", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount()) --ingame/pickup/candy/ob31/ingametoken
gg.editAll("h 65 00 66 00 66 00 65 00 63 00 74 00 73 00 2F 00 76 00 66 00 78 00 5F 00 69 00 6E 00 67 00 61 00 6D 00 65 00 5F 00 6C 00 61 00 73 00 65 00 72 00", gg.TYPE_BYTE)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function curar()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";Kä ä", gg.TYPE_WORD)
gg.refineNumber(";ä", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";ä", gg.TYPE_WORD)
gg.clearResults(true)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("25D;2;25D::13", 16)
gg.refineNumber("2", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("1", 16)
gg.clearResults(true)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("3;0.56699997187", 16)
gg.refineNumber("3", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("2.95000004768", 16)
gg.clearResults(true)
gg.toast("ACTIVADO ð¥")
end

function reg()
menureg = gg.choice({
"ð¥ NBM VERSIÃN #1",
"ð¥ NBM VERSIÃN #2",
"ð¥ EDU VERSIÃN #1",
"ð¥ EDU VERSIÃN #2",
"â AtrÃ¡s"},nil,"â¶ ELIJE TU REGEDIT FAVORITO:")
if menureg == 1 then v1() end
if menureg == 2 then v2() end
if menureg == 3 then v3() end
if menureg == 4 then v4() end
if menureg == 5 then menusafe() end
XGCK= -1
end

function v1()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("20;40;35;45", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

function v2()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("30;50;40;60", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

function v3()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("25;45;60;80", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

function v4()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("20;40;55;50", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

function aim()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("3FACCCCD3FACCCCDh", gg.TYPE_QWORD)
gg.getResults(gg.getResultsCount())
gg.editAll("3FACCCCD42B3CCCDh", gg.TYPE_QWORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð´")
end

function blayne()
gg.setRanges(gg.REGION_VIDEO)
gg.searchNumber("1072216622", 4)
gg.getResults(gg.getResultsCount())
gg.editAll("1147786543", 4)
gg.clearResults(gg.getResultsCount())
gg.searchNumber("h 00 00 70 40 00 00 00 3F", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("h 00 00 70 40 66 66 48 42", 1)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¼")
end

function rec()
gg.loadResults(Recoil)
gg.getResults(gg.getResultsCount())
gg.editAll("2", gg.TYPE_FLOAT) 
gg.clearResults(true)
gg.toast("ACTIVADO â")
end

function carga()
gg.loadResults(C30)
gg.getResults(gg.getResultsCount())
gg.editAll("50", gg.TYPE_DWORD) -- 30
gg.clearResults(true)
gg.loadResults(C20)
gg.getResults(gg.getResultsCount())
gg.editAll("40", gg.TYPE_DWORD) -- 20
gg.clearResults(true)
gg.loadResults(C7)
gg.getResults(gg.getResultsCount())
gg.editAll("10", gg.TYPE_DWORD) -- 7
gg.clearResults(true)
gg.loadResults(C4)
gg.getResults(gg.getResultsCount())
gg.editAll("8", gg.TYPE_DWORD) -- 4
gg.clearResults(true)
gg.loadResults(C5)
gg.getResults(gg.getResultsCount())
gg.editAll("10", gg.TYPE_DWORD) -- 5
gg.clearResults(true)
gg.loadResults(C15)
gg.getResults(gg.getResultsCount())
gg.editAll("30", gg.TYPE_DWORD) -- 15
gg.clearResults(true)
gg.loadResults(C12)
gg.getResults(gg.getResultsCount())
gg.editAll("22", gg.TYPE_DWORD) -- 12
gg.clearResults(true)
gg.loadResults(C6)
gg.getResults(gg.getResultsCount())
gg.editAll("12", gg.TYPE_DWORD) -- 6
gg.clearResults(true)
gg.loadResults(C2)
gg.getResults(gg.getResultsCount())
gg.editAll("4", gg.TYPE_DWORD) -- 2
gg.clearResults(true)
gg.loadResults(C8)
gg.getResults(gg.getResultsCount())
gg.editAll("16", gg.TYPE_DWORD) -- 8
gg.clearResults(true)
gg.loadResults(C3)
gg.getResults(gg.getResultsCount())
gg.editAll("6", gg.TYPE_DWORD) -- 3
gg.clearResults(true)
gg.loadResults(C50)
gg.getResults(gg.getResultsCount())
gg.editAll("80", gg.TYPE_DWORD) -- 50
gg.clearResults(true)
gg.loadResults(C42)
gg.getResults(gg.getResultsCount())
gg.editAll("62", gg.TYPE_DWORD) -- 42
gg.clearResults(true)
gg.loadResults(C100)
gg.getResults(gg.getResultsCount())
gg.editAll("120", gg.TYPE_DWORD) -- 100
gg.clearResults(true)
gg.loadResults(C10)
gg.getResults(gg.getResultsCount())
gg.editAll("20", gg.TYPE_DWORD) -- 10
gg.clearResults(true)
gg.loadResults(C35)
gg.getResults(gg.getResultsCount())
gg.editAll("55", gg.TYPE_DWORD) -- 35
gg.clearResults(true)
gg.loadResults(C22)
gg.getResults(gg.getResultsCount())
gg.editAll("42", gg.TYPE_DWORD) -- 22
gg.clearResults(true)
gg.loadResults(C80)
gg.getResults(gg.getResultsCount())
gg.editAll("100", gg.TYPE_DWORD) -- 80
gg.clearResults(true)
gg.loadResults(C60)
gg.getResults(gg.getResultsCount())
gg.editAll("80", gg.TYPE_DWORD) -- 60
gg.clearResults(true)
gg.loadResults(C18)
gg.getResults(gg.getResultsCount())
gg.editAll("28", gg.TYPE_DWORD) -- 18
gg.clearResults(true)
gg.loadResults(C25)
gg.getResults(gg.getResultsCount())
gg.editAll("45", gg.TYPE_DWORD) -- 25
gg.clearResults(true)
gg.loadResults(C9)
gg.getResults(gg.getResultsCount())
gg.editAll("19", gg.TYPE_DWORD) -- 9
gg.clearResults(true)
gg.loadResults(C16)
gg.getResults(gg.getResultsCount())
gg.editAll("26", gg.TYPE_DWORD) -- 16
gg.clearResults(true)
gg.toast("ACTIVADO ð¥")
end

function menurisk()
menur = gg.multiChoice({
"ðª MODO TIENDAS",
"ð MODO AIRDROPS",
"ð² ATRAVESAR GLOO",
"ð CORRER RÃPIDO",
"ð  AYUDA MIRA",
"ð½ CABEZOTAS",
"â¨ BALAS MÃGICAS LITE",
"ð¯ HEADSHOT",
"ð® BORRAR INVITADO",
"â AtrÃ¡s"},nil,"ð´ ACTIVA BAJO TU RIESGO")
if menur == nil then else
if menur [1] == true then tienda() end
if menur [2] == true then airdrop() end
if menur [3] == true then gloo() end
if menur [4] == true then correr() end
if menur [5] == true then aimm() end
if menur [6] == true then cbz() end
if menur [7] == true then bmh1() end
if menur [8] == true then hsmeta() end
if menur [9] == true then inv() end
if menur [10] == true then START() end
end
XGCK= -1
end

function tienda()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "(" 00 00 "ingame/interactionobject/modelingameshop"')
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"',1)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ðª")
end

function airdrop()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "!" 00 00 "ingame/pickup/item/pickup_airdrop" 00 00 00', 1) -- 1
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.searchNumber('Q "%" 00 00 "ingame/pickup/item/pickup_carepackage" 00 00 00', 1) -- 2
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.searchNumber('Q "#" 00 00 "ingame/levelobject/levellockairdrop" 00 00 00', 1) -- 3
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/levelobject/techairdrop" 00 00 00 00 00 00 00 00 00 00', 1) -- 4
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.toast("ACTIVADO ð")
end

function gloo()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "#" 00 00 "ingame/assistantitem/icewall_bunker" 00 00 00', gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "effects/vfx_pet/vfx_petskill_robot"', gg.TYPE_BYTE)
gg.clearResults()
gg.toast("ACTIVADO ð²")
end

function correr()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("2.80259693e-44F;1.20000004768F;0.18000000715F;1.40129846e-45F", 16)
gg.refineNumber("1.20000004768", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("2.2", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð")
end

function aimm()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1075000115;1075000115::489", gg.TYPE_DWORD)
gg.getResults(gg.getResultsCount())
gg.editAll("-15", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("ACTIVADO ð ")
end

function cbz()
gg.setRanges(32)
gg.searchNumber("h 62 00 6F 00 6E 00 65 00 5F 00 4C 00 65 00 66 00 74 00 5F 00 57 00 65 00 61 00 70 00 6F 00 6E 00", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h 62 00 6F 00 6E 00 65 00 5F 00 4E 00 65 00 63 00 6B 00", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("h 23 AA A6 B8 46 0A CD 70", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h 23 AA A6 B8 B2 F7 1F A4", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("h 57 27 13 BE C5 26 27 BC 1F 02 81 B3 D6 2D 8B 29 73 4E D6 34 CB 5F 13 BE BA 55 7D 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h EC 51 B8 BD 3B 64 29 BD 1F 02 81 B3 D6 2D 8B 29 73 4E D6 34 CB 5F 13 BE BA 55 7D 3F 72 1C C7 3F 72 1C C7 3F 72 1C C7 3F", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("h 7B D5 FE BD 6B F1 AE BC DA 65 8F B3 38 C2 15 2A 1F CD 04 35 42 A6 36 BE 0D E5 7B 3F 01 00 80 3F 01 00 80 3F 00 00 80 3F", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h EC 51 B8 BD 3B 64 29 BD DA 65 8F B3 38 C2 15 2A 1F CD 04 35 42 A6 36 BE 0D E5 7B 3F 00 00 C0 3F 00 00 C0 3F 00 00 C0 3F", gg.TYPE_BYTE)
gg.clearResults()
gg.toast("ACTIVADO ð½")
end

function bmh1()
gg.setRanges(32)
gg.searchNumber('Q 2C 00 00 00 "ingame/backweapon/backwp_bulletproofumbrella" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_eagle" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_g18" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_usp45" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_m1917" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_uzi" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_wsp" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1D 00 00 00 "ingame/backweapon/backwp_m500" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_pan" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1F 00 00 00 "ingame/backweapon/backwp_katana" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 20 00 00 00 "ingame/backweapon/backwp_machete" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q "!" 00 00 "ingame/backweapon/backwp_crossbow" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q "$" 00 00 "ingame/backweapon/backwp_baseballbat" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q "&" 00 00 "ingame/backweapon/backwp_superheat_gun" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1F 00 00 00 "ingame/backweapon/backwp_sickle" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.toast("ACTIVADO â¨")
end

function hsmeta()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber(":bone_Neck", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll(":bone_Necs", gg.TYPE_BYTE)
gg.clearResults(true)
gg.searchNumber(":bone_Hips", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll(":bone_Neck", gg.TYPE_BYTE)
gg.clearResults(true)
NBM("libil2cpp.so", Female, "C0035FD6")
gg.toast("ACTIVADO ð¯")
end

function inv()
NBM("libil2cpp.so", Guest, "E0030032C0035FD6")
gg.toast("ELIMINADA ð®")
end

function exit()
gg.toast("Gracias por apoyar mis scipts NBM")
print("ââââââââââââ")
print("ââSCRIPTâVIPââ")
print("ââByâNiverBMââ")
print("ââââââââââââ")
os.exit()
end
while true do if gg.isVisible(true) then XGCK = 1 gg.setVisible(false) end if XGCK == 1 then START() end end
end

while true do if gg.isVisible(true) then XGX = 1 gg.setVisible(false) end if XGX == 1 then tipoff() end
end
