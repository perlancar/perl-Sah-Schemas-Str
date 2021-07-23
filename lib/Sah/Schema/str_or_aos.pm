package Sah::Schema::str_or_aos;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [any => {
    summary => 'String or array (0+ length) of (defined) string',
    of => [
        ['str', {}],
        ['aos', {}],
    ],

    examples => [
        {value=>'', valid=>1},
        {value=>'a', valid=>1},
        {value=>{}, valid=>0, summary=>'Not string or array'},
        {value=>[], valid=>1},
        {value=>['a'], valid=>1},
        {value=>['a',undef], valid=>0, summary=>'Has undef element'},
        {value=>['a',[]], valid=>0, summary=>'Has non-string element'},
    ],

}];

1;
# ABSTRACT:
