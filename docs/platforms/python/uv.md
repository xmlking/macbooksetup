# UV

**UV** is a modern, high-performance Python package manager and installer written in Rust.

Key features that make UV stand out:

* Lightning-fast package installation and dependency resolution
* Compatible with existing Python tools and workflows
* Built-in virtual environment management
* Support for modern packaging standards
* Reliable dependency locking and reproducible environments
* Memory-efficient operation, especially for large projects

## Install

> [!NOTE]
> **brew** also install `zsh completions` when you run below command

```shell
brew install uv
```

Add `UV_TOOL_BIN_DIR` to paths

> [!NOTE]
> We automatically add it to path, if you use our **dotfiles**, See [extra.zsh](../../../dotfiles/my/extra.zsh)

```shell
export PATH="$HOME/.local/bin:$PATH"
```

## Usage

### Initializing a new project

> [!NOTE]
> For lib projects use: `uv init --lib`

```shell
uv init explore-uv
cd explore-uv
uv sync         # create lockfiles, install Python deps
```

Git is automatically initialized and main git-related files like .gitignore and an empty README.md are generated.

### Advanced Dependency Management With UV

#### Adding initial dependencies to the project

UV combines the environment creation and dependency installation into a single command. UV also updates the `pyproject.toml` and `uv.lock` files after each add command.

```shell
# Installing the latest version of a package:
uv add pydantic
# Installing a specific version:
uv add requests=2.1.2
# Change the bounds of a package's constraints:
uv add 'requests<3.0.0'
# Make a dependency platform-specific:
uv add 'requests; sys_platform="linux"' 
```

The first time you run the add command, UV creates a new virtual environment in the current working directory and installs the specified dependencies. On subsequent runs, UV will reuse the existing virtual environment and only install or update the newly requested packages, ensuring efficient dependency management.

> [!TIP]
You can also just edit these dependencies manually (this is what I usually do), and just run `uv sync` whenever you do, to update your `uv.lock` (you shouldn’t edit these manually) and your `venv`.

To remove a dependency from the environment and the `pyproject.toml` file, you can use the `uv remove` command. It will uninstall the package and all its child-dependencies:

```shell
uv remove pydantic
```

#### Adding optional dependencies

Optional dependencies are packages that are not required for the core functionality of your project but may be needed for specific features. For example, Pandas has an `excel` extra and a `plot` extra to avoid the installation of Excel parsers and matplotlib unless someone explicitly requires them.

With UV, this syntax is slightly different. First, ensure that the core Pandas package is installed:

```shell
uv add pandas
```

Then, add its optional dependencies:

```shell
uv add pandas --optional plot excel
```

#### Dependency groups

Dependency groups allow you to organize your dependencies into logical groups, such as development dependencies, test dependencies, or documentation dependencies. This is useful for keeping your production dependencies separate from your development dependencies.

To add a dependency to a specific group, use the `--group` flag:

```shell
uv add --group group_name package_name
```

### Running Python scripts with UV

Once you install the necessary dependencies, you can start working on your Python scripts as usual. UV provides a few different ways to run Python code:

```shell
uv run hello.py
```

The run command ensures that the script is executed inside the virtual environment UV created for the project.

### Changing Python versions for the current project

You can switch Python versions for your current UV project at any point as long as the new version satisfies the specifications in your pyproject.toml file.

For example, the following file requires Python versions 3.9 and above:

```toml
requires-python = ">=3.9"
```

### What Are UV Tools And How to Use Them?

Some Python packages are exposed as command-line tools like `ruff` for code formatting and linting, `pytest` for testing, `pyright` for type checking, etc. UV provides two special interfaces to manage these packages:

UV provides two special interfaces to manage these packages:

1. Using `uv tool run`:

    ```shell
    uv tool run black hello.py
    ```

2. Using the shorter and more convenient `uvx` command:

    ```shell
    uvx black hello.py
    ```

Read the [UV Tools section of the documentation](https://docs.astral.sh/uv/concepts/tools/) to learn more about these interfaces.

#### Linting

Let’s also add [Ruff](https://docs.astral.sh/ruff/):

```shell
uv add --dev ruff
```

```shell
uv run ruff format        # format (what black used to do)
uv run ruff check --fix    # lint   (what flake8 used to do)
```

#### Typing

first install it

```shell
uv add --dev pyright
```

[configure](https://github.com/microsoft/pyright/blob/main/docs/configuration.md) it

```toml
[tool.pyright]
venvPath = "."          # uv installs the venv in the current dir
venv = ".venv"          #       in a folder called `.venv`
strict = ["**/*.py"]    # use 'strict' checking on all files
pythonVersion = "3.13"  # if library, specify the _lowest_ you support
```

And now you can run it with `uv run pyright`. And, as with the formatters/linters, you should get it integrated with your editor.

#### Testing

```shell
uv add --dev pytest
```

Sample test

```python
# tests/test_nothing.py
from explore-uv.hello import main
def test_hello():
    main("what?")  # main doesn't accept any args 😉
```

And then:

```shell
uv run pytest

...
FAILED tests/test_import.py::test_hello -
TypeError: main() takes 0 positional arguments but 1 was given
```

I’ll leave fixing the test as an exercise for the reader.

#### Task runner

Let’s install it with  `uv add --dev poethepoet` and set it up right at the top of the `pyproject.toml`

```toml
[tool.poe.tasks]
# run with eg `uv run poe fmt`
fmt = "ruff format"
lint = "ruff check --fix"
check = "pyright"
test = "pytest"
# run all the above
all = [ {ref="fmt"}, {ref="lint"}, {ref="check"}, {ref="test"} ]
```

Then any time you’ve made some changes or are preparing to commit, you can run `uv run poe test` or just run `uv run poe all` and the full suite of tools will get to work for you!

You can always still run `uv run ruff format` or whatever

### Switching From PIP and Virtualenv to UV

1. Converting an existing `virtualenv` project

    start by generating a requirements.txt file from your current environment if you haven't already:

    ```shell
    pip freeze > requirements.txt
    ```

    Then, create a new UV project in the same directory:

    ```shell
    uv init .
    ```

    Finally, install the dependencies from your requirements file:

    ```shell
    uv pip install -r requirements.txt
    ```

2. Replacing common pip/virtualenv commands

    | pip/virtualenv command          | UV equivalent                      |
    |---------------------------------|------------------------------------|
    | python -m venv .venv            | uv venv                            |
    | pip install package             | uv add package                     |
    | pip install -r requirements.txt | uv pip install -r requirements.txt |
    | pip uninstall package           | uv remove package                  |
    | pip freeze                      | uv pip freeze                      |
    | pip list                        | uv pip list                        |

## Commands

### Managing Python Versions in UV

```shell
uv python install # Install Python versions.
uv python list # View available Python versions.
uv python list --only-installed # Listing existing Python versions
uv python find # Find an installed Python version.
uv python pin # Pin the current project to use a specific Python version.
uv python uninstall # Uninstall a Python version.
```

To learn more about [managing Python versions with UV](https://docs.astral.sh/uv/concepts/python-versions/), refer to the documentation.

### Miscellaneous

```shell
# To generate a requirements.txt from a UV lock file, use the following command:
uv export -o requirements.txt
```

### Maintenance

```shell
# self update
uv self update
# clear cache
uv cache clean
```

## References

* <https://github.com/astral-sh/uv/blob/main/docs/getting-started/features.md>
* <https://docs.astral.sh/uv/guides/projects/>
* <https://rdrn.me/postmodern-python/>
* <https://www.datacamp.com/tutorial/python-uv>
