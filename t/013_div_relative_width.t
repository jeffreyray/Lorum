#!/usr/bin/perl -w
use warnings;
use strict;

use Test::More qw( no_plan );
use Scalar::Util qw( refaddr );

use TryCatch;
use Carp qw( confess );

use_ok('Lorum::Document');
use_ok('Lorum::Surface::Pdf');
use_ok('Lorum::Util');
use_ok('Lorum::Element::Div');

use Lorum::Util qw( in2pt pt2in );

my $doc    = Lorum::Document->new; 
ok($doc, 'pdf surface created');

$doc->style->set_margin( 50 );


$doc->build( sub {
    my ($doc, $context) = @_;
    
    my ( $page, $div );
    $page  = $doc->new_page;
   
    $div   = $page->new_div;
    $div->style->set_width( '100%' );
    $div->style->set_border( 'solid' );
    
    my $inner = $div->new_div;
    $inner->style->set_margin( 50 );
    $inner->style->set_width( '50%' );
    $inner->style->set_border( 'solid' );
    $inner->style->set_padding( 10 );
    $inner->new_text( content => 'holla' );

});
try {
    my $surface = Lorum::Surface::Pdf->new(file_name => 't/output/015_div_relative_width.pdf', width => in2pt(8.5), height => in2pt(11) );
    $surface->print( $doc );
}
catch ($e) {
    confess $e;
}


