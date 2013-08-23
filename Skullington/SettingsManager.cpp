
#include "Library.h"

SettingsManager::SettingsManager()
{
    lua = lua_open();
    if (!lua)
    {
        std::cout << "Error Starting Lua" << std::endl;
    }
    luaL_openlibs(lua);
    luaL_dofile(lua, "main.lua");
}

SettingsManager::~SettingsManager()
{
    lua_close(lua);
}

void SettingsManager::LuaRunMethod(const std::string &func)
{
    lua_getglobal(lua, "RunMethod");
    lua_pushstring(lua, func.c_str());
    lua_call(lua, 1, 0);
}

int SettingsManager::LuaGetValueFrom(const std::string &func)
{
    lua_getglobal(lua, "GetValueFrom");
    lua_pushstring(lua, func.c_str());
    lua_call(lua, 1, 1);

    int returnValue = lua_tointeger(lua, -1);
    lua_pop(lua, 1);
    return returnValue;
}
