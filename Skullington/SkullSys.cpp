
#include "Library.h"

SkullSys::SkullSys()
{
    //
}

SkullSys::~SkullSys()
{
    //
}

void SkullSys::RunSkullSys()
{
    settingsManager.LuaRunMethod("PrintAllValues");
}
