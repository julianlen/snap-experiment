#!/bin/bash
systemctl stop rsk
cd rskj
./gradlew clean build -x test
cp rskj-core/build/libs/rskj-core-5.1.0-SNAPSHOT-all.jar /usr/share/rsk/rsk.jar
cd -
systemctl start rsk
