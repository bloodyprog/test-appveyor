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

project( "AppVeyor" )
    kind( "ConsoleApp" )
    language( "C++" )

    includedirs { "../src" }

    files { "../src/**.cpp" }

    configuration { "Debug" }
        defines { "DEBUG" }
        flags { "Symbols", "ExtraWarnings", "FatalWarnings" }

    configuration { "Release" }
        defines { "NDEBUG" }
        flags { "Optimize", "ExtraWarnings", "FatalWarnings" }

    configuration { "vs*" }
        postbuildcommands { "\"$(TargetPath)\"" }
