#!/usr/bin/env bash

echo "Please make sure you have Java 17 installed and set as java in PATH before continuing."
read -p "Press any key to continue ..."
read -p "Enter the {version} you want to build (Default latest): " Version
Version=$Version:-latest}

read -p "Enter your start file name (Default start.sh): " Name
Name=${Name:-start.sh}

read -p "Enter your minimum ram amount in megabytes (Default 512): " Minimum
Minimum=${Minimun:-512}

read -p "Enter your maximum ram amount in megabytes (Default 2048): " Maximum
Maximum=${Maximum:-2048}

if [ -d "/build/" ] 
then
    echo "Build directory already exists"
else
    echo "Build directory doesn't exist, creating..."
	mkdir build
fi
cd build
curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -jar BuildTools.jar --rev ${Version}
mv spigot*.jar spigot-${Version}.jar
mv spigot-${Version}.jar ..
cd ..

rm $Name
echo "java -Xmx${Maximum}M -Xms${Minimum}M -Dlog4j2.formatMsgNoLookups=true -jar spigot-${Version}.jar nogui" >$Name
chmod +x ./$Name

echo "Hopefully it compiled right. Have a good day/night!"
read -p "Press any key to exit ..."
exit
