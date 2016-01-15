
Ñ
ClientSvrMsg.protofgame"

CSErrorMsg
ErrCode ("+

CSLoginReq
OpenId (	
Inner ("
CSLoginResp
Uin ("(
CSRegReq
Account (	
Pwd (	"
	CSRegResp
Uin (" 
CSHeartBeatReq
Msg_ID ("
CSHeartBeatResp
Ret ("S

CSPlayInfo
Uin (
Name (	
Camp (
Seat (
Weapon ("
CSPoint	
x (	
y ("5
CSPvpMatchReq
PlayType (

BattleType ("h
CSPvpMatchResp
	Match_Ret (
Type (
PlayType (#
PlayInfo (2.fgame.CSPlayInfo"#
CSPvpMatchCancelReq
Type ("#
CSPvpMatchCancelResp
Uin ("H

CSRandItem
PosX (
PosY (
ItemId (
Serial ("
CSPvpStartReq
Type ("r
CSPvpStartResp
	StartType (
MapId (
Type (

Ts ($
	RandItems (2.fgame.CSRandItem"
CSPvpEndReq
Wincamp ("+
CSItem
ItemId (
	ItemCount ("V
CSPvpReward
Uin (
Result (
gold (
Items (2.fgame.CSItem"
CSPvpEndResp
Wincamp ("n
CSPvpMovReq
Uin ( 
velocity (2.fgame.CSPoint 
position (2.fgame.CSPoint
status ("‰
CSPvpSkillReq
Uin (
	SourceUin (
SkillUid (
SkillId ( 
position (2.fgame.CSPoint
SkillStatus ("9
CSDamageInfo
Uin (
Type (
Subuid ("`
CSPvpDamageReq
Uin (
Type ( 
position (2.fgame.CSPoint
	sourceUin ("M
CSBuff
Serial (
Buffid (
	BuffValue (
BuffTime ("8
CSSysBuffReq
Uin (
Buff (2.fgame.CSBuff"9
CSSysBuffResp
Uin (
Buff (2.fgame.CSBuff"W
CSPlayerStatus
Uin (
PosX (
PosY (
Buffs (2.fgame.CSBuff"
CSPvpPingReq

Ts ("
CSPvpPingResp
Host ("
CSPvpLeaveReq
Uin ("
CSPvpLeaveResp
Uin ("-
CSPvpWeaponReq
Uin (
Serial ("?
CSPvpWeaponResp
Uin (
Serial (
SkillId ("3
CSPvpPickItemReq
Uin (

ItemSerial ("4
CSPvpPickItemResp
Uin (

ItemSerial (",
CSPvpRelive
Uin (
LiveSeat ("÷
C2ServerMsg$
	Login_Req (2.fgame.CSLoginReq 
Reg_Req (2.fgame.CSRegReq,
HeartBeat_Req (2.fgame.CSHeartBeatReq'
	Match_Req (2.fgame.CSPvpMatchReq'
	Start_Req (2.fgame.CSPvpStartReq#
End_Req (2.fgame.CSPvpEndReq'
	Skill_Req (2.fgame.CSPvpSkillReq)

Damage_Req	 (2.fgame.CSPvpDamageReq#
Mov_Req
 (2.fgame.CSPvpMovReq%
Ping_Req (2.fgame.CSPvpPingReq(
	WeaponReq (2.fgame.CSPvpWeaponReq2
MatchCancelReq (2.fgame.CSPvpMatchCancelReq,
PickItemReq (2.fgame.CSPvpPickItemReq$
BuffReq (2.fgame.CSSysBuffReq)
PvpLeaveReq (2.fgame.CSPvpLeaveReq"ã
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
	Ping_Resp (2.fgame.CSPvpPingResp*

WeaponResp (2.fgame.CSPvpWeaponResp4
MatchCancelResp (2.fgame.CSPvpMatchCancelResp.
PickItemResp (2.fgame.CSPvpPickItemResp&
BuffResp (2.fgame.CSSysBuffResp+
PvpLeaveResp (2.fgame.CSPvpLeaveResp)
PvpReliveResp (2.fgame.CSPvpRelive*ª
	CS_CMD_ID

CS_CMD_REGd
CS_CMD_LOGINô
CS_CMD_HEART_BEATõ
CS_CMD_ENTER_STAGEÙ
CS_CMD_PASS_STAGEÚ
CS_CMD_PVP_MATCHÐ
CS_CMD_PVP_STARTÑ
CS_CMD_PVP_ENDÔ
CS_CMD_PVP_WEAPONÕ
CS_CMD_PVP_PINGÖ
CS_CMD_Pvp_Mov×
CS_CMD_Pvp_SkillØ
CS_CMD_Pvp_DamageÙ
CS_CMD_PVP_MATCH_CANCELÚ
CS_CMD_PVP_PICK_ITEMÛ
CS_CMD_PVP_BUFFÜ
CS_CMD_PVP_LEAVEÝ
CS_CMD_PVP_RELIVEÞ