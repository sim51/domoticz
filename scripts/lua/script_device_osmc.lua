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
local deviceName = osmcName;
local salonId    = otherdevices_idx["Salon"];

----------------------------------------------------------------------------------------------------------
-- CommandArray
----------------------------------------------------------------------------------------------------------
commandArray = {};

-- If the device has changed
if ( devicechanged[deviceName] ) then
  
  -- Make a debug
  if ( debug ) then 
    print('Device '.. deviceName .. ' change to '.. devicechanged[deviceName]);
  end
  
  -- When a movie is playing => light in red 20%
  if ( devicechanged[deviceName] == "Video" ) then
      if ( otherdevices[hueSalonName] ~= "Off" ) then
          commandArray['OpenURL']= hue(20, "false", 0, salonId);
      end
  end
  
  -- When a movie is paused => light in with 40%
  if ( devicechanged[deviceName] == "Paused" ) then
      if ( otherdevices[hueSalonName] ~= "Off" ) then
          commandArray['OpenURL']= hue(40, "true", 0, salonId);
      end
  end

  -- When a OSMC is on but do nothing => white 100%
  if ( devicechanged[deviceName] == "On" ) then
      if ( otherdevices[hueSalonName] == "On" ) then
          commandArray['OpenURL']= hue(100, "true", 0, salonId);
      end
  end  
end

return commandArray;
