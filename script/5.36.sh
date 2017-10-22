# 5.36. Stripping 

## Remove those symbols with:
strip --strip-debug /tools/lib/*
/usr/bin/strip --strip-unneeded /tools/{,s}bin/*

## To save more, remove the documentation:
rm -rf /tools/{,share}/{info,man,doc}
