# Radio Playing Daemon

`RPD` is a daemon that plays radio streams.

Mplayer is used for the actual backend, providing the user with total control.

#Radio Playing Client


RPC is the program for controlling Radio Playing Daemon (RPD).
```
  Usage: rpc [OPTIONS] (ARGS) 

  OPTIONS:
      np      show the currently playing song
      npi     show the currently playing song on one line
      play    play/switch to channel
      random  switch to random channel
      list    list all available channels
      fav     add track to the favlist
      shfav   show favorites
      son     turn on sound
      soff    turn off sound
      toggle  toggle playback status, pause/play
      stop    pauses playback. If you really want to stop, use quit
      quit    stops RPD

  EXAMPLES:
      rpc play psy
```

#Installation

Grab the 'now playing'-module:
```bash
    $ git clone git@github.com:trapd00r/Mplayer-NowPlaying-Crappy.git Mplayer-NowPlaying
    $ cd Mplayer-NowPlaying
    $ perl Makefile.PL
    $ make
    # make install
```
Now you can install RPD and RPC:
```bash
    $ perl Makefile.PL
    $ make
    # make install
```
copy, edit channel list:
```bash
sudo cp channels.txt /etc/
vim /etc/channels.txt
```
Start RPD and enjoy.
#License

Copyright (C) 2010 Magnus Woldrich

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License, version 2, as published by the
Free Software Foundation.
