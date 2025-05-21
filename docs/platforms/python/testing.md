# testing

Setting up testing with pytest and uv

## Creating a Project with Tests

```shell
uv init myapp --package
d myapp
```

This creates a Python package project with the following structure:

```
myapp/
├── pyproject.toml
├── README.md
└── src
    └── myapp
        └── __init__.py
```

## Adding pytest as a Development Dependency

Add pytest to your project’s development dependencies:

```shell
uv add --dev pytest
```

This command:

- Updates your `pyproject.toml` with pytest as a development dependency
- Create the project’s lockfile
- Installs pytest in your project’s virtual environment

## Creating a Simple Module to Test

Let’s create a simple calculator module to test.
Create a new file at `src/myapp/calculator.py`:

```python
def add(a, b):
    return a + b


def subtract(a, b):
    return a - b


def multiply(a, b):
    return a * b


def divide(a, b):
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b
```

## Creating Test Files

Create a `tests` directory at the root of your project

Now, create a test file for our calculator module in tests/test_calculator.py:

```python
import pytest
from myapp.calculator import add, subtract, multiply, divide


def test_add():
    assert add(1, 2) == 3
    assert add(-1, 1) == 0
    assert add(-1, -1) == -2


def test_subtract():
    assert subtract(3, 2) == 1
    assert subtract(2, 3) == -1
    assert subtract(0, 0) == 0


def test_multiply():
    assert multiply(2, 3) == 6
    assert multiply(-2, 3) == -6
    assert multiply(-2, -3) == 6


def test_divide():
    assert divide(6, 3) == 2
    assert divide(6, -3) == -2
    assert divide(-6, -3) == 2


def test_divide_by_zero():
    with pytest.raises(ValueError):
        divide(5, 0)
```

## Configuring pytest

Let’s configure pytest in your pyproject.toml file by adding these settings:

```yml
[tool.pytest.ini_options]
log_cli = true
testpaths = ["tests"]
python_files = "test_*.py"
python_functions = "test_*"
addopts = ["-v", "--strict-markers"]
pythonpath = ["."]
```

This configuration:

- Sets the test discovery path to the `tests` directory
- Specifies that test files should start with `test_`
- Specifies that test functions should start with `test_`

## Running Tests

Now you can run your tests using uv:

```shell
uv run pytest
```

To see more detailed output, use the verbose flag:

```shell
uv run pytest --cov=testing_demo
```

For a more detailed report:

```shell
uv run pytest --cov=testing_demo --cov-report=term-missing
```

To test a specific test case in a test file

```shell
uv run pytest tests/integration/agent/test_basic.py::test_basic
```
