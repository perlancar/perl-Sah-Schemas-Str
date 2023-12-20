package Sah::Schema::str_or_re;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [any => {
    summary => 'String or regex (if string is of the form `/.../`)',
    description => <<'MARKDOWN',

Either string or Regexp object is accepted.

If string is of the form of `/.../` or `qr(...)`, then it will be compiled into
a Regexp object. If the regex pattern inside `/.../` or `qr(...)` is invalid,
value will be rejected.

Currently, unlike in normal Perl, for the `qr(...)` form, only parentheses `(`
and `)` are allowed as the delimiter.

Currently modifiers `i`, `m`, and `s` after the second `/` are allowed.

What's the difference between this schema and `re_from_str` (from
<pm:Sah::Schemas::Re>)? Both this schema and `re_from_str` accept string, but
this schema will leave strings not in the form of `/.../` or `qr(...)` as-is,
while `re_from_str` will still convert the string to Regexp object (after
escaping the special characters). In other words, this schema can produce
strings while `str_or_re` always produces Regexp object.

MARKDOWN
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
        {value=>'qr(foo', valid=>1, summary=>'Becomes a string'},
        {value=>'qr(foo(', valid=>1, summary=>'Becomes a string'},
        {value=>'qr/foo/', valid=>1, summary=>'Becomes a string'},

        {value=>'/foo.*/', valid=>1, validated_value=>qr/foo.*/},
        {value=>'qr(foo.*)', valid=>1, validated_value=>qr/foo.*/},
        {value=>'/foo/is', valid=>1, validated_value=>qr/foo/is},
        {value=>'qr(foo)is', valid=>1, validated_value=>qr/foo/is},

        {value=>'/foo[/', valid=>0, summary=>'Invalid regex'},
    ],

}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::str_or_re_or_code>

L<Sah::Schema::str_or_code>

L<Sah::PSchema::re_from_str>

L<Regexp::From::String>
