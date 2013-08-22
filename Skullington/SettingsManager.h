
#ifndef SETTINGSMANAGER_H_INCLUDED
#define SETTINGSMANAGER_H_INCLUDED

class SettingsManager
{
private:
    lua_State* lua;
public:
    SettingsManager();
    ~SettingsManager();

    void LuaRunMethod(std::string method);
    int LuaGetValueFrom(std::string method);

    void RunScript(std::string file, std::string method);
    int RunScriptWithReturn(std::string, std::string method);
};

#endif // SETTINGSMANAGER_H_INCLUDED
