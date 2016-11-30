--
-- Author: HLZ
-- Date: 2016-11-22 16:49:08
-- 主界面控制器

local MainViewMgr = class("MainViewMgr")

function MainViewMgr:getInstance(  )
    if self.instance == nil then
        self.instance = MainViewMgr.new()
    end
    return self.instance
end

function MainViewMgr:ctor()
    
end


return MainViewMgr