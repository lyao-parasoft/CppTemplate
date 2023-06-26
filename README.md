# Usage

### Prerequisites
 * A modern C/C++ compiler
 * CMake 3.1+ installed
 * Set "<MinGW_INSTALL_DIR>\bin" to environment variable if using Windows system
 * Python (If you need to generate a static report)

### Generating coverage report
#### Compiling project
1. Create a folder (e.g. `build`) in project root path.
2. run command in build folder:
   * In Windows:
    ```bash
    cmake -DCPPTEST_COVERAGE=ON -DCPPTEST_HOME="<CPPTEST_INSTALL_DIR>" -S "../" -DCMAKE_BUILD_TYPE=Release -G "MinGW Makefiles"
    ``` 

   * In Linux:
    ```bash
    cmake -DCPPTEST_COVERAGE=ON -DCPPTEST_HOME="<CPPTEST_INSTALL_DIR>" -S "../" -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles"
    ```

3. run command in build folder:
    ```bash
    make && make install
    ```
    or

    ```bash
    mingw32-make && make install
    ```

4. Go to `test` folder in build folder and run command line:
    ```bash
    divider_tests.exe
    ```
5. Go to `cpp-project-template` folder (build/cpptest-coverage/cpp-project-template) and run command:
    ```bash
    cpptestcli -config "builtin://Coverage" -settings "../../../conf/localsettings.properties" -report "./reports/cpptest-std/ut" -input "cpp-project-template.clog"
    ```

### Generating static report
#### Compiling project
1. Create a folder (e.g. `build`) in project root path.
2. Run command in build folder:
   * In Windows:
     ```bash
     cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S "../" -DCMAKE_BUILD_TYPE=Release -G "MinGW Makefiles"
     ```
   * In Linux:
     ```bash
     cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S "../" -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles"
     ```
3. Run cpptest static test:
    ```bash
    cpptestcli -config "../conf/cpptest_settings.properties" -settings "../conf/localsettings.properties" -report "./reports/cpptest-std/static" -compiler gcc_9-64 -input compile_commands.json
    ```