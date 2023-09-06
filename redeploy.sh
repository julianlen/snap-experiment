#!/bin/bash
systemctl stop rsk
cd rskj
git fetch

if [ "$#" -eq 0 ]
then
	echo "Please provide a branch"
else
	git checkout $1
	git pull
	git reset --hard origin/$1
fi

./gradlew clean build -x test
cp rskj-core/build/libs/rskj-core-5.1.0-SNAPSHOT-all.jar /usr/share/rsk/rsk.jar
cd -
systemctl start rsk
