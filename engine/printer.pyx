from engine.updatable cimport Updtbl


cdef class Prntr(Updtbl):

    cdef str name

    def __init__(self, 
            str name,
            int priority = 0):
        super().__init__(priority = priority)
        self.name = name

    cpdef void update(self):
        print(self.name)
