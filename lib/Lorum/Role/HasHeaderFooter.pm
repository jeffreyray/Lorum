package Lorum::Role::HasHeaderFooter;
use Moose::Role;

use Lorum::Types qw( MaybeGiDocDoesStamp );

has 'header' => (
    is => 'rw',
    isa => 'Maybe[Lorum::Element::Box]',
    default => undef,
);

has 'header_margin' => (
    is => 'rw',
    isa => 'Num',
    default => 0,
);

has 'footer' => (
    is => 'rw',
    isa => 'Maybe[Lorum::Element::Box]',
    default => undef,
);

has 'footer_margin' => (
    is => 'rw',
    isa => 'Num',
    default => 0,
);



1;
