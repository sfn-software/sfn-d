# sfn protocol

Binary protocol. General scheme:

`<1-byte opcode> <sequence of unknown length>` (repeat many times)

## Protocol revisions

L1 is the most basic one, L3 has checksum support, L4 has faster checksum support. They are backward-compatible: every new revision includes support for existing opcodes all the way back to L1.

## Opcodes

Protocol revision|Opcode|Name|Description
-----------------|------|----|-----------
L1 | `0x01` | FILE |
L1 | `0x02` | DONE | Signals that no more opcodes will be sent.
L3 | `0x03` | MD5_WITH_FILE | _(outdated)_
L4 | `0x04` | FILE_WITH_MD5 |

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
