local go; --加载的坦克模型
         
--主入口函数。从这里开始lua逻辑
function Main()
    --在 tank 目录下面找 TankPrefab 物体，回调到OnLoadFinish                                                                               
    resMgr:LoadPrefab('tank', { 'TankPrefab' }, OnLoadFinish);
end
 
--加载完成后的回调--
function OnLoadFinish(objs)
    go = newObject(objs[0]);
    log("LoadFinish");

    UpdateBeat:Add(Update, self)
end
 
--每帧执行
function Update()
    log("每帧执行");

    local Input = UnityEngine.Input;
    local horizontal = Input.GetAxis("Horizontal");
    local verticla = Input.GetAxis("Vertical");

    local x = go.transform.position.x + horizontal
    local z = go.transform.position.z + verticla
    go.transform.position = Vector3.New(x,0,z)
end