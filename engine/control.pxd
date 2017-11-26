from engine.updatable cimport Updtbl


cdef class Cntrl(Updtbl):

    cdef public dict signal
