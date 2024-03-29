---
title: "Rust: Projects"
permalink: /rust/projects/
excerpt: "Notes and resources about rust."
header:
  image: "/assets/images/academy/rust.svg"
last_modified_at: 2023-06-29 00:00:00 +00:00
toc: true
---

## Projects

### cargo


Cargo is Rust's build system and package manager, used to manage their Rust projects, such as building your code, downloading the libraries your code depends on, and building those libraries.
Cargo comes installed with Rust if you used the official installers.

```console
$ cargo --version
```

### New project

```console
$ cargo new hello_world
$ cd hello_world
```

Cargo has generated two files and one directory for us:
* a `Cargo.toml` file
* a `src` directory with a `main.rs` file inside.
* initialized a new Git repository along with a `.gitignore` file.

```ini
[package]
name = "hello_world"
version = "0.1.0"
edition = "2021"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
```

* `[package]` is a section heading that indicates that the following statements are configuring a package.
* `[dependencies]` is the start of a section for you to list any of your project’s dependencies. In Rust, packages of code are referred to as crates.

## Building and Running a Cargo Project

```console
## build executable
$ cargo build
## creates an executable file in target/debug/hello_world
## creates Cargo.lock to track of the exact versions of dependencies
$ ./target/debug/hello_world
Hello, world!
## or build and run it
$ cargo run
Hello, world!
```

* `cargo check` can be used to check your code to make sure it compiles but doesn’t produce an executable.
* `cargo build --release` is used when the code is ready for release, to compile it with optimizations, creating an executable in `target/release` instead of `target/debug`.
