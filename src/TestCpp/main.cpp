#define CATCH_CONFIG_RUNNER
#include <catch.hpp>

int main(int argc, const char* argv[])
{
    std::cout << "Hello Test C++" << std::endl;

    return Catch::Session().run(argc, argv);
}
