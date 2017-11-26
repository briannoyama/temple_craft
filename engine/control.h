/* Generated by Cython 0.27.3 */

#ifndef __PYX_HAVE__engine__control
#define __PYX_HAVE__engine__control


/* "engine/control.pyx":3
 * from engine.control cimport *
 * 
 * cdef public enum:             # <<<<<<<<<<<<<<
 *     UP_K = 0
 *     DOWN_K = 1
 */
enum  {
  UP_K = 0,
  DOWN_K = 1,
  LEFT_K = 2,
  RIGHT_K = 3,
  A_K = 4,
  S_K = 5,
  Z_K = 6,
  X_K = 7,
  ESCAPE_K = 8
};

#ifndef __PYX_HAVE_API__engine__control

#ifndef __PYX_EXTERN_C
  #ifdef __cplusplus
    #define __PYX_EXTERN_C extern "C"
  #else
    #define __PYX_EXTERN_C extern
  #endif
#endif

#ifndef DL_IMPORT
  #define DL_IMPORT(_T) _T
#endif

#endif /* !__PYX_HAVE_API__engine__control */

/* WARNING: the interface of the module init function changed in CPython 3.5. */
/* It now returns a PyModuleDef instance instead of a PyModule instance. */

#if PY_MAJOR_VERSION < 3
PyMODINIT_FUNC initcontrol(void);
#else
PyMODINIT_FUNC PyInit_control(void);
#endif

#endif /* !__PYX_HAVE__engine__control */