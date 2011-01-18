package Lorum;

use Lorum::Document;
use Lorum::Surface::Pdf;
use Lorum::Surface::PrintOperation;

sub new_document {
    Lorum::Document->new;
}


1;



__END__

=pod

=head1 NAME

Lorum - Document creation

=head1 SYNOPSIS

  use Lorum;

  use Lorum::Util qw( in2pt );

  $doc = Lorum->new_document;

  $doc->new_header( center => 'Lorum Document' );

  $doc->build( sub {

  $page = $doc->new_page;

  $page->new_text( content => 'Lorum Ipsum' );


  # save to pdf file

  $pdf = Lorum::Surface::Pdf->new (

    file_name => 'output.pdf',

    width => in2pt( 8.5 ),

    height => in2pt( 11 ),

  );

  $pdf->print( $doc );

  # send to printer

  $printer = Lorum::Surface::PrintOperation->new(

    gtk_window = Gtk2::Window->new,

  );

  $printer->print( $doc );

=head1 DESCRIPTION

L<Lorum> is a library for creating/displaying/printing documents.

=head1 BETA VERSION

*THIS IS NEW SOFTWARE. IT IS STILL IN DEVELOPMENT. THE API MAY CHANGE IN FUTURE
VERSIONS WITH NO NOTICE.*

=head1 METHODS

=over 4

=item new_document 

Returns a new L<Lorum::Document> object.

=back

=head1 SEE ALSO

=over 4

=item L<Cairo>

=item L<Glib>

=item L<Gtk2>

=back

=head1 AUTHOR

Jeffrey Ray Hallock E<lt>jeffrey.hallock at gmail dot comE<gt>

=head1 COPYRIGHT

    Copyright (c) 2010 Jeffrey Ray Hallock. All rights reserved.
    This program is free software; you can redistribute it and/or
    modify it under the same terms as Perl itself.

=cut

