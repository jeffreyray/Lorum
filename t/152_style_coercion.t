use Test::More tests => 8;

use warnings;
use strict;



use Lorum::PdfSurface;

my $doc = Lorum::PdfSurface->new(file_name => 't/output/152_style_coercion.pdf', width => 1024, height => 768 );
$doc->style->set_margin( 50 );

$doc->build( sub {
    my ($doc, $context) = @_;
    
    my ( $page, $div );
    $page  = $doc->new_page;
    
    $div   = $page->new_div( style => 'border: solid; font-weight: bold; width: 100%; padding: 5' );
    $div->new_text( content => 'TEXT1' );
    $div->new_text( content => 'TEXT2' );
});

$doc->finish;