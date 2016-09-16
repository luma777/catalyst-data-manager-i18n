#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install 1.02;
use Module::Install::Catalyst; # Complain loudly if you don't have
                               # Catalyst::Devel installed or haven't said
                               # 'make dist' to create a standalone tarball.

name 'My-Web-App';
all_from 'lib/My/Web/App.pm';

requires 'Catalyst::Runtime' => '5.90112';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats

requires 'Catalyst::Plugin::Session';
requires 'Catalyst::Plugin::Session::Store::FastMmap';
requires 'Catalyst::Plugin::Session::State::Cookie';
requires 'Catalyst::Plugin::Authentication';
requires 'Catalyst::Plugin::MessageStack';
requires 'Catalyst::Plugin::I18N';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Catalyst::Model::Adaptor';
requires 'Catalyst::View::TT';

requires 'Starman';
requires 'Config::JFDI';
requires 'Catalyst::Utils';

requires 'DBIx::Class';
requires 'DBIx::Class::Schema::Versioned';
requires 'DBIx::Class::Candy' => '0.005001';
requires 'DBIx::Class::Storage::Statistics';
requires 'DBIx::Class::Admin';
requires 'DBIx::Class::EncodedColumn';
requires 'DBIx::Class::UUIDColumns';
requires 'DBD::SQLite';
requires 'DBD::mysql';


requires 'Data::Verifier';
requires 'Data::Manager';
requires 'Message::Stack';
requires 'Message::Stack::Message';
requires 'SQL::Translator' => '0.11021';

test_requires 'Test::More' => '0.88';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
