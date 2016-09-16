use strict;
use warnings;

use My::Web::App;

my $app = My::Web::App->apply_default_middlewares(My::Web::App->psgi_app);
$app;

