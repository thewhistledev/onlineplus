util.require_natives(1676318796)
util.keep_running()
local self = {}

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
