function scrDefineMacros()
{
#macro WPORT 	view_wport[0]
#macro HPORT 	view_hport[0]

#macro WCENTER view_wport[0]/2
#macro HCENTER view_hport[0]/2

#macro WLEFT view_wport[0]-view_wport[0]
#macro HLEFT view_hport[0]-view_hport[0]

#macro CB c_black
#macro CW c_white
}

function scrDebugCallibration()
{
	if keyboard_check(vk_control)
	{
		draw_set_alpha(0.5)
		draw_rectangle_color(0,0,9999,9999,c_white,c_white,c_white,c_white,false)
		draw_set_alpha(1)
		draw_set_color(c_black)
		draw_circle(WPORT/2,HPORT/2,3,false)
	
		draw_circle(WPORT,HPORT/2,3,false)
		draw_circle(WPORT-WPORT,HPORT/2,3,false)
		draw_circle(WPORT/2,HPORT,3,false)
		draw_circle(WPORT/2,HPORT-HPORT,3,false)
	
		draw_circle(WPORT,HPORT,3,false)
		draw_circle(WPORT-WPORT,HPORT,3,false)
		draw_circle(WPORT-WPORT,HPORT-HPORT,3,false)
		draw_circle(WPORT,HPORT-HPORT,3,false)
		draw_set_color(c_white)
	
		draw_line_color(WPORT-WPORT,HPORT-HPORT+10,WPORT,HPORT-HPORT+10,c_green,c_green)
		draw_line_color(WPORT-WPORT+10,HPORT-HPORT,WPORT-WPORT+10,HPORT,c_red,c_red)
		
		draw_set_font(fntDMSBOLD)
		draw_text_color(WPORT-WPORT+15,HPORT-HPORT+10,string(WPORT),c_green,c_green,c_green,c_green,1)
		draw_text_color(WPORT-WPORT+15,HPORT-HPORT+25,string(HPORT),c_red,c_red,c_red,c_red,1)
		
		draw_text_color(WPORT-WPORT+15,HPORT-HPORT+25+15+15,"X: "+string(window_mouse_get_x()),c_green,c_green,c_green,c_green,1)
		draw_text_color(WPORT-WPORT+15,HPORT-HPORT+25+15+15+15,"Y: "+string(window_mouse_get_y()),c_red,c_red,c_red,c_red,1)
	}
}

function scrCheckResize()
{
	if (!window_get_fullscreen())
	{
		    if ( window_get_width() != global.Window_Width ||
		         window_get_height() != global.Window_Height )
		    {
		        WPORT = window_get_width()
		        HPORT = window_get_height()
			
				show_debug_message("Window resized to "+string(WPORT)+"x"+string(HPORT))
				
				var _maxW=860
				var _maxH=488
				
				if WPORT>=_maxW and HPORT>=_maxH
				{
				surface_resize(application_surface, WPORT, HPORT)
				}else
				if WPORT>=_maxW and HPORT<=_maxH
				{
				window_set_size(WPORT,_maxH)
				surface_resize(application_surface, WPORT, _maxH)
				}else		
				if WPORT<=_maxW and HPORT>=_maxH
				{
				window_set_size(_maxW,HPORT)
				surface_resize(application_surface, _maxW, HPORT)
				}else		
				if WPORT<=_maxW and HPORT<=_maxH
				{
				window_set_size(_maxW,_maxH)
				surface_resize(application_surface, _maxW, _maxH)
				}
   
		        global.Window_Width = window_get_width()
		        global.Window_Height = window_get_height()
				//display_set_gui_size(global.Window_Width,global.Window_Height) //(Useless)
		    }
	}	
}

function scrResetAlign()
{
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}

function draw_text_outline(x_,y_,string_,color1,color2,color3,color4,color_outline,outline_big,alpha_)
{
 
	draw_text_color(x_+outline_big,y_,string_,color_outline,color_outline,color_outline,color_outline,alpha_) //X+
	draw_text_color(x_,y_+outline_big,string_,color_outline,color_outline,color_outline,color_outline,alpha_) //Y+
	draw_text_color(x_-outline_big,y_,string_,color_outline,color_outline,color_outline,color_outline,alpha_) //X-
	draw_text_color(x_,y_-outline_big,string_,color_outline,color_outline,color_outline,color_outline,alpha_) //Y+
	 
	draw_text_color(x_+outline_big,y_+outline_big,string_,color_outline,color_outline,color_outline,color_outline,alpha_) //X+ Y+
	draw_text_color(x_-outline_big,y_-outline_big,string_,color_outline,color_outline,color_outline,color_outline,alpha_) //X- Y-
	draw_text_color(x_+outline_big,y_-outline_big,string_,color_outline,color_outline,color_outline,color_outline,alpha_) //X+ Y-
	draw_text_color(x_-outline_big,y_+outline_big,string_,color_outline,color_outline,color_outline,color_outline,alpha_) //X- Y+
	 
	draw_text_color(x_,y_,string_,color1,color2,color3,color4,alpha_)
 
}

function scrPromptName()
{
	name=get_string("Your name?","")
	name=string_replace_all(name," ","_")
	if name=""{show_message("Name cannot be blank!"); scrPromptName();}
	if string_length(name)>16{show_message("Name cannot be longer than 16 characters!"); scrPromptName();}
}

function scrPromptPassword()
{
	password=get_string("Password for user "+string(name)+".","")
	if password=mockupPassword{global.state=states.running;}else{show_message("Wrong password!"); scrPromptPassword();}
}

function scrRectangleThick(x1,y1,x2,y2,color,width)
{
 //This might need optimization
draw_set_color(color)
draw_rectangle(x1,y1,x2,y2,true)
 
var i = 0
 
do
{
    i += 1
    draw_rectangle(x1-i,y1-i,x2+i,y2+i,true)
}
until(i = width)
 
}

function scrXY(_x,_y)
{
	x=_x
	y=_y
}