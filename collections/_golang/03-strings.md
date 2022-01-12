---
title: "Go: Data Types - Strings"
excerpt: "Notes about golang"
header:
  image: "/assets/images/academy/golang.svg"
last_modified_at: 2021-12-26 00:00:00 +00:00
toc: true
---

> :warning: **NOTE:** Under Construction

## Strings

A string in Go is an immutable sequence of bytes, which don't necessarily have to represent characters.


A string literal is a sequence of bytes enclosed in double quotes:

```go
name := "Jane"
```

Strings can be concatenated via the `+` operator:
```go
fullName := "Jane" + " " + "Austen"
```

Some special characters need to be escaped with a leading backslash:
```go
question := "\t or spaces?"
```

The `strings` package contains many useful **functions** to work on strings. It needs to be imported before it can be used.
To call functions within the `strings` package, prefix them with `strings.`.

```go
import "strings"

strings.ToLower()	  //  Convert the string to lower case
strings.ToUpper()	  //	Convert the string to upper case
strings.TrimSpace()	//	Trim leading and trailing whitespace
strings.Index()	    //	Find the index of the first instance of a substring within a string
strings.Replace()	  //	Replace one occurrence of a substring in a string
strings.ReplaceAll()//	Replace all occurrences of a substring in a string
strings.Split()	    //	Split a string into parts based on a separator
strings.HasSuffix()	//	Check if a string ends with a specific substring
strings.Count()	    //	Count the number of occurrences of a substring within a string
```

### String Formatting


Go provides an in-built package called `fmt` (format package) which offers a variety of functions to manipulate the format of input and output.
The most commonly used function is `Sprintf`, which uses verbs like `%s` to interpolate values into a string and returns that string.

```go
import "fmt"

food := "taco"
fmt.Sprintf("Bring me a %s", food)
// Returns: Bring me a taco
```

In Go floating point values are conveniently formatted with Sprintf's verbs: `%g` (compact representation), `%e` (exponent) or `%f` (non exponent).
All three verbs allow the field's width and numeric position to be controlled.

```go
import "fmt"

number := 4.3242
fmt.Sprintf("%.2f", number)
// Returns: 4.32
```

You can find a full list of available verbs in the format package documentation.

`fmt` contains other functions for working with strings, such as `Println` which simply prints the arguments it receives to the console and `Printf` which formats the input in the same way as `Sprintf` before printing it.


# Packages

In Go an application is organized in packages.
A package is a collection of source files located in the same folder.
All source files in a folder must have the same package name at the top of the file.
By convention packages are named to be the same as the folder they are located in.

```go
package greeting
```

Go provides an extensive standard library of packages which you can use in your program using the `import` keyword.
Standard library packages are imported using their name.

```go
package greeting

import "fmt"
```

An imported package is then addressed with the package name:

```go
world := "World"
fmt.Sprintf("Hello %s", world)
```

Go determines if an item can be called by code in other packages through how it is declared.
To make a function, type, variable, constant or struct field externally visible (known as _exported_) the name must start with a capital letter.

```go
package greeting
// Hello is a public function (callable from other packages)
func Hello(name string) string {
    return "Hello " + name
}
// hello is a private function (not callable from other packages)
func hello(name string) string {
    return "Hello " + name
}
```
