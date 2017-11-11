from engine.updatable cimport Updtbl


cdef class Cmpst(Updtbl):
    
    cdef Updtbl children

    cpdef void update(self)
    cpdef void put(self, Updtbl cmpnt)
