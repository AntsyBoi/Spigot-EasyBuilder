# PLEASE ADD THIS LINE TO YOUR LAUNCH OPTIONS BEFORE JOINING ANY SERVER
(The server-side version of this patch was already added to the build file)
Go to your Minecraft launcher and change the launch option settings for each of your profiles beyond and including 1.7 "-Dlog4j2.formatMsgNoLookups=true" if you don't use this any server you join can comprimise your entire machine, even if the owners of the server never wanted it. If they use my spigot builder script or manually include the extra line then all of the players will be safe, but it's still a good precaution to include this line still.

# Spigot EasyBuilder
Simple solution to building the latest version of spigot.
## Features
- Simple text based UI
- Auto-generate startup bat files for your server
- Easy version input 
## How to install

### Method 1:
1. Clone the repository
2. Move "`EasyBuilder.bat`" for Windows systems, move "`EasyBuilder.sh`" for *nix based systems (Linux, MacOS, FreeBSD, OpenBSD) file from the repository to your servers root directory

### Method 2:
__**Caution: These methods will run the script from the current working directory so make sure you are in the right folder before proceeding**__ 

For *nix systems run
`sh -c "$(curl -fsSL https://github.com/AntsyBoi/Spigot-EasyBuilder/blob/main/EasyBuilder.sh)"`

For Windows systems run
`iwr -useb https://raw.githubusercontent.com/AntsyBoi/Spigot-EasyBuilder/main/EasyBuilder.bat|iex` in powershell

And thats it!
## How to use
1. Open the file with your terminal of choice (CMD for Windows and bash for *nix systems)
2. Input the Minecraft version number you want to build (As long as its supported by Spigot)
3. Input the name of your startup bat file with the file extension (Don't include the file extension on the shell script version)
4. Input the min/max ram usage in megabytes
5. Wait for it to compile and enjoy!
