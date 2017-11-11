from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

extensions = [
    Extension("engine.*", ["engine/*.pyx"]),
    Extension("cmpnt.*", ["cmpnt/*.pyx"]),
    Extension("sdl2.view", ["sdl2/view.pyx"],
        libraries = ["SDL2"]
    )
]


setup(
    ext_modules = cythonize(
        extensions)
)

