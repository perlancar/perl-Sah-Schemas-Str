package Sah::Schema::hexstr;

# DATE
# VERSION

our $schema = [str => {
    summary => 'String of bytes in hexadecimal',
    match => qr/\A(?:[0-9A-Fa-f]{2})*\z/,
}, {}];

1;
# ABSTRACT:
