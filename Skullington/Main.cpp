
#include "Library.h"

int main(int argc, char* argv[])
{
    SkullSys skullSys;
    skullSys.RunSkullSys();

    std::cout << "\nPress Enter to Exit" << std::endl;
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    return 0;
}
