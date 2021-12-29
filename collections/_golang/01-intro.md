---
title: "Go: Introduction"
excerpt: "Guide to understand golang"
header:
  image: "/assets/images/academy/golang.svg"
last_modified_at: 2021-12-26 00:00:00 +00:00
toc: true
---

> :warning: **NOTE:** Under Construction

Go is a statically typed, compiled programming language, syntactically similar to C, often referred to as Golang.


## Basics

### Comments

Note that Go supports two types of comments. Single line comments are preceded by `//` and multi-line comments are inserted between `/* and */`.


### Packages

Every Go program is made up of packages.
A package is a collection of source files located in the same directory. All source files in a directory must share the same package name.
It is conventional for the package name to be the last directory in the import path.
A program can use other packages with import paths:

```go
package main

import "fmt"
```

#### Exported names
A name is exported if it begins with a capital letter. For example `Println`, which is exported from the `fmt` package. When a package is imported, only entities (functions, types, variables, constants) whose names start with a capital letter can be used / accessed. The recommended style of naming in Go is that identifiers will be named using `camelCase`, except for those meant to be accessible across packages which should be `CamelCase`.


### Variables

The var statement declares a list of variables; as in function argument lists, the type is last.
A var statement can be at package or function level.
Variables can be defined by explicitly specifying a type:
```go
var explicit int // Explicitly typed

  // declaring multiple vars
var c, python, java bool
```

A var declaration can include **initializers** (one per variable), in which the type can be omitted and the variable will take the type of the initializer.

```go
var c, python, java = true, false, "no!"
```

Inside a function, the `:=` short assignment statement can be used in place of a var declaration with implicit type.

Outside a function, every statement begins with a keyword (var, func, and so on) and so the `:=` construct is not available.

Once declared, variables can be assigned values using the `=` operator. Once declared, a variable's type can never change.

```go
count := 1 // Assign initial value. Implicitly typed as an int
count = 2  // Update to new value

c, python, java := true, false, "no!"
```

#### Constants
Constants are declared like variables, but with the `const` keyword.
It can be characters, strings, booleans, or numeric values, but cannot be declared using the `:=` syntax.

```go
const Pi = 3.14
```
Constants hold a piece of data just like variables, but their value cannot change during the execution of the program.


### Functions
A function can take zero or more arguments. Parameters must be explicitly typed, there is no type inference.

```go
func add(x int, y int) int {
  return x + y
}
```

In this example, add takes two parameters of type int and a return value of the same type.
When two or more consecutive named function parameters share a type, you can omit the type from all but the last `x, y int`.

##### Return
A function can return any number of results.

```go
func swap(x, y string) (string, string) {
	return y, x
}
```

return values may be named. If so, they are treated as variables defined at the top of the function.

```go
func split(sum int) (x, y int) {
	x = sum * 4 / 9
	y = sum - x
	return
}
```

These names should be used to document the meaning of the return values.
A return statement without arguments returns the named return values. This is known as a "naked" return.
