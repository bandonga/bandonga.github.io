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

### The console

The console/terminal is a *system console* internal to the Linux kernel, which receives all kernel messages and warnings and which allows logins in single user mode. It provides a way to send text output to the user, in a display, and to receive text input from the user, through a keyboard.

Historically, a *terminal* was a single keyboard and monitor plugged into a dedicated serial console port on a computer used for direct communication at a low level with the operating system, such as the [VT100](https://en.wikipedia.org/wiki/Computer_terminal). Early user terminals connected to computers were electromechanical teleprinters/teletypewriters (TeleTYpewriter, TTY). As unix/linux systems added better multiprocessing and windowing systems, this terminal concept was abstracted into software.

The Linux kernel supports multiple *virtual consoles*, which act as separate terminals, but which access the same physical keyboard and display and can be accessed simultaneously.
The console (and virtual consoles) are implemented by the VT subsystem of the Linux kernel, and do not rely on any user space software. This is in contrast to a *terminal emulator*, which is a user space process that emulates a terminal, and is typically used in a graphical display environment.

Generally, there is no reason to leave the default virtual console for graphical installations unless you are attempting to diagnose installation problems. Uusually the first six virtual consoles provide a text terminal with a login prompt to a Unix shell. The graphical X Window System starts in the seventh virtual console.

Of these virtual consoles, the first one is used as the default console. It is commonly known as the virtual console tty1 and it has a corresponding device file in the `/dev/tty1`.
In the graphical environment, you need touse `Ctrl+Alt+Function` key to switch the Virtual Console. To open `/dev/tty2` use `Ctrl+Alt+F2` . To get back to the graphical console, you can use the `Alt+F6`.

For terminal windows that are started from a graphical environment, pseudo terminals are started, referred to using numbers in the /dev/pts directory. The first terminal window that is started from a graphical environment shows as /dev/pts/1, the second terminal windows is /dev/pts/2, as show using the `tty` command

### Shell Basics

The command entered in the shell have the next parts:
* *command* - the name of the program to run, followed by possible options or arguments
* *options* - behaviour or what the program will do, starting with `-` or `--`.
* *arguments* - the target of the command

Most command have a `--help` or `-h` argument, to display a usage statment:
* `< >` variable data
* ` | ` only one of the itens can be specified
* `...` variable lenght of items
* `[ ]` optional items


#### commands
The shell makes a difference between three kinds of commands:
* An *alias* is a command that a user can define as needed and are executed before anything else.
It's usually used as way to subsitute long commands, such as `alias ll='ls -l --color=auto'`. You can use the `alias` command to check the alias currently defined.
* An *internal command* is a command that is a part of the shell itself. It is available when the shell is loaded and can be executed from memory without any lookup from disk.
* An *external command* is a command that exists as an executable file on disk of the computer. The shell first looks to determine whether it is an internal command. If not, looks for an executable file with a matching filename in the list of directories defined by the `$PATH` variable.

To find out the type of command you are using, you can use the `type` command and to find out which exact command the shell will be using, you can use the`which` command.

**Shell Environment** - When you are working from a shell, an environment is created, which  consists of variables that define the user environment, such as the `$PATH`. **Variables** are fixed names that can be assigned dynamic values. To get an overview of the current variables defined in your shell environment, type the `env` command.

To define a variable, the name of the variable is mentioned followed by an equals sign `=` and the value that is assigned to the specific variable. To read the value of a variable, a user can use the `echo` command, followed by the name of the variable.

**Environment Configuration Files**
When a user logs in, an environment is created for that user automatically. This happens based on


four different files where some script code can be specified and where variables can be defined for use by one specific user:
* `/etc/profile`: This is the generic file that is processed by all users upon login.
* `/etc/bashrc`: This file is processed when subshells are started.
* `~/.bash_profile`: In this file, user-specific login shell variables can be defined.
* `~/.bashrc`: In this user-specific file, subshell variables can be defined.

As you have seen, in these files a difference is made between a login shell and a subshell.

A **login shell** is the first shell that is opened for a user after the user has logged in. From the login shell, a user may run scripts, which will start a subshell of that login shell. Bash allows for the creation of a different environment in the login shell and in the subshell but to synchronize settings; by default the subshell settings are included when entering a login shell.

A **subshell** is a separate instance of the command processor -- the shell that gives you the prompt at the console or in an xterm window. Just as your commands are interpreted at the command-line prompt, similarly does a script batch-process a list of commands. Each shell script running is, in effect, a subprocess (child process) of the parent shell.

In computing, **xterm** is the standard terminal emulator for the X Window System. A user can have many different invocations of xterm running at once on the same display, each of which provides independent input/output for the process running in it (normally the process is a Unix shell).



https://askubuntu.com/questions/463462/sequence-of-scripts-sourced-upon-login

Another way to send information to users is by using /etc/issue. The contents of this
file display before the user logs in. This provides an excellent means of specifying
specific login instructions to users who are not logged in yet.



### How to access

To log in from a text console, you need to know which user account you should use.
A user root is always available, but using this account to do your work is often not a good idea; the user root has no limitations to access the system and can therefore do a lot of damage.

> Altough the recomended to use root commads through `sudo command`, it's more efficient and quicker to switch to root user in the Exam.
You can use the `su -` command to change to root.


### Access remote systems using ssh

* Access remote systems using ssh

#### I/O Redirection
When a command is executed it shows its results on the monitor, the standard output, which is also referred to as the `STDOUT`. The shell also has default destinations to send error messages to and to accept input:

Name   | Default interface | File Descriptor
-------|-------------------|----------------
STDIN  | keyboard          | 0
STDOUT | monitor           | 1
STDERR | monitor           | 2

The programs started from the command line have don't know they are reading from or writing to. They just read from channel, file descriptor 0, if they want to read from standard input, and they write to file descriptor 1 to display output and to file descriptor 2 if they have error messages to be output.

If you use redirection symbols, the shell connects the file descriptors to files or other commands.
Most common redirectors in the bash shell:

Redirector    | Explanation
--------------|------------
`< (or 0<)`   | Redirects STDIN.
`>  (or 1>)`  | Redirects STDOUT. If redirection is to a file, the current contents of that file are overwritten.
`>> (or 1>>)` | Redirects STDOUT. If output is written to a file, the output is appended to that file.
`2>`          | Redirects STDERR.
`2>&1`        | Redirects STDERR to the same destination as STDOUT.

In I/O redirection, files can be used to replace the default. You can also redirect to device files, that is used to access specific hardware. Most common device files:

device files   | Explanation
---------------|------------
`/dev/sda`     | hard disk
`/dev/console` | the console of your server
`/dev/null`    | discard a commands output

A **pipe** `|` can be used to catch the output of one command and use that as input for a second command. If a user runs the command ls , for instance, the output

#### Utilities

**History** - A convenient feature of the bash shell is the bash `history`. When a shell session is closed, the history of that session is updated to the history file, `.bash_history`,in the home directory of the user. The history file is closed only when the shell session is closed, until that moment, all commands in the history are kept in memory.
* Type `!number` to execute a command with a specific number from history.
* Use `Ctrl+R` to  do backward searches in commands that you have previously used. Just type a part of the command you are looking for and use `Ctrl+R` to search further backward.

**Bash Completion** - This feature helps you in finding the command you need, and it also works on variables and filenames. Type the beginning of a command and press the *Tab key* on your computer's keyboard. If there are several options, you need to press the Tab key once more to get an overview of all the available options.



45
#### Login messages

Bash offers an option to include messages in the /etc/motd and the /etc/issue files. Messages in /etc/motd display after a user has successfully logged in to a shell. (Notice that users in a graphical environment do not see its contents after a graphical login.) Using /etc/motd can be a convenient way for system administrators to inform users.


**Rebooting** - When a server is rebooted, all processes that are running need to shut down properly, using the `reboot` command.

> Rebooting a Linux server is an important task on the RHCSA as well as on the RHCE exam. Everything you have configured should still be working after the server has rebooted. So, make sure that you reboot at least once during the exam, but also after making critical modifications to the server configuration.


111
-----

### Finding Help



xterm




--------------------------------------------------------------------------------

##

### Laboratory

* [1.1 lab - Initial Setup](/RHCSA/02.01-essencial-lab/)

### Pratice

* [1.1 lab - Initial Setup](/RHCSA/02.01-essencial-ex/)

### References
[^1]: man intro page
