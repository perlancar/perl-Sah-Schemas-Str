package Sah::Schema::lowercase_str;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'String containing only zero or more lowercase letters',
    'x.perl.coerce_rules' => ['From_str::to_lower'],
    description => <<'_',

Uppercase letters will be coerced to lowercase.

_
    examples => [
        {value=>'', valid=>1},
        {value=>[], valid=>0, summary=>'Not a string'},
        {value=>'12_3', valid=>1},
        {value=>'AAbz', valid=>1, validated_value=>'aabz'},
    ],

}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::uppercase_str>

L<Sah::Schema::latin_lowercase_alpha>

L<Sah::Schema::latin_lowercase_letter>
