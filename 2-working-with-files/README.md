# Working With Files

## Access Files

A couple of ways to access files:

```
file = File.new(filepath, mode)
# access file
file.close
```

an alternative

```
File.open(filepath, mode) do |file|
  # work with file
end
```

but is automatically closed after (insta `try-with`).

### File Access Modes

`r` - reads from the start (must exist)
`w` - write from the start (truncates existing content)
`a` - append/write from end

Variations with a `+` means do the normal thing, but also allow the other (read/write) option.

## Write to Files

The same `puts` and `print` are available when working with a `File` object, following the same newline rules.

Another option is `write` which does the same thing as `print` (but used in naming conjunction with `read`).

The last option is the `<<` which always ignores the current position of the cursor.

## Read from Files

Files is accessed the same way, but calling the `read` method.  `read` takes an argument for the number of bytes to read from the file.  As we read, the cursor moves through the file that many bytes.

In order to read full lines, the same `gets` is available.

```
file = File.new('groceries.txt','r');
line1 = file.gets.chomp
```

## File Pointer (Cursorish)

**When adding text at the cursor position the content is OVERWRITTEN (not inserted)**

```
irb(main):001:0> file = File.new('groceries.txt','r')
=> #<File:groceries.txt>
irb(main):002:0> file.pos
=> 0
irb(main):003:0> file.pos = 10
=> 10
irb(main):004:0> file.read(3)
=> "st\n"
irb(main):005:0> file.pos
=> 13
irb(main):006:0> file.gets
=> "+ butter\n"
irb(main):007:0> file.pos
=> 22
# Set beyond the end of the file.  Be careful as you can write after the end of the file 
# and some random special characters are written
irb(main):008:0> file.pos = 4000
=> 4000
irb(main):009:0> file.read
=> ""
irb(main):010:0> file.gets
=> nil
irb(main):011:0> file.read(4)
=> nil
irb(main):012:0> file.read
=> ""
irb(main):013:0> file.pos = 0
=> 0
irb(main):014:0> file.gets
=> "Grocery List\n"
irb(main):015:0> file.eof?
=> false
```

## Read or Write Entire File

### Read

Full file reading is available through `File.read(filepath)` which:
- access mode assumed read
- instance not need to be closed

but with caution as this is all read into memory.

### Write

`File.write(filepath, string)` will write the full file, truncating existing file (by default).  To add a file position must be supplied as well.

## Rename, Delete, Copy

`File.rename('oldfile','newfile')`

`File.delete('filename')`

Copying requires the `FileUtils`

```
require 'fileutils'

FileUtils.copy('oldfile','newfile')
```

## Examine File Details

A large number of methods for dealing with files, some special are:

`File.mtime` - last modified time
`File.atime` - last accessed time
`File.ctime` - last status change time (last time read, written or permissions change)