package My::Web::App::Controller::User::Account;
use namespace::autoclean;
use Moose;

BEGIN { extends 'Catalyst::Controller' }
with 'My::Store::Role::Action';

__PACKAGE__->config(
   action => {
      base => {
         Chained     => '/user/checkauth',
         CaptureArgs => 0,
         PathPart    => 'account',
      }
   }
);

sub GET :Action {
   my ($self, $c) = @_;

   $c->stash({
      user => $c->user
   });

}

sub POST :Action {}

sub error :Action {
   my ($self, $c, $dm) = @_;
   $c->stash->{error} = 
      $dm->isa('Message::Stack') ? $dm : $dm->messages;
}


__PACKAGE__->meta->make_immutable;

1;
