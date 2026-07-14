fx_version 'cerulean'
game 'gta5'

author 'Aiden Harvey'
description 'AirSupportPro - Advanced standalone helicopter aviation suite for FiveM'
version '0.1.0'

lua54 'yes'

-- Resource metadata
repository 'https://github.com/aidenharvey21-beep/ASP'

-- Shared files
shared_scripts {
    'config.lua',
    'shared/*.lua'
}

-- Client files
client_scripts {
    'client/*.lua'
}

-- Server files
server_scripts {
    'server/*.lua'
}

-- NUI Interface
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js'
}

-- Optional dependencies
dependencies {
    '/onesync'
}

-- Export definitions
exports {
    'IsAirSupportActive',
    'GetCurrentTarget',
    'GetCameraState',
    'StartOrbit',
    'StopOrbit'
}

-- Resource settings
escrow_ignore {
    'config.lua'
}
