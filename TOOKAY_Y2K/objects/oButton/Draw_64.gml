if inside=false
{
	draw_rectangle_color(fakeX-width/2,fakeY+thick*3-height/2,fakeX+width/2,fakeY+thick*3+height/2,c_gray,c_gray,c_gray,c_gray,false)
}
draw_rectangle_color(fakeX-width/2,fakeY-height/2+anim,fakeX+width/2,fakeY+height/2+anim,colorIn,colorIn,colorIn,colorIn,false)

scrRectangleThick(fakeX-width/2,fakeY-height/2+anim,fakeX+width/2,fakeY+height/2+anim,colorOut,thick)

if endAnimating=false
{
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_set_font(oProgram.fntDMSBOLD)
		draw_text_color(fakeX,fakeY+anim,text,colorTxt,colorTxt,colorTxt,colorTxt,1)
	scrResetAlign()
}

/*
//draw_circle_color(x,y,5,c_black,c_black,false)
draw_set_alpha(0.5);
draw_rectangle_colour(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,false);
draw_set_alpha(1);