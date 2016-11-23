-- require "Common/define"

-- require "3rd/pblua/login_pb"
-- require "3rd/pbc/protobuf"

-- local sproto = require "3rd/sproto/sproto"
-- local core = require "sproto.core"
-- local print_r = require "3rd/sproto/print_r"

-- PromptMgr = {};
-- local this = PromptMgr;

-- local panel;
-- local prompt;
-- local transform;
-- local gameObject;

-- --构建函数--
-- function PromptMgr.New()
-- 	logWarn("PromptMgr.New--->>");
-- 	return this;
-- end

-- function PromptMgr.Awake()
-- 	logWarn("PromptMgr.Awake--->>");
-- 	panelMgr:CreatePanel('Prompt', this.OnCreate);
-- end

-- --启动事件--
-- function PromptMgr.OnCreate(obj)
-- 	gameObject = obj;
-- 	transform = obj.transform;

-- 	panel = transform:GetComponent('UIPanel');
--     --[[LuaFramework会给每个界面添加名为LuaBehaviour的组件,
--     它拥有用于添加按钮监听的AddClick方法,相关代码如下,与UIEvent的AddButtonClick方法相似。
--     --]]
-- 	prompt = transform:GetComponent('LuaBehaviour');
-- 	logWarn("Start lua--->>"..gameObject.name);

-- 	prompt:AddClick(PromptPanel.btnOpen, this.OnClick);
-- 	resMgr:LoadPrefab('prompt', { 'PromptItem' }, this.InitPanel);
-- end

-- --初始化面板--
-- function PromptMgr.InitPanel(objs)
-- 	local count = 100; 
-- 	local parent = PromptPanel.gridParent;
-- 	for i = 1, count do
-- 		local go = newObject(objs[0]);
-- 		go.name = 'Item'..tostring(i);
-- 		go.transform:SetParent(parent);
-- 		go.transform.localScale = Vector3.one;
-- 		go.transform.localPosition = Vector3.zero;
--         prompt:AddClick(go, this.OnItemClick);

-- 	    local label = go.transform:FindChild('Text');
-- 	    label:GetComponent('Text').text = tostring(i);
-- 	end
-- end

-- --初始化面板--
-- -- function PromptMgr:InitPanel()
-- --     self.panel.depth = 1    --设置纵深--
-- --     local parent = self.promptPanel.gridParent
-- --     local itemPrefab = self.prompt:LoadAsset('PromptItem')
-- --     for i = 1, 100 do
-- --         local go = newObject(itemPrefab)
-- --         go.name = tostring(i)
-- --         go.transform.parent = parent
-- --         go.transform.localScale = Vector3.one
-- --         go.transform.localPosition = Vector3.zero
-- --         self.prompt:AddClick(go, self.OnItemClick)

-- --         local goo = go.transform:FindChild('Label')
-- --         goo:GetComponent('UILabel').text = i
-- --     end
-- --     local grid = parent:GetComponent('UIGrid')
-- --     grid:Reposition()
-- --     grid.repositionNow = true
-- --     parent:GetComponent('WrapGrid'):InitGrid()
-- -- end


-- --滚动项单击--
-- function PromptMgr.OnItemClick(go)
--     log(go.name);
-- end

-- --单击事件--
-- function PromptMgr.OnClick(go)
-- 	if TestProtoType == ProtocalType.SPROTO then
-- 		this.TestSendSproto();
-- 	end
-- 	logWarn("OnClick---->>>"..go.name);
-- end

-- --测试发送SPROTO--
-- function PromptMgr.TestSendSproto()
--     local sp = sproto.parse [[
--     .Person {
--         name 0 : string
--         id 1 : integer
--         email 2 : string

--         .PhoneNumber {
--             number 0 : string
--             type 1 : integer
--         }

--         phone 3 : *PhoneNumber
--     }

--     .AddressBook {
--         person 0 : *Person(id)
--         others 1 : *Person
--     }
--     ]]

--     local ab = {
--         person = {
--             [10000] = {
--                 name = "Alice",
--                 id = 10000,
--                 phone = {
--                     { number = "123456789" , type = 1 },
--                     { number = "87654321" , type = 2 },
--                 }
--             },
--             [20000] = {
--                 name = "Bob",
--                 id = 20000,
--                 phone = {
--                     { number = "01234567890" , type = 3 },
--                 }
--             }
--         },
--         others = {
--             {
--                 name = "Carol",
--                 id = 30000,
--                 phone = {
--                     { number = "9876543210" },
--                 }
--             },
--         }
--     }
--     local code = sp:encode("AddressBook", ab)
--     ----------------------------------------------------------------
--     local buffer = ByteBuffer.New();
--     buffer:WriteShort(Protocal.Message);
--     buffer:WriteByte(ProtocalType.SPROTO);
--     buffer:WriteBuffer(code);
--     networkMgr:SendMessage(buffer);
-- end


-- --关闭事件--
-- function PromptMgr.Close()
-- 	panelMgr:ClosePanel(MgrNames.Prompt);
-- end


local PromptMgr = class("PromptMgr")

function PromptMgr:getInstance(  )
    if self.instance == nil then
        self.instance = PromptMgr.new()
    end
    return self.instance
end

function PromptMgr:ctor()
    
end

return PromptMgr