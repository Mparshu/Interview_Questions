For loop in python:
```
fruits = ['apple', 'banana', 'cherry']
for fruit in fruits:
    print(fruit)
```

```
for i in range(5):
    print(i)
```
```
for i in range(10):
    if i == 5:
        break
    print(i)
```

```
greeting = "Hello, World!"
for char in greeting:
    print(char)
```

Prime Numbers:
```
def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True

def find_primes(limit):
    primes = []
    for i in range(2, limit + 1):
        if is_prime(i):
            primes.append(i)
    return primes

limit = 20
primes = find_primes(limit)
print(primes)  # Output: [2, 3, 5, 7, 11, 13, 17, 19]
```

Odd Or Even:
```
def check_odd_even(number):
    if number % 2 == 0:
        return f"{number} is Even."
    else:
        return f"{number} is Odd."

# Example usage
num = int(input("Enter a number: "))
result = check_odd_even(num)
print(result)
```

Assertions in Pytest:

Assertions in pytest are a fundamental feature that allows developers to verify that their code behaves as expected during testing. They are used to set expectations about the output of code and to check for specific conditions. When an assertion passes, it indicates that the code is functioning correctly; when it fails, pytest provides detailed information about the failure, making it easier to diagnose issues.

### Key Features of Assertions in Pytest

1. **Human-Readable Syntax**:
   - Pytest allows the use of plain `assert` statements instead of specific assertion methods (like `assertEquals`), making the tests more intuitive and easier to read. For example:
     ```python
     assert result == expected_value
     ```

2. **Detailed Failure Reports**:
   - When an assertion fails, pytest provides detailed output that includes the values of the variables involved in the assertion. This helps developers quickly understand what went wrong.

3. **Custom Assertion Messages**:
   - You can enhance assertions with custom messages to provide more context when an assertion fails:
     ```python
     assert result == expected_value, "Expected value was not returned"
     ```

4. **Chaining Assertions**:
   - Pytest supports chaining multiple assertions in a single test function. This allows you to check several conditions at once, which can lead to more comprehensive tests.

5. **Mocking and Assertions**:
   - Pytest integrates well with the `unittest.mock` library, enabling you to assert that functions are called with specific arguments, how many times they are called, and more. For example:
     ```python
     mock_function.assert_called_with(arg1, arg2)
     ```

6. **Plugins for Enhanced Functionality**:
   - Pytest supports plugins like `pytest-mock`, which extends its capabilities for mocking and asserting function calls, allowing for more sophisticated testing scenarios.

### Example of Using Assertions in Pytest

Here's a simple example demonstrating how assertions work in pytest:

```python
def add(a, b):
    return a + b

def test_add():
    assert add(2, 3) == 5
    assert add(-1, 1) == 0
    assert add(0, 0) == 0
```

In this example, the `test_add` function contains several assertions that verify the behavior of the `add` function. If any of these assertions fail, pytest will provide a detailed report indicating which assertion failed and why.

Assertions are crucial for ensuring code quality and reliability, making them an essential part of the testing process in pytest.

Types of Assertions:

In pytest, assertions are used to verify that the code behaves as expected during testing. There are several types of assertions that can be utilized, each serving different purposes. Here are some key types of assertions commonly used in pytest:

### 1. Basic Assertions
The most straightforward type of assertion is the basic `assert` statement, which checks for equality or truthiness. For example:
```python
assert result == expected_value
```
This checks if `result` equals `expected_value`. If not, pytest will report a failure.

### 2. Chained Assertions
Pytest allows chaining multiple assertions in a single test function, enabling comprehensive checks. For example:
```python
assert a == b
assert c == d
```
This can be useful for validating multiple conditions in one go.

### 3. Custom Assertion Messages
You can provide custom messages to assertions, which can help clarify the context of a failure:
```python
assert result == expected_value, "Expected value did not match the result"
```
This message will be displayed if the assertion fails.

### 4. Function Call Assertions
When using mocking, you can assert that functions were called as expected:
- **Basic Call Check**: 
  ```python
  mock_function.assert_called()
  ```
- **Call Count**: 
  ```python
  assert mock_function.call_count == 2
  ```
- **Verifying Call Arguments**: 
  ```python
  mock_function.assert_called_with(arg1, arg2)
  ```

### 5. Comparison Assertions
Pytest supports assertions that compare values, such as:
- **Less Than or Equal To**:
  ```python
  assert a <= b
  ```
- **Greater Than or Equal To**:
  ```python
  assert a >= b
  ```

### 6. Boolean Assertions
You can assert boolean conditions directly:
```python
assert condition is True
```

### 7. Exception Assertions
Pytest provides a way to assert that specific exceptions are raised:
```python
import pytest

with pytest.raises(ValueError):
    function_that_raises()
```

### 8. Assert with `pytest` Plugins
There are plugins like `pytest-assertions` that extend the functionality of assertions, providing additional methods for more complex checks, such as:
- `assert_all`
- `assert_any`
- `assert_lte` (less than or equal)

These assertions help in validating collections or specific conditions in a more readable way.

### Conclusion
Assertions in pytest are versatile and provide a robust way to ensure that your code behaves as expected. By utilizing various types of assertions, you can create comprehensive tests that not only check for correctness but also provide meaningful feedback when things go wrong. This makes pytest a powerful tool in the software testing landscape.
