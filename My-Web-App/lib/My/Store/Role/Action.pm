package My::Store::Role::Action;
use Moose::Role;
use MooseX::MethodAttributes::Role;

sub base : CaptureArgs(0) {}

sub root : Chained('base') PathPart('') Args(0) {
  my ( $self, $c ) = @_;

  if ( $self->action_for( $c->req->method ) ) {
    $c->forward( $c->req->method );
  } else {
    $c->detach('/error404');
  }
}


1;
