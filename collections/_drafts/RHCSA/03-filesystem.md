---
title: "RHCSA - Red Hat Certified System Administrator Guide"
excerpt: "This certification guide will provide a comprehensive overview of Linux RHEL 7,
covering the EX200 exam topics."
last_modified_at: 2018-01-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:**  Under Construction :construction:


### File System Hierarchy

RHEL 7 uses the Filesystem Hierarchy Standard (FHS), version 7, maintained by the Linux Foundation, as file system structure. It defines the names, locations, and permissions for many file types and directories, but still leaves many areas undefined or extensible.

`/` The root directory. This is where the file system tree starts. Main directories:


* `/boot` - Contains all files and directories that are needed to boot the Linux kernel.
* `/dev` - Files that are used for accessing physical devices.
* `/etc` - Contains configuration files that are specific to the server.
* `/home` - Used for local user home directories for regular users.
* `/root` - The home directory of the root user.
* `/run` - Contains runtime data for process and user specific information that has been created since the last boot, with the process id and lock files.
* `/tmp` - Contains temporary files that may be deleted without any warning during boot.
* `/usr` - Directory that contains subdirectories with program files, shared libraries and static data.
  * `/usr/bin` - User commands, essential during boot and to repair the system.
  * `/usr/sbin` - System administration commands that are not necessarily needed by regular users.
  * `/usr/local` - local costumised software.
  * `/usr/lib, /usr/lib64` - Shared libraries that are used by programs in `/boot`, `/bin` and `/sbin`.
  * `/usr/tmp` - A symbolic lick to `/var/tmp`
* `/var` Directory that contains files which may change in size dynamically, such as log files, mail boxes, and spool files.
  * `/var/tmp` - Anonther temporary directory that can hold files for a longer time, possibly in a different partition, not available in early boot.
  * `/var/run` - A symbolic lick to `/run`.
  * `/var/lock` - A symbolic lick to `/run/lock`.


* `/bin, /sbin` -
* `/lib, /lib64` - Shared libraries that are used by programs in /boot, /bin and /sbin.
* `/media, /mnt` - Directories that are used for mounting devices in the file system tree.
* `/opt` - This directory is used for optional packages that may be installed on your server.
* `/proc` - This directory is used by the proc file system. This is a file system structure that gives access to kernel information.
* `/srv` - Directory that may be used for data that is used by services like NFS, FTP and HTTP .
* `/sys` - Used as an interface to different hardware devices that is managed by the Linux kernel and associated processes.

The file system can have the following content types:
  * *static* - content that is not changed, until it's edited.
  * *dynamic* - variable content, tipically modified by active processes.
  * *presistent* - configurations that remain the same after a reboot.
  * *runtime* - process or system content that is clear during reboot.

> Red Hat Enterprise Linux 7 introduces two major changes to the layout of the file system.
* The /bin, /sbin, /lib and /lib64 directories are now under the /usr directory.
* The /tmp directory can now be used as a temporary file storage system (tmpfs). The /run directory is now used as a temporary file storage system (tmpfs). Applications can now use /run the same way they use the /var/run directory.


[]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_administration_guide/ch-filesystem

### I/O Redirection
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
