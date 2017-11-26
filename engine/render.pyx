import numpy as np

cdef class ImgRndr(Updtbl):

    def __init__(self,
            Pstn pos,
            str name,
            int x_cell = 0,
            int y_cell = 0,
            priority = 0):
        super().__init__(priority)
        self.pos = pos
        self.name = intern(name)
        self.x_cell = x_cell
        self.y_cell = y_cell


cdef class Anmtn(Updtbl):

    def __init__(self, ImgRndr render,
            list sqnc,
            int frame = 0,
            int priority = 0):
        super().__init__(priority)
        self.render = render
        self.sqnc = np.array(sqnc, dtype = np.int)
        self.frame = frame

    cpdef void update(self):
        self.render.x_cell, self.render.y_cell = self.sqnc[self.frame]
        self.frame = (self.frame + 1) % len(self.sqnc)

    cpdef void set_frame(self, int frame):
        self.frame = frame
