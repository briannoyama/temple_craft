from engine.control import RIGHT_K, DOWN_K, LEFT_K, UP_K, \
             A_K, S_K, Z_K, X_K, ESCAPE_K


cdef class Cntrl(cntrl.Cntrl):


    def __init__(self,
            dict mapping = {
            SDLK_RIGHT : RIGHT_K,
            SDLK_DOWN : DOWN_K,
            SDLK_LEFT : LEFT_K,
            SDLK_UP : UP_K,
            SDLK_a: A_K,
            SDLK_s: S_K,
            SDLK_z: Z_K,
            SDLK_x: X_K,
            SDLK_ESCAPE: ESCAPE_K},
            int priority = 0):
        self.mapping = mapping
        signal = {}
        for key in mapping:
            signal[mapping[key]] = False
        super().__init__(signal, priority)

    cpdef void update(self):
        cdef SDL_Event e
        cdef int sym
        while SDL_PollEvent(&e) != 0:
            self.signal[SDLK_ESCAPE] = True
            if e.type == SDL_QUIT:
                self.signal[SDLK_ESCAPE] = True
            elif e.type == SDL_KEYDOWN:
                sym = e.key.keysym.sym
                if sym in self.mapping:
                    self.signal[self.mapping[sym]] = True
            elif e.type == SDL_KEYUP:
                sym = e.key.keysym.sym
                if sym in self.mapping:
                    self.signal[self.mapping[sym]] = False
