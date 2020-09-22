#!/usr/bin/env bash

#Go on debian 

apt-get -y update 
apt-get -y dist-upgrade

apt-get -y install zip
apt-get -y install unzip
apt-get -y install build-essential
apt-get -y install gcc
apt-get -y install tcl-dev
apt-get -y install libssl-dev

# Version example : 4.4.0

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

rm -R ./tmp 2> /dev/null
rm -R ./${VERSION} 2> /dev/null

mkdir /tmp 2> /dev/null
mkdir ./tmp
mkdir ./tmp/${VERSION}

cd ./tmp/${VERSION}/

#Download sources files from SQLCipher

wget https://github.com/sqlcipher/sqlcipher/archive/v${VERSION}.zip
#tar -xvf v${VERSION}.zip
unzip v${VERSION}.zip
cd sqlcipher-${VERSION}
mkdir ./tmp

#Compile

make clean 2> /dev/null

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
#rm  ./${VERSION}/libsqlcipher.a

cp ./tmp/${VERSION}/sqlcipher-${VERSION}/.libs/libsqlcipher.a ./${VERSION}/linux/libsqlcipher.a

#Clean 

rm -r ./tmp/
