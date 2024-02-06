package Sah::Schema::str_or_aos1::arrayified;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [aos => {
    summary => 'String or array (1+ length) of (defined) string, converted to aos',
    min_len => 1,
    prefilters => [ 'Array::arrayify' ],

    examples => [
        {value=>'', valid=>1, validated_value=>['']},
        {value=>'a', valid=>1, validated_value=>['a']},
        {value=>{}, valid=>0, summary=>'Not string or array'},
        {value=>[], valid=>0, summary=>'Too short'},
        {value=>['a'], valid=>1},
        {value=>['a',undef], valid=>0, summary=>'Has undef element'},
        {value=>['a',[]], valid=>0, summary=>'Has non-string element'},
    ],

}];

1;
# ABSTRACT:
