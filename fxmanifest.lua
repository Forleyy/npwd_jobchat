fx_version("cerulean")
game("gta5")
description("Systeme de job chat SAO")
authors({ "Forley" })
version("1.0")

client_script {
   '@qbx_core/modules/playerdata.lua',
    'jobchat_c.lua'

}

server_script({
    '@oxmysql/lib/MySQL.lua',
	"jobchat_s.lua"
})

