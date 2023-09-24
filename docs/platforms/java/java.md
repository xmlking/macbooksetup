# JVM

Install JVM tools and frameworks via [SDKMan](https://sdkman.io)

## SDKMan

Go to terminal and run:

```shell
curl -s "https://get.sdkman.io" | zsh
```

> Note: this is a known [issue](https://github.com/sdkman/sdkman-cli/issues/1204) which causes installation fail. the temp workaround is:

```shell
curl -s "https://get.sdkman.io" | bash
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
# java  `21-graal` is current long-term support (LTS). 
# pick latest LTS version at the time of installation.
sdk install java 21-graal
java --version # verify

sdk install gradle
sdk install maven
gradle --version # verify
mvn --version # verify
sdk install kotlin

# optional
sdk install quarkus
sdk install springboot
sdk install scala

# spark (optional)
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

To remove old version e.g., gradle 8.4:

```shell
sdk uninstall gradle 8.4
```
