import numpy as np
cimport numpy as np

from engine.position cimport Pstn
from engine.updatable cimport Updtbl

cdef class RndrGrd(Updtbl):

    cdef str name
    cdef Pstn pos
    cdef public int x_cell
    cdef public int y_cell

cdef class AnmtnGrd(RndrGrd):

    cdef RndrGrd render
    cdef np.ndarray sqnc
    cdef public int frame

