require("Common.init")

local Game = class("Game")

--从 LuaFramework 下的Main.lua 走到这里，开始游戏的主逻辑
function Game:ctor()
    log(" Game Game Game")

    self:init()
end

function Game:init( ... )
	log(" Game init")

	mtOreMapMgr():initScene()
end

return Game