--
-- Author: HLZ
-- Date: 2016-12-28 21:02:00
-- 矿石的基本结构体

local OreBaseInfo = class("OreBaseInfo")

function OreBaseInfo:ctor( data )
    
    --表格的基本属性
    self.id = data.ID
    self.name = data.Name
    self.level = data.Level
    self.resName = data.ResName
    self.animName = data.AnimName
    self.desc = data.Desc
    self.icon = data.Icon
    self.devourSkillID = data.DevourSkillID
    self.detectSkillID = data.DetectSkillID
    self.exclusiveSkillID = data.ExclusiveSkillID
    self.satiation = data.Satiation
    self.evolution = data.Evolution
    self.maxSatiation = data.MaxSatiation
    self.maxEvolution = data.MaxEvolution
    self.hungry = data.Hungry
    self.velocity = data.Velocity
    --及时属性
    --当前的 饱食度和进化值
    self.nowSatiation = data.MaxSatiation
    self.nowEvolution = 0
    self.nowVelocity = data.Velocity
    self.nowLevel = data.Level

    --出生时间
    self.birthTime = 0

    --是否 是主怪 不是则为中立怪
    self.isMainMonster = false 

end

--从服务器拿去到的信息
function OreBaseInfo:setMonsterBaseInfo(data)

end


function OreBaseInfo:setIsMainMonster( flag )
	self.isMainMonster = true
end

function OreBaseInfo:getIsMainMonster(  )
	return self.isMainMonster
end

function OreBaseInfo:setBirthTime( time )
	self.birthTime = time
    print("BirthTime :"..self.birthTime)
end

function OreBaseInfo:getBirthTime(  )
	return self.birthTime 
end

function OreBaseInfo:getMonsterNowSatiation(  )
	return self.nowSatiation
end

function OreBaseInfo:getMonsterNowEvolution(  )
	return self.nowEvolution
end

function OreBaseInfo:setMonsterNowSatiation(satiation)
	self.nowSatiation = satiation
end

function OreBaseInfo:setMonsterNowEvolution(evolution)
	self.nowEvolution = evolution
end

function OreBaseInfo:getMonsterID(  )
	return self.id
end

function OreBaseInfo:getMonsterName(  )
	return self.name
end

function OreBaseInfo:getInitMonsterLevel(  )
	return self.level
end

function OreBaseInfo:getMonsterLevel(  )
    return self.nowLevel
end

function OreBaseInfo:getMonsterResName(  )
	return self.resName
end

function OreBaseInfo:getMonsterAnimName(  )
	return self.animName
end

function OreBaseInfo:getMonsterDesc(  )
	return self.desc
end

function OreBaseInfo:getMonsterIcon(  )
	return self.icon
end

function OreBaseInfo:getMonsterDevourSkillID(  )
	return self.devourSkillID
end

function OreBaseInfo:getMonsterDetectSkillID(  )
	return self.detectSkillID
end

function OreBaseInfo:getMonsterExclusiveSkillID(  )
	return self.exclusiveSkillID
end

function OreBaseInfo:getMonsterSatiation(  )
	return self.satiation
end

function OreBaseInfo:getMonsterEvolution(  )
	return self.evolution
end

function OreBaseInfo:getMonsterMaxSatiation(  )
	return self.maxSatiation
end

function OreBaseInfo:getMonsterMaxEvolution(  )
	return self.maxEvolution
end

function OreBaseInfo:getMonsterHungry(  )
    return self.hungry
end

--初始化怪兽移速
function OreBaseInfo:initMonsterVelocity(  )
    self.nowVelocity = self.velocity
end

function OreBaseInfo:setMonsterVelocity(velocity)
    self.nowVelocity = velocity
end



return OreBaseInfo