package Sah::Schema::str1;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'A non-empty string (length >= 1)',
    min_len => 1,

    examples => [
        {value=>'', valid=>0, summary=>'Empty'},
        {value=>'a', valid=>1},
        {value=>[], valid=>0, summary=>'Not a string'},
    ],

}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::non_empty_str>
