fx_version 'cerulean'
game 'gta5'

Author 'AglioB'

version '1.0.0'

server_script 'server.lua'

client_script 'client.lua'

shared_scripts {
    '@ox_lib/init.lua',
    'language.lua',
    'config.lua'
}

dependencies {
    'ox_lib'
}

data_file 'DLC_ITYP_REQUEST' 'stream/def_props.ytyp'

files {
    'stream/def_props.ytyp',
    'stream/elfbar_blueberry.ydr',
    'stream/elfbar_cola.ydr',
    'stream/elfbar_grape.ydr',
    'stream/elfbar_kiwi.ydr',
    'stream/elfbar_mango.ydr',
    'stream/elfbar_melon.ydr',
    'stream/elfbar_strawberry.ydr',
}

lua54 'yes'