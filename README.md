[![Build Status](https://travis-ci.org/adiwg/mdCodes.svg)](https://travis-ci.org/adiwg/mdCodes)
[![Gem Version](https://badge.fury.io/rb/adiwg-mdcodes.svg)](http://badge.fury.io/rb/adiwg-mdcodes)

# Mdcodes

adiwg-mdcodes provides code lists in hash or JSON formats for loading of mdEditor and other metadata
tools that use the adiwg-json-schema.  The code lists include all ISO 19115-2 and ISO 19115-1 codes plus
supplemental codes added NGDC and ADIwg.

## Installation

Add this line to your application's Gemfile:

    gem 'adiwg-mdcodes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install adiwg-mdcodes


## Methods

### getYamlPath
> returns the path to the 'resources' folder containing codelist files in YAML format'.

### getAllCodeistsDetail( returnFormat )
> returns all code lists with all codelist detail
> returnFormat = \[__hash__ | json] (string)

### getCodelistDetail( codeListName, returnFormat )
> returns a single codelist with all code list detail
> codeListName = name of code list to return (string)
> returnFormat = \[ __hash__ | json ] (string)

### getAllStaticCodelists( returnFormat )
> returns all static codelists with only the codelist item names
> returnFormat = \[__hash__ | json] (string)

### getStaticCodelist( codeListName, returnFormat )
> returns a single static codelist with only the codelist item names
> codeListName = name of code list to return (string)
> returnFormat = \[__hash__ | json] (string)


## Contributing

1. Fork it (https://github.com/adiwg/mdCodes/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
