gcc add.c -o libadd.so -fPIC -shared
cp libadd.so libadd_copy.so
gcc add_multi.c -o libadd_multi.so -fPIC -shared
gcc test.c -L. -ladd -ladd_copy -o main_copy
gcc test.c -L. -ladd -ladd_multi -o main_multi
export LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH
echo "copy result:"
./main_copy
ldd ./main_copy
echo "multi result:"
./main_multi
ldd ./main_multi