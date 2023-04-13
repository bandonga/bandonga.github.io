---
title: "Linux: Using Essential Tools"
permalink: /linux/essential/
header:
  teaser: "/assets/images/academy/linux.svg"
  image: "/assets/images/academy/linux.svg"
excerpt: "Notes and resources about Linux"
last_modified_at: 2022-02-07 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:**  Under Construction :construction:

### The Shell

A **Shell** is *command-line* interpreter that provides a user interface. Users input instructions to a computer by entering commands as text for a command line interpreter to execute. The default shell for RHEL is *bash* (Bourne-Again Shell), an improved version of the *sh* (Bourne Shell).

When using a shell interactivelly, it displays a string, warning for a command, the *shell prompt*. When using a regular user, the prompt is the `$` character.
```console
marcelo@bandonga:~ $
```
The `$` is replaced by `#`, if the you are the *superuser*, root, to avoid accidents
```console
root@bandonga:~ #
```
The bash shell also provides a scripting language that can support automation of tasks.

#### The console

The console/terminal is a *system console* internal to the Linux kernel, which receives all kernel messages and warnings and which allows logins in single user mode. It provides a way to send text output to the user, in a display, and to receive text input from the user, through a keyboard.

Historically, a *terminal* was a single keyboard and monitor plugged into a dedicated serial console port on a computer used for direct communication at a low level with the operating system, such as the [VT100](https://en.wikipedia.org/wiki/Computer_terminal). Early user terminals connected to computers were electromechanical teleprinters/teletypewriters (TeleTYpewriter, TTY). As unix/linux systems added better multiprocessing and windowing systems, this terminal concept was abstracted into software.

The Linux kernel supports multiple **virtual consoles**, which act as separate terminals, but which access the same physical keyboard and display and can be accessed simultaneously.
The console (and virtual consoles) are implemented by the VT subsystem of the Linux kernel, and do not rely on any user space software. This is in contrast to a **terminal emulator**, which is a user space process that emulates a terminal, and is typically used in a graphical display environment.
*xterm* is the standard terminal emulator for the *X Window System*. A user can have many different invocations of xterm running at once on the same display, each of which provides independent I/O for the shell.

Generally, there is no reason to leave the default virtual console for graphical installations unless you are attempting to diagnose installation problems. Uusually the first six virtual consoles provide a text terminal with a login prompt to a Unix shell. The graphical X Window System starts in the seventh virtual console.

Of these virtual consoles, the first one is used as the default console. It is commonly known as the virtual console tty1 and it has a corresponding device file in the `/dev/tty1`.
In the graphical environment, you need touse `Ctrl+Alt+Function` key to switch the Virtual Console. To open `/dev/tty2` use `Ctrl+Alt+F2` . To get back to the graphical console, you can use the `Alt+F6`.

For terminal windows that are started from a graphical environment, pseudo terminals are started, referred to using numbers in the /dev/pts directory. The first terminal window that is started from a graphical environment shows as `/dev/pts/1`, the second terminal windows is `/dev/pts/2`, as show using the `tty` command

#### commands
The command entered in the shell have the next parts:
* *command* - the name of the program to run, followed by possible options or arguments
* *options* - behaviour or what the program will do, starting with `-` or `--`.
* *arguments* - the target of the command

Most command have a `--help` or `-h` argument, to display a usage statment:
* `< >` variable data
* ` | ` only one of the itens can be specified
* `...` variable lenght of items
* `[ ]` optional items

The shell makes a difference between three kinds of commands:
* An *alias* is a command that a user can define as needed and are executed before anything else.
It's usually used as way to subsitute long commands, such as `alias ll='ls -l --color=auto'`. You can use the `alias` command to check the alias currently defined.
* An *internal command* is a command that is a part of the shell builtin. It is available when the shell is loaded and can be executed from memory without any lookup from disk.
* An *external command* is a command that exists as an executable file on disk of the computer. The shell first looks to determine whether it is an internal command. If not, looks for an executable file with a matching filename in the list of directories defined by the `$PATH` variable.

To find out the type of command you are using, you can use the `type` command. To find out which exact command the shell will be using, you can use the `which` command.

#### Variables
**Variables** are fixed names that can be assigned dynamic values. Acts as a temporary storage of data in memory, that contains information used for customizing the shell *environment* or application processes.  There are two types of variables: local and environment.

A **local variable** is private to the shell in which it is created and its value cannot be used by processes that are not started in that shell.

To define a variable, the name of the variable is mentioned followed by an equals sign `=`, such as `VAR=hello` and the value that is assigned to the specific variable. To read the value of a variable, a user can use the `echo` command, such as `echo $VAR`, followed by the name of the variable.
To undefine a variable, use the `unset` command.

**Shell Environment** - When you are working from a shell, an environment is created, which  consists of variables that define the user environment, such as the `$PATH`. The value of an environment variable is passed from the current shell to the subshell during the execution of a script. To get an overview of the current variables defined in your shell environment, type the `env` command.

To make a variable an environment variable, use the `export` command.

#### Environment Configuration Files
When a user logs in, an environment is created for that user automatically, depending if it's a *login shell* or a *subshell*.
* A **login shell** is the first shell that is opened for a user after the user has logged in. From the login shell, a user may run scripts, which will start a subshell of that login shell. By default the subshell settings are included when entering a login shell.
* A **subshell** is a non-login separate instance of the shell, that gives you the prompt at the console or in an *xterm* window. Just as your commands are interpreted at the command-line prompt, similarly does a script batch-process a list of commands. Each shell script running is, in effect, a subprocess (child process) of the parent shell.

According to the `man bash` page:
> it first reads and executes commands from the file `/etc/profile`, if that file exists. After reading that file, it looks for `~/.bash_profile`, `~/.bash_login`, and `~/.profile`, in that order, and reads and executes commands from the first one that exists and is readable.

* `/etc/profile`: The generic file that is processed by all users upon login.
* `~/.bash_profile`:User-specific, upon login
* `~/.bashrc`: User-specific file for the subshell, referenced `~/.bash_profile` in RHEL.
* `/etc/bashrc`: This file is processed when subshells are started, referenced by `~/.bashrc` in RHEL.

#### Utilities

**History** - A convenient feature of the bash shell is the bash `history`. When a shell session is closed, the history of that session is updated to the history file, `.bash_history`,in the home directory of the user. The history file is closed only when the shell session is closed, until that moment, all commands in the history are kept in memory.
* Type `!number` to execute a command with a specific number from history.
* Use `Ctrl+R` to  do backward searches in commands that you have previously used. Just type a part of the command you are looking for and use `Ctrl+R` to search further backward.

**Bash Completion** - This feature helps you in finding the command you need, and it also works on variables and filenames. Type the beginning of a command and press the *Tab key* on your computer's keyboard. If there are several options, you need to press the Tab key once more to get an overview of all the available options.

### How to access

To log in from a text console, you need to know which user account you should use.
A user root is always available, but using this account to do your work is often not a good idea; the user root has no limitations to access the system and can therefore do a lot of damage.
After accessing the terminal you can use the commands `su - user` or `sudo -iu user` to switch to another user.


> Altough the recomended to use root commads through `sudo command`, it's more efficient and quicker to switch to root user in the Exam.
You can use the `su -` command to change to root.

#### Access remote systems using ssh

Secure Shell (SSH) is the common method to gain access to other machines over the network, with the traffic encrypted while transmitted.
On the remote server that you want to access, the sshd service must be running,  and it should not be blocked by the firewall.

The ssh command is available on all Linux distributions and *Apple Macintosh*.
In Windows you can login with ssh using *PuTTY* and use *mRemoteNG* (or *Ásbrú Connection Manager* in Linux) to manage multiple machine connections.

The SSH client tries to login with the same user account you are currently logged and at port 22 by default.
To allow the remote host to draw graphical screens on your computer is by adding the `-X` option to the ssh command. The
remaining configuration of ssh is in the file `/etc/ssh/ssh_config`. Commom usage:


```console
ssh user@server
  # main options
  -X # to run graphical tools have the output redirected to the local system
```

When connecting to the remote server a security message was displayed, because has never been contacted before and therefore there is no way . After
connecting to the remote server, a public key fingerprint is stored in the file `~/.ssh/known_hosts`, to verify the identity of the remote server.
The next time you connect to the same server, this fingerprint is checked with the encryption key that was sent over by the remote server to initialize contact. If the fingerprint matches, you will not see this message anymore.


#### Login messages

Bash offers an option to include messages in the `/etc/motd` and the `/etc/issue` files.
* Messages in `/etc/motd` display after a user has successfully logged in to a shell. (Notice that users in a graphical environment do not see its contents after a graphical login.) Using /etc/motd can be a convenient way for system administrators to inform users.
* Another way to send information to users is by using `/etc/issue`. The contents of this file display before the user logs in. This provides an excellent means of specifying specific login instructions to users who are not logged in yet.

#### Key-Based Authentication

The key authentication is an usefull option, that allows automatic login without passoword (usefull is scripts) and can add security, since the user trying to login needs to have the key to login. If SSH is used on the Internet the ssh should not allow password logins.

When authenticating using key pairs, the user generates a hash derived from the private key. This hash is sent to the server, and if on the server it proves to match the public key that is stored on the server, the user is authenticated.
The *private key* is used the authentication credential and must be kept secret. The *public key* must be copied to the target server before the login and is used as verification.

When creating a public/private key pair, you are prompted for a passphrase, if you want maximal security.
To create a key pair, use the `ssh-keygen` command, creating the private key in `~/.ssh/ìd_rsa` and the public in `~/.ssh/ìd_rsa.pub`
The `ssh-copy-id` command is next used to copy the public key over to the target server.

After copying over the public key to the remote host, it will be written to the `~/.ssh/authorized_keys` file on that host.


### Finding Help

The is four main ways to get information in linux, without internet:
* the command help option
* man pages
* info system
* documentation files

The quickest way to get an overview of how to use a command is by running the command with the *help option* `--help` or `-h`, to  display a usage summary.

The *man* command lets you know how a command is used, using `man` followed by command you need info, as the argument.
To find information in man pages, you can search the *mandb* database by using `man -k` or `apropos`, followed by the keyword you want to search for.
You can run the `mandb` command to update the database.

The man pages are categorized in different sections
* 1: Executable programs or shell commands
* 5: File formats and conventions
* 8: System administration commands

Some commands are documented only in the *info system*. If that is the case, the “see also” section of the man page of that command will tell you that "The full documentation is maintained as a Texinfo manual." If that happens, you
can read the Info page using the command `pinfo`.

The is also the *documentation files*, copied to the `/usr/share/doc directory`, for services and larger systems that are a bit more complex.

> To get help on shell *built-in* (internal) commands use `help` command, such as `help export`.

### References
[^1]: man intro page
