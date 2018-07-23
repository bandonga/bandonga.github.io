---
title: "RHCSA - Red Hat Certified System Administrator Guide"
excerpt: "This certification guide will provide a comprehensive overview of Linux RHEL 7,
covering the EX200 exam topics."
last_modified_at: 2018-01-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:**  Under Construction :construction:

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
