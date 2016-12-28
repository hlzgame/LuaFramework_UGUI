--
-- Author: HLZ
-- Date: 2016-12-28 21:02:00
-- 矿石的通用逻辑
-- 

local CommonOreLogic = class("CommonOreLogic")

function CommonOreLogic:ctor(data)

   -- self.parentScene = mtBattleMgr():getScene()
   -- self.monsterID = data.monsterID
   -- self.playerType = data.playerType 
   
end

--初始化 矿石信息
function CommonOreLogic:initMonsterInfo( )
	  --获得表格里面的怪兽信息
	  -- self.monsterInfo = g_Config:getData("Monster","ID",self.monsterID)[1]
     -- self.monsterData = mtMonsterBaseInfo().new(self.monsterInfo)   
end

--获得矿石的即时数据
function CommonOreLogic:getMonsterData()
	return self.monsterData
end

return CommonOreLogic