---
title: Mixing professional and personal git configurations
description: Mixing professional and personal git configurations
created: !!timestamp '2012-01-29 18:49:20'
author: rgauthier
tags:
  - tips
  - git
---

{% mark excerpt -%}

Many developers publish code in 2 different contexts:

  - A professional environment.
  - A personnal one.

Most of the time this means two different e-mails.
So how can you manage your git configuration to help you distinguish
these two environments ?

{%- endmark %}


The template directory
----------------------

When you both initialize or clone a repository, git accepts a special
option: a template directory via the `--template` option.

A template directory contains files and directories that will be
copied in the `.git` of your repository.

Among these files there is the `config` file which can tells git who
you are and what is your e-mail address.

This way, you can "override" your default git configuration by using
the `--template` option.

Creating a basic template directory
-----------------------------------

Creating a basic template directory is simple. First you have to generate a valid `.git` directory:

    $ cd /path/to/your/template
    $ git init --bare

So what did we do here ? For the moment we just created a bare
repository. We need to remove the useless parts:

    $ cd /path/to/your/template
    $ rm objects refs HEAD -r
    
Here we remove the `objects` and `refs` directories as we don't want
git objects in our template directory. We do the same with the `HEAD`
file.

Now you can modify the config file in order to set another e-mail:

    # /path/to/your/template/config
    [user]
        name  = Romain Gauthier
        email = myfancyemail@fancyland.com

Using the template
------------------

So you have a proper template directory. How to use it?
To do so, just use the `--template` option:

    $ cd /path/to/my/uberproject
    $ git init --template=/path/to/your/template

or

    $ git clone --template=/path/to/your/template git://github.com/antirez/redis.git

And you're done.

However, this can be tedious to use the option constantly and think
whether or not to use it. To make your life easier you can use the
̀GIT_TEMPLATE_DIR` environment variable. But don't forget you have to
set it only when you want to change of context.

As I'm working with ruby very often, I already have rvm installed so I
can benefit of the `.rvmrc` files. These files are script launched
automatically when entering a directory. Thus I have a special
`.rvmrc` for my professional directory:

    $ cat /home/romain/af83/.rvmrc
    export GIT_TEMPLATE_DIR=/home/romain/af83/git-templates

If you don't want to use rvm just for this task (which is something I
can understand) you will have to find out another solution.

