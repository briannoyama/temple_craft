#TODO move to the pyx file.
#from libc.stdint cimport uint8_t, uint32_t:

struct image{
    int width;
    int height;
    void* image;
};


cdef extern from "SDL2/SDL.h":
    enum:
        SDL_INIT_VIDEO
        SDL_INIT_AUDIO
        SDL_HINT_RENDER_SCALE_QUALITY
        SDL_WINDOWPOS_CENTERED
        SDL_WINDOW_FULLSCREEN
        SDL_WINDOWPOS_CENTERED
        SDL_RENDERER_ACCELERATED
        SDL_RENDERER

    cdef struct SDL_Window:
        pass

    cdef struct SDL_Renderer:
        pass

    cdef struct SDL_Texture:
        pass

    cdef struct SDL_Rect:
        int x
        int y
        int w
        int h

    cdef struct SDL_Surface:
        unsigned int flags
        int w
        int h
        int pitch
        void *pixels
        void *userdata
        int locked
        void *lock_data
        SDL_Rect clip_rect


    int SDL_Init(unsigned int flags)
    char* SDL_GetError()
    SDL_bool SDL_SetHint(char *name, char *value)
    SDL_Window* SDL_CreateWindow(char *title, int x, int y, int w, int h,
            unsigned int flags)
    SDL_Renderer* SDL_CreateRenderer(SDL_Window *window, int index,
            unsigned int flags)
    int SDL_SetRenderDrawColor(SDL_Renderer *renderer, char r, char g, char b,
            char a)

    void SDL_DestroyRenderer(SDL_Renderer *renderer)
    void SDL_DestroyWindow(SDL_Window *window)
    void SDL_Quit()
    SDL_Texture* SDL_CreateTextureFromSurface(SDL_Renderer *renderer,
            SDL_Surface *surface)
    void SDL_FreeSurface(SDL_Surface *surface)
    int SDL_RenderCopy(SDL_Renderer *renderer, SDL_Texture *texture, SDL_Rect *srcrect, SDL_Rect *dstrect)
    void SDL_RenderPresent(SDL_Renderer *renderer)
    int SDL_RenderClear(SDL_Renderer *renderer)
    void SDL_DestroyTexture(SDL_Texture *texture)


cdef extern from "SDL2/SDL_image.h":
    enum:
        IMG_INIT_PNG

    int IMG_Init(int flags)
    SDL_Surface* IMG_Load(char *file)
    void IMG_Quit()
    #IMG_GetError() <-Use SDL_GetError() instead.


cdef extern from "SDL2/SDL_mixer.h"
    enum:
        MIX_DEFAULT_FORMAT

    struct Mix_Chunk:
        pass
    struct Mix_Music:
        pass

    Mix_Chunk* Mix_LoadWAV(const char *file)
    Mix_Music* Mix_LoadMUS(const char *file)
    int Mix_OpenAudio(int frequency, unsigned short format, int channels, int chunksize)
    void Mix_Quit()
    int Mix_FadeOutMusic(int ms)
    int Mix_FadeInMusic(Mix_Music *music, int loops, int ms)
    int Mix_PlayingMusic()
    void Mix_PauseMusic()
    int Mix_PausedMusic()
    void Mix_ResumeMusic()
    int Mix_PlayChannel(int channel, Mix_Chunk *chunk, int loops)
    void Mix_FreeMusic(Mix_Chunk *chunk)
    void Mix_FreeChunk(Mix_Music *music)

    #Mix_GetError() <-Use SDL_GetError() instead.
