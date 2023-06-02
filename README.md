# Usage

### Prerequisites
 * A modern C/C++ compiler
 * CMake 3.1+ installed
 * Set "<MinGW_INSTALL_DIR>\bin" to environment variable if using Windows system

### Compiling project
1. Create a folder (e.g. `build`) in project root path.
2. run command in build folder:
```bash
cmake -DCPPTEST_COVERAGE=ON -DCPPTEST_HOME="<CPPTEST_INSTALL_DIR>" .. -DCMAKE_BUILD_TYPE=Release -G "MinGW Makefiles"
```
3. run command in build folder: 
```bash
make && make install
```
or
```bash
mingw32-make && make install
```

### Generating coverage report
1. Go to `test` folder in build folder and run command line: 
```bash
divider_tests.exe
```
2. Go to `cpp-project-template` folder (build/cpptest-coverage/cpp-project-template) and run command:
```bash
cpptestcli -config "builtin://Coverage" -settings "../../../conf/localsettings.properties" -input "cpp-project-template.clog"
```