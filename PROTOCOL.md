# sfn protocol

Binary protocol. General scheme:

`<opcode> <sequence of unknown length>` (repeat many times)

## Opcodes

* `0x01` FILE
* `0x02` DONE — signals that no more control bytes will be sent.
* `0x03` MD5_WITH_FILE
* `0x04` FILE_WITH_MD5

## FILE

```
OPCODE:   0x01
FILENAME: utf-8 string terminated by \n
FILESIZE: 64-bit unsigned integer, little endian
DATA:     exactly FILESIZE bytes
```

## MD5_WITH_FILE

```
OPCODE:   0x03
FILENAME: utf-8 string terminated by \n
FILESIZE: 64-bit unsigned integer, little endian
MD5:      ascii hexadecimal string, terminated by \n
DATA:     exactly FILESIZE bytes
```

## FILE_WITH_MD5

```
OPCODE:   0x04
FILENAME: utf-8 string terminated by \n
FILESIZE: 64-bit unsigned integer, little endian
DATA:     exactly FILESIZE bytes
MD5:      ascii hexadecimal string, terminated by \n
```
