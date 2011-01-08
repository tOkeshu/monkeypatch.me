title: Mynus, the minimalist wiki
project: Mynus
layout: projects/readme

# Mynus, the minimalist wiki

The pupose of Mynus is to demonstrate the philosophy of
[batteries included](http://www.python.org/about/#python-is-powerful-and-fast).
Thus, Mynus will never depends on anything else than the Python's standard
library.

## Features

  * Provides a tiny wiki engine to launch everywhere.
  * No others dependencies than Python itself.
  * Offers a `mynus` script which allow you to transform any directory into a
    wiki repository.
  * WSGI Compliant.

## License

Mynus is released under the terms of the
[GNU Affero General Public License v3](http://www.gnu.org/licenses/agpl-3.0.html)
or later.

## Get started

Use pip to install Mynus the easy way:

    $ pip install mynus

Another solution is to download the sources:

    $ git clone git://monkeypatch.me/mynus.git
    $ cd mynus
    $ python setup.py install

or download the latest version as a tarball from
[pypi](http://pypi.python.org/pypi/Mynus).


Now you have Mynus, choose or create a directory and turn it into a wiki
repository:

    $ mkdir wiki && cd wiki
    $ mynus

This should launch a Mynus instance on the port 8000.

## URLs

The basic URLs are:

    /                   - redirect to /pages/index
    /pages              - list all the pages of the wiki
    /pages/{pagename}   - return a specific page

## Contribute !

  - Fork the project:
    [git://monkeypatch.me/mynus.git](git://monkeypatch.me/mynus.git)
  - Create your patch in a topic branch
  - Send pull requests or send your patches via e-mail

## TODO

  * Add showdown.js:
    [http://attacklab.net/showdown/](http://attacklab.net/showdown/)
  * Improve the mynus command line tool
  * Moar documentation
  * Make beautiful templates

