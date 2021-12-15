:Start
@echo off
TITLE Spigot EasyBuilder
echo "Please make sure you have Java 16 installed before continuing."
pause
set /p Version=Enter the version you want to build (Default latest): || set Version=latest
set /p Name=Enter your start file name with file extension (Default start.bat): || set Name=start.bat
set /p Minimum=Enter your minimum ram amount in megabytes (Default 1024): || set Minimum=1024
set /p Maximum=Enter your maximum ram amount in megabytes (Default 1024): || set Maximum=1024

:Folders
if exist build\ (
	echo "Build directory already exists"
	goto :Building
) else (
	echo "Build directory doesn't exist, creating..."
	mkdir build
	goto :Building
)

:Building
cd build
curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -jar BuildTools.jar --rev %Version%
ren spigot*.jar server.jar
move server.jar ..
cd ..

:Starter
if exist %Name% (
	del %Name%
	echo java -Xmx%Maximum%M -Xms%Minimum%M -Dlog4j2.formatMsgNoLookups=true -jar server.jar nogui >%Name%
	goto :Exiting
) else (
	echo java -Xmx%Maximum%M -Xms%Minimum%M -Dlog4j2.formatMsgNoLookups=true -jar server.jar nogui >%Name%
	goto :Exiting
)

:Exiting
echo Hopefully it compiled right. Have a good day/night!
pause
exit
