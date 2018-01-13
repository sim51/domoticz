----------------------------------------------------------------------------------------------------------
-- Action script to respond to the `plug` button.
-- 
-- Author : Benoit Simard (@logisima)
-- Date : 4th January 2018
-- Licence : MIT
----------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------
-- Imports
----------------------------------------------------------------------------------------------------------
package.path = package.path .. ";/opt/domoticz/scripts/lua/?.lua"
require("helpers");
require("config");

----------------------------------------------------------------------------------------------------------
-- Local variables
----------------------------------------------------------------------------------------------------------
local deviceName = plugDeskName;
local script     = plugScript .. plugDeskIp .. " ";

----------------------------------------------------------------------------------------------------------
-- CommandArray
----------------------------------------------------------------------------------------------------------
commandArray = {};

-- If the device has changed, we call the bash script with the new state (ie On | Off)
if ( devicechanged[deviceName] ) then
  
  -- Make a debug
  if ( debug ) then
    print('Device '.. deviceName .. ' change to '.. devicechanged[deviceName]);
  end
  
  -- Call the bash script
  callShellScript( script .. devicechanged[deviceName] );
  
end

return commandArray;

