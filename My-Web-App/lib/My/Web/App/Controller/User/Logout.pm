package My::Web::App::Controller::User::Logout;
use namespace::autoclean;
use Moose;

use Data::Manager;
use My::Store::Validation::Login;
use Message::Stack::Message;

BEGIN { extends 'Catalyst::Controller' }
with 'My::Store::Role::Action';

__PACKAGE__->config(
   action => {
      base => {
         Chained     => '/user/checkauth',
         CaptureArgs => 0,
         PathPart    => 'logout',
      }
   }
);

sub GET :Action {
   my ($self, $c) = @_;
   $c->logout;
   $c->res->redirect( '/' );
}

sub POST: Action {}

sub error :Action {
   my ($self, $c, $dm) = @_;
   $c->stash->{error} = 
      $dm->isa('Message::Stack') ? $dm : $dm->messages;
}


__PACKAGE__->meta->make_immutable;

1;
