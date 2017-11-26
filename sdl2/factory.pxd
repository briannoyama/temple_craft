from sdl2.sdl2 cimport *
from sdl2.render cimport ImgRndr
from sdl2.view cimport View
from engine.position cimport Pstn
from engine cimport render as rndr
from engine cimport factory as fctr

cdef class Image:
    cdef int width
    cdef int height
    cdef SDL_Texture* pntr

cdef class Music:
    cdef Mix_Music* pntr

cdef class Clip:
    cdef Mix_Chunk* pntr

cdef class Factory(fctr.Factory):

    cdef View v
    cdef public dict rsrcs

    cpdef void load_all(self, str file_)
    cpdef Image load_img(self, str file_)
    cpdef void free_all(self)
    cpdef void free_img(self, Image img)

    #Music library.
    cpdef Clip load_clip(self, str file_)
    cpdef Music load_music(self, str file_)
    cpdef void free_clip(self, Clip clip)
    cpdef void free_music(self, Music music)

    cpdef rndr.ImgRndr build_rndr(self, rndr.ImgRndr)
