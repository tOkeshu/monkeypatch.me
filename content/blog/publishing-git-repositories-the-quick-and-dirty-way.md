---
title: Publish Git repositories, the quick and dirty way
description: Publish Git repositories, the quick and dirty way
created: !!timestamp '2011-06-12 19:06:04'
author: rgauthier
tags:
  - git
---

{% mark excerpt -%}

In the previous post, we discussed
[how to host git repositories](hosting-git-repositories-the-quick-and-dirty-way.html). This
time, we'll learn how to publish our code in 5 minutes chrono.

What you need is a *bare repository* and a *web server*.

{%- endmark %}

The bare repository
-------------------

First, you need to create a bare copy of your code repository. It must
be accessible by the web server:

    $ mkdir -p /var/www/repositories/
    $ cd /var/www/repositories
    $ git clone --bare user@server:/path/to/repositories/myuberproject

Again, the `--bare` option is important.

Now, here is the trick. The following command will allow everyone to
clone the repository:

    $ cd /var/www/repositories/myuberproject
    $ git update-server-info

The last command generate auxiliary files that tells the git client
how to discover the repository references. Without this
command, the client is unable to clone the project.

The web server
--------------

This part is not specific to code publishing. Indeed, all you have to
do is to configure a web server to deliver the files of the
`/var/www/repositories` directory.

The dirtiest example I can give is the following commands:

    $ cd /var/www/repositories
    $ python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"

Now, you should be able to clone your repositories via the http
protocol:

    $ git clone http://server:8000/myuberproject.git

This example runs the Python embedded web server. However it is not
very robust, so you really should take a better option like
[Nginx](http://wiki.nginx.org/) or
[Lighttpd](http://www.lighttpd.net/).

The Easy (and Secure) Way
-------------------------

Again, this is a quick-and-dirty how to, not a production guide.

If you seriously plan to publish your code (which is a very good idea
:), you should use *gitosis* and *git-daemon*. They are both
available on Debian and while *git-daemon* require some minor
configurations, they are *almost* ready to use:

    $ aptitude install gitosis
    $ view /usr/share/doc/gitosis/README.rst.gz

    $ aptitude install git-daemon-run
    $ view /usr/share/doc/git-daemon-run/README.Debian
