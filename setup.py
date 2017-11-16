from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import numpy

extensions = [
    Extension("engine.*", ["engine/*.pyx"],
        include_dirs=[numpy.get_include()]),
    Extension("cmpnt.*", ["cmpnt/*.pyx"]),
    Extension("sdl2.*", ["sdl2/*.pyx"],
        include_dirs=[numpy.get_include()],
        libraries = ["SDL2"]
    )
]


setup(
    ext_modules = cythonize(
        extensions)
)

