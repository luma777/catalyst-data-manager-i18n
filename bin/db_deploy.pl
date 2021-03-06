#!/usr/bin/env perl

use strict;
use warnings;

use FindBin qw/$Bin/;
use DBIx::Class::Admin;
use lib $Bin. '/../My-Web-App/lib/';
use My::Store::Config;

## conf
my $conf = My::Store::Config->get;

my $admin = DBIx::Class::Admin->new(
    schema_class => 'My::Store::Schema',
    sql_dir      => $conf->{upgrade_directory},
    connect_info => $conf->{'Model::DB'}->{connect_info}
);

## versions
my $db_version     = $admin->schema->get_db_version;
my $schema_version = $admin->schema->schema_version;

## deploy
if ( !$db_version ) {
    $admin->schema->deploy( { auto_drop_tables => 0 } );
    exit 0;
}

## not upgrade
exit 0 if $db_version eq $schema_version;

## upgrade
$admin->upgrade;

exit 0;

__END__

