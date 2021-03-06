package My::Web::App::Controller::User;
use namespace::autoclean;
use Moose;

BEGIN { extends 'Catalyst::Controller' }
    

sub base :Chained('/base') CaptureArgs(0) PathPart('user') {} 

sub checkauth :Chained('base') CaptureArgs(0) PathPart(''){
   my ($self, $c) = @_;
   
   if (!$c->user_exists) {
       $c->res->redirect( '/user/login' );
       $c->detach;
   }
   return 1;
}

sub noauth :Chained('base') CaptureArgs(0) PathPart(''){
   my ($self, $c) = @_;
   if ($c->user_exists) {
       $c->res->redirect( '/user/account' );
       $c->detach;
   }
   return 1;
}

__PACKAGE__->meta->make_immutable;

1;
