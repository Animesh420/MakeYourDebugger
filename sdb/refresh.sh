
if [ $# -eq 0 ]; then 
cd build 
cmake --build .
else
if [ -d './build' ]; then 
    echo './build does exist'
    rm -rf './build'
fi 

mkdir build && cd build 

cmake .. -DCMAKE_TOOLCHAIN_FILE=/home/animesh-mukherjee/resume_work/MakeYourDebugger/vcpkg/scripts/buildsystems/vcpkg.cmake
cmake --build .

fi