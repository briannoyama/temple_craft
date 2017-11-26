from engine.updatable cimport Updtbl

cdef class Loop:

    cdef Updtbl updtbl
    cdef public bint running
    cdef float spf

    cpdef void start(self)
