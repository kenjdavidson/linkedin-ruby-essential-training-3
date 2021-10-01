# The File System

## Input/Output Basics

`IO` class is the basis for all input and output in Ruby - [https://ruby-doc.org/core-2.7.1/IO.html](https://ruby-doc.org/core-2.7.1/IO.html).

## File System Basics

When working with files and directories:

```
File.join('shared','lib','myfile.rb')
```

Will work like Java `Paths.from()` to use the correct file separator based on the current OS.  There is absolutely no testing or checking of validate files or directories, it's just creating the `String` path.

## Types of File Paths

Types of paths:

- Absolute
- Relative

The current file path is available with `__FILE__`, although if working with or looking for other files:

- `File.dirname(__FILE__)` gets the relative path of the file to the execution directory
- `File.expand_path(File.dirname(__FILE__))` which provides the absolute path.
- `__dir__` is the shortcut to absolute path of the current file.

## File Permissions

### Unix

- `chown` change owner
- `chmod` change permissions

Permissions are `rwxrwxrwx` in read, write, execute for:

- Yourself
- Group
- Everyone


### Windows

File permissions cannot be modified by Ruby as it requires the Windows Security Tab