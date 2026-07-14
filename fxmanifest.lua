fx_version 'cerulean'

game 'gta5'

lua54 'yes'

author 'Aiden Harvey'

description 'AirSupportPro - Advanced Helicopter Aviation Suite'

version '0.2.0'


shared_scripts {
    'config.lua',
    'shared/helpers.lua'
}


client_scripts {
    'client/utilities.lua',
    'client/main.lua',
    'client/camera.lua',
    'client/controls.lua'
}


server_scripts {
    'server/server.lua'
}


files {
    'html/index.html',
    'html/style.css',
    'html/app.js'
}


ui_page 'html/index.html'
