package Sah::Schema::hexstr;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'String of bytes in hexadecimal',
    match => qr/\A(?:[0-9A-Fa-f]{2})*\z/,

    examples => [
        {value=>'', valid=>1},
        {value=>'a0', valid=>1},
        {value=>'a0f', valid=>0, summary=>'Odd number of digits (3)'},
        {value=>'a0ff', valid=>1},
        {value=>'a0fg', valid=>0, summary=>'Invalid hexdigit (g)'},
        {value=>'a0ff12345678', valid=>1},
    ],

}];

1;
# ABSTRACT:
