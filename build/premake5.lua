-- appveyor-test

local function CatchArguments(outputFile)
    if os.getenv("APPVEYOR") then
        return " --reporter junit --out " .. outputFile
    else
        return ""
    end
end

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
        postbuildcommands { "\"$(TargetPath)\"" .. CatchArguments("$(OutDir)$(TargetName).results.xml") }

    configuration { "gmake" }
        postbuildcommands { "$(TARGET)" }

project("TestCSharp.NUnit")
    kind("SharedLib")
    language("C#")

    files { "../src/TestCSharp/**.cs" }

    links { "dependencies/nunit/bin/net-4.5/nunit.framework.dll" }

    configuration { "vs*" }
        postbuildcommands { "nunit3-console.exe $(TargetPath)" }
