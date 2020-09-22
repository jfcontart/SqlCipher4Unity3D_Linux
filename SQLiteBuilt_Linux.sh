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

# Version example : 3310100

if [ "$#" -ne 1 ]
then
    echo "Usage:"
    echo "./SQLiteBuilt.sh <VERSION>"
    exit 1
fi

VERSION=$1

#prepare dir to compile

rm -R ./tmp 2> /dev/null
rm -R ./${VERSION} 2> /dev/null

mkdir /tmp 2> /dev/null
mkdir ./tmp
mkdir ./tmp/${VERSION}

cd ./tmp/${VERSION}/

#Download sources files from SQLCipher

wget https://www.sqlite.org/2020/sqlite-autoconf-${VERSION}.tar.gz
tar -xvf sqlite-autoconf-${VERSION}.tar.gz
cd sqlite-autoconf-${VERSION}
mkdir ./tmp

#Compile

make clean 2> /dev/null

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

cp ./tmp/${VERSION}/sqlite-autoconf-${VERSION}/.libs/libsqlite3.a ./${VERSION}/linux/libsqlite3.a

#Clean 

#rm -R ./tmp

