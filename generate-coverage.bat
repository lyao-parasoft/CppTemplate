rem "Set environment varibles"
set "MINGW_HOME=C:\alife-tools\MinGW-W64_gcc-8.1.0\MinGW\mingw64"
set "CMAKE_HOME=C:\alife-tools\cmake"
set "CPPTEST_STD_HOME=C:\cpptest_standard-2022.1.0\cpptest"
set "Path=%CPPTEST_STD_HOME%;%CPPTEST_STD_HOME%\bin;%MINGW_HOME%\bin;%CMAKE_HOME%\bin;%Path%"

set "PROJECT_NAME=cpp-project-template"
set "BUILD_DIR=build"

rem "Compile project"
rmdir /s /q "%BUILD_DIR%"
mkdir "%BUILD_DIR%"
cd "%BUILD_DIR%"
cmake -DCPPTEST_COVERAGE=ON -DCPPTEST_HOME="%CPPTEST_STD_HOME%" .. -DCMAKE_BUILD_TYPE=Release -G "MinGW Makefiles"
make && make install

rem "Run unit test"
cd test
divider_tests.exe


rem "Generate coverage report"
cd "../cpptest-coverage/%PROJECT_NAME%"
cpptestcli -config "builtin://Coverage" -settings "../../../localsettings.properties" -input "%PROJECT_NAME%.clog" -report "../../reports/cpptest-std/ut"

