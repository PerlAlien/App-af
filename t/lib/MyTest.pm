package MyTest;

use strict;
use warnings;
use Test2::Tools::Basic;
use Path::Tiny qw( path );
use Capture::Tiny qw( capture_merged );
use base qw( Exporter );

our @EXPORT = qw( alienfile run );

sub alienfile
{
  my($str, $name) = @_;
  my(undef, $filename, $line) = caller;
  $str = '# line '. $line . ' "' . $filename . qq("\n) . $str;
  my $alienfile = path($name||'alienfile')->absolute;
  $alienfile->spew($str);
  return;
}

sub run
{
  my($subcommand, @args) = @_;
  
  my $class = "App::af::$subcommand";
  
  my($out, $ret) = capture_merged {
    $class->new(@args)->main;
  };
  
  note $out;
  
  $ret;
}

1;
