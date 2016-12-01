--
-- Author: HLZ
-- Date: 2016-11-22 16:49:08
-- 战斗控制器

local BattleMgr = class("BattleMgr")

function BattleMgr:getInstance(  )
    if self.instance == nil then
        self.instance = BattleMgr.new()
    end
    return self.instance
end

function BattleMgr:ctor()
    
end

--切换场景之后，调用该方法，开始加载场景控件
function BattleMgr:initScene( )
	log('BattleMgr:initScene')

    --panelMgr:CreatePanel('Battle', self.OnCreate);

    self.battleMap = GameObject.Find("BattlePanel");
    
    resMgr:LoadPrefab('battle', { 'chr_man' }, self.initPlayer);
end

--初始化 战斗地图
--[[
    需要解决的问题：1、地图的坐标系要怎么来弄？
                    2、地图的寻路是否使用A* 还是自带的导航网格
                    3、死亡线的设定
                    4、地图视角虚化
                    5、地图物件的添加
]]
function BattleMgr:initPlayer( objs )

    log('BattleMgr:initPlayer')
	local player = newObject(objs[0]);
     player.name = 'player'
     player.transform:SetParent(self.battleMap);
     player.transform.localScale = Vector3.one;
     player.transform.localPosition = Vector3.zero;

     log(player.name);
end

--初始化灯光
--[[
    减少动态灯光的使用
]]
function BattleMgr:initLight( ... )
	
end

--初始化相机
--[[
    相机的初始位置
    相机的移动规则
]]
function BattleMgr:initCamera( ... )
	
end


return BattleMgr