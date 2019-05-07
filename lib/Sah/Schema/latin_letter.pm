package Sah::Schema::latin_letter;

# DATE
# VERSION

our $schema = [str => {
    summary => 'Latin letter, i.e. A-Z or a-z',
    len => 1,
    match => qr/\A[A-Za-z]\z/,
}, {}];

1;
# ABSTRACT:
