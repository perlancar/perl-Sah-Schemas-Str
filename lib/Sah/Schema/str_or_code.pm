package Sah::Schema::str_or_code;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [any => {
    summary => 'String or coderef (if string is of the form `sub {...}`)',
    description => <<'MARKDOWN',

Either string or coderef is accepted.

If string matches the regex `qr/\Asub\s*\{.*\}\z/s`, then it will be eval'ed
into a coderef. If the code fails to compile, the value will be rejected. Note
that this means you accept arbitrary code from the user to execute! Please make
sure first and foremost that this is acceptable in your case.

Currently string is eval'ed in the `main` package, without `use strict` or `use
warnings`.

This schema is handy if you want to accept string or coderef from the
command-line.

What's the difference between this schema and `code_from_str` (from
<pm:Sah::Schemas::Code>)? Both this schema and `code_from_str` accept string,
but `code_from_str` will directly compile any input string while this schema
will only convert string to code if it is in the form of `sub { ... }`. In other
words, this schema can output either string or coderef, while `code_from_str`
will always produce coderef.

MARKDOWN
    of => [
        ['str'],
        ['code'],
    ],

    prefilters => ['Str::maybe_eval'],

    examples => [
        {value=>'', valid=>1},
        {value=>'a', valid=>1},
        {value=>{}, valid=>0, summary=>'Not a string'},

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

L<Sah::Schema::str_or_re_or_code>

L<Sah::Schema::code_from_str>
