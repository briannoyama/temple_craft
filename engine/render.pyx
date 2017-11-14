
cdef class RndrGrd(Updtbl):

    def __init__(self,
            Pstn pos,
            str name,
            int x_cell = 0,
            int y_cell = 0):
        self.pos = pos
        self.name = name
        self.x_cell = x_cell
        self.y_cell = y_cell

    cpdef void update(self):
        raise Exception('Error, use derived view version instead.')

cdef class AnmtnGrid(RndrGrd):

    def __init__(self, RndrGrd render, list sqnc, int frame = 0):
        self.render = render
        self.sqnc = np.array(sqnc, dtype = np.int)
        self.frame = frame

    cpdef void update(self):
        self.render.x_cell, self.render.y_cell = self.sqnc[self.frame]
        self.frame = (self.frame + 1) % len(self.sqnc)

    cpdef void set_frame(self, int frame):
        self.frame = frame
