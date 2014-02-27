#!/usr/local/bin/ruby

require 'glfw3'
require 'opengl'
require 'opengl-core'

Glfw.init

window = Glfw::Window.new(640, 480, "GLFW Skeleton Ruby")

def drawSkullAt(pos_x, pos_y)
    glPushMatrix()
        glBegin(GL_QUADS)
            glColor3f(1.0, 1.0, 1.0)

            glVertex2f(pos_x + 60, pos_y + 40)
            glVertex2f(pos_x - 60, pos_y + 40)
            glVertex2f(pos_x - 60, pos_y - 50)
            glVertex2f(pos_x + 60, pos_y - 50)
    
            glVertex2f(pos_x - 30, pos_y + 40)
            glVertex2f(pos_x + 30, pos_y + 40)
            glVertex2f(pos_x + 30, pos_y + 55)
            glVertex2f(pos_x - 30, pos_y + 55)
    
            glColor3f(0.0, 0.0, 0.0)
            
            glVertex2f(pos_x - 40, pos_y - 0)
            glVertex2f(pos_x - 10, pos_y - 0)
            glVertex2f(pos_x - 10, pos_y + 30)
            glVertex2f(pos_x - 40, pos_y + 30)
            
            glVertex2f(pos_x + 40, pos_y - 0)
            glVertex2f(pos_x + 10, pos_y - 0)
            glVertex2f(pos_x + 10, pos_y + 30)
            glVertex2f(pos_x + 40, pos_y + 30)
        glEnd()
    
        glBegin(GL_TRIANGLES)
            glVertex2f(pos_x, pos_y + 30)
            glVertex2f(pos_x + 10, pos_y + 40)
            glVertex2f(pos_x - 10, pos_y + 40)
        glEnd()
    glPopMatrix()
end

window.set_key_callback {
  |window, key, code, action, mods|
  window.should_close = true if key == Glfw::KEY_ESCAPE
}

window.set_close_callback {
  |window|
  window.should_close = true
}

def reshape(window, width, height) 
    w,h = window.framebuffer_size()
    Gl.glViewport(0, 0, w, h)
    Gl.glMatrixMode(GL_PROJECTION)
    Gl.glLoadIdentity()
    Gl.glOrtho(0, width, height, 0, 0, 1)
    Gl.glMatrixMode(GL_MODELVIEW )
    Gl.glLoadIdentity()
end

window.set_size_callback {
  |window,width,height|
  reshape(window,width,height)
}

#window.window_hint(Glfw::RESIZABLE, Gl::GL_FALSE)

window.make_context_current

reshape(window, window.size[0], window.size[1])

loop {
  Glfw.wait_events
  Gl.glClear(Gl::GL_COLOR_BUFFER_BIT | Gl::GL_DEPTH_BUFFER_BIT)

  x,y = window.size
  drawSkullAt(x/2, y/2)

  window.swap_buffers
  

  break if window.should_close?
}

window.destroy
