package My::Store::Validation::Signup;

use namespace::autoclean;
use Moose;
use Data::Verifier;
use MooseX::Types::Moose qw/Str/;
use My::Store::Type::Email qw/TypeEmailAddress/;

sub build {
   my ($self) = @_;

   my $dv = Data::Verifier->new(
      profile => {
         user_name => {
            type => Str,
            required => 1 
         },
         email => {
            type => TypeEmailAddress,
            required => 1,
         },
         email_confirm => {
            type => Str,
            required => 1,
            post_check => sub {
               my ($r) = @_;
               my $e = $r->get_value('email');
               my $ec = $r->get_value('email_confirm');
               return $e eq $ec
            }
         },
         password => {
            type => Str,
            required => 1
         }
      }
   );

   return $dv;
}


__PACKAGE__->meta->make_immutable;

1;
