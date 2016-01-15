
package.path = package.path .. ";src/?.lua";


require "config"
require "cocos.init"

require "single"
require "global"

require "net.init"
require "logic.init"


cc.FileUtils:getInstance():setPopupNotify(false)


function __G__TRACKBACK__(msg)
    printf("----------------------------------------")
    printf("LUA ERROR: " .. tostring(msg) .. "\n")
    printf(debug.traceback())
    printf("----------------------------------------")
end

-- initproxy()

local netconfig = require "net.netconfig"

-- net test
local function  testNet()
	printf("testNet--------------------------")
	require("table.tableManager")

	local dirReq = {
		OpenId = sgUserObj():getOpenID(),
		GameServerName = sgUserObj():getGameServerName(),
		LastTs = sgUserObj():getLastServerTime(),
		Uin = sgChannelApi():isOnlineSdk() and  sgUserObj():getUin() or 0,
		Version = sgChannelApi():getVersion()

	}
	dump(dirReq)
	dump(NetManager)
	dump(sgLoginProxy())

	sgLoginProxy():InitNetConnection(sgChannelApi():getDirURL());
	sgNetManager():sendData(netconfig.CS_GET_SERVER, dirReq)
end

--table 
local function  testTable()
	require("table.tableManager")
end

--main
local function main()
	local uiconstants = require "logic.constants"

	dump(uiconstants)
	sgPageFunction():gotoFunction(uiconstants.MSG_FUC_LOGO)
	-- testTable()
	-- testNet()
end

main()

