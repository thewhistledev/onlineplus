--[[
    Use: Startup script for Online+ (Online Plus).
]]
--[[
    Possession Policy:
    --------------------
    While you are in possession of this script or have access to it somewhere or somehow, you agree that with any attempt to reverse-engineer, modify, copy, reupload/retransmit any contents included as part of this script,
    i (the developer) will not be held liable for any damages to any of your or anyone elses personal/commercial belongings, you agree that you assume responsibilty with use of this script.
]]


util.require_natives(1676318796)
util.keep_running()
require "onlineplus.loader1"


--[[
    --- Loader ---
]]

local opFiles <const> = {
    "lib/onlineplus/loader1.lua"
}

local requiredFiles <const> = filesystem.scripts_dir()
for _, file in ipairs(opFiles) do
	assert(filesystem.exists(requiredFiles .. file), "File failed to validate: " .. file)
end




--[[
    --- End of Loader ---
]]

