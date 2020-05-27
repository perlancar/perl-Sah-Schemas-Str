package Sah::Schema::latin_alphanum;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'String containing only zero or more Latin letters/digits, i.e. A-Za-z0-9',
    match => qr/\A[A-Za-z0-9]*\z/,

    examples => [
        {value=>'', valid=>1},
        {value=>'A019', valid=>1},
        {value=>'foo bar', valid=>0},
    ],

}, {}];

1;
# ABSTRACT:
