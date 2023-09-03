package Sah::Schema::str_or_re_or_code;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [any => {
    summary => 'String, or regex (if string is of the form `/.../`), or coderef (if string is in the form of `sub { ... }`)',
    description => <<'_',

Either string, Regexp object, or coderef is accepted.

If string is of the form of `/.../` or `qr(...)`, then it will be compiled into
a Regexp object. If the regex pattern inside `/.../` or `qr(...)` is invalid,
value will be rejected. Currently, unlike in normal Perl, for the `qr(...)`
form, only parentheses `(` and `)` are allowed as the delimiter. Currently
modifiers `i`, `m`, and `s` after the second `/` are allowed.

If string matches the regex `qr/\Asub\s*\{.*\}\z/s`, then it will be eval'ed
into a coderef. If the code fails to compile, the value will be rejected. Note
that this means you accept arbitrary code from the user to execute! Please make
sure first and foremost that this is acceptable in your case. Currently string
is eval'ed in the `main` package, without `use strict` or `use warnings`.

This schema is handy if you want to accept string or regex or coderef from the
command-line.

_
    of => [
        ['str'],
        ['re'],
        ['code'],
    ],

    prefilters => [
        'Str::maybe_convert_to_re',
        'Str::maybe_eval',
    ],

    examples => [
        {value=>'', valid=>1},
        {value=>'a', valid=>1},
        {value=>{}, valid=>0, summary=>'Not a string'},

        # re
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

        # code
        {value=>'sub {}', valid=>1, code_validate=>sub { ref($_[0]) eq 'CODE' & !defined($_[0]->()) }},
        {value=>'sub{"foo"}', valid=>1, code_validate=>sub { ref($_[0]) eq 'CODE' && $_[0]->() eq 'foo' }},
        {value=>'sub {', valid=>1, summary=>'Becomes a string'},

        {value=>'sub {1=2}', valid=>0, summary=>'Code does not compile'},
    ],

}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::str_or_re>

L<Sah::Schema::str_or_code>

L<Sah::PSchema::re_from_str>

L<Sah::PSchema::code_from_str>

L<Sah::Schema::re_from_str>

L<Sah::Schema::code_from_str>

L<Regexp::From::String>
