from time import clock, sleep

cdef class Loop:

    def __init__(self, Updtbl updtbl, int fps=60):
        self.updtbl = updtbl
        self.spf = 1.0/fps
        self.running = False

    #Keeping the loop code simplt for now.
    #Look into using multiprocessing when needed.
    cpdef void start(self):
        cdef float delta
        self.running = True
        while self.running:
            delta = clock()
            self.updtbl.update()
            delta = clock() - delta
            if delta < self.spf:
                sleep(self.spf - delta)
