# af [![Build Status](https://secure.travis-ci.org/plicease/App-af.png)](http://travis-ci.org/plicease/App-af)

Command line tool for alienfile

# SYNOPSIS

    af download   --help
    af install    --help
    af test       --help
    af requires   --help
    af missing    --help
    af prop       --help
    af list      --help

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
      [ ( -l | --local ) directory ]

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

## prop

### Usage

    af prop ( -c | --class ) class [ --cflags ] [ --libs ] [ --static ] [ --modversion ] [ --bin-dir ]

### prop

Print the runtime properties for the given [Alien](https://metacpan.org/pod/Alien) class.  You may
omit the `Alien::` prefix, so for example [Alien::curl](https://metacpan.org/pod/Alien::curl) may be queried
as simply `curl`.  If no specific properties are requested then the
entire runtime property hash will be printed in [YAML](https://metacpan.org/pod/YAML) format.

### options

#### -c | --class

The class to query for runtime properties.  This option is required.

#### --cflags

Print the compiler flags

#### --libs

Print the linker flags

#### --static

For either the `--cflags` or `--libs` option print the static versions.

#### --modversion

Print the version of the Alienized package.  This is not the version of
the [Alien](https://metacpan.org/pod/Alien) module itself.

#### --bin-dir

Print the list of directories bundled with a `share` install.

## list

### Usage

    af list [ -l | --long ]

### prop

Print list of [Alien](https://metacpan.org/pod/Alien) modules already installed that used [Alien::Build](https://metacpan.org/pod/Alien::Build)
as their installer.

### options

#### -l | --long

Also print the version number of the [Alien](https://metacpan.org/pod/Alien) module, and the version of the
alienized package.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
