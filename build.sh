cmake -S . -B FastNoiseLite/build -DCMAKE_BUILD_TYPE=Debug
cmake --build FastNoiseLite/build --config Debug

cmake -S . -B FastNoiseLite/build -DCMAKE_BUILD_TYPE=Release
cmake --build FastNoiseLite/build --config Release