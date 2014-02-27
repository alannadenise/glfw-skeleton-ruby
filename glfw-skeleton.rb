#!/usr/local/bin/ruby

require 'opengl'
require 'glfw'
include Gl,Glu,Glfw

window = glfwOpenWindow(640, 480, 0, 0, 0, 0, 0, 0, GLFW_WINDOW )
if (window == false)
    exit
end

glfwSwapInterval( 0 )

running = true

def drawSkullAt(pos_x, pos_y)
    glPushMatrix();
        glBegin(GL_QUADS);
            glColor3f(1.0, 1.0, 1.0);

            glVertex2f(pos_x + 60, pos_y + 40);
            glVertex2f(pos_x - 60, pos_y + 40);
            glVertex2f(pos_x - 60, pos_y - 50);
            glVertex2f(pos_x + 60, pos_y - 50);
    
            glVertex2f(pos_x - 30, pos_y + 40);
            glVertex2f(pos_x + 30, pos_y + 40);
            glVertex2f(pos_x + 30, pos_y + 55);
            glVertex2f(pos_x - 30, pos_y + 55);
    
            glColor3f(0.0, 0.0, 0.0);
            
            glVertex2f(pos_x - 40, pos_y - 0);
            glVertex2f(pos_x - 10, pos_y - 0);
            glVertex2f(pos_x - 10, pos_y + 30);
            glVertex2f(pos_x - 40, pos_y + 30);
            
            glVertex2f(pos_x + 40, pos_y - 0);
            glVertex2f(pos_x + 10, pos_y - 0);
            glVertex2f(pos_x + 10, pos_y + 30);
            glVertex2f(pos_x + 40, pos_y + 30);
        glEnd();
    
        glBegin(GL_TRIANGLES);
            glVertex2f(pos_x, pos_y + 30);
            glVertex2f(pos_x + 10, pos_y + 40);
            glVertex2f(pos_x - 10, pos_y + 40);
        glEnd();
    glPopMatrix();
end

width,height = glfwGetWindowSize()
height = height > 0 ? height : 1

glViewport(0, 0, width, height);
glMatrixMode(GL_PROJECTION );
glLoadIdentity();
glOrtho(0, width, height, 0, 0, 1);
glMatrixMode(GL_MODELVIEW );
glLoadIdentity();

titlestr = "GLFW Skeleton Ruby"
glfwSetWindowTitle( titlestr )

while running == true
    glClearColor(0.0, 0.0, 0.0, 0.0)
    glClear( GL_COLOR_BUFFER_BIT )

    drawSkullAt(width/2, height/2);

    glfwSwapBuffers()
    
    running = ( glfwGetKey( GLFW_KEY_ESC ) == GLFW_RELEASE &&
                          glfwGetWindowParam( GLFW_OPENED ) == true )
end
