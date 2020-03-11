# SqlCipher4Unity3D_linux

## Binairies in repository

We already built default binaries for some versions and pushed in this repository.

## Shell script

SqlCipher4Unity3D build bundle for linux© (OSX©). 

Use with https://github.com/netpyoung/SqlCipher4Unity3D .

You need :
- computer with **linux**
- we use **Ubuntu**
- libssl-dev
```
sudo apt-get install libssl-dev
```
- tcl-dev
```
sudo apt-get install tcl-dev
```

## Use the SQLCipherBuilt_linux.sh

Use the SQLCipherBuilt_linux.sh default

```
cd <this directory>
./SQLCipherBuilt_linux.sh <version example:4.3.0>
```
All is automatic!

## Custom the SQLCipherBuilt_linux.sh

Open the SQLCipherBuilt_linux.sh, find the lines and edit your config

```
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
```

save and execute:

```
cd <this directory>
./SQLCipherBuilt_linux.sh <version example:4.3.0>
```
All is automatic!

## Where to find compiled library?

A directory is created for each compiled version (ex: 4.2.0), inside you can see a folder named **Linux** with the file **sqlcipher.a**

## Copy in Unity3D project

See https://www.zetetic.net/sqlcipher/sqlcipher-api/ for PRAGMA configurations.

Copy in "**Plugins**" (create one if necessary) folder in Unity3D, select each file and check in "Inspector" :

### linux

For the file **/Plugins/linux/sqlcipher.a**

![LINUX](./LINUX_Inspector.png)

## LICENCES

| project                                                        | license                                                                      |
|----------------------------------------------------------------|------------------------------------------------------------------------------|
| this shell script                                        | is copyleft!
| [SqlCipher4Unity3d](https://github.com/robertohuertasm/SQLite4Unity3d)                                        | [MIT](https://github.com/robertohuertasm/SQLite4Unity3d/blob/master/LICENSE) |
| [SQLite4Unity3d](https://github.com/codecoding/SQLite4Unity3d) | [MIT](https://github.com/codecoding/SQLite4Unity3d/blob/master/LICENSE)      |
| [Sqlite-net](https://github.com/praeclarum/sqlite-net)         | [MIT](https://github.com/praeclarum/sqlite-net/blob/master/LICENSE.txt)      |
| [SQLite](sqlite370_banner.gif)                                 | [SQLite's License](https://sqlite.org/copyright.html)                        |
| [SQLCipher](https://www.zetetic.net/sqlcipher/)                | [SQLCipher's License](https://www.zetetic.net/sqlcipher/license/)            |

### SQLite's License

``` license
All of the code and documentation in SQLite has been dedicated to the public domain by 
the authors. All code authors, and representatives of the companies they work for, have
signed affidavits dedicating their contributions to the public domain and originals of 
those signed affidavits are stored in a firesafe at the main offices of Hwaci. Anyone 
is free to copy, modify, publish, use, compile, sell, or distribute the original SQLite
code, either in source code form or as a compiled binary, for any purpose, commercial 
or non-commercial, and by any means.

The previous paragraph applies to the deliverable code and documentation in SQLite - 
those parts of the SQLite library that you actually bundle and ship with a larger 
application. Some scripts used as part of the build process (for example the "configure"
scripts generated by autoconf) might fall under other open-source licenses. Nothing 
from these build scripts ever reaches the final deliverable SQLite library, however, 
and so the licenses associated with those scripts should not be a factor in assessing 
your rights to copy and use the SQLite library.

All of the deliverable code in SQLite has been written from scratch. No code has been 
taken from other projects or from the open internet. Every line of code can be traced 
back to its original author, and all of those authors have public domain dedications on 
file. So the SQLite code base is clean and is uncontaminated with licensed code from 
other projects.
```

### SQLCipher's License

``` license
Copyright (c) 2008-2012 Zetetic LLC
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.
* Neither the name of the ZETETIC LLC nor the
names of its contributors may be used to endorse or promote products
derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY ZETETIC LLC ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL ZETETIC LLC BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
