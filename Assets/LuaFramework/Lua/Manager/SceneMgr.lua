--
-- Author: HLZ
-- Date: 2016-11-22 16:49:08
-- 场景管理器

-- SceneMgr = {};
-- local this = SceneMgr;

-- local message;
-- local transform;
-- local gameObject;

-- --构建函数--
-- function SceneMgr.New()
-- 	logWarn("SceneMgr.New--->>");
-- 	return this;
-- end

-- function SceneMgr.Awake()
-- 	logWarn("SceneMgr.Awake--->>");
-- end

-- function SceneMgr.( ... )
-- 	-- body
-- end


-- --关闭事件--
-- function SceneMgr.Close()

-- end


local SceneMgr = class("SceneMgr")

function SceneMgr:getInstance(  )
    if self.instance == nil then
        self.instance = SceneMgr.new()
    end
    return self.instance
end

function SceneMgr:ctor()
    
end

function SceneMgr:enterMainScene( )
    --进入第一个场景
    OnLevelWasLoaded(2)

end

return SceneMgr