from engine.updatable cimport Updtbl


cdef class Tst(Updtbl):

    cdef str name

    def __cinit__(self, str name):
        self.name = name

    cpdef void update(self):
        print(self.name)
