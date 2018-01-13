----------------------------------------------------------------------------------------------------------
-- Lua Helper Functions
----------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------
-- Imports
----------------------------------------------------------------------------------------------------------
package.path = package.path .. ";/opt/domoticz/scripts/lua/?.lua"
require("config");

--
-- Time dif between the time in parameter and now.
--
function timeDifference(s)
  year = string.sub(s, 1, 4);
  month = string.sub(s, 6, 7);
  day = string.sub(s, 9, 10);
  hour = string.sub(s, 12, 13);
  minutes = string.sub(s, 15, 16);
  seconds = string.sub(s, 18, 19);
  
  t1 = os.time();
  t2 = os.time{year=year, month=month, day=day, hour=hour, min=minutes, sec=seconds};
  
  difference = os.difftime (t1, t2);
  
  return difference;
end
 
--
-- Call a shell script and give back the result
--
function callShellScript(script)
  if ( debug ) then 
    print("Script is : " .. script);
  end
  
  local handle = io.popen(script);
  local result = handle:read("*a");
  handle:close();
  
  if ( debug ) then 
    print("Script result is : " .. result);
  end 
  
  return result;
end
    

--
-- Philips HUE change
--
function hue(brightness, iswhite, hue, deviceId)
  local url = "http://127.0.0.1:8080/json.htm?type=command&param=setcolbrightnessvalue&idx=" .. deviceId .. '&hue=' .. hue .. '&brightness=' .. brightness ..'&iswhite=' .. iswhite;
  if ( debug ) then
    print(url);
  end
  return url
end
