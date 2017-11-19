from engine.updatable cimport Updtbl
from engine.position cimport Pstn
from engine cimport render as rndr
from sdl2.factory cimport Image
from sdl2.view cimport View

cdef class ImgRndr(rndr.ImgRndr):

    cdef View view
    cdef Image img
