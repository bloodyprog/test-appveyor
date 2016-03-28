-- appveyor-test

local isOnAppVeyor = os.getenv("APPVEYOR") ~= nil
local shouldRunTests = not isOnAppVeyor

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

    if shouldRunTests then
        configuration { "vs*" }
            postbuildcommands { "\"$(TargetPath)\"" }

        configuration { "gmake" }
            postbuildcommands { "$(TARGET)" }
    end

project( "TestCSharp" )
    kind( "ConsoleApp" )
    language( "C#" )

    files { "../src/TestCSharp/**.cs" }

    if shouldRunTests then
        configuration { "vs*" }
            postbuildcommands { "\"$(TargetPath)\"" }

        configuration { "gmake" }
            postbuildcommands { "mono $(TARGET)" }
    end
