from scg import GraphicsWindow
import sys


# Create the window and access the canvas. 
win = GraphicsWindow(400, 200)
canvas = win.canvas()
    
# Draw on the canvas. 
canvas.drawRect(0, 10, 200, 10) 
canvas.drawRect(0, 30, 300, 10) 
canvas.drawRect(0, 50, 100, 10)

x = 0
y = 10
while True:
    canvas.drawLine(x, y,x+1,y)
    canvas.drawRect(1, 1, x, y)
    x += 1
    if x == 400:
        y += 1
        x = 0
        
    key = win.scanKey()
    if key == 'q' or key == 'Q':
        win.quit()
        sys.exit()
    if key != "":
        print (key)
    win.update()
    
    
#quitProgram = False
#while quitProgram == False:
    #key = ezKeyboard.getLastKey()
    #if key == 'q':
        #quitProgram = True
    #elif key == 'Up':
        #print (key)
    #else:
        #print('x')
    #win.wait()

#Wait for the user to close the window. 
#win.wait()
