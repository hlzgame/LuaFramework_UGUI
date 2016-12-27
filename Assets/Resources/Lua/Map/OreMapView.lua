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

   --self.object = self.gameObject.transform:FindChild("default").gameObject


end

function OreMapView:Start() 
    print("OreMapView Start name = "..self.name );
    UpdateBeat:Add(self.Update, self)
end

--[[
    分帧来刷新矿石 添加黑雾

]]
function OreMapView:Update()

end

function OreMapView:stop( )
    UpdateBeat:Remove(self.Update, self)
end


