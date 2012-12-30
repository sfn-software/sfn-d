sfn
===

A small and fast utility to send files over network.

Building and running
--------------------

Note: if you're running Arch Linux, you can just install package `sfn`, we keep it pretty fresh.

Requirements:

* D compiler (dmd is recommended, gdc is officially supported too)
* make

If you already have all this, just type `make` (`make dmd`, `make gdc`) to build sources. `make install` will install sfn to `/usr/bin/` (other destinations are not supported yet). `make DESTDIR=/some/folder install` allows to install it not relative to root (useful when builing a package).

Help
----

Usage:

```
sfn --listen [options] [files to send]
sfn --connect <address> [options] [files to send]
```

sfn will establish a connection, send all the files, receive all the files from another side and then exit.

`-l` and `-s` are aliases for `--listen`, `-c` is an alias for `--connect`.

Options:

* `--version`, `-v`: Show sfn version and exit.
* `--help`, `-h`: Show this text and exit.
* `--port`, `-p`: Use specified port. Defaults to 3214.
* `--prefix`, `-f`: Add prefix to received files' path and name. For example: `/home/user/downloads/`, `sfn-`, `/etc/file-`.
* `--no-external-ip`, `-n`: Don't perform external IP detection and reverse DNS lookup.
