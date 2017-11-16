from sdl2.sdl2 cimport *
from sdl2.render cimport ImgRndr
from sdl2.view cimport View
from engine.render cimport RndrGrd
from engine cimport resource as rsrc


cdef tuple IMAGE = ('.png', '.bmp', '.jpg', '.jpeg')
cdef tuple MUSIC = ('_mus.wav', '_mus.ogg', '.midi', '.mp3')
cdef tuple CLIP = ('.wav', '.ogg', '.voc', '.aif')

cdef class Image(rsrc.Image):
    cdef int width
    cdef int height
    cdef SDL_Texture* pntr

cdef class Music(rsrc.Music):
    cdef Mix_Music* pntr

cdef class Clip(rsrc.Clip):
    cdef Mix_Chunk* pntr

cdef class Factory:

    cdef SDL_Renderer* renderer

    cpdef dict load_all(self, str file_)
    cpdef Image load_img(self, str file_)
    cpdef void free_all(self, dict resources)
    cpdef void free_img(self, Image img)

    #Music library.
    cpdef Clip load_clip(self, str file_)
    cpdef Music load_music(self, str file_)
    cpdef void free_clip(self, Clip clip)
    cpdef void free_music(self, Music music)

    cpdef ImgRndr build_rndr(self, Image img, RndrGrd grid, View view)
