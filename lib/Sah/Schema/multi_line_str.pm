package Sah::Schema::multi_line_str;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['str' => {
    summary => 'A multi-line string',
    description => <<'MARKDOWN',

String cannot be empty or just contain a single line of text; it must contain at
least one of either \x0D or \x0A character.

MARKDOWN
    match => qr/\A(?!.*[\x0A\x0D]).*\z/,
    examples => [
        {value=>'', valid=>0},
        {value=>'a', valid=>0},
        {value=>"line1\nline2", valid=>1},
    ],
}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<Sah::Schema::single_line_str>
