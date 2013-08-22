
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
    settingsManager.RunScript("main.lua", "PrintAllValues");
}
