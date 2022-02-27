# Xcode

The first thing you should install is [Xcode](https://developer.apple.com/xcode/) 
because it is the prerequisite for [brew](https://brew.sh/) and many other development tools.

## Xcode

Download and install it from the App Store or from [Apple's website](https://developer.apple.com/xcode/).

## CommandLineTools

For installing Xcode command line tools, run:

```shell
xcode-select --install
```

It'll prompt you to install the command line tools. Follow the instructions and you'll have Xcode and Xcode command line tools both installed.

Verify installation of Xcode Command Line Tools

```shell
xcode-select -p

# You should see:
# /Library/Developer/CommandLineTools
```

Check that you can run git:
```shell
git --version
# You should see: (latest version)
# git version 2.30.1 (Apple Git-130)
```

Just to be certain, verify that gcc is installed:

```shell
gcc --version
```

If all went well, you should see the GCC version in the output.

It will show something like this:

```
Configured with: --prefix=/Library/Developer/CommandLineTools/usr --with-gxx-include-dir=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/4.2.1
Apple clang version 13.0.0 (clang-1300.0.29.30)
Target: arm64-apple-darwin21.4.0
Thread model: posix
InstalledDir: /Library/Developer/CommandLineTools/usr/bin
```

## Developer Mode

> Enable `Developer Mode` on this Mac so that you can use debugger and other dev tools

```shell
# check status
DevToolsSecurity -status
# DevToolsSecurity -status -verbose

#  substitute your username in palace of <username>
DevToolsSecurity -enable
# or
sudo dscl . append /Groups/_developer GroupMembership <username>
```


## Work Directories

Go to terminal and run the following commands:

Create directories in user home

```shell
# Developer directory contains developer projects/code organized based on programming language 
mkdir ~/Developer
# Applications directory contains Apps you downloaded and install (VSCode, subllimtext, IntelliJ etc). 
# You don't need to have admin access to install apps into ~/Applications 
mkdir ~/Applications
 ```

```shell
# directory to install/copy developer CLI tools such as `gcloud` `appcli` etc
mkdir -p ~/Developer/Apps

mkdir -p ~/Developer/Work
# Make `SPA`, `go`, `java` etc directories under ~/Developer/Work:
mkdir -p ~/Developer/Work/tools
mkdir -p ~/Developer/Work/node
mkdir -p ~/Developer/Work/SPA
mkdir -p ~/Developer/Work/go
mkdir -p ~/Developer/Work/rust
mkdir -p ~/Developer/Work/java
mkdir -p ~/Developer/Work/python
 ```

Then you can check out your GitHub projects into respective directories 
```shell
cd ~/Developer/Work/tools
git clone https://github.com/xmlking/macbooksetup.git
```
 