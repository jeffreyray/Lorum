package Lorum::Element::Div;

use Moose;
use MooseX::SemiAffordanceAccessor;
use MooseX::StrictConstructor;
use MooseX::Method::Signatures;

use Cairo;
use Pango;

use Lorum::Types qw(  );
extends 'Lorum::Element::Box';

with 'Lorum::Role::ConstructsElement' => {
    name => 'text',
    class => 'Lorum::Element::Text'
};










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
