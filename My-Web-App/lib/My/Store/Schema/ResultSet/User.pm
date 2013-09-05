package My::Store::Schema::ResultSet::User;

use Moose;
use namespace::autoclean;
BEGIN { extends 'DBIx::Class::ResultSet' }

use Data::Manager;
use Message::Stack;
use My::Store::Validation::Signup;


sub signup {
   my ($self, $data) = @_;
   
   ## validation
   my $dm = Data::Manager->new;
   $dm->set_verifier( 
         signup => My::Store::Validation::Signup->new->build 
      );
      
   $dm->verify( signup => $data );

   if (!$dm->success) {
      $self->{error} = $dm;
      return 0
   }

   ## email unique
   $self->find({ email => $data->{email} }) and do {
      my $stack = Message::Stack->new;
      $stack->add({
         scope => 'signup',
         msgid => 'user_exists',
         level => 'error'
      });
      $self->{error} = $stack;
      return 0
   };

   ## create user
   delete ${$data}{email_confirm};
   my $schema = $self->result_source->schema;
   
   $schema->txn_do(sub{
      $self->create( $data );
   });

   return 1
}

sub error {
   return $_[0]->{error}
}


1;