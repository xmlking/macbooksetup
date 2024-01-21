# Python

## Install

We will not be using  **Python** that get added by installing the command-line tools with  `xcode-select --install`.  
i.e., `/Library/Developer/CommandLineTools/usr/bin/python3`  
Instead we will install latest **Python3** and **pip3** via `brew`

> Apple does not include *Python3* in the MacOS **Sonoma** distribution, but it get added when installing the *command-line tools* with: `xcode-select --install`

install Python 3:
```shell
brew install python
```

### Configure 

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to  
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into  
  `$(brew --prefix python)/libexec/bin` e.g., `/opt/homebrew/opt/python@3.11/libexec/bin`

Make sure you added `export PATH=$(brew --prefix python)/libexec/bin:$PATH` to `~/my/paths.zsh`

You can install Python packages with `pip3 install <package>`  

They will install into the **site-package** directory `/opt/homebrew/lib/python3.11/site-packages`

### Pipenv & Virtual Environments

The next step is to install *Pipenv*, so you can install dependencies and manage virtual environments.

**pipenv** is a tool that combines **virtualenv** with **pip**, the Python package manager. you no longer use them separately.
It is designed to be more user-friendly than using **virtualenv** and **pip** separately.

A Virtual Environment is a tool to keep the dependencies required by different projects in separate places, by creating virtual Python environments for them. It solves the `Project X depends on version 1.x but, Project Y needs 4.x` dilemma, and keeps your global **site-packages** directory clean and manageable.

Use **brew** to install **Pipenv**:
```shell
brew install pipenv
```

### Upgrade

```shell
brew update
brew upgrade python  pipenv
```

## Usage  

```shell
python --version
pip --version
# (or)
pip3 --version
python3 --version

pip install httpie
pip list
pip show pip
```

Optional

```shell
# for ML
pip install scipy
pip install matplotlib
```

### Installing packages for your project

Pipenv manages dependencies on a per-project basis. To install packages, change into your project’s directory (or just an empty directory for this tutorial) and run:

```shell
cd project_folder
# Install from Pipfile, if there is one:
pipenv install
```

To install a Python package for your project
```shell
# This will install the excellent `Requests` library and 
# creates a Pipfile for you in your project’s directory if not already present
pipenv install requests
# Or Specifying Versions of a Package
pipenv install requests==2.13.0
# Importing from requirements.txt
pipenv install -r path/to/requirements.txt
# Pipenv will let you keep the two environments separate using the --dev flag. For example:
pipenv install --dev nose2
```

```shell
# Pipenv Upgrade Workflow
pipenv update --outdated
# Checks for PyUp Safety security vulnerabilities
pipenv check
# To create a new virtualenv, using a specific version of Python you have installed
pipenv --python 3.12
# Activate Virtual Environment
pipenv shell
```

> Generally, keep both `Pipfile` and `Pipfile.lock` in version control.

## Running your code
```shell
pipenv run python rock.py
# (Or) You can activate the virtual environment then run the file
pipenv shell
python rock.py
```