
cc.FileUtils:getInstance():setPopupNotify(false)
--modify by weihua.cui 2014.03.10
cc.FileUtils:getInstance():addSearchPath("src/")
-- cc.FileUtils:getInstance():addSearchPath("lua/")
cc.FileUtils:getInstance():addSearchPath("res/")
cc.FileUtils:getInstance():addSearchPath("res/ui/")
-- cc.FileUtils:getInstance():addSearchPath("res/ccs-res/")
-- cc.FileUtils:getInstance():addSearchPath("res/ccs-res/armature/")
require "config"
require "cocos.init"

-- local director = cc.Director:getInstance()
-- local view = director:getOpenGLView()
-- view:setFrameSize(1136,640)
require "framework.init"
require "net.init"


local function dumpProto(proto)
    local a = "--"
    local deep = 1
    local function dumpProtoDetail(t)
        deep = deep +1 
        for k,v in pairs(t) do
            if type(v) ~= "table" then
                printf("%s key:%s   value:%s valueLen:%s", string.rep(a,deep), tostring(k), tostring(v), string.len(tostring(v)))
            else
                printf("%s key:%s   \n", string.rep(a,deep), tostring(k))
                dumpProtoDetail(v)
            end
        end
        deep = deep - 1
    end
    dumpProtoDetail(proto)
end


local function  testProto( ... )

    -- require "testparser"

    require("net.protobuf")
    printf("heheh")
    print(_env_new)
    print(_env_register)

    local path =    cc.FileUtils:getInstance():fullPathForFilename("net/protoc/addressbook.pb")
    -- addr = io.open(path,"rb")
    -- buffer = addr:read "*a"
    -- addr:close()

    local buffer = cc.FileUtils:getInstance():getStringFromFile(path)
    print(buffer)
    -- dump(buffer)
    protobuf.register(buffer)

    local person = {
        name = "Alice",
        id = 123,
        phone = {
            { number = "400000000" , type = "MOBILE" },
            { number = "87654321" , type = "HOME" },
        }
    }

    print("-----------------start test")
    local buffer = protobuf.encode("tutorial.Person", person)
    local t = protobuf.decode("tutorial.Person", buffer)
    dumpProto(person)
    dumpProto(t)
    print("----------------end test")


    local path =    cc.FileUtils:getInstance():fullPathForFilename("net/protoc/ClientSvrMsg.pb")
    -- addr = io.open(path,"rb")
    -- buffer = addr:read "*a"
    -- addr:close()
    local buffer = cc.FileUtils:getInstance():getStringFromFile(path)
    protobuf.register(buffer)


    print("-----------------start CSPvpMatchResp")
    local pvpMessage = {
        Match_Ret = 123213,
        PlayInfo = {
            {   Uin = 1111,    Name = 1111},
            {   Uin = 22222,    Name = 2222},
        }
    }
    local buffer = protobuf.encode("fgame.CSPvpMatchResp", pvpMessage)
    local t = protobuf.decode("fgame.CSPvpMatchResp", buffer)

    dump(t)
    print("-----------------end CSPvpMatchResp")


    print("-----------------start CSPvpMapReq")
    local pvpMessage = {
        Data = {
                BuildId  = 123,
                Type  = 2222,
                Level = 322,
                Camp = 432,
                Num = 543,},
        Ts = 12345678,
    }
    printf("before encode")
    dump(pvpMessage)
    local buffer = protobuf.encode("fgame.CSPvpMapReq", pvpMessage)
    local t = protobuf.decode("fgame.CSPvpMapReq", buffer)
    printf("after decode")
    dump(t)
    print("-----------------end CSPvpMapReq")


    -- local net = NetManager:getInstance()
    -- net:initConnect("10.10.2.92", 9999)

    -- local msg = "I love sgame"
    -- net:sendData(msg, string.len(msg))
    
    -- -- local message = t
    -- net:sendData(buffer, string.len(buffer))
end

local function testLogin()
    local net = NetManager:getInstance()
    net:initConnect("10.10.2.92", 9999)

    local regMsg = {
        Account = "wayen",
        Pwd = "61",
    }
    local buffer = protobuf.encode("fgame.CSRegReq", regMsg)   

    net:sendData(100, buffer, string.len(buffer))
    net:registerScriptHanlder(100, function (data)
        printf("recv data:%s, type:%s", data,tolua.type(data))
    end)
    -- net.sendData()

end


local function main()
	-- dump(cc.load("mvc"))
	-- printLog("*********", cc.load("mvc"))
	-- dump(cc.loa			self.menu_:setLocalZOrder(100)d("event"))
	-- printLog("*********", cc.load("event"))

 --    local scene = display.newScene("test")
 --    display.runScene(scene)
	-- local sprite = cc.Sprite:create("map/Map01_bg_01.jpg")    
	-- sprite:setAnchorPoint(cc.p(0,0))
	-- scene:addChild(sprite)

	-- do return end
	-- testProto()
	-- do return end
    -- testLogin()
    -- do return end

	require "property.init"
        require("scene.app.MyApp"):create({
            viewsRoot = "scene.app.views",
        }):run()
    do return end
    require("sceneNew.main.Main"):create({
        viewsRoot  = "scene.main.views",
        defaultSceneName = "MainScene",
    }):run()()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
