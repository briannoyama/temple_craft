from engine.updatable cimport Updtbl
from engine.position cimport Pstn
from sdl2.factory cimport Image
from sdl2.render cimport ImgRndr
from sdl2.sdl2 cimport *

cdef class View(Updtbl):

    cdef SDL_Window* window
    cdef SDL_Renderer* renderer
    cdef Pstn offset
    cdef int width
    cdef int height

    cpdef void update(self)
    cpdef void draw(self, ImgRndr img_rndr)
    cpdef View __enter__(self)
    cpdef void __exit__(self, exc_type, exc_val, exc_tb)
