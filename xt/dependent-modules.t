use Test2::V0;
use strictures 2;

use Test::DependentModules 'test_all_dependents';

skip_all "ENV var TEST_DEPENDENTS not set" if not $ENV{TEST_DEPENDENTS};

test_all_dependents    #
  PPI => { exclude => qr/^(Apache2-SSI|Devel-IPerl|Padre)$/ };
