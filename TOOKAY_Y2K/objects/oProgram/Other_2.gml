show_debug_message("Window resized to "+string(WPORT)+"x"+string(HPORT)+" FROM REBOOTING")

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
 
 window_set_size(WPORT,HPORT)