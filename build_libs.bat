mkdir libs

copy FastNoiseLite\C\FastNoiseLite.h FastNoiseLite\C\FastNoiseLite.c

clang -c -g -gcodeview -o fastnoiselited.lib -target x86_64-pc-windows -fuse-ld=llvm-lib -Wall -DFNL_IMPL FastNoiseLite\C\FastNoiseLite.c
move fastnoiselited.lib libs

clang -c -O3 -o fastnoiselite.lib -target x86_64-pc-windows -fuse-ld=llvm-lib -Wall -DFNL_IMPL FastNoiseLite\C\FastNoiseLite.c
move fastnoiselite.lib libs

del FastNoiseLite\C\FastNoiseLite.c


