util.require_natives(1676318796)
util.keep_running()
local self = {}
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
        DoToast("You are playing on a non-legitimate copy of GTA:V, this script is not supported on pirated copies of GTA:V.", TOAST_ABOVE_MAP, silent_flag) -- Remove this if you want i dont care, but what i do care about is you using a pirated copy, those aren't safe and you should probably install the legit version of gta.. :/
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

self.config = {
    ["PluginName"] = "Online+",
    ["PluginDescription"] = "Online Plus is a plugin that allows the stand community to purchase properties and businesses that are not part of GTA: Online.",
    ["Disclaimer"] = "This plugin is not affiliated with Rockstar Games or Take Two Interactive Software, This plugin does not interact with the ROS (Rockstar Online Service) or its partner services in any way, shape or form, this plugin serves the purpose of enhancing the entertainment perspective of the game and provides some sort of community competition or roleplaying interaction.",
    ["Use"] = "This plugin is used to purchase properties and businesses that are not part of GTA: Online.",
    ["PluginVersion"] = "1.0.0",
    ["PluginIntendedType"] = "public-release",
    ["PluginAuthor"] = "WhistleDev",
    ["PluginAuthorDiscordID"] = "Свисток#1203"
}

self.getVersion = function ()
    return self.config.PluginVersion or "1.0.0"
end


function DoToast(string, flag, silent)
    if silent == false then
        util.toast(string, flag)
    end
end


local root = menu.my_root()
local sub_dev = menu.list(root, "Developer", {}, "A list of developer options.")
local sub_about = menu.list(root, "About", {}, "Information about developers and update status.")




menu.action(sub_about, "Check Plugin Version", {}, "Checks the version of the plugin", function()
    DoToast("You are currently running version " .. self.getVersion(), TOAST_ABOVE_MAP, false)
end)
