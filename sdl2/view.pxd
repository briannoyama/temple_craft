from engine.updatable cimport Updtbl
from sdl2.sdl2 cimport *

cdef class View(Updtbl):

    cdef SDL_Window* window
    cdef SDL_Renderer* renderer
    cdef int width
    cdef int height

    cpdef void update(self)
    cpdef void draw(self, Image img,
            int x_cell,
            int y_cell,
            int x_coor,
            int y_coor)
    cpdef void __enter__(self)
    cpdef void __exit__(self, exc_type, exc_val, exc_tb)
