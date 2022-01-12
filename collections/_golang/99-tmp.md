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

```
# You can use git checkout to get an specific version and build your program using this version.
# Example:
# export GOPATH=~/
# go get github.com/whateveruser/whateverrepo
# cd ~/src/github.com/whateveruser/whateverrepo
# git tag -l
# # supose tag v0.0.2 is correct version
# git checkout tags/v0.0.2
# go run whateverpackage/main.go

# RUN set -o nounset -o errexit -o xtrace -o verbose \
#    && curl -sSL -O https://github.com/sipcapture/heplify-server/archive/refs/tags/${HEPLIFY_VERSION}.tar.gz \
#    && tar zxf ${HEPLIFY_VERSION}.tar.gz -C /go/src/ \
#    && cd /go/src/heplify-server-${HEPLIFY_VERSION} \
#    && go mod download
#WORKDIR /go/src/heplify-server-${HEPLIFY_VERSION}/cmd/heplify-server/
#RUN CGO_ENABLED=1 GOOS=linux go build -v -a --ldflags '-linkmode external -extldflags "-static -s -w"' -o /heplify-server .


RUN go get -d -u -v github.com/sipcapture/heplify-server@v0.0.0-20220105121138-4d4a9c1330e5 && \
    cd /go/pkg/mod/github.com/sipcapture/heplify-server@v0.0.0-20220105121138-4d4a9c1330e5/cmd/heplify-server && \
    GO_ENABLED=1 GOOS=linux go build -v -a --ldflags '-linkmode external -extldflags "-static -s -w"' -o /heplify-server .

go get          github.com/sipcapture/heplify-server@v0.0.0-20220105121138-4d4a9c1330e5
go get -u -d -v github.com/sipcapture/heplify-server@0.0.0-20220105121138-4d4a9c1330e5
```


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
















test
go test -v --bench . --benchmem

lint:
https://siderlabs.com/blog/lets-use-go-vet-the-standard-tool-for-analyzing-go-s-source-code-59435ea71059/
https://staticcheck.io/

--------------------------------------------------------------------------------
