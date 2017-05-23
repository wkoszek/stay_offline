# Stay Offline and Study

This repository has scripts which will make you more productive offline.
Each individual directory is named with a site name.
You can enter it, type 'make', and get site's content downloaded for
offline viewing.
Right now PDF format is supported only.
This stuff has been tested on iPad Pro, which is my primary reading
platform.

**I don't support illegal scrubbing** (stealing content and repurposing it
without giving credit), so this repo is only for reader's convenience, so
that you can read blog articles and essays offline, when you're in the train
on a crappy Internet connection.

**If you want to support offline website with a paid content**, remember to make
script be parametrizable, and remove the login/password credentials before
submitting stuff here.

**Example**: NSScreencasts are nice,
but don't support offline mode well. So `nsscreencast/` has a script which
will take your user name and password.

## How to use

To workaround Homebrew `gs_init.ps` bug, download Ghostscript 9.19 to `_gs`
directory and unpack it there, and then set:

```
export GS_LIB=`pwd`/_gs/ghostscript-9.19/Resource/Init/
```

## Currently supported

| **Website** | **Description** |
|----+------------|
| [alertbox/](alertbox)  | Nielsen Norman Group "Alertbox" articles |
| [alistapart](alistapart) | A List Apart articles |
| [indiehackers](indiehackers/) | Indie Hackers interviews |
| [bitfountain](bitfountain/) | Bitfountain Autolayout tutorials (incomplete; didn't have a patience to figure out what they do) |
| [nsscreencast](nsscreencast/) | NSScreencasts |

