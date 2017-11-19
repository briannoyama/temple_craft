cimport numpy as np

cdef class View(Updtbl):

    def __init__(self,
            int width,
            int height,
            Pstn offset,
            int priority = 0):
        super().__init__(priority = priority)
        self.width = width
        self.height = height
        self.offset = offset

    cpdef void draw(self, ImgRndr img_rndr):
        cdef SDL_Rect src, buf
        cdef Image img
        cdef np.ndarray coor

        img = img_rndr.img
        coor = img_rndr.pos.coor()

        src.x = img_rndr.x_cell*img.width
        src.y = img_rndr.y_cell*img.height
        src.w = img.width
        src.h = img.height
        buf.x = coor[0]
        buf.y = coor[1] - coor[2]
        buf.w = img.width
        buf.h = img.height
        SDL_RenderCopy(self.renderer, img.pntr, &src, &buf)

    cpdef void update(self):
        #Copy to the screen
        SDL_RenderPresent(self.renderer)
        #Clear the buffer
        SDL_RenderClear(self.renderer)

    cpdef View __enter__(self):
        cdef int img_flags

        if SDL_Init(SDL_INIT_VIDEO) < 0:
            raise Exception(SDL_GetError())

        if not SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "1"):
            print("Warning: Linear texture filtering not enabled!")

        self.window = SDL_CreateWindow( "Temple Craft",
                SDL_WINDOWPOS_CENTERED,
                SDL_WINDOWPOS_CENTERED,
                self.width,
                self.height,
                SDL_WINDOW_OPENGL);
        if self.window == NULL:
            raise Exception(SDL_GetError())

        self.renderer = SDL_CreateRenderer(self.window,
                -1,
                SDL_RENDERER_ACCELERATED
                | SDL_RENDERER_PRESENTVSYNC)
        if self.renderer == NULL:
            raise Exception(SDL_GetError())

        SDL_SetRenderDrawColor(self.renderer, 0xFF, 0xFF, 0xFF, 0xFF)
        img_flags = IMG_INIT_PNG
        if not IMG_Init(img_flags) & img_flags:
            raise Exception(SDL_GetError())
        SDL_RenderClear(self.renderer)
        SDL_RenderPresent(self.renderer)
        return self

    cpdef void __exit__(self, exc_type, exc_val, exc_tb):
        SDL_DestroyWindow(self.window)
        SDL_Quit()
        self.window = NULL
