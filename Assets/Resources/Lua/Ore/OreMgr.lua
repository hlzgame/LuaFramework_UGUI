--
-- Author: HLZ
-- Date: 2016-12-28 21:02:00
-- 矿石信息管理类
--

--[[
   
]]

local OreMgr = class("OreMgr")
OreMgr.__index = OreMgr

function OreMgr:getInstance(  )
    if self.instance == nil then
        self.instance = OreMgr.new()
    end
    return self.instance
end

function OreMgr:ctor()

end

--生成矿石
function OreMgr:createOre( data )
	-- local monsterLogic = mtCommonMonsterLogic().new(data)
    
 --    local monsterView = mtMonsterView().new(monsterLogic)
    
 --    --设置怪兽的出生时间 （其实这些都是需要服务器来发的，目前先本地写）
 --    local birthTime = mtTimeMgr():getCurTime()
 --    monsterLogic:setMonsterBirthTime(birthTime)
    
 --    return monsterView
end

--删除矿石
function OreMgr:removeOre(monster)
	
end

return OreMgr