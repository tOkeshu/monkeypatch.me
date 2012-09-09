Please, don't break the links !
===============================

The web finds its power in its hypermedia nature. The most simple and
successful web architectures rely on hypermedia content and
hyperlinks.

Everyone understand hyperlinks. They are everywhere in our
applications. That's the most irreductible piece of interaction
between a hypermedia content and the user.

However, more and more I encounter applications that break the links.

## A History of Schizofrenia

There is basically 2 possibles ways of using a link on the web.
Either you click on it, either you use the URL the link or your
address bar provide to access directly the hypermedia content.

In other words, you have 2 ways of breaking it:

- The first is to create links that lead nowhere. There are used for
  pure interactivity. The twitter's follow buttons  is a good example.

- The second is to build URLs that are not accessible twice or
  directly. Add a token tied to an expiration date and you time kill
  your URLs. They're a kind of ghost URL.

## The third eye

Actually there is a third way to break a link. This is a special case
of the first one. As I said you have two ways to use a link, either
you click it, either you acces the URL it provides. And sometimes, you
want to acess the URL it provides by clicking on it.

Let me explain how you do this. Imagine you have a nice gallery of
pictures that you want to browse. But the gallery use lightboxes.
While you are ok with lightboxes, you want to acess a specific image
without going throught the fancy effects. In other term you want to
click a thumbnail and open a new tab with the image within it and only
this image.

A lot of browsers do that. They even allow you to do that via
different key-strokes. For example in Firefox if you press `Ctrl`
while clicking a link, it will open the content in a new tab. I
personnaly use for a long time the third button of my mouse which do
exactly that in Firefox and Chromium.

When you use this feature, what you tell to the web application is « I
want to access directly the content of this hyperlink », like if you
had copy and paste the corresponding URL in your address bar. In a
sense it's a shortcut.

But what happens when the link does not provide a proper URL ? It
breaks. The newly opened tab will be often the same page.

Worse, even when twitter provide a proper URL, the JavaScript catch
this "third" click and treats it as a simple click, thus breaking the
semantic of your action. I personnaly consider this behaviour as a
broken UX design.

## Fixing all this

Fixing these probleme are no very difficult.

For the purely interactive links, take care that they lead to another
page which is dedicated to the action the links is supposed to
provide. So, if it's a follow button, create a special page with a
well defined URL that allow the user to follow someone, via a basic
form for example.

To avoid ghost URLs, take care that every URLs built cand be accessed
directly, via a simple bookmark. What the URL should return for
different users is a matter of your application semantic.

