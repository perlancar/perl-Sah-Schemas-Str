package Sah::Schema::latin_alpha;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'String containing only zero or more Latin letters, i.e. A-Z or a-z',
    match => qr/\A[A-Za-z]*\z/,

    examples => [
        {value=>'', valid=>1},
        {value=>'Abz', valid=>1},
        {value=>'foo123', valid=>0},
    ],

}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::latin_letter>

L<Sah::Schema::latin_uppercase_alpha>

L<Sah::Schema::latin_lowercase_alpha>
