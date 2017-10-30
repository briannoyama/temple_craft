
cdef class Updtbl:

    def __cinit__(self):
        self._next = self
        self._prev = self
        self.priority = 0

    cpdef void update(self):
        raise NotImplementedError('Override with a submodule.')

    cpdef void remove(self):
        self._prev._next = self._next
        self._next._prev = self._prev
        self._next = self
        self._prev = self

    cpdef void _set_next(self, Updtbl next):
        next.remove()
        next._next = self._next
        self._next._prev = next
        self._next = next
        next._prev = self
