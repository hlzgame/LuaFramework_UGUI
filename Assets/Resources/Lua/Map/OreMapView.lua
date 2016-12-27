local UpdateBeat = UpdateBeat

--该类 只负责矿石的创建 刷新 销毁 黑雾消散 
OreMapView = 
{
    name = "OreMapView",
    speed = 0.1,
    dircetion = 1
}

--创建对象
function OreMapView:New(obj)
    local o = {} 
    setmetatable(o, self)  
    self.__index = self  
    return o
end  

function OreMapView:Awake(gameObject) 
   print("OreMapView Awake name = "..self.name );
   self.gameObject = gameObject

end

function OreMapView:Start() 
    
 
end

--初始化前几排的矿石
function OreMapView:initOre( ... )

   self.ore = GameObject.Find("Ore")
   self.mask = GameObject.Find("Mask")
   self.background = GameObject.Find("BackGround")
  
   self.row = 1

   self.maxRow = 5
   self:startCreate()

end



function OreMapView:startCreate( ... )
    UpdateBeat:Add(self.Update, self)
end


--开始每帧刷新
--[[
    分帧来刷新矿石 添加黑雾

]]
function OreMapView:Update()
   print("OreMapView:Update")

   self:createNewOre()
end

--添加新的矿石（以每行为单位）
function OreMapView:createNewOre(  )
  -- body
    if self.row <= self.maxRow then 
        local go = newObject(self.ore);
        go.name = 'Item'..tostring(i);
        --go.transform:SetParent(parent);
        go.transform.localScale = Vector3.one;
        go.transform.localPosition = Vector3(self.ore.transform.localPosition.x,self.ore.transform.localPosition.y - 0.8*(self.row-1),self.ore.transform.localPosition.z);
        self.row = self.row + 1
    else 
       print("max row")
    end
end

--添加新的遮罩黑雾（以每行为单位）
function OreMapView:createNewMask(  )
  -- body
end

--清除报废的矿石和黑雾（以及生成的原矿和道具等）
function OreMapView:clearScrapOreAndMask(  )
  -- body
end


function OreMapView:stop( )
    UpdateBeat:Remove(self.Update, self)
end


