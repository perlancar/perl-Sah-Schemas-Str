package Sah::Schema::latin_lowercase_alpha;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'String containing only zero or more lowercases Latin letters, i.e. a-z',
    'x.perl.coerce_rules' => ['From_str::to_lower'],
    match => qr/\A[a-z]*\z/,

    description => <<'_',

Uppercase letters will be coerced to lowercase.

_
    examples => [
        {value=>'', valid=>1},
        {value=>'Abz', valid=>1, validated_value=>'abz'},
        {value=>'foo123', valid=>0, summary=>'Contains numbers'},
    ],

}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::latin_alpha>

L<Sah::Schema::latin_uppercase_alpha>

L<Sah::Schema::uppercase_str>
