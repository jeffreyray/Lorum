package Lorum::Role::HasStyle;
use Moose::Role;
use MooseX::Clone;

use Lorum::Types qw( GiDocStyle );
use Lorum::Style;

has 'style' => (
    is => 'rw',
    isa => GiDocStyle,
    traits => [qw(Clone)],
    lazy_build => 1,
    coerce => 1,
);

has 'merged_style' => (
    is => 'rw',
    isa => GiDocStyle,
    traits => [qw(NoClone)],
    lazy_build => 1,
);

sub _build_style {
    Lorum::Style->new
}

sub _build_merged_style {
    my $self = shift;
    
    my $style = $self->style;
    my $parent_style = $self->parent ? $self->parent->merged_style : undef;
    
    my $merged = Lorum::Style->new;
    for my $att ( map { $merged->meta->get_attribute( $_ ) } $merged->meta->get_attribute_list ) {
        my $my_value = $att->get_value( $style );
        if ( defined $my_value ) {
            $att->set_value( $merged, $my_value );
        }
        elsif ( $att->does('Inherit') && $self->parent ) {
            $att->set_value( $merged, $att->get_value( $parent_style ) ) if $att->get_value( $parent_style );
        }
    }
    return $merged;
}



1;
