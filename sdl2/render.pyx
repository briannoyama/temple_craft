
cdef class ImgRndr(rndr.ImgRndr):

    def __init__(self,
            View view,
            Image img,
            Pstn pos,
            int x_cell = 0,
            int y_cell = 0,
            priority = 0):
        super().__init__(pos, x_cell, y_cell, priority)
        self.view = view
        self.img = img

    cpdef void update(self):
        self.view.draw(self)

