# af [![Build Status](https://secure.travis-ci.org/plicease/App-af.png)](http://travis-ci.org/plicease/App-af)

Command line tool for alienfile

# SYNOPSIS

    af download   --help
    af install    --help
    af test       --help
    af requires   --help
    af missing    --help
    af prop       --help
    af clean      --help

# DESCRIPTION

The `af` command is a command line interface to [alienfile](https://metacpan.org/pod/alienfile) and
[Alien::Build](https://metacpan.org/pod/Alien::Build).

### options

These options are available for all subcommands.

#### --help

Print the help for either `af` as a whole, or the specific subcommand.

#### --version

Print the version of `af` and exit.

# SUBCOMMANDS

## download

### Usage

    af download
      [
        ( -f | --file )  alienfile | 
        ( -c | --class ) class
      ]
      [ ( -l | --local ) directory

### description

Download the external resource using the usual [alienfile](https://metacpan.org/pod/alienfile) logic.  File
will be deposited in the directory indicated by the `--local` (or `-l`)
option, or the current working directory if not specified.

### options

#### -f | --file

The [alienfile](https://metacpan.org/pod/alienfile).  If neither this option, nor `-c` is specified, then 
`alienfile` in the current directory will be assumed.

#### -c | --class

Get the [alienfile](https://metacpan.org/pod/alienfile) from the already installed Alien module.

#### -l | --local

The location to store the downloaded resource.  The current directory
if not specified.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
