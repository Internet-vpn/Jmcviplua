local URL = "https://ogltn.com/ARCHIVOS_VIP/PanelNBM/Login.php"

function SPLIT(A1, A2)

local Result = {}

for Match in (A1 .. A2):gmatch("(.-)" .. A2) do 

table.insert(Result, Match)

end 

return Result

end

function JsonString(Text) 

local AA = "" 

for UU = 2,#Text,2 do 

if UU == 2 then AA = "{" .. '"' .. Text[UU-1] .. '":' .. '"' .. Text[UU] .. '"' 

else AA = AA .. ',"' .. Text[UU-1] .. '":' .. '"' .. Text[UU] .. '"' end 

if UU == #Text then 

AA = AA .. "}" 

end;end 

return AA 

end

function ReadUser(Path)

local DATA = io.open(Path, "r") 

if not DATA then return nil end  

return DATA:read("*a")

end 

function string:getUID() 

local class = luajava.bindClass 

local activity = nil 

xpcall(function() 

activity = class("android.ext.Tools"):getContext() 

end, function() 

activity = class("android.ext.Tools"):e() 

end) 

local Secure = class("android.provider.Settings$Secure") 

local UID = Secure:getString(activity:getContentResolver(), Secure.ANDROID_ID) 

return UID 

end 

local Device = string.getUID() .. "NBM"

function LOGIN()

if ReadUser(gg.EXT_STORAGE .. "/Android/.UserConfigNew") ~= nil and string.len(ReadUser(gg.EXT_STORAGE .. "/Android/.UserConfigNew"))  > 2 then

local Dialog = gg.alert("Anteriormente Has Iniciado Seción En Este Dispositivo!\n\n¿Desea Continuar?","Continuar ✔️")

if not Dialog then return end

if Dialog == 1 then

local Username = ReadUser(gg.EXT_STORAGE .. "/Android/.UserConfigNew")

Internet = gg.makeRequest(URL,nil,Username).content

if Internet == nil then gg.alert("📲 Sin Conexión a Internet") os.exit() end

if not load('Script = '.."string.char(table.unpack(".. "{" .. Internet .. "}))") then

gg.alert(Internet)

io.output(gg.EXT_STORAGE .. "/Android/.UserConfigNew", "r"):write("")

os.exit()

else

load('Script = '.."string.char(table.unpack(".. "{" .. Internet .. "}))")() 

pcall(load(Script))

os.exit()

end

else

io.output(gg.EXT_STORAGE .. "/Android/.UserConfigNew", "r"):write("")

end

end

local MenuLogin = gg.prompt({"👤 INGRESE SU USUARIO :"},{},{"text"})

if not MenuLogin then return os.exit() end

local JSON = JsonString({"Username", MenuLogin[1],"ANDROID_ID", Device})

Internet = gg.makeRequest(URL,nil,JSON).content

if Internet == nil then gg.alert("📲 Sin Conexión a Internet") os.exit() end

if not load('Script = '.."string.char(table.unpack(".. "{" .. Internet .. "}))") then

gg.alert(Internet)

io.output(gg.EXT_STORAGE .. "/Android/.UserConfigNew", "r"):write("")

os.exit()

else

load('Script = '.."string.char(table.unpack(".. "{" .. Internet .. "}))")() 

pcall(load(Script))

io.output(gg.EXT_STORAGE .. "/Android/.UserConfigNew","r"):write(JSON)

os.exit()

end;end

LOGIN()
