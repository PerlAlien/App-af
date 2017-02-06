use strict;
use warnings;
use 5.014;

package App::af {

  use Moose::Role;
  use namespace::autoclean;
  use Getopt::Long qw( GetOptionsFromArray );
  use Pod::Usage   qw( pod2usage           );

  # ABSTRACT: Command line tool for alienfile

  has args => (
    is      => 'ro',
    isa     => 'ArrayRef[Str]',
    default => sub { [] }
  );

  sub BUILDARGS
  {
    my($class, @args) = @_;
    
    my @options = (
      'help'    => sub { pod2usage({ -verbose => 1 }) },
      'version' => sub {
        say "App::af version ", ($App::af::VERSION // 'dev');
        exit;
      },
    );
    
    GetOptionsFromArray(\@args, @options)
      || pod2usage({ -exitval => 1 });
    
    { args => \@args },
  }

  sub compute_class
  {
    defined $ARGV[0] && $ARGV[0] !~ /^-/
      ? 'App::af::' . shift @ARGV
      : 'App::af::default';
  }

  requires 'main';  
}

package App::af::default {

  use Moose;
  with 'App::af';

  sub main
  {
    say "App::af version @{[ $App::af::VERSION || 'dev' ]}";
    say "  af --help for usage information";
    0;
  }

  __PACKAGE__->meta->make_immutable;
}

1;

