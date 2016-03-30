#include <catch.hpp>

TEST_CASE("Test_Case_A")
{
    CHECK(true);
}

TEST_CASE("Test_Case_B")
{
    CHECK(true);
}

TEST_CASE("Test_Case_C")
{
    SECTION("success")
    {
        CHECK(2 < 4);
    }

    /*SECTION("failure")
    {
        CHECK(3 * 2 == 9);
    }*/
}
