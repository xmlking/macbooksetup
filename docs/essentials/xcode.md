# Xcode

The first thing you should install is [Xcode](https://developer.apple.com/xcode/) 
because it is the prerequisite for [brew](https://brew.sh/) and many development tools.

## Xcode

Download and install it from the App Store or from [Apple's website](https://developer.apple.com/xcode/).

## CommandLineTools

For installing Xcode command line tools run:

```sh
xcode-select --install
```

It'll prompt you to install the command line tools. Follow the instructions and you'll have Xcode and Xcode command line tools both installed.

Verify installation of Xcode Command Line Tools

```sh
xcode-select -p

# You should see:
# /Library/Developer/CommandLineTools
```

Check that you can run git:
```sh
git --version
# You should see: (latest version)
# git version 2.30.1 (Apple Git-130)
```

Just to be certain, verify that gcc is installed:

```sh
gcc --version
```

If all went well, you should see the GCC version in the output.

It will show something like this:

```
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr --with-gxx-include-dir=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/c++/4.2.1
Apple clang version 13.0.0 (clang-1300.0.29.30)
Target: x86_64-apple-darwin21.4.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```

## Developer Mode

> Enable `Developer Mode` on this Mac so that you can use debugger and other dev tools

```bash
# check status
DevToolsSecurity -status
# DevToolsSecurity -status -verbose

#  substitute your username in palace of <username>
DevToolsSecurity -enable
# or
sudo dscl . append /Groups/_developer GroupMembership <username>
```