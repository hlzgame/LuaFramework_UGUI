--
-- Author: HLZ
-- Date: 2016-12-28 21:02:00
-- 矿场控制器


--加载矿场视图脚本
require("Mine.MineView")

local MineMgr = class("MineMgr")

function MineMgr:getInstance(  )
    if self.instance == nil then
        self.instance = MineMgr.new()
    end
    return self.instance
end

function MineMgr:ctor()
    
end

--初始化新的一轮数据
function MineMgr:initData(  )
    
    --玩家当前所在的矿层
    self.playerNowRow = 0
    
    --玩家最大到达的矿层
    self.playerMaxRow = 0

    --当前生成的最大矿层
    self.maxRow = 0

    --资源安全存在层数 最大存在N层的矿石
    self.safeRow = 40

    self.cameraSpeed = 0.01

    --现存矿石数组
    self.oreList = {}

    --现存道具数组
    self.itemList = {}

    -- body
    self:startGame()
end

--切换场景之后，调用该方法，开始加载场景控件
function MineMgr:initScene( )
	log('MineMgr:initScene')
    
    --获得管理矿场的矿场空 节点MineManager
    self.mineManager = GameObject.Find("MineManager")

    -- self.player = GameObject.Find("chr_man")
   
    self:initData()
    
end

function MineMgr:startGame( )
    log('MineMgr:startGame')

    LuaComponent.Add(self.mineManager,MineView)

    MineView:initOre()

    self.mineView = MineView

end

-----------------------------------------数据层的管理----------------------------------------

function MineMgr:getPlayerNowRow( )
    return self.playerNowRow
end

function MineMgr:setPlayerNowRow( playerNowRow )
    self.playerNowRow = playerNowRow
end

function MineMgr:getPlayerMaxRow( )
    return self.playerMaxRow
end

function MineMgr:setPlayerMaxRow( playerMaxRow )
    self.playerMaxRow = playerMaxRow
end

function MineMgr:getMaxRow( )
    return self.maxRow
end

function MineMgr:setMaxRow( maxRow )
    self.maxRow = maxRow
end

function MineMgr:getSafeRow( )
    return self.safeRow
end

function MineMgr:getCameraSpeed( )
    return self.cameraSpeed
end

function MineMgr:getMineView( )
    return self.mineView
end

--通过id 获得矿石数据
function MineMgr:getOreDataByID( oreID )
    -- body
end

--将新添加的矿石加入数组
function MineMgr:addOreToList( ore )
    --self.oreList

end

--将新添加的道具加入数组
function MineMgr:addItemToList( ore )
    --self.itemList

end

-------------------------------------坐标转换相关-----------------------------------------
--世界坐标转换为矿场坐标
function MineMgr:worldPosToMinePos( ... )
    -- body
end

--矿场坐标转换为世界坐标
function MineMgr:minePosToWorldPos( ... )
    -- body
end



return MineMgr