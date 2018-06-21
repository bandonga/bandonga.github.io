---
title: "2 - Using Essential Tools"
excerpt: "This certification guide will provide a comprehensive overview of Red Hat Enterprise Linux, RHEL 7,
covering the EX200 exam topics, in order to be a RHCSA - Red Hat Certified System Administrator Guide."
last_modified_at: 2018-01-02 21:28:04 +00:00
toc: true
---

## RHCSA Objectives
* Access a shell prompt and issue commands with correct syntax
* Use input-output redirection `(>, >>, |, 2>, etc.)`
* Use grep and regular expressions to analyse texta
* Access remote systems using ssh
* Log in and switch users in multiuser targets

* Archive, compress, unpack, and uncompress files using tar, star, * gzip, and bzip2

* Create and edit text files
* Create, delete, copy, and move files and directories

* Create hard and soft links
* List, set, and change standard ugo/rwx permissions
*
* Locate, read, and use system documentation including man, info, and files in `/usr/share/doc`


## Seccions

### Accessing the command Line using the local console

* Access a shell prompt and issue commands with correct syntax

#### The Shell

A **Shell** is *command-line* interpreter that provides a user interface. Users input instructions to a computerr by entering commands as text for a command line interpreter to execute. The default shell for RHEL is *bash* (Bourne-Again Shell), an inproved version of the *sh* (Bourne Shell).

When using a shell interactivelly, it displays a string, warning for a command, the *shell prompt*. When using a regular user, the prompt is the `$` character.
```console
marcelo@mo:~$
```
The `$` is replaced by `#`, if the you are the *superuser*, root, to avoid accidents
```console
root@mo:~#
```
The bash shell also provides a scripting language that can support automation of tasks.


<<<<<<< HEAD
### The console
=======
#### Virtual console

A *terminal* provides input through a keyboard and output is a display, that can be the machine's physical console.
the physical console supports multiple virtual consoles, which act as separate terminals.
>>>>>>> da46ba4b0d7ca1f2d1f3430a9b5b9aaa638d87ba

The console/terminal is a *system console* internal to the Linux kernel, which receives all kernel messages and warnings and which allows logins in single user mode.
The console provides a way to send text output to the user, in a display, and to receive text input from the user, through a keyboard.

The Linux kernel supports *virtual consoles*, which act as separate terminals, but which access the same physical keyboard and display.
The console (and virtual consoles) are implemented by the VT subsystem of the Linux kernel, and do not rely on any user space software. This is in contrast to a *terminal emulator*, which is a user space process that emulates a terminal, and is typically used in a graphical display environment.

### Shell Basics

The command is the name of the program to run, followed by possible options or arguments:



#### commands
The shell makes a difference between three kinds of commands:
* An *alias* is a command that a user can define as needed and are executed before anything else.
It's usually used as way to subsitute long commands, such as `alias ll='ls -l --color=auto'`. You can use the `alias` command to check the alias currently defined.
* An *internal command* is a command that is a part of the shell itself. It is available when the shell is loaded and can be executed from memory without any lookup from disk.
* An *external command* is a command that exists as an executable file on disk of the computer. The shell first looks to determine whether it is an internal command. If not, looks for an executable file with a matching filename in the list of directories defined by the `$PATH` variable.

To find out the type of command you are using, you can use the `type` command and to find out which exact command the shell will be using, you can use the`which` command.




* Access remote systems using ssh

### I/O Redirection



-----

> Historically, a terminal was a single keyboard and monitor plugged into a dedicated serial console port on a computer used for direct communication at a low level with the operating system. Early user terminals connected to computers were electromechanical teleprinters/teletypewriters (TeleTYpewriter, TTY). As unix/linux systems added better multiprocessing and windowing systems, this terminal concept was abstracted into software.

A virtual console is a shell prompt in a non-graphical environment, accessed from the physical machine, not remotely. Multiple virtual consoles can be accessed simultaneously.

Generally, there is no reason to leave the default console (virtual console #6) for graphical installations unless you are attempting to diagnose installation problems.

---

Logging In to a Local Console
Roughly, there are two ways to make yourself known to a Linux server. Sometimes
you just sit behind the Linux console and interactively log in from the login prompt
that is presented. In other cases, a remote connection is established. The second part
of this chapter is about logging in from a remote session; in this part, you learn how
to work from a local console.
If a Linux server boots with a graphical environment (the so-called graphical target),
you see a login prompt on which a user name and password can be entered. Many
Linux servers do not use a graphical environment at all, though, and are just pre-
senting a text-based console, as shown in Figure 5.1 .


xterm


--------------------------------------------------------------------------------

##

### Laboratory

* [1.1 lab - Initial Setup](/RHCSA/02.01-essencial-lab/)

### Pratice

* [1.1 lab - Initial Setup](/RHCSA/02.01-essencial-ex/)
