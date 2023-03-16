var glyphHeight=24
var numberOfLines=(string_height_ext(global.chatWriteString,24,WCENTER-55-55)/glyphHeight)-1
numberOfLines=clamp(numberOfLines,0,9999)

draw_set_valign(fa_bottom)
draw_set_halign(fa_left)
	
	var text=global.chatWriteString
	var final="";
	var hold="";
	var threshold=WCENTER-55-55
	
	for (var i=1, dim = string_length(text); i<=dim; i++)
	{
		var c=string_char_at(text, i);
		var w=string_width(hold + c);
		if (w<threshold)
		{
			hold=hold+c;	
		}
		else
		{
			final=final+hold+"\n";
			hold=c==" " ? "" : c;
		}
	}
	
	if writing=true and keyboard_check_pressed(vk_enter)
	{
		scrAppearSentMessage();
		messageCount++
		global.sentMsg[messageCount]=global.chatWriteString
		global.msgTurn[messageCount]=messageCount
		scrSendMessage();
		keyboard_string=""
		scrAppearSentMessage();
	}
	show_debug_message(string(leftAt)+" / "+string(messages)+" / "+string(messageCount))
	/*
		//Chat messages
		for (var ii = messages, jj=-1; ii >= 0; --ii)
		{
			if ii>=0{jj++}
	
		        var messageDifference=5+24
		        draw_text_ext_color(WCENTER-55+oProgram.animation[4],HPORT-60-string_height(final)-10-messageDifference-jj*messageDifference,
		        "> "+global.chatMessages[ii].sender+": "+
		        global.chatMessages[ii].msg
		        ,messageDifference,WCENTER-55-55,CW,CW,CW,CW,1) //6899 AÑADIR EL LINE BREAK QUE HE SUADO PARA LO OTRO AQUI 6899
		}
		*/

	//Message currently being written
	draw_sprite_stretched(sprite_index,0,WCENTER-100+oProgram.animation[4],HPORT-sprite_height-string_height(final),WCENTER,sprite_height+string_height(final))
	draw_text_color(WCENTER-55+oProgram.animation[4],HPORT-57,hold,CB,CB,CB,CB,1)
	draw_text_color(WCENTER-55+oProgram.animation[4],HPORT-57-glyphHeight,final,CB,CB,CB,CB,1)
	
	draw_set_alpha(blinkingLineAlpha)
		draw_line_color(WCENTER-55+oProgram.animation[4]+string_width(hold)+2,HPORT-52-10,WCENTER-55+oProgram.animation[4]+string_width(hold)+2,HPORT-52-30,c_black,c_black)
	draw_set_alpha(1)
	


scrResetAlign()


