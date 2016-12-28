local UpdateBeat = UpdateBeat

--该类 只负责矿石的创建 刷新 销毁 黑雾消散 
MineView = 
{
    name = "MineView",
    speed = 0.1,
    dircetion = 1
}

--创建对象
function MineView:New(obj)
    local o = {} 
    setmetatable(o, self)  
    self.__index = self  
    return o
end  

function MineView:Awake(gameObject) 
   print("MineView Awake name = "..self.name );
   self.gameObject = gameObject

end

function MineView:Start() 
    
 
end

--初始化前几排的矿石
function MineView:initOre( ... )

   self.ore = GameObject.Find("Ore")
   self.mask = GameObject.Find("Mask")
   self.background = GameObject.Find("BackGround")
   self.mainCamera = GameObject.Find("MainCamera") 
  
    --玩家当前所在的矿层
    self.playerNowRow = 0
    
    --玩家最大到达的矿层
    self.playerMaxRow = 0

    --当前生成的最大矿层
    self.maxRow = 5

    self.nowOreRow = 0


    --资源安全存在层数 最大存在N层的矿石
    self.safeRow = 10
    
    self.limitMaxRow = self.playerNowRow + self.safeRow

    self.isStartDrop = false

    --现存矿石数组
    self.oreList = {}

    --现存道具数组
    self.itemList = {}

    self:startCreate()

end

function MineView:startCreate( ... )
    UpdateBeat:Add(self.Update, self)
end


--开始每帧刷新
--[[
    分帧来刷新矿石 添加黑雾

]]
function MineView:Update()
   self:createMineRow()
   
   self:refreshCameraPos()
end

function MineView:createMineRow(  )
   if self.nowOreRow <= self.limitMaxRow then 
      self:createNewOre()
      self:createNewMask()
      self.nowOreRow = self.nowOreRow + 1
      if self.nowOreRow == 8 then 
        --self.isStartDrop = true 
      end
   else
      
   end
end

--添加新的矿石（以每行为单位）
function MineView:createNewOre(  )
    local go = newObject(self.ore);
    go.name = 'ore'..tostring(self.nowOreRow);
    --go.transform:SetParent(parent);
    go.transform.localScale = Vector3.one;
    go.transform.localPosition = Vector3(self.ore.transform.localPosition.x,self.ore.transform.localPosition.y - 0.8*self.nowOreRow,self.ore.transform.localPosition.z);
end

--添加新的遮罩黑雾（以每行为单位）
function MineView:createNewMask(  )
    local go = newObject(self.mask);
    go.name = 'mask'..tostring(self.nowOreRow);
    --go.transform:SetParent(parent);
    go.transform.localScale = Vector3.one;
    go.transform.localPosition = Vector3(self.mask.transform.localPosition.x,self.mask.transform.localPosition.y - 0.8*self.nowOreRow,self.mask.transform.localPosition.z);

end

function MineView:refreshCameraPos( )
    if self.isStartDrop == true then 
        local posX = self.mainCamera.transform.localPosition.x
        local posY = self.mainCamera.transform.localPosition.y - 0.01 
        local posZ = self.mainCamera.transform.localPosition.z 
        self.mainCamera.transform.localPosition = Vector3(posX,posY,posZ);
    end
end

--清除报废的矿石和黑雾（以及生成的原矿和道具等）
function MineView:clearScrapOreAndMask(  )
  -- body
end


function MineView:stop( )
    UpdateBeat:Remove(self.Update, self)
end


