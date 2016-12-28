--
-- Author: HLZ
-- Date: 2016-11-22 16:49:08
-- 矿场控制器

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

--初始化新的一轮数据
function OreMapMgr:initData(  )
    
    --玩家当前所在的矿层
    self.playerNowRow = 0
    
    --玩家最大到达的矿层
    self.playerMaxRow = 0

    --当前生成的最大矿层
    self.maxRow = 0

    --资源安全存在层数 最大存在N层的矿石
    self.safeRow = 40




    -- body
    self:startGame()
end

--切换场景之后，调用该方法，开始加载场景控件
function OreMapMgr:initScene( )
	log('OreMapMgr:initScene')

    self.gameManager = GameObject.Find("GameManager")

    -- self.player = GameObject.Find("chr_man")
   
    self:initData()

    
end

function OreMapMgr:startGame( )
    log('OreMapMgr:startGame')

    LuaComponent.Add(self.gameManager,OreMapView)

    OreMapView:initOre()

end

--初始化相机
--[[
    相机的初始位置
    相机的移动规则
]]
function OreMapMgr:initCamera( ... )
	
end

-----------------------------------------数据层的管理----------------------------------------

function OreMapMgr:getPlayerNowRow( )
    return self.playerNowRow
end

function OreMapMgr:setPlayerNowRow( playerNowRow )
    self.playerNowRow = playerNowRow
end


function OreMapMgr:getPlayerMaxRow( )
    return self.playerMaxRow
end

function OreMapMgr:setPlayerMaxRow( playerMaxRow )
    self.playerMaxRow = playerMaxRow
end

function OreMapMgr:getMaxRow( )
    return self.maxRow
end

function OreMapMgr:setMaxRow( maxRow )
    self.maxRow = maxRow
end

function OreMapMgr:getSafeRow( )
    return self.safeRow
end





return OreMapMgr