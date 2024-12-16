load(string.char(table.unpack({local let = {}
local internal_storage = {
	[1] = "/sdcard",
	[2] = "/storage/emulated/0"
}
local Notes = {
	[1] = "/sdcard/Notes",
	[2] = "/storage/emulated/0/Notes"
}
local contentcache = {
	[1] = "/sdcard/Notes/.contentcache",
	[2] = "/storage/emulated/0/Notes/.contentcache"
}

local function base64(LuaR)
    local char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
        return ((LuaR:gsub('.', function(x)
    local r, b = '', x:byte()
    for i = 8, 1, -1 do
        r = r ..(b % 2^i - b % 2^(i-1) > 0 and '1' or '0')
    end
        return r
    end) ..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
    if (#x < 6) then return '' end
    local c = 0
    for i = 1, 6 do
        c = c + (x:sub(i, i) == '1' and 2^(6 - i) or 0)
    end
        return char:sub(c + 1, c + 1)
    end) ..({'', '==', '=' })[#LuaR % 3 + 1])
end
local admin = 'admin'
local key = 'public_html/cPanel'
local Basic = base64(admin ..':'.. key)

local function VERIFICATION()
    local condition = false
    if file.exists(internal_storage[1]) then
        local files = file.list(Notes[1])
        for _, path in ipairs(files) do
            if path == contentcache[1] then
                condition = true
                break
            end
        end
    elseif file.exists(internal_storage[2]) then
        local files = file.list(Notes[2])
        for _, path in ipairs(files) do
            if path == contentcache[2] then
                condition = true
                break
            end
        end
    end
    if condition then
        if file.exists(internal_storage[1]) then
            if file.read(contentcache[1]):match('{"Username":".*"}') then
                local https = gg.makeRequest("https://andrxsgranda.online/cPanel/%24%20Home/%24%20Sign%20in.php?url=clientes.html&Page=Clientes", {["Authorization"] = "Basic " ..Basic}, file.read(contentcache[1])).content
                if https == nil then
                    return gg.alert("📶 SIN CONEXIÓN A INTERNET")
                end
                    pcall(load(https))
            else
                gg.alert("👾 LA COMPILACIÓN DE LOS RECURSOS DEL SISTEMA HA FALLADO")
                gg.toast("Reiniciando...", nil)
                local prompt = gg.prompt({
                "INGRESAR USUARIO 👤"
                }, nil, {
                "text"
                })
                if not prompt then
                    os.exit()
                end
                if prompt[1]:match("^%s*$") then
                    gg.alert("👤 USUARIO VACÍO")
                    return os.exit()
                end
                gg.command([=[echo '{"Username":"']=].. prompt[1] ..[=['"}' > ]=]..contentcache[1])
                local c = file.read(contentcache[1])
                c = string.gsub(c, "\n$", "")
                io.open(contentcache[1], "w"):write(c):close()
                local https = gg.makeRequest("https://andrxsgranda.online/cPanel/%24%20Home/%24%20Sign%20in.php?url=clientes.html&Page=Clientes", {["Authorization"] = "Basic " ..Basic}, file.read(contentcache[1])).content
                if https == nil then
                    return gg.alert("📶 SIN CONEXIÓN A INTERNET")
                else
                    return pcall(load(https))
                end
            end
            elseif file.exists(internal_storage[2]) then
                if file.read(contentcache[2]):match('{"Username":".*"}') then
                    local https = gg.makeRequest("https://andrxsgranda.online/cPanel/%24%20Home/%24%20Sign%20in.php?url=clientes.html&Page=Clientes", {["Authorization"] = "Basic " ..Basic}, file.read(contentcache[2])).content
                    if https == nil then
                        return gg.alert("📶 SIN CONEXIÓN A INTERNET")
                    end
                    pcall(load(https))
                else
                    gg.alert("👾 LA COMPILACIÓN DE LOS RECURSOS DEL SISTEMA HA FALLADO")
                    gg.toast("Reiniciando...", nil)
                    local prompt = gg.prompt({
                    "INGRESAR USUARIO 👤"
                    }, nil, {
                    "text"
                    })
                    if not prompt then
                        os.exit()
                    end
                    if prompt[1]:match("^%s*$") then
                        gg.alert("👤 USUARIO VACÍO")
                        return os.exit()
                    end
                    gg.command([=[echo '{"Username":"']=].. prompt[1] ..[=['"}' > ]=]..contentcache[2])
                    local c = file.read(contentcache[2])
                    c = string.gsub(c, "\n$", "")
                    io.open(contentcache[2], "w"):write(c):close()
                    local https = gg.makeRequest("https://andrxsgranda.online/cPanel/%24%20Home/%24%20Sign%20in.php?url=clientes.html&Page=Clientes", {["Authorization"] = "Basic " ..Basic}, file.read(contentcache[2])).content
                    if https == nil then
                        return gg.alert("📶 SIN CONEXIÓN A INTERNET")
                    else
                        return pcall(load(https))
                    end
                end
            end
        else

        local colorAlert = gg.colorAlert("<font color='#3b464c'>GG NBM VIP 2</font>", "✪ Te damos la bienvenida a tu producto NBM VIP. ¿Deseas continuar?", "SÍ", "NO")
        if colorAlert == 0 or colorAlert == 2 then
        print("¡Nos vemos pronto, Niveriano de 💙! 👋")
            return os.exit()
        end
        if file.exists(internal_storage[1]) then
                local prompt = gg.prompt({
                "INGRESAR USUARIO 👤"
                }, nil, {
                "text"
                })
                if not prompt then
                    os.exit()
                end
                if prompt[1]:match("^%s*$") then
                    gg.alert("👤 USUARIO VACÍO")
                    return os.exit()
                end
                gg.command([=[echo '{"Username":"']=].. prompt[1] ..[=['"}' > ]=]..contentcache[1])
                local c = file.read(contentcache[1])
                c = string.gsub(c, "\n$", "")
                io.open(contentcache[1], "w"):write(c):close()
                let["TOKENs"] = '{"Usuario":"' .. prompt[1] .. '"}'
                local http = gg.makeRequest("https://andrxsgranda.online/cPanel/%24%20Home/%24%20Registrar%20TOKENs.php?url=tokens.html&Page=TOKENs", {["Authorization"] = "Basic " ..Basic}, let["TOKENs"]).content
                if http == nil then
                    return gg.alert("📶 SIN CONEXIÓN A INTERNET")
                end
                if string.find(http, "📳 EL USUARIO INGRESADO YA ESTÁ REGISTRADO EN OTRO DISPOSITIVO") or 
   string.find(http, "👤 TU USUARIO NO FUE ENCONTRADO EN EL SISTEMA") then
                    if string.find(http, "📳 EL USUARIO INGRESADO YA ESTÁ REGISTRADO EN OTRO DISPOSITIVO") then
                        gg.alert("📳 EL USUARIO INGRESADO YA ESTÁ REGISTRADO EN OTRO DISPOSITIVO")
                    elseif string.find(http, "👤 TU USUARIO NO FUE ENCONTRADO EN EL SISTEMA") then
                        gg.alert("👤 TU USUARIO NO FUE ENCONTRADO EN EL SISTEMA")
                    end
                    os.remove(contentcache[1])
                    return os.exit()
                else
                    pcall(load(http))
                end
                
                gg.sleep(100)
                
                local https = gg.makeRequest("https://andrxsgranda.online/cPanel/%24%20Home/%24%20Sign%20in.php?url=clientes.html&Page=Clientes", {["Authorization"] = "Basic " ..Basic}, file.read(contentcache[1])).content
                if https == nil then
                    return gg.alert("📶 SIN CONEXIÓN A INTERNET")
                else
                    return pcall(load(https))
                end
        elseif file.exists(internal_storage[2]) then
                local prompt = gg.prompt({
                "INGRESAR USUARIO 👤"
                }, nil, {
                "text"
                })
                if not prompt then
                    os.exit()
                end
                if prompt[1]:match("^%s*$") then
                    gg.alert("👤 USUARIO VACÍO")
                    return os.exit()
                end
                gg.command([=[echo '{"Username":"']=].. prompt[1] ..[=['"}' > ]=]..contentcache[2])
                local c = file.read(contentcache[2])
                c = string.gsub(c, "\n$", "")
                io.open(contentcache[2]):write(c):close()
                let["TOKENs"] = '{"Usuario":"' .. prompt[1] .. '"}'
                local http = gg.makeRequest("https://andrxsgranda.online/cPanel/%24%20Home/%24%20Registrar%20TOKENs.php?url=tokens.html&Page=TOKENs", {["Authorization"] = "Basic " ..Basic}, let["TOKENs"]).content
                if http == nil then
                    return gg.alert("📶 SIN CONEXIÓN A INTERNET")
                end
                if string.find(http, "📳 EL USUARIO INGRESADO YA ESTÁ REGISTRADO EN OTRO DISPOSITIVO") or 
   string.find(http, "👤 TU USUARIO NO FUE ENCONTRADO EN EL SISTEMA") then
                    if string.find(http, "📳 EL USUARIO INGRESADO YA ESTÁ REGISTRADO EN OTRO DISPOSITIVO") then
                        gg.alert("📳 EL USUARIO INGRESADO YA ESTÁ REGISTRADO EN OTRO DISPOSITIVO")
                    elseif string.find(http, "👤 TU USUARIO NO FUE ENCONTRADO EN EL SISTEMA") then
                        gg.alert("👤 TU USUARIO NO FUE ENCONTRADO EN EL SISTEMA")
                    end
                    os.remove(contentcache[2])
                    return os.exit()
                else
                    pcall(load(http))
                end
                
                gg.sleep(100)
            
                local https = gg.makeRequest("https://andrxsgranda.online/cPanel/%24%20Home/%24%20Sign%20in.php?url=clientes.html&Page=Clientes", {["Authorization"] = "Basic " ..Basic}, file.read(contentcache[2])).content
                if https == nil then
                    return gg.alert("📶 SIN CONEXIÓN A INTERNET")
                else
                    return pcall(load(https))
                end
        end
    end
    
end

if file.exists(Notes[1]) or file.exists(Notes[2]) then
    gg.toast("Conectando a Internet...")
    gg.sleep(100)
else
    if file.exists(internal_storage[1]) then
        file.mkdir(Notes[1])
    elseif file.exists(internal_storage[2]) then
        file.mkdir(Notes[2])
    else
        return gg.alert("📳 TU DISPOSITIVO NO ES COMPATIBLE PARA NUESTRO PRODUCTO")
    end    
end

VERIFICATION();})))()
