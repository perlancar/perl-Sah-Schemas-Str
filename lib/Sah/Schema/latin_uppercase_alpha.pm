package Sah::Schema::latin_uppercase_alpha;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'String containing only zero or more uppercase Latin letters, i.e. A-Z',
    'x.perl.coerce_rules' => ['From_str::to_upper'],
    match => qr/\A[A-Z]*\z/,

    description => <<'_',

Uppercase letters will be coerced to lowercase.

_
    examples => [
        {value=>'', valid=>1},
        {value=>'Abz', valid=>1, validated_value=>'ABZ'},
        {value=>'foo123', valid=>0, summary=>'Contains numbers'},
    ],

}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::latin_alpha>

L<Sah::Schema::latin_lowercase_alpha>

L<Sah::Schema::lowercase_str>
