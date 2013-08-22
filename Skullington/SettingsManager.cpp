
#include "Library.h"

SettingsManager::SettingsManager()
{
    lua = lua_open();
    if (!lua)
    {
        std::cout << "Error Starting Lua" << std::endl;
    }
}

SettingsManager::~SettingsManager()
{
    lua_close(lua);
}

void SettingsManager::RunScript(std::string file, std::string method)
{
    luaL_dofile(lua, file.c_str());
    runMethod(method.c_str);
}

int SettingsManager::RunScriptWithReturn(std::string file, std::string method)
{
    luaL_dofile(lua, file.c_str());
    return getValueFrom(method.c_str());
}
