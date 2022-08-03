# JVM

Install JVM tools and frameworks via [SDKMan](https://sdkman.io)

## SDKMan

Go to terminal and run:

```shell
curl -s "https://get.sdkman.io" | zsh
```

Then execute contents in file via:

```shell
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

Verify the installation went well

```shell
sdk version
```

### SDKman Packages Installation

To get a list of current or candidate versions for gradle:

```shell
sdk list java
```

To install the following software, go to terminal and run:

```shell
# if you want to manage java version with `sdkman`
# java  `17.0.4-zulu` is current long-term support (LTS). 
# pick latest LTS version at the time of installation.
sdk install java 17.0.4-zulu
java --version # verify

sdk install gradle
sdk install maven
gradle --version # verify
mvn --version # verify
sdk install kotlin

#optional
sdk install quarkus
sdk install springboot
sdk install scala

#spark
# hadoop currently don't support Java 17 (as of 2022-08-01)
sdk install java 11.0.16-zulu
sdk use java 11.0.16-zulu 
# install `spark-shell`, `spark-submit` cli
sdk install spark
```

> TODO: Add graalVM when [M1 support is releases](https://github.com/oracle/graal/issues/2666)

When you prompted to set the newly installed software as default enter 'Y'

How to use [sdkman](http://sdkman.io/usage.html)

To see what is outdated for all Candidates

```shell
sdk upgrade
```

To remove old version e.g., gradle 7.5:

```shell
sdk remove gradle 7.5
```