
�
ClientSvrMsg.protofgame"

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
y ("5

PlayType (

BattleType (
CSPvpMatchResp
	Match_Ret (
Type (
PlayType (
PlayInfo (2.fgame.CSPlayInfo"#
CSPvpMatchCancelReq
Type (
CSPvpMatchCancelResp
Uin (

CSRandItem
PosX (
PosY (
ItemId (
Serial (

Type (
CSPvpStartResp
	StartType (
MapId (
Type (

Ts (
	RandItems (2.fgame.CSRandItem"
CSPvpEndReq
Wincamp (
CSItem
ItemId (
	ItemCount (
CSPvpReward
Uin (
Result (
gold (
Items (2
CSPvpEndResp
Wincamp (
CSPvpMovReq
Uin (
velocity (2.fgame.CSPoint 
position (2.fgame.CSPoint
status (

Uin (
	SourceUin (
SkillUid (
SkillId (
position (2.fgame.CSPoint
SkillStatus (
CSDamageInfo
Uin (
Type (
Subuid (
CSPvpDamageReq
Uin (
Type (
position (2.fgame.CSPoint
	sourceUin (
CSBuff
Serial (
Buffid (
	BuffValue (
BuffTime (
CSSysBuffReq
Uin (
Buff (2

Uin (
Buff (2
CSPlayerStatus
Uin (
PosX (
PosY (
Buffs (2
CSPvpPingReq

Ts ("

Host (

Uin (
CSPvpLeaveResp
Uin (
CSPvpWeaponReq
Uin (
Serial (
CSPvpWeaponResp
Uin (
Serial (
SkillId (
CSPvpPickItemReq
Uin (

ItemSerial (
CSPvpPickItemResp
Uin (

ItemSerial (
CSPvpRelive
Uin (
LiveSeat (
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
	WeaponReq (2.fgame.CSPvpWeaponReq2
MatchCancelReq (2.fgame.CSPvpMatchCancelReq,
PickItemReq (2.fgame.CSPvpPickItemReq$
BuffReq (2.fgame.CSSysBuffReq)
PvpLeaveReq (2.fgame.CSPvpLeaveReq"�
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

WeaponResp (2.fgame.CSPvpWeaponResp4
MatchCancelResp (2.fgame.CSPvpMatchCancelResp.
PickItemResp (2.fgame.CSPvpPickItemResp&
BuffResp (2.fgame.CSSysBuffResp+
PvpLeaveResp (2.fgame.CSPvpLeaveResp)

	CS_CMD_ID

CS_CMD_REGd
CS_CMD_LOGIN�
CS_CMD_HEART_BEAT�
CS_CMD_ENTER_STAGE�
CS_CMD_PASS_STAGE�
CS_CMD_PVP_MATCH�
CS_CMD_PVP_START�
CS_CMD_PVP_END�
CS_CMD_PVP_WEAPON�
CS_CMD_PVP_PING�
CS_CMD_Pvp_Mov�
CS_CMD_Pvp_Skill�
CS_CMD_Pvp_Damage�
CS_CMD_PVP_MATCH_CANCEL�
CS_CMD_PVP_PICK_ITEM�
CS_CMD_PVP_BUFF�
CS_CMD_PVP_LEAVE�
CS_CMD_PVP_RELIVE�