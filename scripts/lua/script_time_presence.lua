----------------------------------------------------------------------------------------------------------
-- Script to check if a phone is present by its IP wifi, and set the corresponding switch in Domoticz
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
-- Local viariables
----------------------------------------------------------------------------------------------------------
local deviceName = presenceName
local script     = presenceScript .. presenceIp
local time       = presenceTime

----------------------------------------------------------------------------------------------------------
-- CommandArray
----------------------------------------------------------------------------------------------------------
commandArray = {};

-- Only perform the check if the elapse time since last time is enought
if ( timeDifference( otherdevices_lastupdate[deviceName] ) > time ) then
    
  -- Retrieve the status of the camera home mode
  local result = callShellScript( script );
  local status = domoticz_applyJsonPath( result, '.status' );
  
  -- Make a debug
  if ( debug ) then
    print('Status of device '.. deviceName .. ' is '.. status .. ' and its state is '.. otherdevices[deviceName]);
  end
  
  -- Sometimes the script return a undefined status, so I prefer here to check the result 
  if ( status=='On' or status=='Off') then
   
    -- If the retrieved status is different than the stored state, we update its Domoticz status
    if ( status ~= otherdevices[deviceName] ) then
      commandArray[deviceName] = status;
    end
   
  end

end
 
return commandArray;
