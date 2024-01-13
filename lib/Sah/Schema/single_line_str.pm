package Sah::Schema::single_line_str;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['str' => {
    summary => 'A single-line string',
    description => <<'MARKDOWN',

The string can be zero-length, but it cannot contain \x0D or \x0A character.

MARKDOWN
    match => qr/\A(?!.*[\x0A\x0D]).*\z/,
    examples => [
        {value=>'', valid=>1},
        {value=>'a', valid=>1},
        {value=>"line1\nline2", valid=>0},
    ],
}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::multi_line_str>
