
#include "Library.h"

SkullSys::SkullSys()
{
    SDL_Init(SDL_INIT_EVERYTHING);
}

SkullSys::~SkullSys()
{
    SDL_Quit();
}

void SkullSys::RunSkullSys()
{
    settingsManager.LuaRunMethod("PrintAllValues");
}
