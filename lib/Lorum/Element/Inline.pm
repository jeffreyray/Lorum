package Lorum::Element::Inline;

use Moose;
use MooseX::SemiAffordanceAccessor;
use MooseX::StrictConstructor;
use MooseX::Method::Signatures;

use Lorum::Types qw( MaybeGiDocDoesStamp );
extends 'Lorum::Element';

with 'Lorum::Role::HasCoordinates';
with 'Lorum::Role::HasDimensions';

has 'size_allocation' => (
    is => 'rw',
    isa => 'Maybe[HashRef]',
    default => undef,
    writer => 'set_size_allocation',
);




1;
