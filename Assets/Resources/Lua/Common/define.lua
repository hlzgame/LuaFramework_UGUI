
MgrNames = {
    Scene = "SceneMgr",
    MainView = "MainViewMgr",
	Prompt = "PromptMgr",
	Message = "MessageMgr",
	Battle = "BattleMgr",
}

PanelNames = {
    "MainViewPanel",
	"PromptPanel",	
	"MessagePanel",
	"BattlePanel",
}

--协议类型--
ProtocalType = {
	BINARY = 0,
	PB_LUA = 1,
	PBC = 2,
	SPROTO = 3,
}
--当前使用的协议类型--
TestProtoType = ProtocalType.BINARY;

--定义一些常用API
Util = LuaFramework.Util;
AppConst = LuaFramework.AppConst;
LuaHelper = LuaFramework.LuaHelper;
ByteBuffer = LuaFramework.ByteBuffer;

resMgr = LuaHelper.GetResManager();
panelMgr = LuaHelper.GetPanelManager();
soundMgr = LuaHelper.GetSoundManager();
networkMgr = LuaHelper.GetNetManager();

WWW = UnityEngine.WWW;
GameObject = UnityEngine.GameObject;
Input = UnityEngine.Input;