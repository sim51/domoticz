package.path = package.path .. ";/opt/domoticz/scripts/lua/?.lua"
require("password");

----------------------------------------------------------------------------------------------------------
-- Shared configuration
----------------------------------------------------------------------------------------------------------
folderScript             = "/opt/domoticz/scripts"
folderBashScript         = folderScript .."/bash"
debug                    = true

----------------------------------------------------------------------------------------------------------
-- WEMO configuration
----------------------------------------------------------------------------------------------------------

--
-- Generic configuration
--
plugTime                 = 60 
plugScript               = folderBashScript .. "/wemo "

--
-- Music configuration
--
plugMusicIp              = "10.0.1.20"
plugMusicName            = "Prise Music"
plugMusicConsumptionId   = "122"
plugMusicConsumptionName = "Prise Music Consommation"

--
-- Desk configuration
--
plugDeskIp               = "10.0.1.21"
plugDeskName             = "Prise Bureau"
plugDeskConsumptionId    = "124"
plugDeskConsumptionName  = "Prise Bureau Consommation"

--
-- TV configuration
--
plugTvIp                 = "10.0.1.22"
plugTvName               = "Prise TV"
plugTvConsumptionId      = "123"
plugTvConsumptionName    = "Prise TV Consommation"

----------------------------------------------------------------------------------------------------------
-- WIFI Presence configuration
----------------------------------------------------------------------------------------------------------
presenceIp               = "10.0.1.12"
presenceScript           = folderBashScript .. "/presence "
presenceName             = "Presence"
presenceTime             = 60

----------------------------------------------------------------------------------------------------------
-- Camera configuration
----------------------------------------------------------------------------------------------------------
cameraUrl                = "https://10.0.0.1:5001"
cameraLogin              = login
cameraPassword           = password
cameraScript             = folderBashScript .. "/camera " .. cameraUrl .. " " .. cameraLogin .. " " .. cameraPassword .. " "
cameraName               = "Camera"
cameraTime               = 60

----------------------------------------------------------------------------------------------------------
-- OSMC configuration
----------------------------------------------------------------------------------------------------------
osmcIp                   = "10.0.0.10"
osmcName                 = "Osmc"

----------------------------------------------------------------------------------------------------------
-- HUE configuration
----------------------------------------------------------------------------------------------------------
hueSalonName             = "Salon"
hueEntreeName            = "Entrée"
hueCuisineName           = "Cuisine"
hueChambreName           = "Chambre"
hueChambre2Name          = "Chambre 2"
hueToiletteName          = "Toilette"

----------------------------------------------------------------------------------------------------------
-- Scene configuration
----------------------------------------------------------------------------------------------------------
scenePlugAll             = "Prise"
sceneHueAll              = "Lumiere"
sceneAway                = "Voyage"
sceneNightMode           = "Mode nuit"
sceneMoviePlay           = "OSMC Video"
sceneMoviePaused         = "OSMC Video Pause"
sceneSalonNormal         = "Salon Normal"
