# JVM

JVM tools and frameworks

## SDKMan

Go to terminal and run:

`$ curl -s "https://get.sdkman.io" | bash`

Then execute contents in file via:

`$ source "$HOME/.sdkman/bin/sdkman-init.sh"`

Verify the installation went well

`$ sdk version`



### SDKman Software Installations

To get a list of current or candidate versions for gradle:

`sdk list java`

To install the following software, go to terminal and run:

```bash
# if you want to manage java version with `sdkman`
# java  `17.0.2.x.y-amzn` is current long-term support (LTS).
sdk install java 17.0.2.8.1-amzn

sdk install gradle
sdk install maven

#optional
sdk install kotlin
sdk install scala
sdk install springboot
```

When you prompted to set the newly installed software as default enter 'Y'

How to use [sdkman](http://sdkman.io/usage.html)

To see what is outdated for all Candidates

`sdk upgrade`

To remove old version e.g., gradle 5.6.2:

`$ sdk remove gradle 5.6.2`