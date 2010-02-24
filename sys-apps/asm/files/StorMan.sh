#!/bin/sh

# Launcher script for Adaptec Storage Manager GUI

# Simplified for Gentoo usage from original Adaptec's StorMan.sh script


unset JAVA_HOME CLASSPATH JFLAGS 

INSTDIR=/opt/StorMan
Arch=`uname -m` 
eval `java-config -P sun-jdk-1.6 | grep ^JAVA_HOME`
JAVA_BIN=$JAVA_HOME/jre/bin
JAVA_LIB=$JAVA_HOME/jre/lib

LD_LIBRARY_PATH=$INSTDIR:$LD_LIBRARY_PATH
if [ -f $INSTDIR/libstdc++.so.5 ] && ldd $INSTDIR/libSTORUTIL.so | grep libstdc++.so.5 > /dev/null 2>&1
then
        LD_PRELOAD=$INSTDIR/libstdc++.so.5
fi

export LD_LIBRARY_PATH JAVA_HOME JAVA_BIN JAVA_LIB CLASSPATH LD_PRELOAD

cd $INSTDIR

$JAVA_BIN/java -cp $INSTDIR/RaidMan.jar com.ibm.sysmgt.raidmgr.mgtGUI.Launch $* 
