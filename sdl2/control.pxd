from engine.updatable cimport Updtbl
from engine cimport control as cntrl
from sdl2.sdl2 cimport *

cdef class Cntrl(cntrl.Cntrl):

    cdef dict mapping
