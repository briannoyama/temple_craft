
cdef extern from "SDL2/SDL.h":
    enum:
        SDLK_RIGHT
        SDLK_LEFT
        SDLK_DOWN
        SDLK_UP
        SDLK_ESCAPE
        SDLK_a
        SDLK_s
        SDLK_z
        SDLK_x
        SDL_KEYDOWN
        SDL_KEYUP
        SDL_QUIT
    struct SDL_Keysym:
        int sym
    struct SDL_KeyboardEvent:
        int type
        SDL_Keysym keysym
    union SDL_Event:
        int type
        SDL_KeyboardEvent key
    int SDL_PollEvent(SDL_Event *event)

