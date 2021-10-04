# Common Data Formats

## CSV

Ruby standard library `require 'csv`' makes the `CSV` class available.

### Reading

```
require 'csv'

CSV.foreach('filename.csv') do |row|
  # use row here
end
```

- Inspect data
- Transform data
- Import data

or read the file completely

```
array_of_arrays = CSV.read('filename.csv')
```

**Loads fully into memory, so be careful**

### Writing

```
require 'csv'

CSV.open('filename.csv','a') do |file|
  file << ['this', 'is', 'some', 'text]
end
```

### CSV to Hashes

Efficiently match up labels to each column in a row.

```
# Lowercase and replace spaces with _
labels = header.map { |item| item.downcase.gsub(/\s/, '_)}
```

then we can use the `zip` method:

- Called on an array
- With another array
- Returns an array of arrays

## YAML

YAML Ain't Markup Language

- `YAML`
- `Psych`

### YAML

Is "an unmaintained library"

### Psych

Psych doesn't actually read the file, that must be done separately.  

#### Reading

Due to YAML files (generally) not being too large, this doesn't  cause memory issues as with larger data related files.

```
require 'psych`

yaml_content = File.read('filename.yml')
data = Psych.load(yaml_content)
```

#### Writing

```
sub_data = data['key1'][0..10]
updated_content = { 'key2': sub_data }
File.write('filename_sublist.yml')
```

## JSON

Ruby standard library `json` can be used.

```
json = File.read('file.json')
data = JSON.parse(json)
```

In order to export we have:

```
# Using generate
json_data = JSON.generate(hash_obj)

# Using to_json
json_data = hash_obj.to_json

File.write('jsonfile.json', json_data)
```

## XML

There are a few Ruby built in libraries:

- `REXML` Old and not overly maintained
- `nokogiri`
- `nori`
- `multi_xml`
- `xml-simple`
