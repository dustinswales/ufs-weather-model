
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -Mpreprocess")

if(ENABLE_NVIDIA_OPENACC MATCHES "true")
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -acc -Minfo=accel")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -acc -Minfo=accel")
else()
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ")
endif()

if(NOT 32BIT)
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -r8")
endif()

if (${CMAKE_BUILD_TYPE} MATCHES "Debug")
  add_definitions(-DDEBUG)
  set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -O0 -g")
  set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0 -g")
else()
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -O2")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O2")
endif()