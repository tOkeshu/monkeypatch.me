Fixing the 949 problem with Fipes
=================================

[![img](/assets/images/xkcd-949-file-transfer.png)](https://xkcd.com/949/)

As said in a [previous post](/blog/backbone-tnetstrings-0.1.0.html),
I'm working on a neat project called [Fipes](http://fipelines.org), a
no-hassle web application to share files with your friends. What makes
Fipes different from other projects like
[Dropbox](https://www.dropbox.com), [Box](http://box.com) or even
*Open Source* solutions like [SparkleShare](http://sparkleshare.org/) and
[Syncany](http://www.syncany.org/), is that Fipes is
*privacy-friendly* and *simpler*.


Privacy-Friendly
----------------

The initial idea was to allow anyone to share files by sharing a link.
Whereas there are a lot of web applications offering this service,
they often ask you to create an account. Moreover, to share files you
need to upload them to their server, which can be a problem when you
feel that your data or your privacy is sensitive. For example, [think
of](http://www.wired.com/threatlevel/2011/05/dropbox-ftc/) all the
business-related data dropbox could access.

So what I wanted was something that was easy to use, yet still
respectful of my privacy. That's why I came up with these simple
goals:

  - Provide a small web application.
  - Should be easy to install, to launch and to use.
  - Should **not** keep any sensitive data about you or your files.
  - Being free as in freedom, in other words free software.

To this end, Fipes takes a radical approach at the technical level.

How does it work?
-----------------

Fipes is made up of two parts: a RESTful API written in Erlang with
[Cowboy](https://github.com/extend/cowboy) and a JavaScript
application written with
[Backbone](http://documentcloud.github.com/backbone).

The workflow is easy to grasp:

  1. Choose a file you want to share
  2. Ask the server to generate a public link
  3. Give the link to your friends

The fun part is that, until someone uses the link you gave them, *the
file is not uploaded to the server*. When choosing a file, you
register it on the server but your browser does not send any file
data.

What happens when someone use the link? The server sends to your
browser a message asking for the file data. Then the JavaScript
application slices the file into several parts and sends them to the
server.

As Fipes does not want to keep any file data, once the server
receives the chunks it forwards them to the downloader.

On the downloader side, the file is retrieved via a simple chunked
response.

Here is a little recap with a sequence diagram:

![Fipes Sequence Diagram](/assets/images/fipes-seq-diag.png)

Further explanations and what's next
------------------------------------

What the Fipes model implies is that the user experience is
synchronous.  If you quit the page, your files are not available
anymore. So you will need to leave the page open until your friends
have gotten the whole file.

Another side effect of the « lazy upload » technique is that you don't
have to wait for the whole file to be uploaded to share it with your
friends.

There is still more work to do on Fipes to achieve these goals, but I
hope it will be useful to others. In the next weeks I'll work on some
of the next features, like the support of download resuming or a https
version for [the online instance](http://fipelines.org). However the
most important parts will be UI related as the current version is not
fully understandable.

As Fipes is a free software, any
[contribution](http://github.com/tOkeshu/fipes) is of course very
welcome. :)

![img](/assets/images/fipes-all-the-things.jpg)

