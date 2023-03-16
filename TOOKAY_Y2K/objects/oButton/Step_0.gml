if posX="center"
{
fakeX=WCENTER
}else
{
fakeX=posX	
}

if posY="bottom"
{
fakeY=HPORT-100
}else
{
fakeY=posY	
}

image_xscale=ogWidth
image_yscale=ogHeight

x=fakeX-ogWidth/2
y=fakeY-ogHeight/2

if endAnimating=false
{
	if instance_position(window_mouse_get_x(),window_mouse_get_y(),id)
	{
		width=lerp(width,ogWidth+30,0.5)
		height=lerp(height,ogHeight-20,0.5)
		inside=true
	}
	else
	{
		inside=false
		width=lerp(width,ogWidth,0.5)
		height=lerp(height,ogHeight,0.5)
	}
}