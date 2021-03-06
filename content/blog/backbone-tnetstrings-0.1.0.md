Backbone-TNetStrings-0.1.0
==========================


Recently, I started a project using Erlang and Javascript,
i.e. [Cowboy](https://github.com/extend/cowboy) and
[Backbone.js](http://documentcloud.github.com/backbone). But I did
not want to use the standard Backbone way to exchange data between the
browser and the server. Indeed, I wanted to give
[TNetStrings](http://tnetstrings.org/) a try.

The result is
[Backbone-TNetStrings](https://github.com/tOkeshu/backbone-tnetstrings).


Backbone-TNetStrings
--------------------

Backbone-TNetStrings is a TNetStrings adapter for Backbone.

For those of you who do not know TNetStrings, it's a data
serialization format that can be used as an alternative to JSON. The
main goal here is to have a simpler parser. You can read more about
TNetStrings at [tnetstrings.org](http://tnetstrings.org).

Usage
-----

Include `Backbone-TNetStrings` after having included `Backbone.js` and
`tnetstrings.js`:

    <script type="text/javascript" src="backbone.js"></script>
    <script type="text/javascript" src="tnetstrings.js"></script>
    <script type="text/javascript" src="backbone-tnetstrings.js"></script>


Override the default Backbone.sync method:

    Backbone.sync = Backbone.TNetStrings.sync

or, for more punctual situations, create your models like so:

    var MyModel = Backbone.Model.extend({
        "sync": Backbone.TNetStrings.sync
    });

Dependencies
------------

  - [Backbone.js](http://documentcloud.github.com/backbone/)
  - [tnetstrings.js](https://github.com/piranha/tnetstrings.js)


LICENSE
-------

The MIT License

Copyright © 2011 [Romain Gauthier](/~tOkeshu)

