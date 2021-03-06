Hosting Git repositories, the quick and dirty way
=================================================


First you write code, for yourself or for other projects. Then you
need to host this code on a centralized place to avoid the painful
synchronization between your 2-or-more machines.

But what are your options when you don't want to waste your time on
fancy things like github, gitorious or even gitosis?

On your local machine
---------------------

Usually, you begin a project by starting to hack some code. Then you
do some git-fu:

    cd myuberproject
    git init
    git add .
    git commit -m "Initial revision of myuberproject (It's gonna be Legendary)"

Now you have some *beautiful* commits you want to keep away from
troubles and you need a centralized place to do this.

On your server
--------------

On your server, prepare a sweet home for your repositories:

    $ mkdir -p repositories/myuberproject
    $ cd repositories/myuberproject
    $ git init --bare

Here the `--bare` option is important as it says to git to create a
repository without a working directory.

Pushing changes to your server
------------------------------

When you are about to push changes to your server for the first time,
add a remote to your local repository:

    $ cd myuberproject
    $ git remote add origin user@server:/path/to/repositories/myuberproject

And then:

    $ git push origin master

As git know how to talk the ssh protocol, you will be asked to type
your password or your passphrase. This should end by a successful
push.

The Easy (and Secure) Way
-------------------------

This post is obviously a quick-and-dirty how to. So as soon as
possible, try to move on to something more serious like *gitosis* or
*[gitolite](https://github.com/sitaramc/gitolite/)*.

Garry Dolley wrote a post, long time ago,
[about gitosis](http://scie.nti.st/2007/11/14/hosting-git-repositories-the-easy-and-secure-way)
and it still seems to be the reference to get started with it.

However, don't forget that gitosis is packaged in several Linux
distributions. For example, on debian, installing it and getting
started is quite straight forward:

    $ aptitude install gitosis
    $ view /usr/share/doc/gitosis/README.rst.gz

