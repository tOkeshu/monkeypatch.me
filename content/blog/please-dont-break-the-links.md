Please, don't break the links !
===============================

The web finds its power in its hypermedia nature.
The more simple and successful web architectures rely on hypermedia content and hyperlinks.

Everyone understand hyperlinks. They are everywhere in our
applications. That's the most irreductible piece of interaction
between a hypermedia content and the user.

However, more and more I encounter applications that break the links.

## A History of Schizofrenia

There is basically 2 possibles ways of using a link on the web.
Either you click on it, either you use the URL the link or your
address bar provide to access directly the hypermedia content it is
supposed to link to.

In other words, you have 2 ways of breaking a link.


## The missing URL

First, your link has only an interactive goal on thus is not tied to a
particular content at all. Its only purpose is to be clicked. For
example, most of the twitter buttons you use to follow other people
are links. But they don't carry any URL that would lead you anywhere
else. Indeed, most of the time these links have an `href` attribute
set to an empty anchor (`#`).

So how is it broken is that sense ? Well, in that case interactivity
is handled by JavaScript litterally catching the event you triggered
by clicking the link. It's a short-circuit that serve well our goal as
we can do whatever we want, for example display something useful. But
sometimes, JavaScript is not here, not yet, for some reason. Thus
nothing happens because the link doesn't lead anywhere.

## The ghost URL

The second way to break a link is to build an URL that can't be
accessed twice, or not directly. If the URL carries a token tied to an
expiration date for instance, its time is counted.

These kind of URLs can't be properly shared. Because if I copy what is
in my address bar and give it to someone else by email, there is a
good chances that, either he will not see the same thing I do, or
worse, he will see an error page.

## Fixing this

Fixing these probleme are no very difficult.

For the purely interactive links, take care that they lead to another
page which is dedicated to the action the links is supposed to
provide. So, if it's a follow button, create a special page with a
well defined URL that allow the user to follow someone, via a basic
form for example.

To avoid ghost URLs, take care that every URLs built cand be accessed
directly, via a simple bookmark. What the URL should return for
different users is a matter of your application semantic.

