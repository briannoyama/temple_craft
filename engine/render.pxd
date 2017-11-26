cimport numpy as np

from engine.position cimport Pstn
from engine.updatable cimport Updtbl

cdef class ImgRndr(Updtbl):

    cdef Pstn pos
    cdef public int x_cell
    cdef public int y_cell
    cdef str name


cdef class Anmtn(Updtbl):

    cdef ImgRndr render
    cdef np.ndarray sqnc
    cdef public int frame

    cpdef void set_frame(self, int frame)
