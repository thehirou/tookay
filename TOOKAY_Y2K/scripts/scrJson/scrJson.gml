function scrRegisterUser()
{
	
}

function scrSaveSession()
{
	//Create save array
	var _Session = array_create(0);
	
	var _savedSession = 
	{
		session : global.sessionCount,
	}
	array_push(_Session,_savedSession);
	
	//Save to JSON
	var _string = json_beautify(json_stringify(_Session));
	var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed, 1);
	buffer_write(_buffer,buffer_string,_string);
	buffer_save(_buffer,"logSession.json");
	buffer_delete(_buffer);
}

function scrLoadSession()
{
	if (file_exists("logSession.json"))
	{
		var _buffer=buffer_load("logSession.json");
		var _string=buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer)
		
		var _loadData = json_parse(_string)
		
		while (array_length(_loadData)>0)
		{
			var _loadSessionData = array_pop(_loadData);
			global.sessionCount=real(_loadSessionData.session)+1
		}
	}
}

function scrSendMessage()
{
	//Create save array
	var _savedDataSession = array_create(0);

		for (var i = 0; i < oChatbox.messageCount+1; ++i)
		{
			var _saveMsg = 
			{
				leftat : oChatbox.messageCount-1,
				sentinsession : global.sessionCount,
				sender : global.userConnected,
				friend : global.currentFriend,
				msg : global.sentMsg[i],
				date : global.date,
				quant : global.msgTurn[i]-1,
				total : oChatbox.messageCount-1,
			}
			array_push(_savedDataSession,_saveMsg);
		}

	
	//Save to JSON
	var _string = json_beautify(json_stringify(_savedDataSession));
	var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed, 1);
	buffer_write(_buffer,buffer_string,_string);
	buffer_save(_buffer,"msgSession.json");
	buffer_delete(_buffer);
	
	show_debug_message("Sent message, saved to .json file.")
}

function scrAppearSentMessage()
{
	if (file_exists("msgSession.json"))
	{
		var _buffer=buffer_load("msgSession.json");
		var _string=buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer)
		
		var _loadData = json_parse(_string)
		
		while (array_length(_loadData)>0)
		{
			var _loadMessage = array_pop(_loadData);	
				for (var i = 0; i < real(_loadMessage.quant)+1; ++i)
				{
					oChatbox.messages=_loadMessage.total
					//oChatbox.messages=i
					global.chatMessages[i]=
					{
						sender : _loadMessage.sender,
						friend : _loadMessage.friend,
						msg : _loadMessage.msg,
						date : _loadMessage.date,		
					}
				}
		}
	}
}

function scrLoadChats()
{
	if (file_exists("msgSession.json"))
	{
		var _buffer=buffer_load("msgSession.json");
		var _string=buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer)
		
		var _loadData = json_parse(_string)
		
		while (array_length(_loadData)>0)
		{
			var _loadMessage = array_pop(_loadData);
			
			oChatbox.messages=_loadMessage.total
			oChatbox.messageCount=_loadMessage.total+1
			oChatbox.leftAt=_loadMessage.leftat
			
			for (var i = 0; i < real(_loadMessage.quant)+1; ++i)
			{
				oChatbox.messages=_loadMessage.total
				//oChatbox.messages=i
				global.chatMessages[i]=
				{
					sender : _loadMessage.sender,
					friend : _loadMessage.friend,
					msg : _loadMessage.msg,
					date : _loadMessage.date,		
				}
			}
		}
	}
}
