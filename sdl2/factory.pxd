
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



cpdef void *load_img(str file_)
cpdef void *load_clip(str file_)
cpdef void *load_music(str file_)
