scrXY(WCENTER-100+oProgram.animation[4],HPORT)

timerBlinking++

if timerBlinking<40{blinkingLineAlpha=0}else{blinkingLineAlpha=1}
if timerBlinking>80{timerBlinking=0}

if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),bbox_left,bbox_top,bbox_right+WCENTER-445,bbox_bottom)
{
	window_set_cursor(cr_beam)
	if mouse_check_button_pressed(mb_left)
	{
		if global.chatWriteString!=""
		{
			//keyboard_string=""	
		}
		writing=true
	}
}
else
{
	window_set_cursor(cr_default)
}

if writing=true
{
	global.chatWriteString=keyboard_string	
}