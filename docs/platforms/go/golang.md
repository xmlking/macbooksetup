# GoLang

Guide to setup `golang` development environment on _MacOS_ without admin privileges

You can use either JetBrains **GoLand** or **VSCode** as your go IDE.

Recommended _tools/libs_ for **Go** projects:
#### Tools
1. **GoReleaser** - Cross-compile and Release to GitHub
2. **protobuf** - gRPC code gen tool and serialization library
3. **ko** - Build, sign and publish OCI images from source code.
#### Libraries
1. **testify** - Unit and integration testing 
2. **[mockery](https://github.com/vektra/mockery)** -  generate mocks for golang interfaces
3. **[entgo](https://entgo.io)** - An entity framework for Go

## Install

```shell
brew install go
# verify 
go version                                                                                                                                                                          ☸ rancher-desktop on ☁️  
# go version go1.18 darwin/arm64

```

### Multiple go versions
If you need multiple versions for testing...

```shell
brew install go@1.17
# brew switch
brew unlink go
brew link go@1.17
# abd back to 1.18
brew unlink go
brew link  go
```

Optional tools for GoLang Developers
```shell
# buf: proto tool https://buf.build/docs/tour-1
brew install bufbuild/buf/buf

brew install protobuf
# certs for mTLS
brew install step
# ko is a tool for build/publish/deploy container images  for Go applications
brew install ko
# grpc cli client
brew install grpcurl
# bloomrpc is a UI client for gRPC (optional)
# install `bloomrpc` via `brew` into ~/Applications)
brew install --cask --appdir=~/Applications bloomrpc
```

```shell
# Update outdated Go dependencies interactively
# Usage: go-mod-upgrade ./...
go install github.com/oligot/go-mod-upgrade@latest
# for static check/linter
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
# mockery
go install github.com/vektra/mockery/v2@latest
# linter and tool for proto files
# *** (if you use brew to install buf, skip next line) ***
go install github.com/bufbuild/buf/cmd/buf@latest

# Install protoc plugins
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
go install github.com/srikrsna/protoc-gen-gotag@latest
go install entgo.io/contrib/entproto/cmd/protoc-gen-entgrpc@latest

# Installing PGV can currently only be done from source: 
# from user's home directory, run
go get -d github.com/envoyproxy/protoc-gen-validate
cd ~/go/src/github.com/envoyproxy/protoc-gen-validate
git pull
make build
```

Make sure you have following in your `~/my/paths.zsh`
```shell
# Executable scripts from GoLang packages you install will be put in here
export PATH=$PATH:$(go env GOPATH)/bin
```
for complete project example with **VSCode** settings, refer [hello](https://github.com/xmlking/hello) project

#### Workspace

`~/go/bin`, `~/go/pkg`, `~/go/src` are created automatically when you pull your first dependency.

### Project

#### Your first project

> create a project directory outside your GOPATH:

```shell
mkdir  -p ~/Developer/Work/go/hello
```

#### Initialize module

> this will create `go.mod` file
```shell
cd ~/Developer/Work/go/hello

go mod init github.com/xmlking/hello
```

#### Write your code

```shell
$ cat <<EOF > hello.go
package main

import (
    "fmt"
    "rsc.io/quote"
)

func main() {
    fmt.Println(quote.Hello())
}
EOF
```

#### Build and Run

```shell
go build
# run
./hello
#  ./... pattern matches all the packages within the current module.
go build ./...
```
> Note: The go.mod file was updated to include explicit versions for your dependencies
> In contrast, `go build` and `go test` will not remove dependencies from `go.mod` that are no longer required and only update `go.mod` based on the current build invocation's tags/OS/architecture.

#### Test

```shell
# test all the go files within the current directory
go test
# test all the packages within the current module
go test ./...
# tests for your module plus the tests for all direct and indirect dependencies to check for incompatibilities
go test all
```

#### Install

> this will copy binary into `$GOPATH/bin` i.e.,  `~/go/bin`
```shell
$ go install 
```

#### Release

> recomdned steps for releasing modules

```shell
# to possibly prune any extraneous requirements
go mod tidy
#  test and  validate your module
go test all
```
Ensure your `go.sum` file is committed along with your `go.mod` file.

A new module version may be published by pushing a tag to the repository that contains the module source code.

#### Docs

```shell
# read docs
go doc rsc.io/quote
go help build
```

#### Format

> format your source code with `prettier` or `fmt`

```shell
go fmt hello.go
```


#### Daily Workflow

> Note there was no `go get` required in the example above.

Your typical day-to-day workflow can be:

* Add import statements to your `.go` code as needed.
* Standard commands like `go build` or `go test` will automatically add new dependencies as needed to satisfy imports (updating `go.mod` and downloading the new dependencies).
* When needed, more specific versions of dependencies can be chosen with commands such as `go get foo@v1.2.3`, `go get foo@master`, `go get foo@e3702bed2`, or by editing go.mod directly.

---

### Go Commands

```shell
go env
#  View final versions that will be used in a build
go list -m all
#  View available minor and patch upgrades for all direct and indirect dependencies
go list -u -m all
#  List the available tagged versions of that module
go list -m -versions rsc.io/sampler
#  Update all direct and indirect dependencies to latest minor or patch upgrades
go get -u  # to use the latest minor or patch releases
go get -u=patch # to use the latest patch releases
#  Updates to the latest version of `foo` plus direct and indirect dependencies of `foo`
go get foo  # is equivalent to `go get foo@latest`
go get -u foo # solely gets the latest version of `foo`
#  Build or test all packages in the module when run from the module root directory
go build ./...
go test ./...
# lists all the commands go build invokes.
go build -x

go test -v context
go test -race
#  Prune any no-longer-needed dependencies from go.mod and add any dependencies needed
go mod tidy
#  If you are curious why a particular module is showing up in your go.mod, then run
go mod why -m <module>
#  Optional step to create a vendor directory (use special case only)
#  Go modules ignores the vendor/ directory by default. The idea is to eventually do away with vendoring
go mod vendor
```

### Points

* A repository contains one or more Go modules.
* Each module contains one or more Go packages.
* Each package consists of one or more Go source files in a single directory.
* A module is defined by a tree of Go source files with a `go.mod` file in the tree's root directory.
* The import paths for all packages in a module share the module path as a common prefix.
* The module path and the relative path from the `go.mod` to a package's directory together determine a package's import path.

---

### FAQ

#### What `go build` do?

What the go command does depends on whether we run it for a "normal" package or for the special  "main" package.

**For packages**
* `go build`   builds your package then discards the results.
* `go install` builds then installs the package in your $GOPATH/pkg directory.

**For commands (package main)**
* `go build`   builds the command and leaves the result in the current working directory.
* `go install` builds the command in a temporary directory then moves it to $GOPATH/bin.

Basically you can use `go build` as a check that the packages can be built (along with their dependencies) while `go install` also (permanently) installs the results in the proper folders of your  $GOPATH.

It is also worth noting that starting with Go 1.5 `go install` also removes executables created by go build

#### How to cross Compiling on MacOS For Linux runtime?

```shell
brew install FiloSottile/musl-cross/musl-cross

CGO_ENABLED=1 CC=x86_64-linux-musl-gcc CXX=x86_64-linux-musl-g++ \
ko resolve -P -f deploy/ > release.yaml
```

---

### Learning
1. Signup for https://golangweekly.com/
2. Data Journey with Golang, GraphQL and Microservices. Ref: [YouTube](https://youtu.be/hIScta6OxQ8) <br/>
   talks about BigTable --> Data Microservices (Go-Micro) --> GraphQL Gateway-gqlgen (ACL check permission at field level, codegen)
3. Interfaces , genarics  (concrete types vs abstract types). Ref: [YouTube](https://www.youtube.com/watch?v=E75b9kuyRKw&list=PLtDHwjb79JK0nrR7UaiavgUDmyuhkVET7&index=5&t=0s) <br/>
   Lessons Learned: "Always Return Concrete types, receive interfaces as perameters"
4. Heap vs Stack memory. Ref: [YouTube](https://www.youtube.com/watch?v=ZMZpH4yT7M0&feature=youtu.be) <br/>
   Are pointers a performance optimization? Ref: [medium](https://medium.com/@vCabbage/go-are-pointers-a-performance-optimization-a95840d3ef85)

---

### Reference

1. <https://github.com/golang/go/wiki/Modules>
2. <https://blog.golang.org/using-go-modules>
3. Project Layout
    1. <https://github.com/golang-standards/project-layout>
    2. <https://code.fb.com/security/service-encryption/>
4. <https://medium.com/@amsokol.com/tutorial-how-to-develop-go-grpc-microservice-with-http-rest-endpoint-middleware-kubernetes-daebb36a97e9>
5. goreleaser [supply-chain-example](https://github.com/goreleaser/supply-chain-example)
