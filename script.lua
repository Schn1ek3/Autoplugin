--[[ 
	Autoinstall plugin

	Licensed by Creative Commons Attribution-ShareAlike 4.0
	http://creativecommons.org/licenses/by-sa/4.0/
	
	Dev: TheHeroeGAC
	Designed By Gdljjrod & DevDavisNunez.
	Collaborators: BaltazaR4 & Wzjk.
]]

--Activamos Paleta de Colores Precargados
color.loadpalette()

--Show splash
splash.zoom("resources/splash.png")

--Imagen de Fondo
back = image.load("resources/back.png")
adr = image.load("resources/adr.png")
psvita = image.load("resources/psvita.png")

--Sprites para Botones
buttonskey = image.load("resources/buttons.png",20,20)
buttonskey2 = image.load("resources/buttons2.png",30,20)

if os.access() == 0 then
	if back then back:blit(0,0) end
	screen.flip()
	os.message(language["STRING_UNSAFE_MODE"])
	os.exit()
end

--Updater
if wlan.strength() > 55 then dofile("git/updater.lua") end

-- Loading language file

function update_language(newlang)
	for k, v in pairs(newlang) do
		language[k] = v
	end
end

language = {}
dofile("lang/ENGLISH_US.lua")
language = ENGLISH_US
-- Official Translations
if files.exists("lang/"..os.language()..".lua") then
	dofile("lang/"..os.language()..".lua")
	if os.language() == "CHINESE_S" then
		update_language(CHINESE_S)
	elseif os.language() == "CHINESE_T" then
		update_language(CHINESE_T)
	elseif os.language() == "FRENCH" then
		update_language(FRENCH)
	elseif os.language() == "GERMAN" then
		update_language(GERMAN)
	elseif os.language() == "ITALIAN" then
		update_language(ITALIAN)
	elseif os.language() == "JAPANESE" then
		update_language(JAPANESE)
	elseif os.language() == "SPANISH" then
		update_language(SPANISH)
	end
end

-- User Translations
files.mkdir("ux0:data/AUTOPLUGIN/lang/")
if files.exists("ux0:data/AUTOPLUGIN/lang/"..os.language()..".lua") then
	dofile("ux0:data/AUTOPLUGIN/lang/"..os.language()..".lua")
end

-- Loading font
files.mkdir("ux0:data/AUTOPLUGIN/font/")
fnt = font.load("ux0:data/AUTOPLUGIN/font/font.pgf") or font.load("ux0:data/AUTOPLUGIN/font/font.pvf") or font.load("ux0:data/AUTOPLUGIN/font/font.ttf")
if fnt then	font.setdefault(fnt) end

dofile("scripts/scroll.lua")
dofile("scripts/tai.lua")
dofile("scripts/commons.lua")

--Funciones PSVITA
dofile("scripts/psvita/sd2vita.lua")
dofile("scripts/psvita/plugins.lua")
dofile("scripts/psvita/pmanager.lua")
dofile("scripts/psvita/autoplugin.lua")
dofile("scripts/psvita/onlinep.lua")
dofile("scripts/psvita/menu_psvita.lua")

--Funciones PSP
dofile("scripts/psp/npdrm.lua")
dofile("scripts/psp/pspctrls.lua")
dofile("scripts/psp/menu_psp.lua")

--Funciones EXTRAS
dofile("scripts/extras/customsplash.lua")
dofile("scripts/extras/menu_extras.lua")

--Main Cycle
dofile("menu.lua")
