
#  Tutorial: Getting info about commands in BASH

Short practical tutorial about 
- how to find commands;
- basic info about them;
- determine whether they are bash built-ins or binary executable;
- where are they located
 
---
## Table of Contents
- [Tutorial: Getting info about commands in BASH](#tutorial-getting-info-about-commands-in-bash)
  - [Table of Contents](#table-of-contents)
  - [1. Finding commands with key words](#1-finding-commands-with-key-words)
    - [`apropos <keyword>`](#apropos-keyword)
  - [2. Getting basic info about a command or system files](#2-getting-basic-info-about-a-command-or-system-files)
    - [`man [section] <command|file-path>`](#man-section-commandfile-path)
    - [`whatis <command>`](#whatis-command)
  - [3. Determining Type Binary: vs Shell-built-in vs alias](#3-determining-type-binary-vs-shell-built-in-vs-alias)
    - [`type <command>`](#type-command)
    - [`file <path>`](#file-path)
  - [4. Finding a file path to command](#4-finding-a-file-path-to-command)
    - [`type`](#type)
    - [`which <file_path>`](#which-file_path)


---
## 1. Finding commands with key words

### `apropos <keyword>`
'apropos' this command is searching all man pages in commands description, return a list of commands with their short description
***example
```bash
$ apropos sudo
    cvtsudoers (1)       - convert between sudoers file formats
    sssd-sudo (5)        - Configuring sudo with the SSSD back end
    sudo (8)             - execute a command as another user
```
:exclamation: `apropos` uses information from man DB, so it is useful to refresh it manually with `$ sudo mandb`

## 2. Getting basic info about a command or system files

### `man [section] <command|file-path>`

There are 9 section in manual:
  1.   Executable programs or shell commands
  2.   System calls (functions provided by the kernel)
  3.   Library calls (functions within program libraries)
  4.   Special files (usually found in /dev)
  5.   File formats and conventions, e.g. /etc/passwd
  6.   Games
  7.   Miscellaneous  (including  macro  packages  and  conventions), e.g. man(7), groff(7), man-pages(7)
  8.   System administration commands (usually only for root)
  9.   Kernel routines [Non standard]

:exclamation: The command **man** can be almost every time replaced by `<command> --help | -h`.
:exclamation: You can manually refresh man DB with `$ sudo mandb`.

### `whatis <command>`
Displays very short one line description of the command.


## 3. Determining Type Binary: vs Shell-built-in vs alias
### `type <command>`

**Binary** - returns path if the command is external binary/
```bash
$ type whatis
whatis is /usr/bin/whatis
```
**Shell Built-in** returns **`<command_name> is a shell builtin`**
```bash
$ type cd
cd is a shell builtin
```
**Alias** returns **`<command_name> is aliased to <output>`**
```bash
$ type ls
ls is aliased to `ls --color=auto'
```

### `file <path>`
`file` shows the actual nature of the file

```bash
file $(which whatis)
/usr/bin/whatis: ELF 64-bit LSB pie executable, x86-64 ...
```
## 4. Finding a file path to command

### [`type`](#type-command)
### [`which <file_path>`]()
Return a file path to a command, if this command is an executable.