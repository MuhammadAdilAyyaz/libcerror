dnl Checks for required headers and functions
dnl
dnl Version: 20170904

dnl Function to detect if libcerror dependencies are available
AC_DEFUN([AX_LIBCERROR_CHECK_LOCAL],
  [dnl Headers included in libcerror/libcerror_error.c
  AC_CHECK_HEADERS([stdarg.h varargs.h])

  AS_IF(
    [test "x$ac_cv_header_stdarg_h" != xyes && test "x$ac_cv_header_varargs_h" != xyes],
    [AC_MSG_FAILURE(
      [Missing headers: stdarg.h and varargs.h],
      [1])
    ])

  dnl Wide character string functions used in libcerror/libcerror_error.c
  AS_IF(
    [test "x$ac_cv_enable_wide_character_type" != xno],
    [AC_CHECK_FUNCS([wcstombs])

    AS_IF(
      [test "x$ac_cv_func_wcstombs" != xyes],
      [AC_MSG_FAILURE(
        [Missing function: wcstombs],
        [1])
      ])
    ])

  dnl Check for error string functions used in libcerror/libcerror_system.c
  AC_FUNC_STRERROR_R()

  AS_IF(
    [test "x$ac_cv_have_decl_strerror_r" != xyes],
    [AC_CHECK_FUNCS([strerror])

    AS_IF(
      [test "x$ac_cv_func_strerror" != xyes],
      [AC_MSG_FAILURE(
        [Missing functions: strerror_r and strerror],
        [1])
      ])
    ])
  ])

