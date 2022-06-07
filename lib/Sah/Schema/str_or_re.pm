package Sah::Schema::str_or_re;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [any => {
    summary => 'String or regex (if string is of the form `/.../`)',
    description => <<'_',

Either string or Regexp object is accepted.

If string is of the form of `/.../`, then it will be compiled into a Regexp
object. Currently modifiers `i`, `m`, and `s` after the second `/` are allowed.
If the regex pattern inside `/.../` is invalid, value will be rejected.

_
    of => [
        ['str'],
        ['re'],
    ],

    prefilters => ['Str::maybe_convert_to_re'],

    examples => [
        {value=>'', valid=>1},
        {value=>'a', valid=>1},
        {value=>{}, valid=>0, summary=>'Not a string'},

        {value=>'//', valid=>1, validated_value=>qr//},
        {value=>'/foo', valid=>1, summary=>'Becomes a string'},
        {value=>'/foo.*/', valid=>1, validated_value=>qr/foo.*/},
        {value=>'/foo/is', valid=>1, validated_value=>qr/foo/is},
        {value=>'/foo[/', valid=>0, summary=>'Invalid regex'},
    ],

}];

1;
# ABSTRACT:
