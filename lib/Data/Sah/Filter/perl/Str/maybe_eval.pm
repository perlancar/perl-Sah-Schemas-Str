package Data::Sah::Filter::perl::Str::maybe_eval;

use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

sub meta {
    +{
        v => 1,
        summary => "Eval string if in the form of 'sub { ... }'",
        might_fail => 1,
        args => {
            # XXX namespace
            # XXX use strict?
            # XXX use warnings?
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
        "do {", (
            "my \$tmp = $dt; ",
            "if (ref(\$tmp) || \$tmp !~ qr/\\Asub\\s*\\{.*\\}\\z/s) { ", (
                "[undef, \$tmp] "), # pass through
            "} else { ", (
                "my \$code = eval qq(package main; \$tmp); if (\$@) { [\"Error in compiling code: \$@\", \$tmp] } else { [undef, \$code] } ",
                "}"),
        ),
        "}",
    );

    $res;
}

1;
# ABSTRACT: Eval string if in the form of 'sub { ... }'

=for Pod::Coverage ^(meta|filter)$

=head1 DESCRIPTION

By default, code is compiled in the C<main> package, without C<use strict> or
C<use warnings>.
