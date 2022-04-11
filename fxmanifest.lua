fx_version 'cerulean'
games { 'gta5' }

author 'Nutela'
description 'Vykradacka obchodu pomoci safe minihry'
version '2.0'

client_scripts { 
	"config.lua",
	"client.lua",
	"pd-safe/pd-safe.lua"
}

server_scripts {
	"config.lua",
	"server.lua"
}

dependencies {
	'mythic_notify'
}
