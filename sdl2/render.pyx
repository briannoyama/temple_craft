
cdef class ImgRndr(rndr.ImgRndr):

    def __init__(self,
            View view,
            Image img,
            rndr.ImgRndr par):
        super().__init__(par.pos,
                par.name,
                par.x_cell,
                par.y_cell,
                par.priority)
        self.view = view
        self.img = img

    cpdef void update(self):
        self.view.draw(self)

