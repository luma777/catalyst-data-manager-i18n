package My::Store::Schema::Result::User;

use DBIx::Class::EncodedColumn;
use DBIx::Class::Candy -autotable => v1, -components => [qw/ EncodedColumn /];

primary_column id => {
  data_type         => 'int',
  is_auto_increment => 1,
};

column
   user_name => {
      data_type   => 'varchar',
      size        => 25,
      is_nullable => 0,
   },
   email => {
      data_type   => 'varchar',
      size        => 25,
      is_nullable => 0,
   },
   password => {
      data_type     => 'varchar',
      size          => 27,
      is_nullable   => 1,
      encode_column => 1,
      encode_class  => 'Digest',
      encode_args   => { algorithm => 'SHA-1', format => 'base64' },
      encode_check_method => 'check_password'
   };

__PACKAGE__->add_unique_constraint('user_unique' => [ qw/email/ ]);

1;
