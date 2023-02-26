--[[
    Use: Startup script for Online+ (Online Plus).
]]
--[[
    Possession Policy:
    --------------------
    While you are in possession of this script or have access to it somewhere or somehow, you agree that any attempt to reverse-engineer, modify, copy, reupload/retransmit, any contents included as part of this script,
    i (the developer) will not be held liable for any damages to any of yours or anyone elses personal/commercial belongings, you agree that you assume responsibilty with use of this script, any attempt to steal credit for the relative hard work the author put into this script, will render this policy void,
    any attempt to make it apparent you or someone other than the author made this script will result in you possibly being banned from future use of this script and/or any future scripts by our development team.
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

local validChecks = false

local OP_IS_VALID_LICENSE = NETWORK.NETWORK_HAS_VALID_ROS_CREDENTIALS()
local OP_IS_ONLINE = PLAYER.IS_PLAYER_ONLINE()
local OP_BANNED = NETWORK.NETWORK_HAVE_ROS_MULTIPLAYER_PRIV()
local OP_SCRIPT_LATEST = true


function StartChecks(silent_flag)
    if OP_BANNED == false then
        validChecks = true
    elseif OP_IS_ONLINE == false then
        DoToast("You are not in a session, please note that you can still use Online+ but the experience wont be as good as being online.", TOAST_ABOVE_MAP, silent_flag) -- script works better online, optimised more for gta online if u use story mode theres no guarantee that it wont crash or cause bugs.
        validChecks = true
    elseif OP_IS_VALID_LICENSE then
        validChecks = false
        DoToast("Online+ Validation checks failed.. Please restart the script or contact the script author.", TOAST_LOGGER, silent_flag) -- general logging informaition, lets user or developer know when the validation checks failed. (yes miliseconds make a difference and i can distinguish what part of the script caused the script crash.)
        DoToast("You are playing on a non-legitimate copy of GTA:V, this script is not supported on pirated copies of GTA:V.", TOAST_ABOVE_MAP, silent_flag) -- Look, this isn't an asshole move, remove this if you want i dont care, but what i do care about is you using a pirated copy, those aren't safe and you should probably install the legit version of gta, you do you though.
    elseif OP_BANNED == true then
        DoToast("You are banned from GTA:O, please note that you can still use Online+ but the experience wont be as good as being online.", TOAST_ABOVE_MAP, silent_flag) -- Lets you play even if banned
        validChecks = false
    else
        DoToast("Online+ Validation checks failed.. Please restart the script or contact the script author.", TOAST_LOGGER, silent_flag) -- general logging informaition, lets user or developer know when the validation checks failed. (yes miliseconds make a difference and i can distinguish what part of the script caused the script crash.)
        DoToast("Unknown Error Occurred, contact Online+ developer.", TOAST_ABOVE_MAP, silent_flag) -- possibly a script error causing it. will check it out and provide a better error handler.
        validChecks = false
    end
end

StartChecks(true) -- got my lua messed up keep it true if u dont want confusing toasts.