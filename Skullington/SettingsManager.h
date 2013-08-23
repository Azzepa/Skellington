
#ifndef SETTINGSMANAGER_H_INCLUDED
#define SETTINGSMANAGER_H_INCLUDED

class SettingsManager
{
private:
    lua_State* lua;
public:
    SettingsManager();
    ~SettingsManager();

    void LuaRunMethod(std::string file, std::string method);
    int LuaGetValueFrom(std::string file, std::string method);
};

#endif // SETTINGSMANAGER_H_INCLUDED
