local UpdateBeat = UpdateBeat

PlayerController = 
{
    name = "Player",
    speed = 0.1,
    dircetion = 1
}

--创建对象
function PlayerController:New(obj)
    local o = {} 
    setmetatable(o, self)  
    self.__index = self  
    return o
end  

function PlayerController:Awake(gameObject) 
   print("PlayerController Awake name = "..self.name );
   self.gameObject = gameObject

   self.object = self.gameObject.transform:FindChild("default").gameObject


end

function PlayerController:Start() 
    print("PlayerController Start name = "..self.name );
    UpdateBeat:Add(self.Update, self)
end

function PlayerController:setPlayerRotation(rotationY)
    self.rotationY = rotationY
    self.object.transform.localRotation = Vector3.New(0,self.rotationY,0)
    --self.gameObject.transform.Rotate(0,self.rotationY,0)
    print("PlayerController Update rotationY = "..rotationY );
end

function PlayerController:Update()
    
    local horizontal = Input.GetAxis("Horizontal");
    local vertical = Input.GetAxis("Vertical");

    print("PlayerController Update horizontal = "..horizontal );
    print("PlayerController Update vertical = "..vertical );

    
    local x = self.gameObject.transform.position.x + vertical*self.speed
    local z = self.gameObject.transform.position.z - horizontal*self.speed
    self.gameObject.transform.position = Vector3.New(x,7.25,z)

    
    if vertical < 0 then 
       self:setPlayerRotation(90)
    elseif vertical > 0 then 
       self:setPlayerRotation(270)
    elseif horizontal > 0 then 
       self:setPlayerRotation(180)
    elseif horizontal < 0 then 
       self:setPlayerRotation(0)
    end

end

function PlayerController:stop( )
    UpdateBeat:Remove(self.Update, self)
end


