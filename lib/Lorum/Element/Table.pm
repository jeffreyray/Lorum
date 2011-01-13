package Lorum::Element::Table;

use Moose;
use MooseX::SemiAffordanceAccessor;
use MooseX::StrictConstructor;
use MooseX::Method::Signatures;

use Cairo;
use Pango;

use Lorum::Types qw(  );
use Lorum::Element::TableRow;
extends 'Lorum::Element::Box';

with 'Lorum::Role::ConstructsElement' => {
    name => 'row',
    class => 'Lorum::Element::TableRow'
};

method append_row ( Lorum::Element::TableRow :$row? ) {
    $row ||= Lorum::Element::TableRow->new;
    $self->append_element( $row );
    return $row;
}




1;



#with 'Lorum::Role::Stamp';

#has 'macro' => (
#    is => 'rw',
#    isa => 'Maybe[CodeRef]',
#    default => sub { },
#);
#
#sub imprint {
#    my ($self, $doc) = @_;    
#    &{$self->macro}(@_);
#}


1;
