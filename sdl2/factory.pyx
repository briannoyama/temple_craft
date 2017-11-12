import os
from libc.stdlib cimport malloc, free


cdef class Factory:

    cpdef dict load_all(self, str file_):
        cdef str ext, name
        cdef dict resources = {}
        for path, subdirs, files in os.walk(file_):
            name = os.path.join(path, name)

            rsrc  = None
            ext = name[:name.rfind('.')]
            if ext.endswith(IMAGE):
                resources[name] = self.load_img(name)
            elif ext.endswith(MUSIC):
                resources[name] = self.load_music(name)
            elif ext.endswith(CLIP):
                resources[name] = self.load_clip(name)

        return resources

    cpdef Image load_img(self, str file_):
        cdef int x, y, x_, y_
        cdef Image img
        cdef SDL_Texture* texture
        cdef SDL_Surface* surface

        parts = file_[:file_.rfind('.')].split("_")
        if len(parts) == 3:
            _, x, y = parts
        elif len(parts) == 2:
            _, x, y = parts[0], parts[1], 1
        else:
            _, x, y = parts[0], 1, 1

        surface = IMG_Load(file_.encode('UTF-8'))

        if surface == NULL:
            raise(SDL_GetError())

        texture = SDL_CreateTextureFromSurface(self.renderer, surface)

        if texture == NULL:
            raise(SDL_GetError())

        img = Image(file_)
        img.texture = texture
        img.width = surface.w/x
        img.height = surface.h/y

        SDL_FreeSurface(surface)

        return img

    cpdef void free_all(self, dict resources):
        for file_ in resources:
            rsrc = resources[file_]
            if isinstance(rsrc, Image):
                self.free_img(rsrc)
            elif isinstance(rsrc, Music):
                self.free_music(rsrc)
            elif isinstance(rsrc, Clip):
                self.free_clip(rsrc)

    cpdef void free_img(self, Image img):
        SDL_DestroyTexture(img.texture)

    cpdef Clip load_clip(self, str file_):
        cdef Clip clip
        clip = Clip(file_)
        clip.pntr = Mix_LoadWAV(file_.encode('UTF-8'))
        return clip

    cpdef Music load_music(self, str file_):
        cdef Music music
        music = Music(file_)
        music.pntr = Mix_LoadMUS(file_.encode('UTF-8'))
        return music

    cpdef void free_clip(self, Clip clip):
        Mix_FreeChunk(clip.pntr)

    cpdef void free_music(self, Music music):
        Mix_FreeMusic(music.pntr)

