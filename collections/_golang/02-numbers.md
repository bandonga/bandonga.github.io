---
title: "Go: Data Types - Numbers"
excerpt: "Notes about golang"
header:
  image: "/assets/images/academy/golang.svg"
last_modified_at: 2021-12-26 00:00:00 +00:00
toc: true
---

> :warning: **NOTE:** Under Construction


# Data Types

* `int  int8  int16  int32  int64`
* `uint uint8 uint16 uint32 uint64 uintptr` // unsigned
* `float32 float64`
* `complex64 complex128`
* `bool`
* `string`
* `byte` alias for uint8
* `rune` alias for int32, represents a Unicode code point

The zero value is:

* `0` for numeric types,
* `false` for the boolean type, and
* `""` (the empty string) for strings.

## Type conversions
The expression T(v) converts the value v to the type T.

```go
  i := 42
  f := float64(i)
  u := uint(f)
```

Unlike in C, in Go assignment between items of different type requires an explicit conversion.

## Type inference
When declaring a variable without specifying an explicit type, the variable's type is inferred from the value on the right hand side.


```go
var i int
j := i // j is an int

fmt.Printf("j is of type %T\n", j)
```

Numeric constants are high-precision values. An untyped constant takes the type needed by its context.

## Numbers

Go contains basic numeric types that can represent sets of either integer or floating-point values.

* `int`: A signed integer. The `int, uint, and uintptr` types are usually 32 bits wide on 32-bit systems and 64 bits wide on 64-bit systems.
* `float64`: Contains the set of all 64-bit floating-point numbers.

### Arithmetic

Go supports the standard set of arithmetic operators:

```
+    sum                    integers, floats, complex values, strings
-    difference             integers, floats, complex values
*    product                integers, floats, complex values
/    quotient               integers, floats, complex values
%    remainder              integers

&    bitwise AND            integers
|    bitwise OR             integers
^    bitwise XOR            integers
&^   bit clear (AND NOT)    integers

<<   left shift             integer << integer >= 0
>>   right shift            integer >> integer >= 0
```

#### Arithmetic operations on different types
In many languages you can perform arithmetic operations on different types of variables, but in Go this gives an error:

```go
var x int = 42

// this line produces an error
value := float32(2.0) * x // invalid operation: mismatched types float32 and int

// you must convert int type to float32 before performing arithmetic operation
value := float32(2.0) * float32(x)
```

#### Shorthand Assignments
These can be used in shorthand assignments to update and assign a variable using the operator:

```go
a := 1
a += 2 // same as a = a + 2 == 3
```

#### Increment and Decrement
There are also two special statements: increment (++) and decrement (--) the value by 1.

```go
a := 10
a++ // same as a += 1
```
