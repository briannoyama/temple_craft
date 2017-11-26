from engine.control cimport *

cdef public enum:
    UP_K = 0
    DOWN_K = 1
    LEFT_K = 2
    RIGHT_K = 3
    A_K = 4
    S_K = 5
    Z_K = 6
    X_K = 7
    ESCAPE_K = 8

cdef class Cntrl(Updtbl):

    def __init__(self, dict signal, int priority = 0):
        self.signal = signal
        super().__init__(priority)
