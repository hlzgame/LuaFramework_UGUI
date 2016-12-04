PlayerLua = 
{
        name = "good tank",
}


function PlayerLua:Update(gameObject)
    

    local Input = UnityEngine.Input;
    local horizontal = Input.GetAxis("Horizontal")*0.10;
    local verticla = Input.GetAxis("Vertical")*0.1;
    print("PlayerLua Update horizontal = "..horizontal );
    print("PlayerLua Update verticla = "..verticla );

    local x = gameObject.transform.position.x + verticla
    local z = gameObject.transform.position.z - horizontal
    gameObject.transform.position = Vector3.New(x,7.25,z)
end


--创建对象
function PlayerLua:New(obj)
    local o = {} 
    setmetatable(o, self)  
    self.__index = self  
    return o
end  
