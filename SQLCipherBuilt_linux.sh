#!/usr/bin/env bash

if [ "$#" -ne 1 ]
then
    echo "Usage:"
    echo "./SQLCipherBuilt.sh <VERSION>"
    exit 1
fi

VERSION=$1

SQLITE_CFLAGS=" \
-DSQLITE_HAS_CODEC \
-DSQLITE_THREADSAFE=1 \
-DSQLITE_TEMP_STORE=2 \
"

LDFLAGS=" \
-lcrypto
"

CFLAGS=" \
"

#prepare dir to compile

mkdir ./tmp
mkdir ./tmp/${VERSION}

cd ./tmp/${VERSION}/

#Download sources files from SQLCipher

wget https://github.com/sqlcipher/sqlcipher/archive/v${VERSION}.tar.gz
tar -xvf v${VERSION}.tar.gz
cd sqlcipher-${VERSION}

#Compile

make clean

./configure \
CFLAGS="${CFLAGS} ${SQLITE_CFLAGS}" \
LDFLAGS="${LDFLAGS}"

make

#Copy result

cd ..
cd ..
cd .. 

mkdir ./${VERSION}
mkdir ./${VERSION}/linux

cp ./tmp/${VERSION}/sqlcipher-${VERSION}/.libs/libsqlcipher.a ./${VERSION}/linux/sqlcipher.a

#Clean 

rm -r ./tmp/