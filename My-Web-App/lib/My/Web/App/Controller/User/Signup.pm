package My::Web::App::Controller::User::Signup;
use namespace::autoclean;
use Moose;

BEGIN { extends 'Catalyst::Controller' }
with 'My::Store::Role::Action';

__PACKAGE__->config(
   action => {
      base => {
         Chained     => '/user/noauth',
         CaptureArgs => 0,
         PathPart    => 'signup',
      }
   }
);

sub GET :Action {}

sub POST :Action {
   my ($self, $c) = @_;

   my $data = $c->req->body_params;
   $c->forward( _sigunp => [ $data ] );
}

sub _signup :Action {
   my ($self, $c, $data) = @_;
 
   my $col = $c->model('DB::User');

   $c->stash( $data ); 
   $col->signup( $data )
      or $c->detach( error => [ $col->error ] );
   
   $c->stash({ signup_sucess => 1 })
}

sub error :Action {
   my ($self, $c, $dm) = @_;
   $c->stash->{error} = 
      $dm->isa('Message::Stack') ? $dm : $dm->messages;
}


__PACKAGE__->meta->make_immutable;

1;
