--
-- Author: HLZ
-- Date: 2016-11-22 16:49:08
-- 战斗界面（主要是地图的静态加载赋值）

local transform;
local gameObject;

BattlePanel = {};
local this = BattlePanel;

--启动事件--
function BattlePanel.Awake(obj)
	gameObject = obj;
	transform = obj.transform;

	this.InitPanel();
	logWarn("Awake lua--->>"..gameObject.name);
end

--初始化面板--
function BattlePanel.InitPanel()

end

--单击事件--
function BattlePanel.OnDestroy()
	logWarn("OnDestroy---->>>");
end