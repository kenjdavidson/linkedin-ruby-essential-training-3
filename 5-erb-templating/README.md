# ERB Templating

Embedded ruby is part of standard library

## Embed Ruby

When embedding ruby we use `require 'erb'`:

- `<% code %>` evaluate only
- `<%= code %>` evaluate and output at location

## Binding

Based on the idea that every Ruby object stores it's instance variables in a `Binding` object.   This can be accessed with `#binding` which can then be passed into an ERB to give the template access. 

**This only works with instance variables, not class or local**

```
irb(main):001:0> @test = 'hello'
=> "hello"
irb(main):002:0> binding
=> #<Binding:0x000055f56eb24148>
irb(main):003:0> eval('@test',binding)
=> "hello"
```

## Template Files

Combining `File.read(filepath)` with `ERB.new(contents)`.

Convention is usually to `filename.fileext.erb`:

- name
- wanted extension
- erb
