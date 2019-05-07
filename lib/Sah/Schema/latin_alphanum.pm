package Sah::Schema::latin_alphanum;

# DATE
# VERSION

our $schema = [str => {
    summary => 'String containing only zero or more Latin letters/digits, i.e. A-Za-z0-9',
    match => qr/\A[A-Za-z0-9]*\z/,
}, {}];

1;
# ABSTRACT:
