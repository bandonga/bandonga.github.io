---
title: "Go: Introduction"
excerpt: "Guide to understand golang"
header:
  image: "/assets/images/academy/golang.svg"
last_modified_at: 2021-12-26 00:00:00 +00:00
toc: true
---

> :warning: **NOTE:** Under Construction

# Introduction


##### Basic types

* `bool`
* `string`
* `int  int8  int16  int32  int64`
* `uint uint8 uint16 uint32 uint64 uintptr`
* `byte` alias for uint8
* `rune` alias for int32, represents a Unicode code point
* `float32 float64`
* `complex64 complex128`

The example shows variables of several types, and also that variable declarations may be "factored" into blocks, as with import statements.

The `int, uint, uintptr` types are usually 32 bits wide on 32-bit systems and 64 bits wide on 64-bit systems. When you need an integer value you should use int unless you have a specific reason to use a sized or unsigned integer type.

The zero value is:

* `0` for numeric types,
* `false` for the boolean type, and
* `""` (the empty string) for strings.

###### Type conversions
The expression T(v) converts the value v to the type T.

```go
  i := 42
  f := float64(i)
  u := uint(f)
```

Unlike in C, in Go assignment between items of different type requires an explicit conversion.

###### Type inference
When declaring a variable without specifying an explicit type, the variable's type is inferred from the value on the right hand side.


```go
var i int
j := i // j is an int

fmt.Printf("j is of type %T\n", j)
```


Numeric constants are high-precision values. An untyped constant takes the type needed by its context.

## Flow control statements

### For

Go has only one looping construct, the for loop.

```go
  for i := 0; i < 10; i++ {
    sum += i
  }
```

The init statement will often be a short variable declaration, and the variables declared there are visible only in the scope of the for statement.

Unlike other languages like C, there are no parentheses surrounding the three components of the for statement and the braces { } are always required.

The init and post statements are optional

```go
  sum := 1
  for sum < 1000 {
    sum += sum
  }
```

##### If
if statements are like its for loops; the expression need not be surrounded by parentheses ( ) but the braces { } are required.

```go
  if x < 0 {
     return sqrt(-x) + "i"
  }
```

the if statement can start with a short statement to execute before the condition.
Variables declared by the statement are only in scope until the end of the if.

```go
  if v := math.Pow(x, n); v < lim {
    return v
  } else {
    fmt.Printf("%g >= %g\n", v, lim)
  }
```

Variables declared inside an if short statement are also available inside any of the else blocks.

##### Switch

 switch is like the one in C, except that Go only runs the selected case, not all the cases that follow. In effect, the break statement that is needed at the end of each case in those languages is provided automatically in Go. Another important difference is that Go's switch cases need not be constants, and the values involved need not be integers.

```go
	switch os := runtime.GOOS; os {
	case "darwin":
		fmt.Println("OS X.")
	case "linux":
		fmt.Println("Linux.")
	default:
		// freebsd, openbsd, windows...
		fmt.Printf("%s.\n", os)
	}
```

Switch without a condition is the same as switch true, that can be used as long if-then-else chains.

```go
	switch {
 	case t.Hour() < 12:
		fmt.Println("Good morning!")
	case t.Hour() < 17:
		fmt.Println("Good afternoon.")
	default:
		fmt.Println("Good evening.")
	}
```

##### Defer
A defer statement defers the execution of a function until the surrounding function returns.

The deferred call's arguments are evaluated immediately, but the function call is not executed until the surrounding function returns.

```go
	defer fmt.Println("world")
```

Deferred function calls are pushed onto a stack. When a function returns, its deferred calls are executed in last-in-first-out order.

## Complex types

### Pointers

A pointer holds the memory address of a value, but unlike C, Go has no pointer arithmetic.
The type `*T` is a pointer to a T value. Its zero value is nil.

```go
var p *int
```

The `&` operator generates a pointer to its operand.

```go
i := 42
p = &i // point to i
```

The `*` operator denotes the pointer's underlying value.
```go
fmt.Println(*p) // read i through the pointer p
*p = 21         // set i through the pointer p
```

This is known as "dereferencing" or "indirecting".


### Structs
A struct is a collection of fields.
Struct fields are accessed using a dot.

```go
type Vertex struct {
  X int
  Y int
}

func main() {
  fmt.Println(Vertex{1, 2})
  v := Vertex{1, 2}
  fmt.Println(v.X)
}
```

To access the field X of a struct when we have the struct pointer p we could write (*p).X. However, it's possible to write just p.X, without the explicit dereference.

```go
  p := &v
  p.X = 10
```

Struct Literals
A struct literal denotes a newly allocated struct value by listing the values of its fields.

You can list just a subset of fields by using the Name: syntax. (And the order of named fields is irrelevant.)

The special prefix & returns a pointer to the struct value.
https://tour.golang.org/moretypes/5


##### time

time.Time - a specific time
t.Add() - add some time

- [How to Write Go Code](https://golang.org/doc/code.html)
- [Effective Go](https://golang.org/doc/effective_go.html)
- [Go Resources](http://golang.org/help)

https://blog.cloudflare.com/using-go-as-a-scripting-language-in-linux/


test
go test -v --bench . --benchmem

lint:
https://siderlabs.com/blog/lets-use-go-vet-the-standard-tool-for-analyzing-go-s-source-code-59435ea71059/
https://staticcheck.io/

################################################################################
