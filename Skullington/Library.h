
#ifndef LIBRARY_H_INCLUDE
#define LIBRARY_H_INCLUDE

#include <iostream>
#include <fstream>
#include <limits>

extern "C"
{
    #include "lua.h"
    #include "lualib.h"
    #include "lauxlib.h"
}

#include "SettingsManager.h"
#include "SkullSys.h"

#endif // LIBRARY_H_INCLUDE
