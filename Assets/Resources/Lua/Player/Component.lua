local UpdateBeat = UpdateBeat
--组件化模板
Component=            --组件表  
{  
        property1 = 100,
        property2 = "helloWorld"
}


function Component:Awake() 
   print("Component Awake name = "..self.name );
end

function Component:Start() 
    print("Component Start name = "..self.name );
    UpdateBeat:Add(self.Update, self)
end

function Component:Update()
    print("Component Update name = "..self.name );
end

--更多方法略

function Component:New(obj) 
    local o = {} 
    setmetatable(o, self)  
    self.__index = self  
    return o
end  