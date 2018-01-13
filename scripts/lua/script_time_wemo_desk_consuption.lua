----------------------------------------------------------------------------------------------------------
-- Script to the consumption of a plug into Domoticz
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
local deviceName = plugDeskConsumptionName;
local deviceId   = plugDeskConsumptionId;
local script     = plugScript .. plugDeskIp .. " data";
local time       = plugTime;

----------------------------------------------------------------------------------------------------------
-- CommandArray
----------------------------------------------------------------------------------------------------------
commandArray = {};

-- Only perform the check if the elapse time since last time is enought
if ( timeDifference( otherdevices_lastupdate[deviceName] ) > time ) then
    
  -- Retrieve the values
  local result = callShellScript( script );
  local power = domoticz_applyJsonPath(result,'consumption');
  local energy = domoticz_applyJsonPath(result,'today_consumption');
  
  -- Make a debug
  if ( debug ) then
    print('Device '.. deviceName .. ' consume '.. power .. 'W and '.. energy .. 'E');
  end
  
  -- Update the value in Domiticz
  commandArray[deviceName] = deviceId .. "|0|" .. power/1000 .. ";" .. energy/1000/1000;
  
end
 
return commandArray;
