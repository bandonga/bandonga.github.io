



- Python Programming - Python, Machine learning

- Devoted Learner - Python

- Python Principles - Python


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


if b > a:
  print("b is greater than a")
elif a == b:
  print("a and b are equal")
else:
  print("a is greater than b")











Ellipsis
The same as the ellipsis literal “...”. Special value used mostly in conjunction with extended slicing syntax for user-defined container data types.


https://docs.python.org/3/library/operator.html

Module: A module is code written somewhere else (maybe by someone else) that you are using in your own code for a specific task. You can write your own modules to organize your code in different files, or you can use modules written by other people. The sys module is built-in to Python to perform tasks such as collecting input for your script.
Import: When we need to use code defined in another module, we have to "import" it into our code using the import keyword (docs). For built-in modules like sys, we can just pass in the module name after the import keyword. There are other ways to include modules, but that's a topic for another time.
Standard Library: These are modules that are built in to Python to do common tasks. There are modules in the standard library to help you work with numbers, dates, text, and other common data types.

https://docs.python.org/3/tutorial/inputoutput.html


Formatted string literals (also called f-strings for short) let you include the value of Python expressions inside a string by prefixing the string with f or F and writing expressions as {expression}.

print(f'My hovercraft is full of {animals}.')

Accessing script arguments
To actually get the arguments passed into the program, you're using the sys.argv object. This object is a list of strings that contain all the arguments passed in to the python3 command, including the name of your script.

sys.argv[0] will always be the name of your script - in this example, that would be "collect_input.py".

pop() is an inbuilt function in Python that removes and returns last value from the list or the given index value.
removes the script name [0].











sudo -H pip install virtualenv

python -m venv myproject

pip install Flask twilio

pip freeze > requirements.txt
If later on, you wish to install this same set of dependencies again, you can install them from this file with the following command:
https://stackoverflow.com/questions/31684375/automatically-create-requirements-txt

pip install -r requirements.txt

Pythonic: https://docs.python-guide.org/writing/style/

# Python pre 3.3
$ virtualenv myproject
New python executable in myproject/bin/python
Installing setuptools, pip, wheel...done.

# Activate the virtualenv (OS X & Linux)
$ source myproject/bin/activate

# Activate the virtualenv (Windows)
$ myproject\Scripts\activate



* "Top 11 Github Repositories to Learn Python | by Claire D. Costa | Nov, 2020 | Towards Data Science" https://towardsdatascience.com/top-11-github-repositories-to-learn-python-e75e8676757a
* "Understand O.O.P. in Python with One Article | by Julian Herrera | Nov, 2020 | Towards Data Science" https://towardsdatascience.com/understand-o-o-p-in-python-with-one-article-bfa76f3ba48c

scripts:
fire
https://medium.com/better-programming/write-better-python-scripts-ce58c1ebf690

gui
https://pysimplegui.readthedocs.io/en/latest/
https://github.com/samuelhwilliams/Eel
https://pywebview.flowrl.com/examples/

framework
flask
django

https://python.libhunt.com/projects

* https://www.fullstackpython.com/flask.html?utm_source=twilioquest-3




## How to run

E:/Python27/python.exe E:/ps/TT_import.py


## How to install locally

In a Server with internet.

```
  ### Download get-pip.py
curl https://bootstrap.pypa.io/get-pip.py
  ### Download required packages and it's dependencies
python -m pip download -d pypi setuptools wheel pymssql
```

In the target Server, copy the packges/script downloaded and run:

```
  ### install pip
python.exe E:/ps/pypiget-pip.py --no-index --find-links=E:/ps/pypi  --no-wheel --no-setuptools

  ### install required packages and it's dependencies
python.exe -m pip install --no-index --find-links file:E:/ps/pypi pymssql setuptools wheel

  ## Check the packages installed (or pip list)
python.exe -m pip freeze
```


* How to generate a requirements file:
https://stackoverflow.com/a/45620892



### How to configure Windows variables

* Go to `Computer > Properties >Advanced System Settings > Environment Variables`
* Click `New` under `System Variable`
* Variable Name: `PythonPath`, Variable Value: `C:\path\to\python\version`
* Click `OK`
* Locate the `Path` System variable and click `Edit`
* Add the following to the existing variable: `;%PythonPath%;%PythonPath%\Lib;%PythonPath%\DLLs;%PythonPath%\Lib\lib-tk;%PythonPath%\Scripts;`
* Click `OK` and close all of the windows.


* Kirk-Byers-Learning-Python
* https://codewith.mu/
* https://www.youtube.com/watch?v=sG_RiytUA38&list=PLOocymQm7YWakdZkBfCRIC06fv7xQE85N
* https://gist.github.com/sloria/7001839
* https://jacobtomlinson.dev/posts/2020/versioning-and-formatting-your-python-code/
* https://towardsdatascience.com/how-to-set-up-python3-the-right-easy-way-11c18b0b4ac0

python3 -m pip install pytest pytest-cache pytest-subtests pytest-pylint


pip install pytest

pytest -v -x -ff  lasagna_test.py
Stop After First Failure [-x]
Failed Tests First [--ff]

https://realpython.com/python-code-quality/
sudo apt install pylint
pip install pylama[all]
pip install flake8

pylint lasagna.py
flake8 exchange.py
pylama exchange.py
https://www.sonarqube.org/ ?
