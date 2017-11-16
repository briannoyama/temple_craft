import numpy as np
cimport numpy as np

from engine.position cimport Pstn
from engine.updatable cimport Updtbl

cdef class ImgRndr(Updtbl):

    cdef RndrGrd grid

cdef class RndrGrd:

    cdef str name
    cdef Pstn pos
    cdef public int x_cell
    cdef public int y_cell

cdef class AnmtnGrd(Updtbl):

    cdef RndrGrd render
    cdef np.ndarray sqnc
    cdef public int frame

    cpdef void set_frame(self, int frame)
