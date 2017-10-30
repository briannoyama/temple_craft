cdef class Updtbl:

    cdef public int priority
    cdef Updtbl _next
    cdef Updtbl _prev

    cpdef void update(self)
    cpdef void remove(self)
    cpdef void _set_next(self, Updtbl next)
