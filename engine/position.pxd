import numpy as np
cimport numpy as np


cdef class Pstn:

    cdef np.ndarray c

    cpdef np.ndarray coor(self)

cdef class RlPstn(Pstn):

    cdef Pstn pos_obj

    cpdef np.ndarray coor(self)
