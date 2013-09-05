package My::Web::App::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

My::Web::App::Controller::Root - Root Controller for My::Web::App

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub base :Chained('/') CaptureArgs(0) PathPart('') {}

sub error_404 :Action {
   my ($self, $c) = @_;
   $c->res->status(404);
   $c->res->body('Not found!');
}


=head2 default

Standard 404 error page

=cut

sub root :Chained('base') PathPart('') Args(0) {
   my ($self, $c) = @_;
   
   if ($c->req->method eq 'POST') {
      my $data = $c->req->body_params;
      my $action = delete ${$data}{action};
       
      $action eq 'login'
         and $c->detach( '/user/login/_login' => [ $data ] );
   
      $action eq 'signup'
         and $c->detach( '/user/signup/_signup' => [ $data ] );
   }
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Lucas Oliveira

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
