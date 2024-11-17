gg.setVisible(false)
-- Ocultar GGgg.setConfig(2131427463, 2|4)
-- Bypass
gg.setConfig(131427464, 1)
--libofset
function NBM(Lib,Offset, EditHex)
local nbm = gg
local t = nbm.getRangesList(Lib)if #t == 0 then 
return os.exit()
else 
for Lua, Lolin pairs(t) do 
local t = gg.getValues({{address = Lol.start, flags = 4}, {address = Lol.start + 0x12, fl	gs = gg.TYPE_WORD}}
if t[1].value == 0x464C457F then 
Offset = Lol["start] + Offset 
end 
Code = {}
if typ
(EditHex) == "numb
r" then 
Lua = "" 
for Lua = 1, EdiHex do 
Code[Lua] = {address = (Offset - 1) + Lua, flas = gg.TYPE_BYTE} 

nd
for v, Lol in ipairs(gg.getValues(Code)) do 
Lua = Lua .. string.format("%02X", Lol.alue & 0xFF) 
end 
return Lua 
end
Byte = {} 
EditHex:gsub("..", function(x) 
Byte[#Byte + 1] = x Code[#Byt
] = {address = (Of
set - 1) + #Byte, flags = gg.TYPE_BYTE, value = x .. "h"}
end)
gg.setValues(Code)
end
end
end
gg.toast("Car
ando Script â³")
function CheckProcess()
local Reg
ons = gg.getRangesList()
ocal LastAddress = Region[#Regions]["end"]
return LastAddress >> 32) ~= 0
end
function GetClassName(Leter)
local RegionsToSearc
 = {
[1] = gg.REGION_C_ALLOC,
[2] = gg.REGION_OTHER,
[3] = gg.REGION_ANONYMOUS
}
local ClassName = {}
for i, Ranges in ipairs(RegionsToSearch do
gg.setRanges(Ranges)

g.loadResults(Letter)
gg.searchPointer(0)
ClassName = gg.getResults(gg.getReultsCount())
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
local MOffset = ""
local x64 = CheckProcess()
function SearchClassName(Text, Offset, Tpe)
gg.clearResults(true)
gg.clearList()
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
local Metadata = 
g.getRangesList("global-metadata.dat")
if Metadata = nil then
Region_Start = etadata[1]["start"] and gg.TYPE_DWORD
Region_End = Metadata[1]["end"]
else
Region_Start = 0
Region_End = -1
end
gg.searchNumber(":" .. string.char(0) .. Text .. sting.char(0), gg.TYPE_BYTE)
local Letters = gg.getResuts(2)
local ClassFirstLeter = {Letters[2]}
gg.clearResults(true)
gg.loadResults(ClassFirstLetter)
gg.earchPointer(0)
local ClassNamePointer = GetClassName(ClassFirstLetter)
gg.seRanges(gg.REGION_ANONYMOUS)
local ClassInstant = {}
fo i,v in ipairs(ClassNamePinter) do
local ClassPoiner = {}
table.insert(ClassPointer, {
address = ClassNamePointer[i].address - (x64 and 0x10 or 0x8),
flags = gg.TYPE_DWORD
})
ClassPointer = gg.getValues(ClassPointer)
gg.clearResults()
gg.loadResults(ClassPointer) 
gg.searchPointer(0)
Rsultss = gg.getResults(g.getResultsCount())
if #Rsultss >0 then
break
end
end
if #Resultss == 0 then
print("Sin Resultados Encontrados... Por Favor Actiar Dentro Del Juego.")
os.exit()
end
MyOffset = MyOffset .. Offset
gg.addListItems(Resultss)
gg.clearReults()
local GetResultsFromSearch = {}
for j,instance in ipairs(Resultss) dotable.insert(GetResultsFromSearch, {
address = instance.address + MyOffset,
flags = Type,
})
end
GetResltsFromSearch = gg.getVales(GetResultsFromSearch)
gg.loadResults(GetResultsFromSearch)
gg.clearList()end
if gg.getTargetPackag() == "com.dts.freefireth then
SearchClassName("OOIMACFIFL","0x134", gg.TYPE_DWORD)
Guest = "0x2854298"; Fema
e = "0x3EE4058"
FF = "FF-1.106"
elseif gg.getTargetPackage() == "com.dts.freefiremax" then 
SearchClassName("OOIPMACFIFL","0x14C", gg.TYPE_DWORD)
Guest = "0x295BAC8"; Fmale = "0x4609A9C"
FF = "FF-MAX-2.106"
else gg.alert("Nose encuentran datos del juego, por favor ejecute el script despuÃ©s de abrir el juego.") 
os.exit() g = nil 
end
local AllResu
ts = gg.getResults(gg.geResultsCount())
local C30,C20, C7, C4, C5, C15, C12, C6, C2, C8, C3, C50, C42, C100, C10, C35, C22, C80, C60, C18, C25, C9, C16 = {}, {}, {}, {}, {, {}, {}, {}, {}, {}, {}, }, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
local Recoil = {}
for Number, Vale in ipairs(AllResults) 
o
if Value.value == 30 or Value.value == 20 or Value.alue == 7 or Value.value == 4 or Value.value == 5 or V	lue.value == 12 or Value.v	lue == 6 or Value.value ==2 or Value.value == 8 or Value.value == 3 or Value.value == 50 or Value.value == 2 or Value.value == 100 or Value.value == 10 or Value.value == 35 or Value.value == 22 or Value.value == 80 or Value.value == 60 or Value.value == 18 or Value.value == 25 then 
Valueee = gg.getValu
s({{address = Value.address+8, flags = gg.TYPE_FLOAT})
for i, v in pairs(Valueee) do
Valueee2 = gg.getValues({{address = v.address+8, flags = gg.TYPE_FLOAT}})
for b, c in pairs(Valueee2) do
if v.value == c.value then
Recoil[#Recoi
 +1] = {address = Value.address+8,flags = gg.TYPE_FLOT}
end;end;end;end
if Value.valu
 == 30 then
C30[#C301] = {address = Value.address, flags = Value.flags}
nd
if Value.value == 20 then
C20[#20+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 7 then
C7[#C7+1] = {address = Value.address, fla
s = Value.flags}
end
if Value.vale == 4 then
C4[#C4+	] = {address = Value.address, fla
s = Value.flags}
e
d
if Value.value == 5 then
C5[#C5+1] = {address = Value.address, flags = Value.flags}
e
d
if Value.value == 15 then
C15[#C15+1] = {address = Value.address, flag = Value.flags}
end
if Value.valu == 12 then
C12[#C12+1] = {address = Value.address, fl	gs = Value.flags}
end
if Value.value == 6 then
C6[#C6+1] = {address = Value.address, flags = Value.flags}
nd
if Value.value== 2 then
C2[#C2+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 8 then
C8[#C8+1]  {address = Value.address, flags = Value.flags}
end
if Value.value == 3 then
C3[#C3+1] = {address = Value.	ddress, flags = Value.flags}
end
if Value.value == 50 then
C50[#C50+1] = {address = Value.address, flags =Value.flags}
end
if Value.value == 42 then
C42[#C42+1] = {address = Value.address, flags = Value.flags}
en
if Value.value == 100 then
C100[#C100+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 10 then
C10[#C10+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 35 then
C35	#C35+1] = {address = Value.address flags = Value.flas}
end
if Value.value == 22 then
22[#C22+1] = {addres = Value.address, flags = Value.flags}
end
if Value.value == 80 then
C80[#C80+1] = {addess = Value.address, flags = Value.flags}
end
if Value.value == 60 the
C60[#C60+1] = {address = Value.addess, flags = Value.flags}
end
if Value.value == 18 ten
C18[#C18+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 25 then
C25[#C25+1] = address = Value.address, flags = Value.flags}
end
i Value.value == 9 hen
C9[#C9+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 16 then
C16[#C16+1] = {	ddress = Value.address, flags = V	lue.flags}
end
en
gg.clearResults(gg.getResultsCount())
gg.clearReslts(nil)
gg.toast("Carga Completada âï¸")
gg.sleep(1000)
gg.setVisible(true)

function tipoff()
local menutipo = gg.choice({"ð¹Free Fire Normal","ðTFree Fire Max"},nil,[[â¶ SELECCIONA TU VERSIÃN DE FF:]])
if menutipo == 1 then ffn() end
if menutipo == 2 hen ffm() end
XGX = -1
end

function ffn()
gg.setVisible(true)
function START()
gg.cle	rResults(gg.getReultsCount())
menu = gg.multiChoice({
"ðµ OPCIONES SEGURAS",
"ð´ OPCIONES RIESGOSAS", 
"â salir â"},nil,[[âª NBM-VIP | FFNormal v1.106 âF]])
if menu == nil then else
if menu [1] ==true the
 menusafe() end
i
 menu [2] ==true then menurisk() end
if menu [3] ==true then exit() end
end
XGCK= -1
end

function menusafe()
menus = gg.multiChoice({
"ð;¶ ANTENAS",
"ð¥ CURAR RÃPIDO",
"ð¥ REGEDITS",
"ð´ AYUDA APUNTADO",
"ð¼ BLANCO & NEGRO",
"â SIN RETROCESO ",
"ð¥ MAS CARGADOR",
"â AtrÃ¡s"},nil,"ðµ ACTIVA CON CONFIANZA")
if menus == nil then else
if menus [1]==true then anten	s() end
if menus [2] ==true then 		urar() end
if mens [3] ==true then reg() end
if me
us [4] ==true then aim() end
if menus [5] ==true then blayne() end
if 
	enus [6] ==true then rec() end
ifmenus [7] ==true then carga() end
if menus [8] ==tru then START() end
end
XGCK= -1
end

function antenas(
menua = gg.multiChoice({
"ð¡ ANTENA CUERPO",
"ð¡ ANTENA FINA",
"ð¡ ANTENA HOMBRO",
"ð¡ ANTENA BRAZO",
"ð¡ LASER MONEDAS",
" AtrÃ¡s"},nil,"â¶ ELIJE TU ANTENA FAVORITA:")
if menua == nil then else
if menua [1] =true then antena( end
if menua [2] ==true then antnaf() end
if menua [3] ==true then antenah() end
if menua [4] ==true then antenab() end
if menua [5] ==tre then item() endif menua [6] ==true then menusafe() end
end
XGCK= -1
end

function antena()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("QDB0A72BE1CFC2FB500000000", 1)
gg.refneNumber("Q00000000", 1)
gg.getResults(gg.getResultsount())
gg.editAll("Q33F3943", 1)
gg.clearResults(gggetResultsCount())
gg.searchNumber("QF36D9BBE2B0562B50000000", 1)
gg.refineNumbe("Q00000000", 1)
gg.getResults(gg.getResultsCount())
g.editAll("Q33F39543", 1)
g
.clearResults(gg.getResu
tsCount())
gg.toast("ACTIVADO ð¡")
end

function antenaf()
gg.setRanges(gg.REION_ANONYMOUS)
gg.searchNumber(";è³°ãã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll";è³°ãää", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.searchNumber(";ä¬ãã¾", gg.T	PE_WORD)
gg.getResults(gg.getResultsCount())
gg.ediAll(";ä¬ãää", gg.TYPE_WORD)
gg.clearResults(g.getResultsCount())
gg.tast("ACTIVADO ð¡")
end

fnction antenah()
gg.setRa
ges(gg.REGION_ANONYMOUS)
gg.searchNumber(";ã¾ë¼¼ã¾", gg.TYP	_WORD)
gg.getResuls(gg.getResultsCount())
gg.editAll(";ã¾ë¼¼ä", 
g.TYPE_WORD)
gg.clearResults(gg.geResultsCount())
g.searchNumber(";íë½ã¾", gg.T	PE_WORD)
gg.getResults(gg.getResultsCount())
gg.ediAll(";íë½ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
g.toast("ACTIVADO ð¡")
end

funcion antenab()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";áºë¼ã¾", gg.TYPE_WORD)
gg.getResults(
g.getResultsCount())
gg.editAll(";áºë¼ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.s
archNumber(";è±«ë¼ã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCout())
gg.editAll(";è±«ë¼ä", ggTYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.oast("ACTIVADO ð¡")
end

function item()
gg.setRan
es(gg.REGION_ANONYMOUS)
gg.searchNumber("h 69 00 6E 00 67 00 61 00 6D 00 65 00 2F 00 70 00 69 00 63 00 6B 00 75 00 70 00 2F 00 63 00 61 00 6E00 64 00 79 00 2F 00 6F 00 62 0 33 00 31 00 2F 00 69 00 6E 00 67 00 61 00 6D 00 65 00 74 00 6F 00 6B 00 65 00 6E 00", gg.T	PE_BYTE)
gg.getResults(gg.etResultsCount()) --ingame/pickup/candy/ob31/ingametoken
gg.editAll("h 65 00 66 00 66 00 65 00 63 00 74 00 73 00 2F 00 76 00 66 00 78 00 5F 00 69 00 6E 00 67 00 61 00 6D 00 65 00 5F 00 6C 00 61 00 73 0065 00 72 00", gg.TYPE_BYTE)
g
.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function curar()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";Kä ä", gg.TYPE_WORD)
gg.refineNumber(";ä", 
g.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.ditAll(";ä", gg.TYPE_WORD)
gg.clearResults(true)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("25D;2;25D::13", 16)
gg.refineNumb
r("2", 16)
gg.getResults(g.getResultsCount())
gg.editAll("1", 16)
gg.clearResults(true)
gg.setRanges(gg.REGION_AONYMOUS)
gg.searchNmber("3;0.56699997187", 16)
gg.refineNumber("3", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("2.9500004768", 16)
gg.clearResults(true)
gg.toast("ACTIVADO ð¥")
end

function reg()
menure
 = gg.choice({
"ð0¥ NBM VERSIÃN #1",
"ð¥ NBM VERSIÃN #2",
"ð¥ EDU VERIÃN #1",
"ð¥ EDU VERSIÃN #2",
"â AtrÃ¡s"},nil,"â¶ ELIJE TU REGEDIT FAVORITO:")
if menureg == 1 then v1() end
if menureg == 2 then v2() end
if menureg == 3 then v3() end
if menureg == 4 then v4() end
if menureg == 5 then menusafe() end
XGCK= -1

nd

function v1()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCont())
gg.editAll("20;40;35;45", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

function v2()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.gtResultsCount())
gg.editll("30;50;40;60", 16)
gg.clearResults(gg.getResultsCont())
gg.toast("ACTIVADO ð¥")
end

function v3()
ggsetRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;350;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCoun())
gg.editAll("25;45;60;80", 16)
gg.clearResults(gg.gtResultsCount())
gg.toast("ACTIVADO ð¥")
end

funcion v4()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNu	ber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("20;40;55;50", 16)
gg.clearRsults(gg.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

function aim()
gg.setRanges(gg.REGION_ANONYMOUS
gg.searchNumber("3FACCCCD3ACCCCDh", gg.TYPE_QWORD)
gg.getResults(gg.getResultsCunt())
gg.editAll("3FACCCCD42B3CCCDh", gg.TYPE_QWORD)
ggclearResults(gg.getResulsCount())
gg.toast("ACTIVADO ð´")
end

function blayne()
gg.setRanges(gg.REGION_VIDEO)
gg.searchNumber("1072216622", 4)
gg.getResultsgg.getResultsCount())
gg.editAll("1147786543", 4)
gg.		learResults(gg.getResultCount())
gg.searchNumber("h 00 00 70 40 00 00 00 3F", 1)gg.getResults(gg.getResutsCount())
gg.editAll("h 0 00 70 40 66 66 48 42", 1)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVAO ð¼")
end

function re		()
gg.loadResults(Recoil)
gg.getResults(gg.getResutsCount())
gg.editAll("2", gg.TYPE_FLOAT) 
gg.clearResults(true)
gg.toast("ACTIVADO â")
end

function carga()
gg.loadResults(C30)
gg.getResults(gg.getResultCount())
gg.editAll("50", 
g.TYPE_DWORD) -- 30
gg.clearesults(true)
gg.loadResu
ts(C20)
gg.getResults(gg.
etResultsCount())
gg.editAll("40", gg.TYPE_DWORD) -- 2
gg.clearResults(true)
gg.loadResults(C7)
gg.getResults(gg.getResultsCount())
gg.editAll("10", gg.TYPE_DWORD) -- 7
gg.clearResults(rue)
gg.loadResults(C4)
gg.getReults(gg.getResultsCount())
gg.editAll("8", gg.TYPE_DWORD) -- 4
gg.clearRsults(true)
gg.loadResults(C5)
g.getResults(gg.getResultsCount())
gg.editAll("10", gg.TYPE_DWORD) -- 5
gg.clearResults(true)
gg.loadResults(C15)
gg.getResuts(gg.getResultsCount())
gg.editAll("30", gg.TYPE_DW	RD) -- 15
gg.clearResults(true)
gg.loadResults(C12)
gg.getResults(gg.getResultsCount())
gg.editAll("22",gg.TYPE_DWORD) -- 12
gg.clearResult(true)
gg.loadReslts(C6)
gg.getResults(gg.getResutsCount())
gg.ediAll("12", gg.TYPE_DWORD) -- 6
gg.clearResults(true)
gg.loadResults(C2)
gg.getResults(gg.getResultsCount()
gg.editAll("4", gg.TYPE_DWORD) -- 2
gg.clearResults(tue)
gg.loadResults(C8)
gg.getResults(gg.getResultsCount())
gg.editAll("16", gg.TYPE_DWORD) -- 8
gg.clearResults(true)
gg.loadResults(C3)
gg.getResults(gg.geResultsCount())
gg.editAll("6", g.TYPE_DWORD) -- 3
ggclearResults(true)
gg.loadResults(C50)
gg.getResuls(gg.getResultsCount())
gg.editAl("80", gg.TYPE_DWOR) -- 50
gg.clearResults(true)
gg.loadResults(C42)
gggetResults(gg.getResultsCount())
gg.editAll("62", gg.TYPE_DWORD) -- 42
gg.clearResults(true)
gg.loadResults(C100)
gg.getResults(gg.getResultsCount())
gg.ediAll("120", gg.TYPE_DWORD) -- 100
gg.clearResults(true)
gg.loadResults(C10)
gg.getResults(gg.getResultsCout())
gg.editAll("20", gg.TYPE_DWORD) -- 10
gg.clearResuts(true)
gg.loadResults(C35)
gg.getResults(gg.getR
sultsCount())
gg.editAll("55", ggTYPE_DWORD) -- 35
gg.clearResults(true)
gg.loadResult(C22)
gg.getResults(gg.getResultsCount())
gg.editAll("42", gg.TYPE_DWORD) -- 22
gg.clearResults(true)
gg.loadResults(C80)
gg.getResults(gg.getResultsount())
gg.editAll("100", 
g.TYPE_DWORD) -- 80
gg.clearesults(true)
gg.loadResu
ts(C60)
gg.getResults(gg.etResultsCount())
gg.ediAll("80", gg.TYPE_DWORD) -- 6
gg.clearResults(true)
gg.loadResults(C18)
gg.getResults(gg.getResultsCount())
gg.editAll("28", gg.TYPE	DWORD) -- 18
gg.clearResult(true)
gg.loadResults(C25)
gg.getResults(gg.getResltsCount())
gg.editAll("4", gg.TYPE_DWORD) -- 25
gg.clearResults(true)
gg.loadRsults(C9)
gg.getResults(gg.getResultsCount())
gg.editAll("19", gg.TYPE_DWORD) -- 9
gg.clearResults(true)
gg.loadResults(C16)
gg.getResults(gg.getResultsCount())
gg.editAll("26", gg.TYE_DWORD) -- 16
gg.clearResu
ts(true)
gg.toast("ACTIVADO ð¥")
end

function menrisk()
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
if menur == nil ten else
if menur [1] == true then tienda() end
if menur [2] == true then airdrop() end
if menur [3] == true then gloo() ed
if menur [4] == true then correr() end
if menur [5] == true then aimm() end
if menu [6] == true then 		bz() end
if menur [7] == true the bmh1() end
if menr [8] == true then hsmeta() end
i menur [9] == true then inv() end
if menur [10] == tue then START() en

end
XGCK= -1
end

function tienda()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "(" 00 00 "ingame/i
teractionobject/modelingameshop"')
gg.getResults(g.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"',	)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ðª")
end

function airdrop()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "!" 00 00 "ingame/pickup/item/picku_airdrop" 00 00 00', 1) -- 1
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 0 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.cleaResults()
gg.sear		hNumber('Q "%" 00 00 "ingame/pickup/item/pickup_carepackage" 00 00 00', 1) -- 2
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ngame/sceneedit/sceneeditgroupbox"', 1)
gg.clearReults()
gg.searchNumber('Q "#" 00 00 "ingame/levelobject/levellockairdrp" 00 00 00', 1) -- 3
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "inga	e/sceneedit/sceneeditgroupbox"', 1)
gg.clearResult()
gg.searchNumber('Q 1E 00 00 00 "ingame/levelobjecttechairdrop" 00 00 00 00 00 00 00 00 00 00', 1) -- 4
gg.getResults(gg.getReultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clarResults()
gg.toast("ACTIVADO ð")
end

function glo()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "#" 00 00 "ingame/assistanitem/icewall_bunker" 00 00 00', gg.TYPE_BYTE)
gg.getResuls(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "effects/vfx_pet/vfx_petskill_robot"', gg.TYPE_BYTE)
gg.clearResults()
gg.oast("ACTIVDO ð²")
end

function correr()
g.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("2.80259693e-44F;1.20000004768F;0.18000000715F;1.40129846e-45F", 1mber("1075000115;1075000115::489", gg.TYPE_DWORD)
gg.getResults(gg.getResultsCount))
gg.editAll("-15", gg.TYP	_DWORD)
gg.clearResults()

g.toast("ACTIVADO ð ")
end

function cbz()
gg.setRages(32)
gg.searchNumber("h 62 00 6F 00 6E 00 65 00 5F 00 4C 00 65 00 66 00 74 00 5F 00 5 00 65 00 61 00 70 00 6F 00 6E 00", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h 62 00 6F 00 6E 00 65 00 5F 00 4E 00 65 00 6 00 6B 00", gg.TYPE_BYTE)
gg.		learResults()
gg.setRanges(32)
gg.searchNumber("h 23 AA A6 B8 46 0A CD 70", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAl("h 23 AA A6 B8 B2 F7 1F A4", gg.TYPE_BYTE)
gg.clearResu
ts()
gg.setRanges(32)
gg.searchNumber("h 57 27 13 BE C 26 27 BC 1F 02 81 B3 D6 2D 8B 29 73 4E D6 34 CB 5F 13 BE BA 55 7D 3F 00 00 80 3F 00 00 80 3F00 00 80 3F", gg.TYPE_BYTE)
g.getResults(gg.getResultsCount())
gg.editAll("h EC 51 B8 BD 3B 64 29 BD 1F 02 81 B3 D6 2D 8B 29 73 4E D6 34 CB 5F 13 BE BA 55 7D 3F 72 1C C7 3F 2 1C C7 3F 72 1C C7 3F", gg.TYPE_BYTE)
gg.clearResults()
g.setRanges(32)
gg.searchumber("h 7B D5 FE BD 6B F1 AE BC DA 65 8F B3 38 C2 15 2A 1F D 04 35 42 A6 36 BE 0D E5 7B 3F 01 00 80 3F 01 00 80 3F 00 00 80 3F", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCoun())
gg.editAll("h EC 51 B8 D 3B 64 29 BD DA 65 8F B3 38 C 15 2A 1F CD 04 35 42 A6 36 BE 0D E5 7B 3F 00 00 C0 3F 00 00 C0 3F 00 00 C0 3F", gg.TYPE_BYTE)
gg.clearResults()
gg.toast("ACTIVADO ð½")
end

fu
ction bmh1()
gg.setRanges32)
gg.searchNumber('Q 2C 0 00 00 "ingame/backweapon/backwp_bulletproofumbrella" 00 00', 1)
gg.getResults(g.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_eagle" 00 00', 1)
gg.getResults(g.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/back	eapon/backwp_g18" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
g
.clearResults()
gg.searchNumber(' 1E 00 00 00 "ingame/backweapon/backwp_usp45" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 	5 00 00 00 "ingame/av/uavpackage" 00 00', 1)
gg.clearR
sults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweaon/backwp_m1917" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpa		kage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/	ackweapon/backwp_uzi" 00 00', 1)
gg.getResults(gg.geResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResuts()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_wsp" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackag" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1D 0 00 00 "ingame/backeapon/backwp_m500" 00 00', 1)
gg.geResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults)
gg.searchNumber(	Q 1C 00 00 00 "ingame/backweapon/backwp_pan" 00 00', 1)
g.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearReults()
gg.searchNumber('Q 1F 00 00 00 "ingame/backweapon/backwp_katana" 00 00', 1)
gg.getResults(gg.getResutsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()gg.searchNumber('Q 20 00 00 00 "ingame/backweapon/backp_machete" 00 00', 	)
gg.getResults(gg.getResultsCount())
gg.editAll(' 15 00 00 00 "ingame/uav/uavpackage 00 00', 1)
gg.clearResults()
gg.searchNumber('Q "!" 00 00 "ingame/backweaon/backwp_crossbow" 00 00' 1)
gg.getResults(gg.getRsultsCount())
gg.editAll'Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.cle	rResults()
gg.searchNumbe('Q "$" 00 00 "ingame/backw
apon/backwp_baseballbat" 00 00', 1)
gg.getResults(gg.
etResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
ggclearResults()
gg.searchNmber('Q "&" 00 00 "ingame/backweapon/backwp_superheat	gun" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "i
game/uav/uavpackage" 00 00	, 1)
gg.clearResults()
gg.earchNumber('Q 1F 00 00 00 "ingame/backweapon/backwp_sckle" 00 00', 1)
gg.getReslts(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ngame/uav/uavpackage" 00 0', 1)
gg.clearResults()
gg.toast("ACTIVADO â¨")
end

function hsmeta()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber(":bone_Neck", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.
ditAll(":bone_Necs", gg.TYPE_BYTE)
gg.clearResults(tre)
gg.searchNumber(":bone_Hips", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCoun())
gg.editAll(":bone_Neck", gg.TYPE_BYTE)
gg.clearResults(true)
NBM("libil2cpp.o", Female, "C0035FD6")
gg.toast("ACTIVADO ð¯")
end


unction inv()
NBM("libil2cp.so", Guest, "E0030032C0035FD6")
gg.toast("ELIMINADA ð®")
end

function exit()
g.toast("Gracias por apoyar mis scipts NBM")
print("âââââââââââ")
print("â-âSCRIPTâVIPââ")
print("ââByâNiverBMââ")
print("ââââââââââââ")
os.exit()
end
while rue do if gg.isVisible(true) then XGCK = 1 gg.setVisible(false) end if XGCK == 1 then START() end end
end

function ffm()
gg.setVisble(true)
function START()
gg.clearResults(gg.getReultsCount())
menu = gg.multiChoice({
"ðµ OPCIONES EGURAS",
"ð´ OPCIONES RIESG	SAS", 
"â salir â"},nil,[[âª NBM-VIP | FFMax v2.106 âª]])
if menu == nil th
n else
if menu [1] ==true then menusafe() end
if menu [2] ==true then menurik() end
if menu [3] ==true then exit() end
end
XGCK= -1
end

function menusafe()
menus = gg.multiChoice({
"ð¶ ANTENAS",
"ð¥ CURA RÃPIDO",
"ð¥ REGEDITS",
"ð´ AYUDA APUNTADO",
"ð¼ BLANCO & NEGRO",
"â SIN RETR	CESO ",
"ð¥ MAS CARGADOR",
â AtrÃ¡s"},nil,"ðµ ACIVA CON CONFIANZA")
if menus == nil then else
if menu [1] ==true then antenas()end
if menus [2] ==true t
en curar() end
if menus [] ==true then reg() end
i
 menus [4] ==true then aim() end
if menus [5] ==truethen blayne() end
if menus [6] ==true then rec() en

if menus [7] ==true then carga() end
if menus [8] ==true then START() end
end
GCK= -1
end

function ante
as()
menua = gg.multiChoice({
"ð¡ ANTENA CUERPO",
"ð¡ ANTENA FINA",
"ð¡ ANTENA HOMBRO",
"ð¡ ANTENA BRAZO",
"ð¡ LASER MONEDAS",
"â AtrÃ¡s"},nil,"â¶ ELIJE TU ANTENA FAVORITA:")
if menua == nil then else
if menua [1] ==true then antena() en
if menua [2] ==true then antenaf() end
if menua [3] ==true then antenah() end
if menua [4] ==true then antenab() end
if menua [5] ==true then item() end
if menua [6] ==true then menusafe() end
end
XGCK= -1
end
function antena()
gg.setanges(gg.REGION_ANONYMOUS)
gg.searchNumber("QDB0A72BE1CF2FB500000000", 1)
gg.refineNumber("Q00000000", 1)
gg.getesults(gg.getResultsCount())
gg.editAll("Q33F39543", 1)
gg.clearResults(gg.getResultsCount())
gg.searchNumber("QF36D9BBE2B0562B500000000", 1)
gg.refineNumber("Q00000000", 1)
gg.getResults(
g.getResultsCount())
gg.editAll("Q33F39543", 1)
gg.clearResults(gg.getResultsCunt())
gg.toast("ACTIVADO ð¡")
ed

function anten	f()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(;è³°ãã¾", gg.TYPE_WORD)
gg.getResults(gg.getResutsCount())
gg.editAll(";è³°ãää", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCont())
gg.searchNumber(";ä¬ãã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";ä¬ãää", gg.TYPE_WORD)
gg.clearResults(gg.getResulsCount())
gg.toast("ACTIVADO ð¡")
end

function antenah()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";ã¾ë¼¼ã¾", gg.TYPE_WORD)
gg.getResults(gg.getR
sultsCount())
gg.editAll(";ã¾ë¼¼ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.searchNumber(";íë½ã¾", gg.TYPE_WORD)
gg.getResults(gg.getesultsCount())
ggeditAll(";íë½ä", gg.TYPE_WOR)
gg.clearResults(gg.getResultsCount())
gg.oast("ACTIVADO ð¡")
end

function antenab()
gg.setRanges(gg.REGION_ANONYMOUS)
g
.searchNumber(";áºë¼ã¾", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())gg.editAll(";áºë¼ä",gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
g.searchNumber(";è±«ë¼ãZ", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";è±«ë¼ä", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")

nd

function item()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("h 69 00 6E00 67 00 61 00 6D 00 65 00 2F 0 70 00 69 00 63 00 6B 00 75 00 70 00 2F 00 63 00 61 00 6E 00 64 00 79 00 2F 00 6F 00 62 00 3 00 31 00 2F 00 69 00 6E 00 6700 61 00 6D 00 65 00 74 00 6F 00 6B 00 65 00 6E 00", gg.TYPE_YTE)
gg.getResults(gg.getesultsCount()) --ingame/pickup/candy/ob31/ingametoken
gg.editAll("h 65 00 66 00 66 00 65 00 63 00 74 00 73 00 2F 00 76 00 66 00 78 00 5F 00 69 00 6E 00 67 00 61 00 6D 00 6500 5F 00 6C 00 61 00 73 00 65 00 72 00", gg.TYPE_BYTE)
gg.clarResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¡")
end

function curar()
gg.seRanges(gg.REGION_AN	NYMOUS)
gg.searchNumber(";Kä ä", gg.TYPE_WORD)
gg.refineNumber(";ä", gg.TYPE_WORD)
gg.getResults(gg.
etResultsCount())
gg.editAll(";ä", gg.TYPE_WORD)
g.clearResults(true)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("25D;2;25D::13", 16)
gg.refineNumber("2", 16)
gg.getResults(gg.getResultsCount())
gg.editA
l("1", 16)
gg.clearResults(true)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("3;0.56699997187", 16)
gg.refineNumber("3", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("2.95000004768", 16)
gg.clearResults(tre)
gg.toast("ACTIVADO ð¥")
end


unction reg()
menreg = gg.choice({
"ð¥ NBM VERSIÃ/N #1",
"ð¥ NBM VERSIÃN #2",
"ð¥ EDU VERSIÃN #1",
"ð¥ EDU VERSIÃN #2",
"â AtrÃ¡s"},nil,"â¶ ELIJE TU REGEDIT FAVORITO:")
if 	enureg == 1 then v1() end
if menureg == 2 then v2() end
if menureg == 3 then v3() end
if menureg == 4 thn v4() end
if menureg == 5 then menusafe() end
XGCK= -1
end

function v1()
gg.setRanges(gg.REGION_ANONYMOUS
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getReults(gg.getResultsCount())
gg.editAll("20;40;35;45", 16)
gg.clearResults(gg.getResultsCount())
gg.toast(ACTIVADO ð¥")
end

function v2()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll(30;50;40;60", 16)
gg.clearResults(g
.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

fnction v3()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searc
Number("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("25;45;60;80", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¥")
end

function v4()
gg.setRanges(gg.REGION_ANONYMOS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResutsCount())
gg.editAll("20;40;55;50", 16)
gg.clearResults(gg.getResultsCount())
gg.toas("ACTIVADO ð¥")
end

function aim()
gg.setRanges(gg.REGION_ANONYMOUS)
ggsearchNumber("3FACCCCD3FACCCCDh", gg.TYPE_QWORD)
gg.getR
sults(gg.getResultsCount())
gg.editAll("3FACCCCD42B3CCDh", gg.TYPE_QWORD)
gg.clearResuls(gg.getResultsCont())
gg.toast("ACTIVADO ð´")
en


function blayne()
gg.setRanges(gg.REGION_VIDEO)
gg.earchNumber("107221622", 4)
gg.getResults(gg.getResutsCount())
gg.ediAll("1147786543", 4)
gg.clearResult(gg.getResultsCount())
gg.searchNumber("h 00 00 70 40 00 00 00 3F", 1)
gg.etResults(gg.getResultsCount())
gg.editAll("h 00 00 70 40 66 66 48 42", 1)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO ð¼")
end

function rec()

g.loadResults(Recoil)
gg.getResuts(gg.getResultsCount())
gg.editAll("2", gg.TYPE_FLOT) 
gg.clearResult(true)
gg.toast("ACTIVADO â")
en

function carga()
gg.loadResults(C30)
gg.getResult(gg.getResultsCount())
gg.editAll("50", gg.TYPE_DWORD) -- 30
gg.clearReslts(true)
gg.loadResults(C20)
gg.getResults(gg.getResultsCount())
gg.editAll("40", g
.TYPE_DWORD) -- 20
gg.clearResults(true)
gg.loadResuls(C7)
gg.getResults(gg.getResultsCount())
gg.editA
l("10", gg.TYPE_DWOR) -- 7
gg.clearResults(true)
gg.ladResults(C4)
gg.gtResults(gg.getResultsCount())
gg.editAll("8", gg.TYPE_DWORD) -- 4
gg.clearResults(tru)
gg.loadResults(C5)
gg.getResults(gg.getResultsCont())
gg.editAll("10", gg.TYPE_DWORD) -- 5
gg.clearResults(true)
gg.loadResults(C15)
gg.getResults(gg.getResultsCount())
gg.editAll("30", gg.TYPE_DWORD) -- 15
gg.clearResults(true)
gg.loadResults(C12)
gg.getResuls(gg.getResultsCount())
gg.editAll("22", gg.TYPE_DWORD) -- 12
gg.clearResults(true)
gg.loadResults(C6)
gg.etResults(gg.getResultsCount())
gg.editAll("12", g
.TYPE_DWORD) -- 6
gg.clearResults(true)
gg.loadResult(C2)
gg.getResults(gg.getResultsCount())
gg.editAl
("4", gg.TYPE_DWORD) -- 2
gg.clearResults(true)
gg.loadResults(C8)
gg.getResults(gg.getResultsCount())
gg.editAll("16", gg.TYE_DWORD) -- 8
gg.clearResults(true)
gg.loadResults(C3)
gg.getResults(gg.getResultsCou
t())
gg.editAll("6, gg.TYPE_DWORD) -- 3
gg.clearResults(true)
gg.loadResults(C50)
gg.getResults(gg.getResultsCount())
gg.editAll("80", gg.TYPE_DWORD) -- 50
gg.clearResults(true)
g.loadResults(C42)
gg.getResultsgg.getResultsCount())
gg.editAll("62", gg.TYPE_DWORD) -- 42
gg.clearResults(true)
gg.loadResults(C100)
gg.
etResults(gg.getResultsCount())
gg.editAll("120", gg.TYPE_DWORD) -- 100

g.clearResults(true)
gg.loadResuts(C10)
gg.getResults(gg.getResultsCount())
gg.ediAll("20", gg.TYPE_DWORD) -- 10
gg.clearResults(true)
gg.loadResults(C35)
gg.getResults(gg.getResultsCount())
gg.editAll("55", gg.TYPE_DWORD) -- 35
gg.clearResult(true)
gg.loadReslts(C22)
gg.getResults(gg.getResltsCount())
gg.ed
tAll("42", gg.TYPE_DWORD) -- 22
gg.clearResults(true)
gg.loadResults(C80)
gg.getResults(gg.getResultsCoun())
gg.editAll("100", gg.TYPE_DWORD) -- 80
gg.clearResu
ts(true)
gg.loadResults(C60)
gg.getResults(gg.getR
sultsCount())
gg.editAll("80", ggTYPE_DWORD) -- 60
gg.clearResults(true)
gg.loadResult(C18)
gg.getResults(gg.getResultsCount())
gg.editAll("28", gg.TYPE_DWORD) -- 18
gg.clearResults(true)
gg.ladResults(C25)
gg.getResults(gg.getResultsCount())gg.editAll("45", g
.TYPE_DWORD) -- 25
gg.clearResults(true)
gg.loadResuls(C9)
gg.getResults(gg.getResultCount())
gg.editAll("19", gg.TYPE_DWORD) -- 9
gg.clearResults(true)
gg.loadResults(C16)
gg.getResults(gg.getResultsCount())
g.editAll("26", gg.TYPE_DWORD) -- 16
gg.clearResults(tue)
gg.toast("ACTIVADO ð¥")
end
function menurisk()
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
"â AtÃ¡s"},nil,"ð´ ACTIVA BAJO TU RIESGO")
if menur == nil then else
if menur [1] == true ten tienda() end
i
 menur [2] == true then airdrop()end
if menur [3] == true then gloo() end
if menur [4] == true then correr() end
if menur [5] == rue then aimm() end
if menur [6] == true then cbz() nd
if menur [7] == true t
en bmh1() end
if menur [8] == true then hsmeta() end
if menur [9] == true then inv() end
if menur [10] == true then START() end
endXGCK= -1
end

function tie
da()
gg.setRanges(gg.REGIO_ANONYMOUS)
gg.searchNumber'Q "(" 00 00 "ingame/interactionobject/modelingameshop"')
gg.getResults(gg.geResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox',1)
gg.clearResults(gg.getResultsCount())
gg.toast"ACTIVADO ðª")
end

function airdrop()
gg.setRange(gg.REGION_ANONYMOUS)
gg.seachNumber('Q "!" 00 00 "inga
	e/pickup/item/pickup_air
rop" 00 00 00', 1) -- 1
gg.g
tResults(gg.getResultsCont())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.searchNumber('Q "%" 00 00 "ingame/pickup/item/pickup_carepackag
" 00 00 00', 1) -- 2
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.searchNumber('Q "#" 00 00 "ingame/levelobject/levellockairdrop" 00 00 00', 1) -- 3
gg.getResuls(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneedit
roupbox"', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/levelobject/techairdrop" 00 00 00 00 00 00 00 00 00 00', 1) -- 4
gggetResults(gg.getResultsCount())
gg.editAll('Q 22 0 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.toast("ACTIVADO ð")
end

function gloo()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNu
	ber('Q "#" 00 00 "ingame/assistantitem/icewall_bunker" 00 00 00', gg.TYPE_BYTE)
gggetResults(gg.getResultsCount())
gg.editAll('Q 22 0 00 00 "effects/vfx_pet/vfx_petskill_robot"', gg.TYPE_BYTE)
gg.clearResults()
g.toast("ACTIVADO ð²")
end

functon correr()
gg.seRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("2.80259693e-44F;1.20000004768F;0.18000000715F;1.40129846e-45F", 16)
gg.refineNumber("1.20000004768", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("2.2", 1)
gg.clearResults(gg.getResultsCount())
gg.toast("ATIVADO ð")
end

function aimm()
gg.setRanges(gg.R	GION_ANONYMOUS)
gg.s
archNumber("1075000115;1075000115::489", gg.TYPE_DWORD)
gggetResults(gg.getResultsCount())
gg.editAll("-15", gg.TYPE_DWORD)
gg.clearResults()
ggtoast("ACTIVADO ð ")
end

function cbz()
gg.setRanges(32)
gg.searchNumber("h 62 00 6F 00 6E 00 65 00 5F 00 4C 00 65 00 66 00 74 00 F 00 57 00 65 00 61 00 70 00 6F 00 6E 00", gg.TYPE_BYTE)
gg.
etResults(gg.getResultsCount())
gg.editAll("h 62 00 6F 00 6E 00 65 00 5F 00 4E 00 65 00 63 00 6B 00", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(32)
gg.searchNumbe("h 23 AA A6 B8 46 0A CD 70", gg.TYPE_BYTE)
gg.getResultsgg.getResultsCount())
gg.editAll("h 23 AA A6 B8 B2 F7 1F A4", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("h 57 27 13 BE C5 26 27 BC 1F 02 81 B3 D6 2D 8B 29 73 4E D6 34 CB 5F 13 BE BA 55 7D 3F 00 00 80 3F 00 0 80 3F 00 00 80 3F", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h EC 51 B8 BD 3B 64 29 BD 1F 02 81 B3 D6 2D 8B 29 73 4E D6 34 CB 5F 13 BE BA 55 7D 3F 72 1CC7 3F 72 1C C7 3F 72 1C C7 3F", gg.TYPE_BYTE)
gg.clearResu
ts()
gg.setRanges(32)
gg.searchNu
	ber("h 7B D5 FE BD 6 F1 AE BC DA 65 8F B3 38 C2 15 2A 1F CD 04 35 42 A6 36 BE 0D E5 7B 3F 01 00 80 3F 01 00 80 3F 00 00 80 3F", gg.TYPE_BYTE)
g.getResults(gg.getResultsCount()
gg.editAll("h EC 51 B8 BD 3B 64 29 BD DA 65 8F B3 38 C2 15 2A 1F CD 04 35 42 A6 36 BE 0D E5 7B 3F 00 00 C0 3F 00 00 C0 3F 00 00 C0 3F", gg.TYPE_BYTE)
gg.clearResults()
gg.toast("ACTIVADO ð½")
end

function bmh1()
gg.setRanges(32)
gg.searchNumber('Q 2C 00 00 00 "ingame/backweapon/backwp_bulletproofumbrella" 00 00', 1)
gg.g
tResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_eagle 00 00', 1)
g.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpa		kage" 00 00	, 1)
gg.clearResults()
gg.searchNumber('Q', 1)
gg.getResults(gg.getResultsCount())
gg.editA
l('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.c
earResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_m1917" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAl('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clarResults()
gg.searchNumbr('Q 1C 00 00 00 "ingame/backweapon/backwp_uzi" 00 00',1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.cleaResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_wsp" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearRsults()
gg.searchNumber(' 1D 00 00 00 "ingame/backweapon/backwp_m500" 00 00', 1)
gg.getResults(gg.getResulsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapn/backwp_pan" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackae" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1F 0 00 00 "ingame/backweapon/backwp_katana" 00 00', 1)
gggetResults(gg.getResultsCount())
gg.editAll('Q 15 0 00 00 "ingame/uav/uavpackage" 00 0', 1)
gg.clearResu
ts()
gg.searchNumber('Q 20 00 00 00 "ingame/backweaponbackwp_machete" 00 00', 1)
gg.getResults(gg.getResulsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()

g.searchNumber('Q !" 00 00 "ingame/backweapon/backwp_crossbow" 00 00', 1)gg.getResults(gg.getResultsCoun())
gg.editAll('Q 	5 00 00 00 "ingame/uav/uavpackage" 0 00', 1)
gg.clearResults()
gg.searchNumber('Q "$" 00 00 "ingame/backweapon/backwp_baseballbat" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q "&" 00 00 "ingame/backweapon/backwp_superheat_gu" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.
ditAll('Q 15 00 00 00 "inga
	e/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1F 00 00 00 "ing	me/backweapon/backwp_sick
e" 00 00', 1)
gg.getResults(gg.getResultsCount())
ggeditAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 	)
gg.clearResults()
gg.toast("ACTIVADO â¨")
end

function hsmeta()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber(":bone_Neck", gg.T	PE_BYTE)
gg.getResults(gg.etResultsCount())
gg.ediAll(":bone_Necs", gg.TYPE_B	TE)
gg.clearResults(true)
gg.searchNumber(":bone_Hips", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll(":bone_Neck", 
g.TYPE_BYTE)
gg.clearResults(true)
NBM("libil2cpp.so", Female, "C0035FD6")
gg.toast("ACTIVADO ð¯")
end

function inv()
NBM("libl2cp.so", Guest, "E0030032C0035FD6")
gg.toat("ELIMINADA ð®")
end

function xit()
gg.toast("Gracias por apoyar mis scipts NBM")
print("ââââââââââââ")
print("âSRIPTâVIPââ")
print("ââByâNiverBMââ")
print("ââââââââââââ")
os.eit()
end
while true do if gg.isVisible(rue) then XGCK = 1 gg.setVisible(fals
) end if XGCK == 1 then START() end endend

while true do if gg.isVisible(true) then XGX = 1 gg.setVisible(false) end if XGX == 1 then tipoff() end
endâââ")
print("ââSCRIPTâVIPââ")
print("ââByâNiverBMââ")
print("â2âââââââââââ")
os.eit()
end
while true do if gg.isVisible(true) then XGCK = 1 gg.setVisible(false) end if XGCK == 1 then START() end end
end

while true do 
f gg.isVisible(true) then XGX = 1 gg.setVisib
e(false) end if XGX == 1 then tipoff() end
endâââ")
print("ââSCRIPTâVIPââ")
print("ââByâNiverBMââ")
print("â2âââââââââââ")
os.eit()
end
while true d if gg.isVisible(true) then XGCK = 1 gg.setViible(false) end if XGCK == 1 then START() end e
d
end

while true do 
f gg.isVisible(true) then XGX = 1 gg.setVisib
e(false) end if XGX == 	 then tipoff() end
end