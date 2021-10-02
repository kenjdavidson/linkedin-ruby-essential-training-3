# Working With Directories

## Create Directory

Couple of ways to create directories:

- `Dir.mkdir(filepath)`
- `FileUtils.mkdir(filepath)`

With deleting (like OS does not delete non empty):

- `Dir.delete(filepath)`
- `FileUtils.rmdir(filepath)` (or `FileUtils.rm_r(filepath)` to delete recursively)

## Canging Directories

Used primarily as a convenience, but usually just absolute paths are used:

- `File.expand_path(File.dirname(__FILE__))` 

when changing directories relative paths will most likely break (itf not managed properly).

## Entries

Get access to contents of directory with `Dir.entries(filepath)`.

- Files
- Directories
- `.` and `..` entries

Quick way to skip unwanted `.` and `..`:

```
Dir.entries('.').each do |entry|
  next if ['.','..'].include? entry
  puts "#{entry} is a #{File.file?(entry) ? 'file' : 'directory'}"
end 
```

Directory entries are just `String`(s).

## Glob

Returns an array of file names which matches a pattern (primitive version of regular expressions).
Patterns are similar to globs in Unix shell.
Does not include `.` and `..`.
