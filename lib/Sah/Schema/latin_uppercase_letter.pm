package Sah::Schema::latin_uppercase_letter;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'A single latin uppercase letter, i.e. A-Z',
    'x.perl.coerce_rules' => ['From_str::to_upper'],
    len => 1,
    match => qr/\A[A-Z]\z/,

    examples => [
        {value=>'', valid=>0},
        {value=>'A', valid=>1},
        {value=>'a', valid=>1, validated_value=>'A'},
        {value=>'ab', valid=>0, summary=>'Multiple letters'},
        {value=>'1', valid=>0, summary=>'Non-letter'},
        {value=>';', valid=>0, summary=>'Non-letter'},
    ],

}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::latin_uppercase_letter>

L<Sah::Schema::lowercase_str>
