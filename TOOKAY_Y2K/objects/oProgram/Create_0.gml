enum states
{
disclaimer,
boot,
login,
running,
background,
}

window_set_caption("TOOKAY")

global.chatWriteString=""

global.msgTurn[0]=0
global.sentMsg[0]=""
global.currentFriend="Alex"
global.date=""
global.userConnected=""
global.sessionCount=0
scrLoadSession()
scrSaveSession()

global.chatMessages[0] = 
{
	sender : "",
	friend : "",
	msg : "",
	date : "",
}

global.state=states.disclaimer

global.Window_Width = window_get_width()
global.Window_Height = window_get_height()

disclaimerString="TOOKAY is an experiment made by a guy who knows nothing about netcode and backend, information might be in danger of being leaked in early stages of this software, use this just as a silly software to play with.\nDO NOT SET HERE REAL PASSWORDS THAT YOU USE!"
check=oButton

checkAnimation=false

name=""
password=""
mockupPassword="12345678"
statusDisplay="Happy"
status="Status: "+string(statusDisplay)

tilingBg1X=0
tilingBg1Y=0
tilingBg2X=0
tilingBg2Y=0

tilingBg1XSpeed=0.1
tilingBg1YSpeed=0.1
tilingBg2XSpeed=-0.1
tilingBg2YSpeed=0.05

day=current_day
month=current_month
year=current_year
hour=current_hour
minute=current_minute
second=current_second

date=string(day)+"/"+string(month)+"/"+string(year)+"      "+string(hour)+":"+string(minute)+":"+string(second)

//datafiles->img
sprReferenceUi=sprite_add("img/uireference.png",0,false,true,0,0)
sprBootLogo=sprite_add("img/tookayboot.png",0,false,true,1080/2,640/2)
sprBottomLogo=sprite_add("img/bottomlogo.png",0,false,true,0,640)
sprBgGradient=sprite_add("img/tookaybg.png",0,false,true,0,0)

//datafiles->hostdatabase
sprPfp=sprite_add("hostdatabase/profilepicture.png",0,false,true,0,0)

//skin->bg
sprBgUi=sprite_add("img/skin/bg/tookayuibg.png",0,false,true,0,0)
sprBgElementsUi=sprite_add("img/skin/bg/tookayuibgelements.png",0,false,true,0,0)

//skin->mask
sprPfpMask=sprite_add("img/skin/mask/profilemask.png",0,false,true,0,0)
sprChatBgImport=sprite_add("img/skin/mask/chatbg.png",0,false,true,0,320)
sprFriendsBgImport=sprite_add("img/skin/mask/friendsbg.png",0,false,true,1080,0)
sprDateBg=sprite_add("img/skin/mask/datebg.png",0,false,true,0,640)
sprNameNStatusBg=sprite_add("img/skin/mask/namenstatusbg.png",0,false,true,0,0)

//skin->frame
sprPfpFrame=sprite_add("img/skin/frame/profileframe.png",0,false,true,0,0)
sprDate=sprite_add("img/skin/frame/date.png",0,false,true,0,640)
sprNameNStatus=sprite_add("img/skin/frame/namenstatus.png",0,false,true,0,0)
sprChatImport=sprite_add("img/skin/frame/chat.png",0,false,true,0,320)
sprFriendsImport=sprite_add("img/skin/frame/friends.png",0,false,true,1080,0)

//skin->elements
sprChatWriteImport=sprite_add("img/skin/elements/chatwrite.png",0,false,true,0,640)

sprite_set_nineslice(sprChatImport,sprite_get_nineslice(sprChat))
sprite_set_nineslice(sprChatBgImport,sprite_get_nineslice(sprChatBg))
sprite_set_nineslice(sprChatWriteImport,sprite_get_nineslice(sprChatWrite))
sprite_set_nineslice(sprFriendsImport,sprite_get_nineslice(sprFriends))
sprite_set_nineslice(sprFriendsBgImport,sprite_get_nineslice(sprFriendsBg))

font_add_enable_aa(true)
var _bigfont=14

fntDMSBOLD=font_add("fnt/dmsbold.ttf",_bigfont, true, false, 32, 128)
fntDMSBOLDIT=font_add("fnt/dmsboldit.ttf",_bigfont, true, false, 32, 128)
fntDMSIT=font_add("fnt/dmsit.ttf",_bigfont, true, false, 32, 128)
fntDMSMED=font_add("fnt/dmsmed.ttf",_bigfont, true, false, 32, 128)
fntDMSMEDIT=font_add("fnt/dmsmedit.ttf",_bigfont, true, false, 32, 128)
fntDMSREGULAR=font_add("fnt/dmsregular.ttf",_bigfont, true, false, 32, 128)

draw_set_font(fntDMSREGULAR)

blendBgBox=#000000
//blendBgBox=#ffcc97
alphaBgBox=1
alphaBgBoxAnimation=1

disclaimerAlpha=1

alphaBg=1
alphaLogo=1
alphaWatermark=0

pfpSurface=surface_create(115, 115);
themeSurface=surface_create(WPORT, HPORT);

//Animation for PFP intro
animation[0]=-999
curve[0]=animcurve_get_channel(curves,"curve1")
percent[0]=0;

//Animation for NAME  intro
animation[1]=-999
curve[1]=animcurve_get_channel(curves,"curve1")
percent[1]=0;

//Animation for TEXT 2 intro
animation[2]=-999
curve[2]=animcurve_get_channel(curves,"curve1")
percent[2]=0;

//Animation for TEXT 3 intro
animation[3]=-999
curve[3]=animcurve_get_channel(curves,"curve1")
percent[3]=0;

//Animation for Friends and Chat
animation[4]=9999
curve[4]=animcurve_get_channel(curves,"curve1")
percent[4]=0;

//Timer for fade out boot
timer[0]=0

//Timer for fade out disclaimer
timer[1]=0



scrCheckResize();