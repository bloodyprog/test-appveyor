-- appveyor-test

workspace("AppVeyor")
    configurations( { "Debug", "Release" } )
    location( _ACTION )

    configuration("Debug")
        targetdir("../output/bin/debug")
        objdir("../output/tmp/debug")

    configuration( "Release" )
        targetdir("../output/bin/release")
        objdir("../output/tmp/release")

project( "TestCpp" )
    kind( "ConsoleApp" )
    language( "C++" )

    includedirs { "../src/TestCpp" }

    files { "../src/TestCpp/**.cpp" }

    configuration { "Debug" }
        defines { "DEBUG" }
        flags { "Symbols", "ExtraWarnings", "FatalWarnings" }

    configuration { "Release" }
        defines { "NDEBUG" }
        flags { "Optimize", "ExtraWarnings", "FatalWarnings" }

    configuration { "vs*" }
        postbuildcommands { "\"$(TargetPath)\"" }

project( "TestCSharp" )
    kind( "ConsoleApp" )
    language( "C#" )

    files { "../src/TestCSharp/**.cs" }

    configuration { "vs*" }
        postbuildcommands { "\"$(TargetPath)\"" }
