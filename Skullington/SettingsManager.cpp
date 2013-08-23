
#include "Library.h"

SettingsManager::SettingsManager()
{
    lua = lua_open();
    if (!lua)
    {
        std::cout << "Error Starting Lua" << std::endl;
    }
    luaL_openlibs(lua);
}

SettingsManager::~SettingsManager()
{
    lua_close(lua);
}

void SettingsManager::LuaRunMethod(std::string method)
{
    lua_getglobal(lua, "RunMethod");
    lua_pushstring(lua, method.c_str());
    lua_call(lua, 1, 0);
}

int SettingsManager::LuaGetValueFrom(std::string method)
{
    lua_getglobal(lua, "GetValueFrom");
    lua_pushstring(lua, method.c_str());
    lua_call(lua, 1, 1);

    int returnValue = lua_tointeger(lua, -1);
    lua_pop(lua, 1);
    return returnValue;
}

void SettingsManager::RunScript(std::string file, std::string method)
{
    luaL_dofile(lua, file.c_str());
    LuaRunMethod(method);
}

int SettingsManager::RunScriptWithReturn(std::string file, std::string method)
{
    luaL_dofile(lua, file.c_str());
    return LuaGetValueFrom(method);
}
