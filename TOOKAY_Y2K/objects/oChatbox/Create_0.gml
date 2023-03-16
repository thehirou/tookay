sprite_index=oProgram.sprChatWriteImport

writing=true

blinkingLineAlpha=1

timerBlinking=0

strWid=0

messages=0
messageCount=0
leftAt=0

//The struct
global.chatMessages[0] = 
{
    sender : "[Server]",
    friend : "",
    msg : "Welcome to the chatroom.",
    date : "NA",
}

scrLoadChats();