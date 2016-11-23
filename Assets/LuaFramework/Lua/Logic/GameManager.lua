require "Common/define"
require "Manager/PromptMgr"
require "Manager/MessageMgr"
require "Manager/BattleMgr"

GameManager = {};
local this = GameManager;
local managerList = {};	--控制器列表--

function GameManager.Init()
	logWarn("GameManager.Init----->>>");
	managerList[ManagerNames.Prompt] = PromptMgr.New();
	managerList[ManagerNames.Message] = MessageMgr.New();
	managerList[ManagerNames.Battle] = BattleMgr.new()

	return this;
end

--添加控制器--
function GameManager.AddManager(managerName, managerObj)
	managerList[managerName] = managerObj;
end

--获取控制器--
function GameManager.GetManager(managerName)
	return managerList[managerName];
end

--移除控制器--
function GameManager.RemoveManager(managerName)
	managerList[managerName] = nil;
end

--关闭控制器--
function GameManager.Close()
	logWarn('GameManager.Close---->>>');
end

function GameManager.openPanel(managerName)
	local panelMgr = this.GetManager(managerName)
	if panelMgr ~= nil then
		panelMgr.Awake()
	else
		local panelMgr = require("Manager/"..managerName..".lua"):new()
		this.AddManager(managerName, panelMgr)
		if not panelMgr then
			logError("Do not create: " ..managerName.."Manager!")
		else
			panelMgr:Awake()
		end
	end
	
	return panelMgr
end

function GameManager.closePanel(managerName)
	if not managerList[managerName] then logError("Not panel:"..managerName.."Manager!") end
	managerList[managerName].Close()
	this.RemoveManager(managerName)
end