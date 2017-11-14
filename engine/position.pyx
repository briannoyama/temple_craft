


cdef class Pstn:

    def __init__(self, list c=(0,0)):
        self.c = np.array(c, dtype = np.int)

    cpdef np.ndarray coor(self):
        return self.c

cdef class RlPstn(Pstn):

    def __init__(self, Pstn pos_obj, list c = (0,0)):
        self.pos_obj = pos_obj
        super().__init__(c)

    cpdef np.ndarray coor(self):
        return self.pos_obj.coor() + self.c

