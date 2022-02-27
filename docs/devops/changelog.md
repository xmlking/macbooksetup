# Changelog

[git-chglog](https://github.com/git-chglog/git-chglog) CHANGELOG generator


```shell
# first time
git-chglog --init
# on release branch, generate CHANGELOG.md and commit before merging back to develop & main.
git-chglog -c .github/chglog/config.yml -o CHANGELOG.md --next-tag 2.0.0
```



## [Commitizen](http://commitizen.github.io/cz-cli/)

```shell
# install and configure `commitizen` git plugin
yarn global add commitizen cz-conventional-changelog
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc; # will create .czrc
# then you can use commitizen as shown below
cd non-node-git-repo
touch foo
git cz -a
```
