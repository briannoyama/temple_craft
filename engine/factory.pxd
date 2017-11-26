
from engine.render cimport ImgRndr

cdef class Factory:

    cpdef build_img(self, ImgRndr par)

