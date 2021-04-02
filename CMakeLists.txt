cmake_minimum_required(VERSION 3.17)
project(globals_native C)

set(CMAKE_C_STANDARD 11)

# Set default build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release")
endif()

string(TOLOWER ${CMAKE_C_COMPILER_ARCHITECTURE_ID} ARCH)

set(LUA_HOME_PREFIX "C:/FX/LUA")

macro(BuildForLua luaVersion)
    string(REGEX MATCH "([0-9]+\\.[0-9]+)" LUA_VERSION ${luaVersion})
    set(LUA_HOME ${LUA_HOME_PREFIX}/lua-${luaVersion}/build/${ARCH})
    file(GLOB LUA_LIBS ${LUA_HOME}/lib/*.lib)

    # code
    add_library(globals_native_${luaVersion} SHARED src/library.c src/library.h)
    target_compile_definitions(globals_native_${luaVersion} PUBLIC LUA_LIB LUA_BUILD_AS_DLL)
    target_include_directories(globals_native_${luaVersion} PUBLIC ${LUA_HOME}/include)
#    target_link_options(globals_native_${luaVersion} PUBLIC ${CMAKE_LINK_DEF_FILE_FLAG}${PROJECT_SOURCE_DIR}/src/library.def)
    target_link_libraries(globals_native_${luaVersion} ${LUA_LIBS})
    set_target_properties(globals_native_${luaVersion} PROPERTIES
            OUTPUT_NAME "globals_native"
            ARCHIVE_OUTPUT_DIRECTORY ${luaVersion}
            LIBRARY_OUTPUT_DIRECTORY ${luaVersion}
            RUNTIME_OUTPUT_DIRECTORY ${luaVersion}
            PDB_OUTPUT_DIRECTORY ${luaVersion}
    )


    set(REL_LIB_OUTPUT_DIR "build/lib/lua/${LUA_VERSION}/${ARCH}")
    set(REL_LUA_OUTPUT_DIR "build/share/lua/${LUA_VERSION}")
    set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})
    install(TARGETS globals_native_${luaVersion} RUNTIME DESTINATION ${REL_LIB_OUTPUT_DIR})
endmacro()


BuildForLua("5.3.5")
BuildForLua("5.4.1")

