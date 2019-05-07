package Sah::Schema::latin_alpha;

# DATE
# VERSION

our $schema = [str => {
    summary => 'String containing only zero or more Latin letters, i.e. A-Z or a-z',
    match => qr/\A[A-Za-z]*\z/,
}, {}];

1;
# ABSTRACT:
