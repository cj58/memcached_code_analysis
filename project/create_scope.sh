
ROOT=/home/dev/sourcecode/memcached/memcached-1.4.21
rm -rf $ROOT/project/cscope.*

find_files () {
    if [[ -d $1 ]];then
        find $1 -name "*.h"    >  $ROOT/project/cscope.files
        find $1 -name "*.c"     >> $ROOT/project/cscope.files
    fi
}

find_files $ROOT 

cd $ROOT/project
cscope -b

ctags  -R --fields=+lS $ROOT 2>/dev/null
