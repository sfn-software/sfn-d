sfn [![Build Status](https://travis-ci.org/m1kc/sfn.svg?branch=master)](https://travis-ci.org/m1kc/sfn)
===

Small and simple utility to send files over network.

This is the reference implementation of **sfn L4** protocol.


Building from source
--------------------

Requirements:

* D compiler with `std.socketstream` support. One such compiler is gdc 6.3.0 which can be found in Debian 9 (stretch). LDC and DMD are supported if this module is present.
* GNU make.

Assuming you're preparing Docker build on Debian 9:

```
sudo docker run --rm -ti -v (pwd):/data debian:stretch bash
cd /data
apt update
apt install make build-essential gdc
make gdc
```

<hr />

Type `make` to use DMD (or `make ldc`, or `make gdc`) to build sources.

`make install` will install sfn to `/usr/bin/` (other destinations [are not supported yet](https://github.com/m1kc/sfn/issues/13)). `install` also accepts `DESTDIR` variable allows you to set root folder different from `/` (for example: `make DESTDIR=/tmp/mypkg install`).

If you need to rebuild the manpage (typically you don't), install ronn and run `make man`.

There also is experimental Ninja support. Try `ninja` and `ninja -t clean`.


Help
----

Usage:

    sfn --listen [options] [files to send]
    sfn --connect <address> [options] [files to send]

sfn will establish a connection, send all the files, receive all the files from another side and then exit.

`-l` and `-s` are aliases for `--listen`, `-c` is an alias for `--connect`.

Options:

* `--version`, `-v`: Show sfn version and exit.
* `--help`, `-h`: Show this text and exit.
* `--port`, `-p`: Use specified port. Defaults to 3214.
* `--prefix`, `-f`: Add prefix to received files' path and name. For example: `/home/user/downloads/`, `sfn-`, `/etc/file-`.
* `--no-external-ip`, `-n`: Don't perform external IP detection and reverse DNS lookup.
* `--zenity`, `-z`: Call zenity to select files using standard GTK dialog.
* `--no-integrity-check`, `-e`: Disable integrity check after transfer. This option was added for compatibility with older versions of sfn.



Related projects
----------------

Take a look at [https://github.com/sfn-software](https://github.com/sfn-software) for alternative implementations in different languages.
