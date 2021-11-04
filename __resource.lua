-- https://github.com/kqpi

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'KITY'

version '1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/main.lua'
}

dependency 'es_extended'


ui_page "html/index.html"

files {
	'html/index.html',
	'html/style.css',
	'html/kqpisound.mp3',
	'html/script.js'
}