require 'glfw3'
require 'opengl'

Glfw.init

Glfw::Window.window_hint(Glfw::RESIZABLE, 0)
window = Glfw::Window.new(640, 480, "GLFW Skeleton Ruby")

def drawRubyAt(pos_x, pos_y)
    glPushMatrix
        glTranslatef(pos_x, pos_y, 0)
        glBegin GL_QUADS
            glColor3f(0.5, 0, 0)
            glVertex2f(-5, 5)
            glVertex2f(-5, -5)
            glVertex2f(-7.5, -5)
            glVertex2f(-7.5, 5)

            glColor3f(1, 0, 0)
            glVertex2f(5, 5)
            glVertex2f(5, -5)
            glVertex2f(-5, -5)
            glVertex2f(-5, 5)

            glColor3f(1, 0.5, 0.5)
            glVertex2f(5, 5)
            glVertex2f(5, -5)
            glVertex2f(7.5, -5)
            glVertex2f(7.5, 5)

            glColor3f(1, 0.8, 0.8)
            glVertex2f(5, 7.5)
            glVertex2f(5, 5)
            glVertex2f(-5, 5)
            glVertex2f(-5, 7.5)

            glColor3f(0.5, 0, 0)
            glVertex2f(5, -7.5)
            glVertex2f(5, -5)
            glVertex2f(-5, -5)
            glVertex2f(-5, -7.5)
        glEnd

        glBegin GL_TRIANGLES
            glColor3f(0.5, 0, 0)
            glVertex2f(-5, 7.5)
            glVertex2f(-5, 5)
            glVertex2f(-7.5, 5)

            glColor3f(1, 0, 0)
            glVertex2f(5, 7.5)
            glVertex2f(5, 5)
            glVertex2f(7.5, 5)

            glColor3f(0.3, 0, 0)
            glVertex2f(-5, -7.5)
            glVertex2f(-5, -5)
            glVertex2f(-7.5, -5)

            glColor3f(0.5, 0, 0)
            glVertex2f(5, -7.5)
            glVertex2f(5, -5)
            glVertex2f(7.5, -5)
        glEnd
    glPopMatrix
end

def drawSkullAt(pos_x, pos_y)
    glPushMatrix
        glTranslatef(pos_x, pos_y, 0)
        glBegin GL_QUADS
            glColor3f(1, 1, 1)

            glVertex2f(60, 50)
            glVertex2f(60, -40)
            glVertex2f(-60, -40)
            glVertex2f(-60, 50)

            glVertex2f(-30, -55)
            glVertex2f(-30, -40)
            glVertex2f(30, -40)
            glVertex2f(30, -55)

            glColor3f(0, 0, 0)

            glVertex2f(-10, 0)
            glVertex2f(-10, -30)
            glVertex2f(-40, -30)
            glVertex2f(-40, 0)

            glVertex2f(40, 0)
            glVertex2f(10, 0)
            glVertex2f(10, -30)
            glVertex2f(40, -30)
        glEnd

        glBegin GL_TRIANGLES
            glVertex2f(0, -30)
            glVertex2f(10, -40)
            glVertex2f(-10, -40)
        glEnd

        drawRubyAt(-25, -15)
        drawRubyAt(25, -15)
    glPopMatrix
end

def reshape(window, width, height)
  w, h = window.framebuffer_size()
  Gl.glViewport(0, 0, w, h)
  Gl.glMatrixMode(GL_PROJECTION)
  Gl.glLoadIdentity()
  Gl.glScalef(1, -1, 1);
  Gl.glOrtho(0, width, height, 0, 0, 1)
  Gl.glMatrixMode(GL_MODELVIEW )
  Gl.glLoadIdentity()
end

window.set_key_callback {
  |window, key, code, action, mods|
  window.should_close = true if key == Glfw::KEY_ESCAPE
}

window.set_close_callback {
  |window|
  window.should_close = true
}

window.set_size_callback {
  |window, width, height|
  reshape(window, width, height)
}

window.make_context_current

reshape(window, window.size[0], window.size[1])

loop {
  Glfw.wait_events
  Gl.glClear(Gl::GL_COLOR_BUFFER_BIT | Gl::GL_DEPTH_BUFFER_BIT)

  x, y = window.size
  drawSkullAt(x/2, y/2)

  window.swap_buffers

  break if window.should_close?
}

window.destroy
