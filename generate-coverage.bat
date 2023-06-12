set "MINGW_HOME=C:/mingw64/bin"
set "CMKAE_HOME=C:/cmake-3.26.4-windows-x86_64/bin"
set "CPPTEST_STD_HOME=C:/cpptest_standard-2022.1.0/cpptest"
set "Path=%CPPTEST_STD_HOME%;%MINGW_HOME%;%CMKAE_HOME%;%Path%"

set "PROJECT_NAME=cpp-project-template"
set "BUILD_DIR=build"

cd cppprojecttemplate
rmdir /s /q "%BUILD_DIR%"
mkdir "%BUILD_DIR%"
cd "%BUILD_DIR%"
cmake -DCPPTEST_COVERAGE=ON -DCPPTEST_HOME="%CPPTEST_STD_HOME%" .. -DCMAKE_BUILD_TYPE=Release -G "MinGW Makefiles"
make && make install

cd test
divider_tests.exe


cd "../cpptest-coverage/%PROJECT_NAME%"
cpptestcli -config "builtin://Coverage" -settings "../../../conf/localsettings.properties" -input "%PROJECT_NAME%.clog" -report "../../reports/cpptest-std/ut" -property dtp.url="https://192.168.3.130:8443" -publish
