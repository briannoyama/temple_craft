from engine.updatable cimport Updtbl


cdef class Tst(Updtbl):

    cdef str name
?!?jedi=0, ?!?                (*_*args*_*, kwargs) ?!?jedi?!?
    def __init__(self, 
            str name,
            int priority = 0):
        super().__init__(priority = priority)
        self.name = name

    cpdef void update(self):
        print(self.name)
