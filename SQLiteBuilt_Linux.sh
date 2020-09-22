#!/usr/bin/env bash

#Go on debian 

#apt-get update 
#apt-get dist-upgrade
#apt-get install build-essential
#apt-get install gcc

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

wget https://www.sqlite.org/2020/sqlite-autoconf-${VERSION}.tar.gz
tar -xvf sqlite-autoconf-${VERSION}.tar.gz
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
mkdir ./${VERSION}/linux
rm  ./${VERSION}/libsqlite.a

cp ./tmp/${VERSION}/sqlite-autoconf-${VERSION}/.libs/libsqlite.a ./${VERSION}/linux/libsqlite.a

#Clean 

rm -r ./tmp

