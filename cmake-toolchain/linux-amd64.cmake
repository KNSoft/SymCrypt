# This toolchain file configures CMake options for Linux AMD64 compilation with CPU optimizations.
# To use the toolchain file, run cmake .. -DCMAKE_TOOLCHAIN_FILE=cmake-toolchain/linux-amd64.cmake

# Set CMake variables that subsequent CMake scripts can check against
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR AMD64)

# For now this is just used for separating the output directories
set(SYMCRYPT_TARGET_ENV Linux)

# Define _AMD64_ to set up the correct SymCrypt macros, e.g. SYMCRYPT_CPU_AMD64
add_compile_options(-D_AMD64_)
add_compile_options(-DDBG)
add_compile_options(-O3)

# TODO: The below target options give the compiler the freedom to generate these instructions _anywhere_ in the resultant
# binary. We need to restrict their use to the specific functions which are only called once CPUID has been checked, or
# we may hit illegal instructions.
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mpclmul -mvpclmulqdq -mavx512dq -mavx512bw -maes -mvaes -msha -mrdrnd -mrdseed")

set(CMAKE_ASM_FLAGS "-x assembler-with-cpp")