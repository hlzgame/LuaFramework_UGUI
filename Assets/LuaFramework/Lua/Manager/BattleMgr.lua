--
-- Author: HLZ
-- Date: 2016-11-22 16:49:08
-- 战斗控制器

BattleMgr = {};
local this = BattleMgr;

local message;
local transform;
local gameObject;

--构建函数--
function BattleMgr.New()
	logWarn("BattleMgr.New--->>");
	return this;
end

function BattleMgr.Awake()
	logWarn("BattleMgr.Awake--->>");
	panelMgr:CreatePanel('Battle', this.OnCreate);
end

--启动事件--
function BattleMgr.OnCreate(obj)
	gameObject = obj;
	
	logWarn("Start lua--->>"..gameObject.name);
end

--单击事件--
function BattleMgr.OnClick(go)
	destroy(gameObject);
end

--关闭事件--
function BattleMgr.Close()
	panelMgr:ClosePanel(MgrNames.Message);
end