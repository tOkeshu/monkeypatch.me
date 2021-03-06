Resume a download started by firefox with wget
==============================================


There is many situations where it can be useful to resume an
unfinished download started by Mozilla Firefox. This is easily
feasible by using the `wget` command and the `.part` file of a paused
download.

Partial download from Firefox
-----------------------------

When Firefox start a download, it create 2 files:

    $ ls -lh
    total 404K
    -rw------- 1 user user    0  7 Feb.  12:12 document.pdf
    -rw------- 1 user user 403K  7 Feb.  12:12 document.pdf.part

Here the `document.pdf` file is empty while the `document.pdf.part`
file is a temporary file which gradually receive data. When the
download is finished, the file `document.pdf.part` will become
`document.pdf`.

Resume the dowload without Firefox
----------------------------------

To resume the download outside Firefox, we first have to rename
`document.pdf.part` to `document.pdf`:

    $ mv -v document.pdf.part document.pdf
    « document.pdf.part » -> « document.pdf »

Now, we use the `wget` command with the initial url of the file with
the `--continue` option:

    $ wget --continue http://example.com/document.pdf
    --2011-02-07 14:40:38--  http://example.com/document.pdf
    Resolving example.com... 192.0.32.10
    Connecting to example.com|192.0.32.10|:80... connected.
    HTTP request sent, awaiting response... 206 Partial Content
    Length: 590630 (577K), 178725 (175K) remaining [application/pdf]
    Saving to: “document.pdf”

    100%[++++++++++++++++++++++++++++++++++++++==============================>]
    590 630     61,1K/s   ds 2,9s

    2010-11-07 14:40:41 (61,1 KB/s) - «document.pdf» saved [590630/590630]

`wget` will then resume the download.

Conclusion
----------

Voilà! This tip can be very useful when you want to close Firefox but
you not want to stop your downloads.

