
MessageMgr = {};
local this = MessageMgr;

local message;
local transform;
local gameObject;

--构建函数--
function MessageMgr.New()
	logWarn("MessageMgr.New--->>");
	return this;
end

function MessageMgr.Awake()
	logWarn("MessageMgr.Awake--->>");
	panelMgr:CreatePanel('Message', this.OnCreate);
end

--启动事件--
function MessageMgr.OnCreate(obj)
	gameObject = obj;

	message = gameObject:GetComponent('LuaBehaviour');
	message:AddClick(MessagePanel.btnClose, this.OnClick);

	logWarn("Start lua--->>"..gameObject.name);
end

--单击事件--
function MessageMgr.OnClick(go)
	destroy(gameObject);
end

--关闭事件--
function MessageMgr.Close()
	panelMgr:ClosePanel(MgrNames.Message);
end