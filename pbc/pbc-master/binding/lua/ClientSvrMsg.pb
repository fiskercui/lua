
�
proto/ClientSvrMsg.protofgame"

CSErrorMsg
ErrCode (

CSLoginReq
OpenId (	
Inner (
CSLoginResp
Uin (
CSRegReq
Account (	
Pwd (	"
	CSRegResp
Uin (
CSHeartBeatReq
Msg_ID (
CSHeartBeatResp
Ret (

CSPlayInfo
Uin (
Name (	
Camp (
Seat (
Weapon ("
CSPoint	
x (	
y ("

Type (
CSPvpMatchResp
	Match_Ret (
Type (

Type (
CSPvpStartResp
MapId (
Type (

Ts (
PlayInfo (2.fgame.CSPlayInfo"
CSPvpEndReq"
CSPvpEndResp
Win (
CSPvpMovReq
Uin (
velocity (2.fgame.CSPoint 
position (2.fgame.CSPoint
status (

Uin (
	SourceUin (
SkillUid (
SkillId (
position (2.fgame.CSPoint")
CSDamageInfo
Uin (
Type (
CSPvpDamageReq
Uin (
SkillUid (
position (2.fgame.CSPoint&
	DamgeInfo (2.fgame.CSDamageInfo"
CSPvpPingReq

Ts ("

Host (
C2ServerMsg$
	Login_Req (2.fgame.CSLoginReq 
Reg_Req (2.fgame.CSRegReq,

	Match_Req (2.fgame.CSPvpMatchReq'
	Start_Req (2.fgame.CSPvpStartReq#
End_Req (2.fgame.CSPvpEndReq'
	Skill_Req (2.fgame.CSPvpSkillReq)

Damage_Req	 (2.fgame.CSPvpDamageReq#
Mov_Req
 (2.fgame.CSPvpMovReq%
Ping_Req
S2ClientMsg$
	Error_Msg (2.fgame.CSErrorMsg&

Login_Resp (2.fgame.CSLoginResp"
Reg_Resp (2.fgame.CSRegResp.
HeartBeat_Resp (2.fgame.CSHeartBeatResp)

Match_Resp (2.fgame.CSPvpMatchResp)

Start_Resp (2.fgame.CSPvpStartResp%
End_Resp (2.fgame.CSPvpEndResp(

Skill_Resp (2.fgame.CSPvpSkillReq*
Damage_Resp	 (2.fgame.CSPvpDamageReq$
Mov_Resp
 (2.fgame.CSPvpMovReq'
	Ping_Resp
	CS_CMD_ID

CS_CMD_REGd
CS_CMD_LOGIN�
CS_CMD_HEART_BEAT�
CS_CMD_ENTER_STAGE�
CS_CMD_PASS_STAGE�
CS_CMD_PVP_MATCH�
CS_CMD_PVP_START�
CS_CMD_PVP_END�
CS_CMD_PVP_PING�
CS_CMD_Pvp_Mov�
CS_CMD_Pvp_Skill�
CS_CMD_Pvp_Damage�