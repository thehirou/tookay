//---Any
tilingBg1X+=tilingBg1XSpeed
tilingBg1Y+=tilingBg1YSpeed
tilingBg2X+=tilingBg2XSpeed
tilingBg2Y+=tilingBg2YSpeed
draw_sprite_tiled(sprBgUi,0,tilingBg1X,tilingBg1Y)
//draw_sprite_stretched_ext(sprBgUi,0,WLEFT,HLEFT,WPORT,HPORT,c_white,1)
draw_sprite_stretched_ext(sprBgGradient,0,WLEFT,HLEFT,WPORT,HPORT,c_white,alphaBg)
draw_sprite_ext(sprBootLogo,0,WCENTER,HCENTER,1,1,0,c_white,alphaLogo)

switch (global.state)
{
	//####
	case states.disclaimer:
		//---Disclaimer
		timer[1]++
		draw_rectangle_color(0,0,9999,9999,c_white,c_white,c_white,c_white,c_black)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_color(c_black)
		draw_set_font(fntDMSBOLD)
		draw_text_ext_color(WCENTER,HCENTER,disclaimerString,30,WPORT-200,c_black,c_black,c_black,c_black,disclaimerAlpha)
		draw_set_color(c_white)
		draw_set_font(fntDMSREGULAR)
		scrResetAlign();
		
		if timer[1]=3*room_speed
		{
			check=instance_create_depth(WCENTER,HPORT-100,-9999,oButton,{posX:"center",posY:"bottom", text:"Okay.",colorOut:c_black,colorIn:c_white,thick:3,colorTxt:c_black,})	
		}
		
		if timer[1]>3*room_speed and instance_exists(check)
		{
			if instance_position(window_mouse_get_x(),window_mouse_get_y(),check)
			{
				if mouse_check_button_pressed(mb_left)
				{
					timer[1]=6899
					checkAnimation=true
				}
			}
			if checkAnimation=true
			{
					disclaimerAlpha-=0.1
					check.endAnimating=true
					check.width+=200
					check.height+=200
					var gap=9000
					if check.width>WPORT+gap
					{
						global.state=states.boot
						instance_destroy(check)
						checkAnimation=false
					}	
			}
		}
		
	//####
	case states.boot:
		//---Boot
			
	break;
	//####
	case states.running:
		//---Running		
			
			//draw_sprite_ext(sprBottomLogo,0,WLEFT,HPORT,1,1,0,c_white,alphaWatermark)
			
			if (!surface_exists(pfpSurface)) {
			    pfpSurface = surface_create(115, 115);    
			}

			surface_set_target(pfpSurface);
			draw_clear_alpha(c_black, 0);
			draw_sprite(sprPfpMask, 0, 0, 0);
			gpu_set_colorwriteenable(1, 1, 1, 0);
			draw_sprite(sprPfp, 0, 0, 0);
			gpu_set_colorwriteenable(1, 1, 1, 1);
			draw_sprite(sprPfpFrame, 0, 0, 0);
			surface_reset_target();

			draw_surface(pfpSurface, WLEFT+animation[0], HLEFT+30);
			
			var _textY=170
			var _txs=25
			var _shadowLength=5
			
			//Mask the bg of the elements to draw tiled backgrounds and masked
			if animation[4]=0
			{
				if (!surface_exists(themeSurface)) {
				themeSurface = surface_create(WPORT+1, HPORT+1);    
				}

				surface_set_target(themeSurface);
				draw_sprite_stretched_ext(sprFriendsBgImport,0,WPORT+animation[4]-sprite_get_width(sprFriendsImport),HLEFT,sprite_get_width(sprFriendsImport),HPORT,blendBgBox,alphaBgBox)
				draw_sprite_stretched_ext(sprChatBgImport,0,WCENTER-100+animation[4],HLEFT,WCENTER,HPORT,blendBgBox,alphaBgBox)

				draw_sprite_ext(sprDateBg,0,WLEFT+animation[3]-50,HPORT,1,1,0,blendBgBox,alphaBgBox)
				draw_sprite_ext(sprNameNStatusBg,0,WLEFT+animation[1]-50,HLEFT,1,1,0,blendBgBox,alphaBgBox)
			
				gpu_set_colorwriteenable(1, 1, 1, 0);
				draw_sprite_tiled(sprBgElementsUi,0,tilingBg2X,tilingBg2Y)
				gpu_set_colorwriteenable(1, 1, 1, 1);
				//Here you can draw anything on top
				surface_reset_target();

				draw_surface(themeSurface, WLEFT, HLEFT);
			}
			
			draw_sprite_stretched_ext(sprFriendsBgImport,0,WPORT+animation[4]-sprite_get_width(sprFriendsImport),HLEFT,sprite_get_width(sprFriendsImport),HPORT,blendBgBox,alphaBgBoxAnimation)
			draw_sprite_stretched_ext(sprChatBgImport,0,WCENTER-100+animation[4],HLEFT,WCENTER,HPORT,blendBgBox,alphaBgBoxAnimation)

			draw_sprite_ext(sprDateBg,0,WLEFT+animation[3]-50,HPORT,1,1,0,blendBgBox,alphaBgBoxAnimation)
			draw_sprite_ext(sprNameNStatusBg,0,WLEFT+animation[1]-50,HLEFT,1,1,0,blendBgBox,alphaBgBoxAnimation)
			
			
			draw_set_font(fntDMSBOLDIT)
			
			//Shadow for the text
			draw_set_color(c_black)
			draw_set_alpha(0.7)
			draw_text_ext(WLEFT+animation[1]+_shadowLength,HLEFT+_textY+_shadowLength,name,5,300)
			draw_text_ext(WLEFT+animation[2]+_shadowLength,HLEFT+_textY+_txs+_shadowLength,status,5,300)
			draw_text_ext(WLEFT+animation[3]+_shadowLength,HPORT-70+_shadowLength,date,5,300)
			draw_set_alpha(1)
			draw_set_color(c_white)
			
			//The text in question
			draw_text_outline(WLEFT+animation[1],HLEFT+_textY,name,c_white,c_white,c_white,c_white,#d4863f,2,1)
			draw_text_outline(WLEFT+animation[2],HLEFT+_textY+_txs,status,c_white,c_white,c_white,c_white,#d4863f,2,1)
			draw_text_outline(WLEFT+animation[3],HPORT-70,date,c_white,c_white,c_white,c_white,#d4863f,2,1)
			
			draw_set_font(fntDMSREGULAR)
			
			draw_sprite_stretched(sprFriendsImport,0,WPORT+animation[4]-sprite_get_width(sprFriendsImport),HLEFT,sprite_get_width(sprFriendsImport),HPORT)
			draw_sprite_stretched(sprChatImport,0,WCENTER-100+animation[4],HLEFT,WCENTER,HPORT)
			
			 if !instance_exists(oChatbox){instance_create_depth(0,0,-9999,oChatbox);}
			
			draw_sprite(sprDate,0,WLEFT+animation[3]-50,HPORT)
			draw_sprite(sprNameNStatus,0,WLEFT+animation[1]-50,HLEFT)
			
	break;
	//####
	case states.background:
		//---Background
			
	break;
	//####
}

scrDebugCallibration();