package My::Store::Validation::Login;

use namespace::autoclean;
use Moose;
use Data::Verifier;
use MooseX::Types::Moose qw/Str/;

sub build {
   my ($self) = @_;

   my $dv = Data::Verifier->new(
      profile => {
         email => {
            type => Str,
            required => 1
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
