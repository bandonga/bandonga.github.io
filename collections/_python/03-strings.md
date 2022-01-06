

##### Strings

Python strings are immutable, which means once you create them, you can't change them. What you do instead is use existing strings to transform their value and create new strings.

Python's string object has many methods which enable you to return a new string with some kind of transformation applied to it. Methods are functions which operate on a specific instance (copy) of an object.


A `str` in Python is an immutable sequence of Unicode code points. These could include letters, diacritical marks, positioning characters, numbers, currency symbols, emoji, punctuation, space and line break characters, and more.
Being immutable, a `str` object's value in memory doesn't change; methods that appear to modify a string return a new copy or instance of that `str` object.

A `str` literal can be declared via single `'` or double `"` quotes. The escape `\` character is available as needed.


```python

>>> single_quoted = 'These allow "double quoting" without "escape" characters.'

>>> double_quoted = "These allow embedded 'single quoting', so you don't have to use an 'escape' character".

>>> escapes = 'If needed, a \'slash\' can be used as an escape character within a string when switching quote styles won\'t work.'
```

Multi-line strings are declared with `'''` or `"""`.

```python
>>> triple_quoted =  '''Three single quotes or "double quotes" in a row allow for multi-line string literals.
  Line break characters, tabs and other whitespace are fully supported.

  You\'ll most often encounter these as "doc strings" or "doc tests" written just below the first line of a function or class definition.
    They\'re often used with auto documentation ✍ tools.
    '''
```

### operations



Strings can be concatenated using the `+` operator.



```python
language = "Ukrainian"
number = "nine"
word = "девять"

sentence = word + " " + "means" + " " + number + " in " + language + "."

>>> print(sentence)
...
"девять means nine in Ukrainian."
```

If a `list`, `tuple`, `set` or other collection of individual strings needs to be combined into a single `str`, [`<str>.join(<iterable>)`][str-join], is a better option:


```python
# str.join() makes a new string from the iterables elements.
>>> chickens = ["hen", "egg", "rooster"]
>>> ' '.join(chickens)
'hen egg rooster'

# Any string can be used as the joining element.
>>> ' :: '.join(chickens)
'hen :: egg :: rooster'

>>> ' 🌿 '.join(chickens)
'hen 🌿 egg 🌿 rooster'
```

Code points within a `str` can be referenced by `0-based index` number from the left:


```python
creative = '창의적인'

>>> creative[0]
'창'

>>> creative[2]
'적'

>>> creative[3]
'인'
```

Indexing also works from the right, starting with a `-1-based index`:


```python
creative = '창의적인'

>>> creative[-4]
'창'

>>> creative[-2]
'적'

>>> creative[-1]
'인'

```


There is no separate “character” or "rune" type in Python, so indexing a string produces a new `str` of length 1:


```python

>>> website = "exercism"
>>> type(website[0])
<class 'str'>

>>> len(website[0])
1

>>> website[0] == website[0:1] == 'e'
True
```

Substrings can be selected via _slice notation_, using [`<str>[<start>:stop:<step>]`][common sequence operations] to produce a new string.
 Results exclude the `stop` index.
 If no `start` is given, the starting index will be 0.
 If no `stop` is given, the `stop` index will be the end of the string.


```python
moon_and_stars = '🌟🌟🌙🌟🌟⭐'
sun_and_moon = '🌞🌙🌞🌙🌞🌙🌞🌙🌞'

>>> moon_and_stars[1:4]
'🌟🌙🌟'

>>> moon_and_stars[:3]
'🌟🌟🌙'

>>> moon_and_stars[3:]
'🌟🌟⭐'

>>> moon_and_stars[:-1]
'🌟🌟🌙🌟🌟'

>>> moon_and_stars[:-3]
'🌟🌟🌙'

>>> sun_and_moon[::2]
'🌞🌞🌞🌞🌞'

>>> sun_and_moon[:-2:2]
'🌞🌞🌞🌞'

>>> sun_and_moon[1:-1:2]
'🌙🌙🌙🌙'
```

Strings can also be broken into smaller strings via [`<str>.split(<separator>)`][str-split], which will return a `list` of substrings.
 The list can then be further indexed or split, if needed.
 Using `<str>.split()` without any arguments will split the string on whitespace.


```python
>>> cat_ipsum = "Destroy house in 5 seconds mock the hooman."
>>> cat_ipsum.split()
...
['Destroy', 'house', 'in', '5', 'seconds', 'mock', 'the', 'hooman.']


>>> cat_ipsum.split()[-1]
'hooman.'


>>> cat_words = "feline, four-footed, ferocious, furry"
>>> cat_words.split(',')
...
['feline', 'four-footed', 'ferocious', 'furry']
```


Separators for `<str>.split()` can be more than one character.
The **whole string** is used for split matching.


```python

>>> colors = """red,
orange,
green,
purple,
yellow"""

>>> colors.split(',\n')
['red', 'orange', 'green', 'purple', 'yellow']
```

Strings support all [common sequence operations][common sequence operations].
 Individual code points can be iterated through in a loop via `for item in <str>`.
 Indexes _with_ items can be iterated through in a loop via `for index, item in enumerate(<str>)`.


```python

>>> exercise = 'လေ့ကျင့်'

# Note that there are more code points than perceived glyphs or characters
>>> for code_point in exercise:
...    print(code_point)
...
လ
ေ
့
က
ျ
င
်
့

# Using enumerate will give both the value and index position of each element.
>>> for index, code_point in enumerate(exercise):
...    print(index, ": ", code_point)
...
0 :  လ
1 :  ေ
2 :  ့
3 :  က
4 :  ျ
5 :  င
6 :  ်
7 :  ့
```

Changing one character in a string

```python

text = 'abcdefg'
new = list(text)
new[6] = 'W'
''.join(new)

text = 'abcdefg'
text = text[:1] + 'Z' + text[2:]
```


[common sequence operations]: https://docs.python.org/3/library/stdtypes.html#common-sequence-operations
[str-join]: https://docs.python.org/3/library/stdtypes.html#str.join
[str-split]: https://docs.python.org/3/library/stdtypes.html#str.split
[text sequence]: https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str
[unicode code points]: https://stackoverflow.com/questions/27331819/whats-the-difference-between-a-character-a-code-point-a-glyph-and-a-grapheme


Strings implement all common sequence operations, and can be iterated through using `for item in <string>` or `for index, item in enumerate(<string>)` syntax.

Strings can be concatenated with `+`, or via `<str>.join()`, split via `<str>.split(<separator>)`, and offer multiple types of formatting, interpolation, and templating.

Being immutable, a str object's value in memory doesn't change; methods that appear to modify a string return a new copy or instance of `str`.

For a deep dive on what information a string encodes (or, "how does a computer know how to translate zeroes and ones into letters?"), this blog post is enduringly helpful: https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/

The Python docs also provide a very detailed unicode HOWTO that discusses Pythons support for the Unicode specification in the `str`, `bytes` and `re` modules, considerations for locales, and some common issues with encoding and translation: https://docs.python.org/3/howto/unicode.html

Stripping everything but alphanumeric chars from a string
```python
$ python -m timeit -s \
    "import re, string" \
    "re.sub('[\W_]+', '', string.printable)"                
100000 loops, best of 3: 15 usec per loop

$ python -m timeit -s \
    "import re, string; pattern = re.compile('[\W_]+')" \
    "pattern.sub('', string.printable)"
100000 loops, best of 3: 11.2 usec per loop
```python
