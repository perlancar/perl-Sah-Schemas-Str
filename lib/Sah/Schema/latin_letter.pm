package Sah::Schema::latin_letter;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'Latin letter, i.e. A-Z or a-z',
    len => 1,
    match => qr/\A[A-Za-z]\z/,

    examples => [
        {value=>'', valid=>0},
        {value=>'A', valid=>1},
        {value=>'AB', valid=>0, summary=>'Multiple letters'},
        {value=>'1', valid=>0, summary=>'Non-letter'},
        {value=>';', valid=>0, summary=>'Non-letter'},
    ],

}];

1;
# ABSTRACT:
