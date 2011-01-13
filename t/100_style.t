use Test::More 'no_plan';

use warnings;
use strict;

use Lorum::Style;

my $style = Lorum::Style->new;
ok( $style, 'created style');