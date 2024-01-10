package Sah::Schema::matcher::str;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [any => {
    summary => 'Something that can be matched against string',
    description => <<'MARKDOWN',

Currently these things are allowed:
- another string
- regexp (Regexp object)
- array of strings
- coderef

MARKDOWN
    of => [
        'str*',
        'obj::re*',
        'aos*',
        'code*',
    ],
    examples => [
        {value=>'foo', valid=>1},
        {value=>['foo', 'bar', 'baz'], valid=>1},
        {value=>[qr/foo/], valid=>0, summary=>'Currently only array of strings are allowed'},
        {value=>qr/foo/, valid=>1},
        {value=>'foo', valid=>1},
        {value=>'foo', valid=>1},
    ],

}];

1;
# ABSTRACT:
