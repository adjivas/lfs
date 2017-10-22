# 6.10. Adjusting the Toolchain 

## We'll also create a link to its counterpart in /tools/$(uname -m)-pc-linux-gnu/bin:
mv -v /tools/bin/{ld,ld-old}
mv -v /tools/$(uname -m)-pc-linux-gnu/bin/{ld,ld-old}
mv -v /tools/bin/{ld-new,ld}
ln -sv /tools/bin/ld /tools/$(uname -m)-pc-linux-gnu/bin/ld

## Also adjust the specs file so that GCC knows where to find the correct headers and Glibc start files. A sed command accomplishes this:
gcc -dumpspecs | sed -e 's@/tools@@g'                   \
    -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
    -e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' >      \
    `dirname $(gcc --print-libgcc-file-name)`/specs

## To do this, perform the following sanity checks:
echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'

## Now make sure that we're setup to use the correct start files:
grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log

## Verify that the compiler is searching for the correct header files:
grep -B1 '^ /usr/include' dummy.log

## Next, verify that the new linker is being used with the correct search paths:
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'

## References to paths that have components with '-linux-gnu' should be ignored, but otherwise the output of the last command should be:
SEARCH_DIR("/usr/lib")
SEARCH_DIR("/lib")

## Next make sure that we're using the correct libc:
grep "/lib.*/libc.so.6 " dummy.log

## Lastly, make sure GCC is using the correct dynamic linker:
grep found dummy.log

## Once everything is working correctly, clean up the test files:
rm -v dummy.c a.out dummy.log
