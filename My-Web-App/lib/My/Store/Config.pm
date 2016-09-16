package My::Store::Config;
use strict;
use Config::JFDI;
use Catalyst::Utils;

my $cfg = Config::JFDI->new(
    name => 'conf/my_web_app',
    path => Catalyst::Utils::home(__PACKAGE__)
);

sub get { $cfg->get }

1;
