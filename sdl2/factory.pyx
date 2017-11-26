import os

cdef tuple IMAGE = ('.png', '.bmp', '.jpg', '.jpeg')
cdef tuple MUSIC = ('_mus.wav', '_mus.ogg', '.midi', '.mp3')
cdef tuple CLIP = ('.wav', '.ogg', '.voc', '.aif')

cdef class Image:

    def __init__(self, int width, int height):
        self.width = width
        self.height = height

cdef class Music:
    pass

cdef class Clip:
    pass

cdef class Factory(fctr.Factory):

    def __init__(self, View v):
        self.v = v
        self.rsrcs = {}

    cpdef void load_all(self, str file_):
        cdef str name
        cdef dict resources = {}
        for path, subdirs, files in os.walk(file_):
            for subfile in files:
                name = os.path.join(path, subfile)
                key = name.replace(os.sep, '_')
                rsrc  = None
                if name.endswith(IMAGE):
                    resources[key] = self.load_img(name)
                elif name.endswith(MUSIC):
                    resources[key] = self.load_music(name)
                elif name.endswith(CLIP):
                    resources[key] = self.load_clip(name)
        self.rsrcs.update(resources)

    cpdef Image load_img(self, str file_):
        cdef int x, y, x_, y_
        cdef Image img
        cdef SDL_Texture* texture
        cdef SDL_Surface* surface

        parts = file_[:file_.rfind('.')].split("_")
        if len(parts) == 3:
            x, y = [int(p) for p in parts[1:]]
        elif len(parts) == 2:
            x, y = int(parts[1]), 1
        else:
            x, y = 1, 1

        surface = IMG_Load(file_.encode('UTF-8'))

        if surface == NULL:
            raise Exception(SDL_GetError())

        texture = SDL_CreateTextureFromSurface(self.v.renderer, surface)

        if self.v.renderer == NULL:
            print('There is no renderer!')

        if texture == NULL:
            raise Exception(SDL_GetError())

        img = Image(surface.w/x, surface.h/y)
        img.pntr = texture
        SDL_FreeSurface(surface)

        return img

    cpdef void free_all(self):
        for file_ in self.rsrcs:
            rsrc = self.rsrcs[file_]
            if isinstance(rsrc, Image):
                self.free_img(rsrc)
            elif isinstance(rsrc, Music):
                self.free_music(rsrc)
            elif isinstance(rsrc, Clip):
                self.free_clip(rsrc)

    cpdef void free_img(self, Image img):
        SDL_DestroyTexture(img.pntr)

    cpdef Clip load_clip(self, str file_):
        cdef Clip clip
        clip = Clip(file_)
        clip.pntr = Mix_LoadWAV(file_.encode('UTF-8'))
        if clip.pntr == NULL:
            raise(SDL_GetError())
        return clip

    cpdef Music load_music(self, str file_):
        cdef Music music
        music = Music(file_)
        music.pntr = Mix_LoadMUS(file_.encode('UTF-8'))
        if music.pntr == NULL:
            raise(SDL_GetError())
        return music

    cpdef void free_clip(self, Clip clip):
        Mix_FreeChunk(clip.pntr)

    cpdef void free_music(self, Music music):
        Mix_FreeMusic(music.pntr)

    cpdef rndr.ImgRndr build_rndr(self, rndr.ImgRndr par):
        return ImgRndr(self.v, self.rsrcs[par.name], par)
