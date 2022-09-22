# af ![static](https://github.com/PerlAlien/App-af/workflows/static/badge.svg) ![linux](https://github.com/PerlAlien/App-af/workflows/linux/badge.svg) ![macos](https://github.com/PerlAlien/App-af/workflows/macos/badge.svg) ![windows](https://github.com/PerlAlien/App-af/workflows/windows/badge.svg) ![cygwin](https://github.com/PerlAlien/App-af/workflows/cygwin/badge.svg) ![msys2-mingw](https://github.com/PerlAlien/App-af/workflows/msys2-mingw/badge.svg)

Command line tool for alienfile

# SYNOPSIS

```
af probe      --help
af download   --help
af install    --help
af requires   --help
af missing    --help
af prop       --help
af list       --help
```

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

```
af download
  [ ( -f | --file )  alienfile | ( -c | --class ) class ]
  [ ( -l | --local ) directory ]
```

### description

Download the external resource using the usual [alienfile](https://metacpan.org/pod/alienfile) logic.  File
will be deposited in the directory indicated by the `--local` (or `-l`)
option, or the current working directory if not specified.

### options

#### -f | --file

The [alienfile](https://metacpan.org/pod/alienfile).  If neither this option, nor `-c` is specified, then
`alienfile` in the current directory will be assumed.

#### -c | --class

Get the [alienfile](https://metacpan.org/pod/alienfile) from the already installed Alien module.    You may
omit the `Alien::` prefix, so for example [Alien::curl](https://metacpan.org/pod/Alien::curl) may be specified
as simply `curl`.

#### -l | --local

The location to store the downloaded resource.  The current directory
if not specified.

## probe

### Usage

```
af probe
  [ ( -f | --file ) alienfile | ( -c | --class ) class ]
  [ --root directory ]
  [ --before hook command ] [ --after hook command ]
  [ -I lib ] [ --blib ]
```

### description

Probe system for existing library or tool using the given [alienfile](https://metacpan.org/pod/alienfile).

#### -f | --file

The [alienfile](https://metacpan.org/pod/alienfile).  If neither this option, nor `-c` is specified, then
`alienfile` in the current directory will be assumed.

#### -c | --class

Get the [alienfile](https://metacpan.org/pod/alienfile) from the already installed Alien module.    You may
omit the `Alien::` prefix, so for example [Alien::curl](https://metacpan.org/pod/Alien::curl) may be specified
as simply `curl`.  If you do not specify the `--prefix` option, the
package will replace the already installed one.

#### --root

Build in root

#### -I

Add directory to the Perl search lib (like -I on [perl](https://metacpan.org/pod/perl)).

#### --blib

Use the blib from the current directory.

## install

### Usage

```
af install
  [ ( -f | --file )  alienfile |  ( -c | --class ) class ]
  [ --prefix directory | --dry-run ] [ --stage directory ]
  [ --type ( share | system ) ] [ --root directory ]
  [ --before hook command ] [ --after hook command ]
  [ -I lib ] [ --blib ]
```

### description

Install or reinstall using the given [alienfile](https://metacpan.org/pod/alienfile) or already installed
[Alien](https://metacpan.org/pod/Alien).

### options

#### -f | --file

The [alienfile](https://metacpan.org/pod/alienfile).  If neither this option, nor `-c` is specified, then
`alienfile` in the current directory will be assumed.

#### -c | --class

Get the [alienfile](https://metacpan.org/pod/alienfile) from the already installed Alien module.    You may
omit the `Alien::` prefix, so for example [Alien::curl](https://metacpan.org/pod/Alien::curl) may be specified
as simply `curl`.  If you do not specify the `--prefix` option, the
package will replace the already installed one.

#### --stage

The stage directory.  By default this is a temporary directory that will
automatically be removed.

#### --prefix

The final install location to use.  Required when using the `-f` option,
but optional when using the `-c` option.

#### --type

Override the install type.  May be either `share` or `system`.

#### --dry-run

Do not install into the final location.

#### --root

Build in root

#### --before

Execute the given command before the given hook.  Note that the same
hook my execute several times for a given recipe.  Example, to open up
an interactive shell before the build has started, right after the
extraction:

```
% af install --before build bash
```

The build configuration is check pointed, so you can read the install
and runtime properties in the `state.json` file in the build root.
Use \* or % as the hook to run the command before all hooks.  You can
use `:repl` as the command to open up a Perl REPL (Read-Eval-Print-Loop)
to inspect the `$build` and `$meta` objects.

#### --after

Execute the given command after the given hook.  Note that the same hook
my execute several times for a given recipe.  Example, to open up an
interactive shell after the build has completed:

```
% af install --after build bash
```

The build configuration is check pointed, so you can read the install
and runtime properties in the `state.json` file in the build root.
Use \* or % as the hook to run the command before all hooks.  You can
use `:repl` as the command to open up a Perl REPL (Read-Eval-Print-Loop)
to inspect the `$build` and `$meta` objects.

#### -I

Add directory to the Perl search lib (like -I on [perl](https://metacpan.org/pod/perl)).

#### --blib

Use the blib from the current directory.

## requires

### Usage

```
af requires
  [ ( -f | --file )  alienfile |  ( -c | --class ) class ]
  [ ( -p | --phase ) ( configure | any | share | system ) ]
```

### description

Print the requirements for the given phase in [YAML](https://metacpan.org/pod/YAML) format.  If the phase
is not provided, then requirements for all phases will be printed separately
in [YAML](https://metacpan.org/pod/YAML) format.

### options

#### -f | --file

The [alienfile](https://metacpan.org/pod/alienfile).  If neither this option, nor `-c` is specified, then
`alienfile` in the current directory will be assumed.

#### -c | --class

Get the [alienfile](https://metacpan.org/pod/alienfile) from the already installed Alien module.    You may
omit the `Alien::` prefix, so for example [Alien::curl](https://metacpan.org/pod/Alien::curl) may be specified
as simply `curl`.

#### -p | --phase

The phase of the requirement.  Please refer to the [Alien::Build](https://metacpan.org/pod/Alien::Build) documentation
for the meaning of the various phases.

## missing

### Usage

```
af missing
  [ ( -f | --file )  alienfile |  ( -c | --class ) class ]
  [ ( -p | --phase ) ( configure | any | share | system ) ]
  [ --plugin | --precompile ]
```

### description

Print the requirements for the given phase in list format that are not
currently fulfilled.  This output can be piped into [cpanm](https://metacpan.org/pod/cpanm) in order
to install any missing requirements:

```
% af missing -p configure | cpanm
% af missing              | cpanm
```

If no phase is specified, then missing prereqs for configure, and either
share or system will be printed depending on what type of install is
detected (for this to work you may need to install the configure
prereqs, since the probe may use configure required modules).

### options

#### -f | --file

The [alienfile](https://metacpan.org/pod/alienfile).  If neither this option, nor `-c` is specified, then
`alienfile` in the current directory will be assumed.

#### -c | --class

Get the [alienfile](https://metacpan.org/pod/alienfile) from the already installed Alien module.    You may
omit the `Alien::` prefix, so for example [Alien::curl](https://metacpan.org/pod/Alien::curl) may be specified
as simply `curl`.

#### -p | --phase

The phase of the requirement.  Please refer to the [Alien::Build](https://metacpan.org/pod/Alien::Build)
documentation for the meaning of the various phases.

#### --plugin

Print out missing plugins.  Caveat: to do this, `af` mocks part of
[Alien::Build::Meta](https://metacpan.org/pod/Alien::Build::Meta), which may or may not break in the future.

## --precompile

Print out missing modules that are needed before the [alienfile](https://metacpan.org/pod/alienfile) is even
compiled.  These are usually `configure` time prereqs, but if they are
`use`d in the [alienfile](https://metacpan.org/pod/alienfile) instead of being declared as a `requires`, then
there is no way for [Alien::Build](https://metacpan.org/pod/Alien::Build) to query for them.  Caveat: since
[alienfile](https://metacpan.org/pod/alienfile) is arbitrary Perl code, there may be corner cases not covered
by this option.

## prop

### Usage

```
af prop
  ( -c | --class ) class [ --cflags ] [ --libs ] [ --static ]
  [ --modversion ] [ --bin-dir ]
```

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

```
af list [ -l | --long ]
```

### prop

Print list of [Alien](https://metacpan.org/pod/Alien) modules already installed that used [Alien::Build](https://metacpan.org/pod/Alien::Build)
as their installer.

### options

#### -l | --long

Also print the version number of the [Alien](https://metacpan.org/pod/Alien) module, and the version of the
alienized package.

# AUTHOR

Author: Graham Ollis <plicease@cpan.org>

Contributors:

Diab Jerius (DJERIUS)

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017-2022 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
