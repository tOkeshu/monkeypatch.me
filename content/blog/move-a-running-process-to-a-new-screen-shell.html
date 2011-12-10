---
title: Move a running process to a new screen shell
description: Move a running process to a new screen shell
created: !!timestamp '2011-04-24 18:06:08'
author: rgauthier
tags:
  - tips
  - process
  - screen
---

{% mark excerpt -%}

The purpose of this article is to show you how to move a process
from your traditional shell to a new screen session.

{%- endmark %}

The necessary tools are:

  - [screen](http://en.wikipedia.org/wiki/GNU_Screen)
  - disown (a builtin command of bash and zsh)
  - [reptyr](https://github.com/nelhage/reptyr) or
    [retty](http://pasky.or.cz//dev/retty/)
    (see the note below)
  - pgrep (optional)

Example
-------

Sometimes I have to restart my X server. In these cases, I would like
to keep my text based IRC client ([Irssi](http://www.irssi.org/))
running. Of course, I didn't launched Irssi into a screen session. So
I will move the process to screen in order to get it back later:

  1. The first thing to do is to suspend the process. In my case,
     Irssi can be suspended by typing `ctrl+z`.


  2. Secondly, resume the process in background:

        $ bg

  3. Now, we will detach the process from its parent (the shell). So,
     when the parent process will be terminated, the child (Irssi)
     will be able to continue. For this, we use the `disown` builtin:

        $ disown irssi

  4. Launch a screen session:

        $ screen

  5. As we are in a screen session, we will retrieve the irssi
     process. To do so, we use the `reptyr` command which take a pid:

        $ reptyr <pid>

  6. To avoid the tedious pid research, we can use the `pgrep`
     command:

        $ reptyr $(pgrep irssi)


Now the process is in a screen shell, we can safely detach our session
and no longer worry about killing our X server or close our ssh
connection.

Here screen is used but the example should works with another terminal
multiplexer like [tmux](http://tmux.sourceforge.net/).

A note about retty and reptyr
-----------------------------


In this article I use `reptyr` but `retty` is a similar program which
does exactly the same. Indeed, this article was written with retty in
the first place. However, reptyr seems to be a better alternative:

  - retty is for x86 Linux only, so it does not work on 64-bits
    distros. That's why you can't find it on Debian amd64.
  - [the reptyr's author claims](http://blog.nelhage.com/2011/01/reptyr-attach-a-running-process-to-a-new-terminal/)
    to have fewer problems than retty especially with `less`.

Nevertheless, I used these tools on multiple machines according to
their availability in the package repository and they always worked
fine.

Recap
-----

    $ ctrl+z                # Suspend the current process
    $ disown irssi          # Detach irssi from the shell
    $ screen                # Launch screen
    $ reptyr $(pgrep irssi) # Get back the process

