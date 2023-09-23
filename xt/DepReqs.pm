package    #
  DepReqs;

use strictures 2;

use Test::DependentModules;
use IO::All;

1;

__PACKAGE__->run;

sub run {
    my @deps = Test::DependentModules::_get_deps    #
      PPI => { exclude => qr/^(Apache2-SSI|Devel-IPerl|Padre)$/ };
    my $c    = MetaCPAN::Client->new;
    my @reqs = map @{ $c->release($_)->dependency }, @deps;
    io("xt/cpanfile")
      ->print( join "\n", map qq[requires "$_->{module}" => "$_->{version}";],
        @reqs );
}
