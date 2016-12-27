--
-- Author: HLZ
-- Date: 2016-11-22 16:49:08
-- 战斗控制器

require("Map.OreMapView")

local OreMapMgr = class("OreMapMgr")

function OreMapMgr:getInstance(  )
    if self.instance == nil then
        self.instance = OreMapMgr.new()
    end
    return self.instance
end

function OreMapMgr:ctor()
    
end

--切换场景之后，调用该方法，开始加载场景控件
function OreMapMgr:initScene( )
	log('OreMapMgr:initScene')

    self.battleMap = GameObject.Find("BattlePanel")

    self.player = GameObject.Find("chr_man")

    -- self:startBattle()
end

function OreMapMgr:startBattle( )
    log('OreMapMgr:startBattle')

    LuaComponent.Add(self.player,OreMapView)

end

--初始化相机
--[[
    相机的初始位置
    相机的移动规则
]]
function OreMapMgr:initCamera( ... )
	
end


return OreMapMgr