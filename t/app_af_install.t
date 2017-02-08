use Test2::Bundle::Extended;
use App::af;
use lib 't/lib';
use MyTest;
use File::chdir;
use File::Temp qw( tempdir );
use Path::Tiny qw( path );
do './bin/af';

subtest 'basic' => sub {

  local $CWD = tempdir( CLEANUP => 1 );
  
  my $prefix = path('test-prefix')->absolute;
  
  alienfile q{
    use alienfile;
    use Path::Tiny qw( path );
    probe sub { 'share' };
    share {
      download sub {
        path('foo-1.00.tar.gz')->touch;
      };
      extract sub {
        path('file1')->touch;
        path('file2')->touch;
      };
      build sub {
        my($build) = @_;
        path($build->install_prop->{prefix})->child('file1')->touchpath;
        path($build->install_prop->{prefix})->child('file2')->touchpath;
      };
    };
  };
  
  run 'install', "--prefix=$prefix";
  
  is last_exit, 0;
  
  ok( -f $prefix->child('file1') );
  ok( -f $prefix->child('file1') );

};

done_testing;
