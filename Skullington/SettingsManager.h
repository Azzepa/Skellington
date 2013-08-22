
#ifndef SETTINGSMANAGER_H_INCLUDED
#define SETTINGSMANAGER_H_INCLUDED

class SettingsManager
{
private:
    lua_State* lua;
public:
    SettingsManager();
    ~SettingsManager();

    void RunScript(std::string);
};

#endif // SETTINGSMANAGER_H_INCLUDED
