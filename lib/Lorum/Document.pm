package Lorum::Document;
our $VERSION = '0.01';


use Moose;
use MooseX::SemiAffordanceAccessor;
use MooseX::StrictConstructor;
use MooseX::Method::Signatures;

use Cairo;
use Pango;

use Lorum::Meta::Attribute::Trait::Inherit;

use Lorum::Element::Div;
use Lorum::Element::Page;
use Lorum::Element::Header;
use Lorum::Element::HRule;
use Lorum::Element::Spacer;
use Lorum::Stamp;
use Lorum::Element::Table;
use Lorum::Element::Text;
use Lorum::Types qw( MaybeGiDocDoesStamp );
use Lorum::Util;


extends 'Lorum::Element::Box';
with 'Lorum::Role::HasHeaderFooter';

with 'Lorum::Role::ConstructsElement' => { 
    name => 'header',
    function => sub {
        my $self = shift;
        my $header = Lorum::Element::Header->new( parent => $self, @_ );
        $self->set_header( $header );
        return $header;
    }
};

with 'Lorum::Role::ConstructsElement' => {
    name => 'page',
    function => sub {
        my $self = shift;
        my $new  = Lorum::Element::Page->new( parent => $self, width => $self->width, height => $self->height, style => $self->style->clone );
        #$new->set_margin_top( $self->margin_top );
        #$new->set_margin_left( $self->margin_left );
        #$new->set_margin_right( $self->margin_right );
        #$new->set_margin_bottom( $self->margin_bottom );
        $new->set_header_margin( $self->header_margin );
        $new->set_footer_margin( $self->footer_margin );
        $new->set_header( $self->header->clone ) if $self->header;
        $self->append_element( $new );
        return $new;
    }
};

has '+parent' => (
    required => 0,
);

has 'builder_func' => (
    is => 'rw',
    isa => 'CodeRef',
    writer => 'build',
    reader => 'builder_func',
);



#sub new_ps {
#    my ($class, $w, $h) = @_;
#    
#    die 'usage: ' . __PACKAGE__ . '->new_pdf($width, $height) '
#        if ! defined $w || ! defined $h;
#    
#    my $surface = Cairo::PsSurface->create ( 'output.pdf', $w, $h);
#    my $self = $class->new( surface => $surface, width => $w, height => $h );
#    return $self;
#}

method doc {
    $self;
}

method inner_width {
    $self->width - $self->margin_left - $self->margin_right;
}

method inner_height {
    $self->height - $self->margin_top - $self->margin_bottom;
}

method margin_left_pos {
    $self->margin_left;
}

method margin_right_pos {
    $self->width - $self->margin_right;
}

method margin_top_pos {
    $self->margin_top;
}

method margin_bottom_pos {
    $self->height - $self->margin_bottom;
}

method margin_center_pos {
    $self->margin_left_pos + ( $self->inner_width / 2 );
}

method imprint_header ( @args ) {
    $self->header->imprint( $self, @args ) if $self->header;
}

method imprint_footer {
    $self->footer->imprint( $self ) if $self->footer;
}

method draw_page ( $cr, Int $i ) {
    $self->children->[$i]->imprint( $cr );
}

1;


__END__

=pod

=head1 NAME

Lorum::Document - Document root class

=head1 SYNOPSIS

  use Lorum;

  $doc = Lorum->new_document;

  $page = $doc->new_page;

  $page->new_text( content => 'Lorum Ipsum' );


=head1 DESCRIPTION

L<Lorum::Document> is the root element of a document.

=head1 METHODS

=over 4

=item new_page

Returns a new L<Lorum::Element::Page> object.

=back

=head1 AUTHOR

Jeffrey Ray Hallock E<lt>jeffrey.hallock at gmail dot comE<gt>

=head1 COPYRIGHT

    Copyright (c) 2010 Jeffrey Ray Hallock. All rights reserved.
    This program is free software; you can redistribute it and/or
    modify it under the same terms as Perl itself.

=cut

