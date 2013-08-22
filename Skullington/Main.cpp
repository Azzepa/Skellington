
//MAIN.CPP

#include "Library.h"

lua_State* lua;

int main(int argc, char* argv[])
{
    //Read in from Lua scripts for config values. If auto, should go fullscreen
    //Then be able to press ESC to go into windowed mode (Relaunches window)
    lua = lua_open();
    luaL_openlibs(lua);
    luaL_dofile(lua, "main.lua");
    lua_close(lua);

    std::cout << "\nPress Enter to Exit" << std::endl;
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    return 0;
}
