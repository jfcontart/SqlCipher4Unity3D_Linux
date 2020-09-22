#!/usr/bin/env bash

#Go on debian 

apt-get update 
apt-get dist-upgrade
apt-get install build-essential
apt-get install gcc

# Version example : 3310100

if [ "$#" -ne 1 ]
then
    echo "Usage:"
    echo "./SQLiteBuilt.sh <VERSION>"
    exit 1
fi

VERSION=$1

#prepare dir to compile

mkdir ./tmp
mkdir ./tmp/${VERSION}
cd ./tmp/${VERSION}/

#Download sources files from SQLCipher

curl -OL https://www.sqlite.org/2020/sqlite-autoconf-${VERSION}.tar.gz
tar -xvf sqlite-autoconf-${VERSION}.tar.gz
ls 
cd sqlite-autoconf-${VERSION}

#Compile

make clean
./configure \
CFLAGS=" \
"
make 

#Copy result

cd ..
cd ..
cd .. 

mkdir ./${VERSION}
mkdir ./${VERSION}/macOS
rm  ./${VERSION}/macOS/libsqlite3.0.dylib

cp ./tmp/${VERSION}/sqlite-autoconf-${VERSION}/.libs/libsqlite3.0.dylib ./${VERSION}/macOS/libsqlite3.0.dylib

open ./${VERSION}

#Clean 

rm -r ./tmp

