package Sah::Schema::str_or_aos1;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [any => {
    summary => 'String or array (1+ length) of (defined) string',
    of => [
        ['str', {}],
        ['aos', {min_len=>1}],
    ],

    examples => [
        {value=>'', valid=>1},
        {value=>'a', valid=>1},
        {value=>{}, valid=>0, summary=>'Not string or array'},
        {value=>[], valid=>0, summary=>'Empty array'},
        {value=>['a'], valid=>1},
        {value=>['a',undef], valid=>0, summary=>'Has undef element'},
        {value=>['a',[]], valid=>0, summary=>'Has non-string element'},
    ],

}];

1;
# ABSTRACT:
