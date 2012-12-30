sfn
===

Send files over network

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
