#include <SDL2/SDL_image.h>

from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import numpy, sys

sdl_include_dirs = [numpy.get_include()]
sdl_lib_dirs = []
if "win" in sys.platform:
    sdl_include_dirs.append("C:/Development")
    sdl_lib_dirs.append("C:/Development/SDL2_lib")


extensions = [
    Extension("engine.*", ["engine/*.pyx"],
        include_dirs=[numpy.get_include()]),
    Extension("cmpnt.*", ["cmpnt/*.pyx"]),
    Extension("sdl2.*", ["sdl2/*.pyx"],
        include_dirs=sdl_include_dirs,
        libraries=["SDL2", "SDL2_image", "SDL2_mixer"],
        library_dirs=sdl_lib_dirs
    )
]

setup(
    ext_modules = cythonize(extensions)
)

