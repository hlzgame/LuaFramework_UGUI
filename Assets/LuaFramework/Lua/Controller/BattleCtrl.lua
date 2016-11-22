--
-- Author: HLZ
-- Date: 2016-11-22 16:49:08
-- 战斗控制器

BattleCtrl = {};
local this = BattleCtrl;

local message;
local transform;
local gameObject;

--构建函数--
function BattleCtrl.New()
	logWarn("BattleCtrl.New--->>");
	return this;
end

function BattleCtrl.Awake()
	logWarn("BattleCtrl.Awake--->>");
	panelMgr:CreatePanel('Battle', this.OnCreate);
end

--启动事件--
function BattleCtrl.OnCreate(obj)
	gameObject = obj;
	
	logWarn("Start lua--->>"..gameObject.name);
end

--单击事件--
function BattleCtrl.OnClick(go)
	destroy(gameObject);
end

--关闭事件--
function BattleCtrl.Close()
	panelMgr:ClosePanel(CtrlNames.Message);
end