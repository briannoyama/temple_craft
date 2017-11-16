
cdef class ImgRndr(rndr.ImgRndr):

    def __init__(self,
            RndrGrd grid,
            View view,
            Image img):
        super().__init__(grid)
        self.view = view
        self.img = img

    cpdef void update(self):
        self.view.draw(self)

