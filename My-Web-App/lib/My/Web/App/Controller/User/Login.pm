package My::Web::App::Controller::User::Login;
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
         Chained     => '/user/noauth',
         CaptureArgs => 0,
         PathPart    => 'login',
      }
   }
);

sub GET :Action {}

sub POST :Action {
   my ($self, $c) = @_;
   my $data = $c->req->body_params;
   $c->forward( _login => [ $data ] );
}

sub _login :Action {
   my ($self, $c, $data) = @_;

   ## validation
   my $dm = Data::Manager->new;
   $dm->set_verifier( login => My::Store::Validation::Login->new->build );
   $dm->verify( login => $data );
   $dm->success or $c->detach( error => [ $dm ] );

   ## authentication
   if (!$c->authenticate( $data )) {
      $c->message(
         Message::Stack::Message->new(
            scope => 'login',
            msgid => 'user_pass_invalid'
         )
      );
      $c->detach;
   }

   $c->res->redirect( '/user/account' );
   
}

sub error :Action {
   my ($self, $c, $dm) = @_;
   $c->stash->{error} = 
      $dm->isa('Message::Stack') ? $dm : $dm->messages;
}


__PACKAGE__->meta->make_immutable;

1;
