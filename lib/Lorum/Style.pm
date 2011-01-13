package Lorum::Style;
use Moose;
use MooseX::SemiAffordanceAccessor;
use MooseX::StrictConstructor;
use MooseX::Method::Signatures;

use Lorum::Meta::Attribute::Trait::Inherit;
use Lorum::Style::Util qw( parse_style );

with 'MooseX::Clone';
with 'Lorum::Role::Style::HasBorders';
with 'Lorum::Role::Style::HasDimensions';
with 'Lorum::Role::Style::HasMargin';
with 'Lorum::Role::Style::HasPadding';
with 'Lorum::Role::Style::HasText';

use Pango;
use Lorum::Types qw( GiDocElement GiDocStyle GiDocStyleVerticalAlign );

has 'color' => (
    is => 'rw',
    traits  => [qw/Inherit/],
);

has 'vertical_align' => (
    is => 'rw',
    isa => GiDocStyleVerticalAlign,
);

around BUILDARGS => sub {
    my $orig  = shift;
    my $class = shift;

    # if a single argument, then we are parsing a style string
    if ( @_ == 1 && !ref $_[0] ) {
        return $class->$orig( %{parse_style $_[0]} );
    }
    else {
        return $class->$orig(@_);
    }
};


method parse ( Str $input ) {
    my $parsed = parse_style $input;
    
    my $style = Lorum::Style->new( %{$parsed} );
    $self->merge( $style );
}

method merge ( GiDocStyle $style ) {

    for my $att ( map { $self->meta->get_attribute( $_ ) } $self->meta->get_attribute_list ) {
        my $newvalue = $att->get_value( $style );
        
        if ( defined $newvalue ) {
            $att->set_value( $self, $newvalue );
        }
        
    }
    return $self;
}

1;
