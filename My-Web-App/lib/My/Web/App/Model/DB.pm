package My::Web::App::Model::DB;

use Moose;

BEGIN { extends 'Catalyst::Model::DBIC::Schema' }

__PACKAGE__->config( schema_class => 'My::Store::Schema' );


1;
