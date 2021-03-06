package Lorum::Role::HasPadding;

use Moose::Role;
use MooseX::Method::Signatures;


use Lorum::Types qw( GiDocStyleLength );

has [qw(padding_left padding_right padding_top padding_bottom)] => (
    is => 'rw',
    isa => GiDocStyleLength,
    default => 0,
);

method _apply_padding_style ( $style ) {
    $self->set_padding_left( $style->padding_left );
    $self->set_padding_right( $style->padding_right );
    $self->set_padding_top( $style->padding_top );
    $self->set_padding_bottom( $style->padding_bottom );
}

1;
