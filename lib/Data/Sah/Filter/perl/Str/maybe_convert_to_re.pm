package Data::Sah::Filter::perl::Str::maybe_convert_to_re;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

sub meta {
    +{
        v => 1,
        summary => 'Convert string to regex if delimited by /.../ or qr(...)',
        might_fail => 1,
        args => {
            # XXX delimiter
            # XXX allowed modifiers
        },
    };
}

sub filter {
    my %fargs = @_;

    my $dt = $fargs{data_term};
    my $gen_args = $fargs{args} // {};

    my $res = {};
    $res->{expr_filter} = join(
        "",
        "do {",
        "    my \$tmp = $dt; ",
        "    if (\$tmp =~ m!\\A(?:/.*/|qr\\(.*\\))(?:[ims]*)\\z!s) { my \$re = eval(substr(\$tmp, 0, 2) eq 'qr' ? \$tmp : \"qr\$tmp\"); if (\$@) { [\"Invalid regex: \$@\", \$tmp] } else { [undef, \$re] } } ",
        "    else { [undef, \$tmp] } ",
        "}",
    );

    $res;
}

1;
# ABSTRACT: Convert string to regex if string is delimited by /.../ or qr(...)

=for Pod::Coverage ^(meta|filter)$

=head1 DESCRIPTION

Currently for the C<qr(...)> form, unlike in normal Perl, only parentheses C<(>
and C<)> are allowed as the delimiter.

Currently regex modifiers C<i>, C<m>, and C<s> are allowed at the end.
