#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

static int new_sized_table( lua_State *L )
{
    int asize = lua_tointeger( L, 1 );
    int hsize = lua_tointeger( L, 2 );
    // https://www.lua.org/manual/5.3/manual.html#lua_createtable
    // Creates a new empty table and pushes it onto the stack.
    //   narr is a hint for how many elements the table will have as a sequence;
    //   nrec is a hint for how many other elements the table will have.
    // Lua may use these hints to preallocate memory for the new table.
    // This preallocation is useful for performance when you know in advance how many elements the table will have.
    // Otherwise you can use the function lua_newtable - equivalent to lua_createtable(L, 0, 0).
    lua_createtable( L, asize, hsize );
    return( 1 );
}

LUALIB_API int luaopen_globals_native (lua_State *L) {
    lua_pushcfunction( L, new_sized_table );
    lua_setglobal( L, "sized_table" );
    return 1;
}

