package Sah::Schema::percent_str;

use strict;

use Regexp::Pattern::Float;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'A number in percent form',
    match => qr/\A$Regexp::Pattern::Float::RE{float_decimal}{pat}%\z/,

    description => <<'_',

This schema accepts floating number followed by percent sign. Unlike the
`percent` schema from <pm:Sah::Schemas::Float>, The percent sign will not be
removed nor the number be converted to decimal (e.g. 50% to 0.5).

_
    examples => [
        {value=>'', valid=>0, summary=>'No percent sign'},
        {value=>'1', valid=>0, summary=>'No percent sign'},
        {value=>'1%', valid=>1},
        {value=>'1 %', valid=>0, summary=>'Whitespace before percent sign is currently not allowed'},
        {value=>'-1.23%', valid=>1},
        {value=>'%', valid=>0, summary=>'Percent sign only'},
    ],

}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::percent>
