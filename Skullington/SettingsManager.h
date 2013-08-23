
#ifndef SETTINGSMANAGER_H_INCLUDED
#define SETTINGSMANAGER_H_INCLUDED

class SettingsManager
{
private:
    lua_State* lua;
public:
    SettingsManager();
    ~SettingsManager();

    void LuaRunMethod(const std::string &method);
    int LuaGetValueFrom(const std::string &method);
};

#endif // SETTINGSMANAGER_H_INCLUDED
