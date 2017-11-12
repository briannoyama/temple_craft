
cdef class Render(Updtbl):

    def __init__(self,
            Image img,
            View view,
            tuple coor, #TODO use numpy arrays for coordinates.
            int x_cell = 0,
            int y_cell = 0):
        self.img = img
        self.view = view
        self.coor = coor
        self.x_cell = x_cell
        self.y_cell = y_cell

    cpdef void update(self):
        view.draw(self.img, self.x_cell, self.y_cell, self.coor)

cdef class Anmtn:

    def __init__(self, Render render, tuple sqnc, int frame = 0):
        self.render = render
        self.sqnc = sqnc
        self.frame = frame

    cpdef void update(self):
        self.render.x_cell, self.render.y_cell = self.sqnc[frame]
        frame = (frame + 1) % len(sqnc)

