//---Any
scrCheckResize();
if keyboard_check_pressed(ord("R")) and keyboard_check(vk_alt){game_restart()}

if keyboard_check_pressed(ord("0")) and keyboard_check(vk_shift){global.state=states.disclaimer}
if keyboard_check_pressed(ord("1")) and keyboard_check(vk_shift){global.state=states.boot}
if keyboard_check_pressed(ord("2")) and keyboard_check(vk_shift){global.state=states.login}
if keyboard_check_pressed(ord("3")) and keyboard_check(vk_shift){global.state=states.running}

if current_day>9{day=current_day}else{day="0"+string(current_day)}
if current_month>9{month=current_month}else{month="0"+string(current_month)}
year=current_year
if current_hour>9{hour=current_hour}else{hour="0"+string(current_hour)}
if current_minute>9{minute=current_minute}else{minute="0"+string(current_minute)}
if current_second>9{second=current_second}else{second="0"+string(current_second)}

date=string(day)+"/"+string(month)+"/"+string(year)+"      "+string(hour)+":"+string(minute)+":"+string(second)
global.date="d"+string(current_day)+"-"+"mo"+string(current_month)+"-"+"y"+string(current_year)+"-"+"h"+string(current_hour)+"-"+"mi"+string(current_minute)+"-"+"s"+string(current_second)+"!"
global.userConnected=name

switch (global.state)
{
	//####
	case states.boot:
		//---Boot
			timer[0]++
			if timer[0]>60{global.state=states.login; timer[0]=6899}
	break;
	//####
	
	case states.login:
		//---Boot
			scrPromptName();
			
			//6899 Check if name is already in database, if so, ask for login. Mockup:
			if name="Marco"
				{
					if show_question("This username already exists, do you want to login?")
					{
						scrPromptPassword();
					}
					else
					{
						name=""
					}
				}
			else{keyboard_string=""; global.state=states.running;}
	break;
	//####
	
	case states.running:
		//---Running		
			alphaBg=lerp(alphaBg,0,0.05)
			alphaLogo=lerp(alphaLogo,0,0.05)
			alphaWatermark=lerp(alphaWatermark,1,0.01)
			if animation[4]=0
			{
			alphaBgBoxAnimation=lerp(alphaBgBoxAnimation,0,0.05)	
			}
			
			//Animation for PFP intro
			percent[0] += 1/60;
			position = animcurve_channel_evaluate(curve[0],percent[0])
			var _start=-115
			var _end=30
			var _distance = _end - _start;
			animation[0]=_start+(_distance*position)
			
			//Animation for NAME intro
			percent[1] += 1/90;
			position = animcurve_channel_evaluate(curve[1],percent[1])
			var _start=-150
			var _end=50
			var _distance = _end - _start;
			animation[1]=_start+(_distance*position)
			
			//Animation for TEXT 1 intro
			percent[2] += 1/100;
			position = animcurve_channel_evaluate(curve[2],percent[2])
			var _start=-150
			var _end=50
			var _distance = _end - _start;
			animation[2]=_start+(_distance*position)
			
			//Animation for TEXT 2 intro
			percent[3] += 1/110;
			position = animcurve_channel_evaluate(curve[3],percent[3])
			var _start=-150
			var _end=50
			var _distance = _end - _start;
			animation[3]=_start+(_distance*position)
			
			//Animation for Friends and Chat
			percent[4] += 1/110;
			position = animcurve_channel_evaluate(curve[4],percent[4])
			var _start=550
			var _end=0
			var _distance = _end - _start;
			animation[4]=_start+(_distance*position)
			
			
			
			
			
	break;
	//####
	case states.background:
		//---Background
			
	break;
	//####
}