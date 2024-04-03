help([[
loads UFS Model prerequisites on Hera with Nvidia HPC
]])

-- First, look for libraries in "prod" space
intel_ver=os.getenv("nvhpc_ver") or "24.1"
load(pathJoin("intel", nvhpc_ver))

cmake_ver=os.getenv("cmake_ver") or "3.23.1"
load(pathJoin("cmake", cmake_ver))


setenv("NetCDF_INCLUDE_DIRS", "/scratch1/BMC/gmtb/Dustin.Swales/libs/nvhpc241/include")
setenv("ESMFMKFILE", "/scratch1/BMC/gmtb/Dustin.Swales/libs/nvhpc241/lib/esmf.mk")


setenv("CC", "nvc")
setenv("CXX", "nvc++")
setenv("FC", "nvfortran")
setenv("CMAKE_Platform", "hera.nvhpc")

whatis("Description: UFS build environment")
