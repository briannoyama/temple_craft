
cdef class View(Updtbl):

    def __init__(self,
            int width,
            int height,
            int priority = 0):
        super().__init__(priority = priority)
        self.width = width
        self.height = height

    cdef void draw(self, void *image):
        pass

    cpdef void update(self):
        pass

    cpdef void __enter__(self):
        self.enter()

    cpdef void __exit__(self, exc_type, exc_val, exc_tb):
        SDL_DestroyWindow(self.window)
        SDL_Quit()
        self.window = NULL

    cdef void enter(self):
        cdef SDL_Surface *screenSurface
        if SDL_Init(SDL_INIT_VIDEO) < 0:
            print("Error: " + SDL_GetError())
        else:
            self.window = SDL_CreateWindow( "SDL Tutorial",
                    SDL_WINDOWPOS_CENTERED,
                    SDL_WINDOWPOS_CENTERED,
                    self.width,
                    self.height,
                    SDL_WINDOW_OPENGL);
            if self.window == NULL:
                print("Error: " + SDL_GetError())
            else:
                screenSurface = SDL_GetWindowSurface(self.window)
                SDL_FillRect(screenSurface, <SDL_Rect *>NULL,
                        SDL_MapRGB(screenSurface.format, 0xFF, 0xFF, 0xFF ))
                SDL_UpdateWindowSurface(self.window)
