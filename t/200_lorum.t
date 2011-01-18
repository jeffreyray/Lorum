#!/usr/bin/perl -w
use warnings;
use strict;

use Test::More qw(no_plan);

use Gtk2 '-init';

use_ok('Lorum');
use Lorum::Util qw( in2pt pt2in );




my $doc    = Lorum->new_document;
isa_ok $doc, 'Lorum:Document';



