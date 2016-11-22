require "Common/define"
require "Controller/PromptCtrl"
require "Controller/MessageCtrl"
require "Controller/BattleCtrl"

CtrlManager = {};
local this = CtrlManager;
local ctrlList = {};	--控制器列表--

function CtrlManager.Init()
	logWarn("CtrlManager.Init----->>>");
	ctrlList[CtrlNames.Prompt] = PromptCtrl.New();
	ctrlList[CtrlNames.Message] = MessageCtrl.New();
	ctrlList[CtrlNames.Battle] = BattleCtrl.new()

	return this;
end

--添加控制器--
function CtrlManager.AddCtrl(ctrlName, ctrlObj)
	ctrlList[ctrlName] = ctrlObj;
end

--获取控制器--
function CtrlManager.GetCtrl(ctrlName)
	return ctrlList[ctrlName];
end

--移除控制器--
function CtrlManager.RemoveCtrl(ctrlName)
	ctrlList[ctrlName] = nil;
end

--关闭控制器--
function CtrlManager.Close()
	logWarn('CtrlManager.Close---->>>');
end

function CtrlManager.openPanel(ctrlName)
	local panelCtrl = this.GetCtrl(ctrlName)
	if panelCtrl ~= nil then
		panelCtrl.Awake()
	else
		local panelCtrl = require("Controller/"..ctrlName..".lua"):new()
		this.AddCtrl(ctrlName, panelCtrl)
		if not panelCtrl then
			logError("Do not create: " ..ctrlName.."Ctrl!")
		else
			panelCtrl:Awake()
		end
	end
	
	return panelCtrl
end

function CtrlManager.closePanel(ctrlName)
	if not ctrlList[ctrlName] then logError("Not panel:"..ctrlName.."Ctrl!") end
	ctrlList[ctrlName].Close()
	this.RemoveCtrl(ctrlName)
end