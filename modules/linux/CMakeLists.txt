add_subdirectory(common) # Common functionality for Linux modules

if(SYMCRYPT_TARGET_ENV MATCHES "PosixUserMode")

    add_subdirectory(generic) # Generic Linux module
    
    if(SYMCRYPT_USE_ASM AND SYMCRYPT_TARGET_ARCH MATCHES "AMD64")
        add_subdirectory(oe_full) # OpenEnclave with all functionality
    endif()
elseif(SYMCRYPT_TARGET_ENV MATCHES "OPTEE")
    add_subdirectory(optee) # OPTEE module
endif()