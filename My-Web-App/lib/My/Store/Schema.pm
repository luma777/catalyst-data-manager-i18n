package My::Store::Schema;
use utf8;
use strict;
use My::Store::Config;

use parent 'DBIx::Class::Schema';

our $VERSION = 0.01;

__PACKAGE__->load_namespaces;
__PACKAGE__->load_components(qw/Schema::Versioned/);
__PACKAGE__->upgrade_directory(
    My::Store::Config->get->{upgrade_directory} );

## HOOK UTF-8 ON CREATE TABLE 
# sub sqlt_deploy_hook {
#     my ( $self, $sqlt_schema ) = @_;

#     foreach my $t ( $sqlt_schema->get_tables ) {
#         my $table = $sqlt_schema->get_table($t);

#         my $extra = $table->extra;
#         if ( !exists ${$extra}{mysql_table_type} ) {
#             $table->extra( mysql_table_type =>
#                     'InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=4'
#             );
#         }
#     }
# }

1;
