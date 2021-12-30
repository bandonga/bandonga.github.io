---
title: "Python: Data Types - Numbers"
excerpt: "Guide to understand python"
header:
  image: "/assets/images/academy/python.svg"
last_modified_at: 2021-12-26 00:00:00 +00:00
toc: true
---



# Data Types

Python has the following data types built-in by default, in these categories:

* Text Type:	str
* Numeric Types:	int, float, complex
* Sequence Types:	list, tuple, range
* Mapping Type:	dict
* Set Types:	set, frozenset
* Boolean Type:	bool
* Binary Types:	bytes, bytearray, memoryview

## Numbers
There are three different kinds of built-in numbers in Python : ints, floats, and complex.

### ints

Integers in Python have arbitrary precision, the amount of digits is limited only by the available memory of the host system.

### floats

Floating point numbers are usually implemented in Python using a `double in C` (15 decimal places of precision), but will vary in representation based on the host system and other implementation details. This can create some surprises when working with floats, due to the [Floating point](https://0.30000000000000004.com/).


### Arithmetic

Python fully supports arithmetic between `ints` and `floats`. It will convert narrower numbers to match their less narrow counterparts when used with the binary arithmetic operators `+, -, *, /, //, %`. When division with `/, //` returns the quotient and `%` returns the remainder.

Python considers `ints` narrower than `floats`. So, using a float in an expression ensures the result will be a float too. However, when doing division, the result will always be a float, even if only integers are used.

```python
>>> 3 - 2.0
1.0
# Division always returns a float.
>>> 6 / 2
3.0
# If an int result is needed, you can use `//` to truncate the result.
>>> 7 // 4
1
```

### Convertion

To convert a float to an integer, you can use `int()`. Also, to convert an integer to a float, you can use `float()`.

```python

>>> int(6 / 2)
3
>>> float(1 + 2)
3.0
```

##### Strings

Python strings are immutable, which means once you create them, you can't change them. What you do instead is use existing strings to transform their value and create new strings.

Python's string object has many methods which enable you to return a new string with some kind of transformation applied to it. Methods are functions which operate on a specific instance (copy) of an object.

##### Bitwise Operators
https://www.geeksforgeeks.org/python-bitwise-operators/#:~:text=In%20Python%2C%20bitwise%20operators%20are,is%20returned%20in%20decimal%20format.&text=Bitwise%20AND%20operator%3A%20Returns%201,bits%20are%201%20else%200.

--------------------------------------------------------------------------------

##### Lists and Tuples


https://realpython.com/python-lists-tuples/#lists-can-be-nested


##### dic

https://docs.python.org/3/library/stdtypes.html?utm_source=twilioquest-3#mapping-types-dict
https://docs.python.org/3/tutorial/datastructures.html?utm_source=twilioquest-3#dictionaries

Dictionaries are a data type that allows programmers to create more complex data than just numbers, strings, and other basic data types. Using key/value pairs, it becomes possible to model concepts like a blog post that has a title and an author, and other more complex ideas. Of course, classes are also used for this purpose, but that is a topic for another time. Dictionaries are a light-weight way to create a container for related data.

Dictionaries are one of many tools in Python that allow us to describe more complex data.

##### lists

Lists are an ordered list of objects in Python code. Lists can contain any kind of data - strings, numbers, and even more complex data types. I will need to learn how to create and work with data in a list to complete this trial.

When you run this code, you create an ordered list of four strings. Each item in the list has an index, which is a number that represents its place in the list. In programming, the first item in a list is at index 0, and the indexes go up from there. In a list of four items, the last index is 3.

You can get an item in a list at a specific index using subscript notation - that bit with the square brackets [] in the print statement above. first_item = groceries[0] would store the first item in the list, the string apples, in the variable first_item.

##### list of objects

The code that runs during the loop is indented two spaces from where the for loop started. This indentation tells Python what code should be executed during the loop. Without the indentation, the code would all be executed in order, and the logic wouldn't work.

There's one improvement we could make to this logic which makes use of the built-in function enumerate. This gives us the index of each item as we loop through the list as well

```python
groceries = ['apples', 'coffee', 'pizza rolls', 'olives']

print("These are the items on my grocery list:")
for index, item in enumerate(groceries, start=1):
  string_to_print = f"{index}. {item}"
  print(string_to_print)
```

### Booleans

Booleans represent the concept of true and false. In programming, it's frequently necessary to execute one code path under one set of circumstances, and different code under another. If a user is logged in, show them their account balance. If they are not logged in, redirect them to a login page. I'll need to demonstrate basic command of this concept to complete this trial.

### Python Collections
Python Collections (Arrays)
There are four collection data types in the Python programming language:

* List is a collection which is ordered and changeable. Allows duplicate members.
* Tuple is a collection which is ordered and unchangeable. Allows duplicate members.
* Set is a collection which is unordered and unindexed. No duplicate members.
* Dictionary is a collection which is ordered* and changeable. No duplicate members.

Set is a collection which is unordered and unindexed. No duplicate members.
