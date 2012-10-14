Fipes: Beating the sneakernet
=============================

OSDC.fr (2012-10-13)

@tOkeshu

## How do you share files?

## The 949 Problem

![img](/assets/images/xkcd-949-file-transfer.png)

« Every time you email a file to yourself so you can pull it up on
your friend's laptop, Tim Berners-Lee sheds a single tear. »

[xkcd 949](https://xkcd.com/949/)

## Sneakers!

![img](/assets/images/my-shoes-by-daveybot.jpg)

sneakernet: /snee´ker·net/, n.

Term used (generally with ironic intent) for transfer of electronic
information by physically carrying tape, disks, or some other media
from one machine to another.

[The Jargon File](http://catb.org/jargon/html/S/sneakernet.html)

## Features

![img](/assets/images/my-shoes-by-daveybot.jpg)

- High troughput
- **Privacy friendly**
- Easy to use
- Easy to understand
- **High Latency**

## To beat the sneakernet

We need a privacy friendly open source web application that doesn't ask
me for an account and doesn't keep any data about me or my files.

## Files + Pipes = Fipes

  - A small web application.
  - Easy to install, easy to launch, easy to use.
  - Doesn't keep any data about you or your files.
  - Free as in freedom.

## The plan

- Choose a file
- Get a link from the server
- Give the link to your friends
- There is no 4th step

## So you just delete files after a certain time, right?

## NO, I don't

I don't need to. Because I don't store any data on the server.

## Worflow

![img](/assets/images/fipes-workflow.png)

As soon as the data hits the server, the data is immediatly sent to the
downloader. No storage, ever.

## Show us the code!

Full JavaScript frontend:

- Backbone.js
- HTML5 File API
- HTML5 WebSockets

Erlang on the server side:

- Cowboy: every request is an Erlang process
- The uploaders and the downloaders have their own Erlang process that talk to each others

##

<pre><code data-language="javascript">
$('input[type="file"]').on('change', function(event) {
    var files = _.map(event.target.files, function(file) {
        return new App.Models.File({
            obj  : file,
            name : file.name,
            type : file.type,
            size : file.size
        });
    });

    App.Files.add(files).save();
});
</code></pre>

##

<pre><code data-language="javascript">
var ws = new WebSocket("ws://fipelines.org/fipes/4CAEFAFC39BDE");

this.ws.onmessage = function (evt) {
    var event = tnetstrings.parse(evt.data).value;

    switch (event.type) {
    case "uid":
        App.UID = uid;
        break;
    case "stream":
        // Someone ask for a file
        stream(ws, event);
        break;
    case "file.new":
        // Someone offers a new file.
        if (event.file.owner != App.UID) {
            App.Files.add(event.file);
        }
        break;
    case "file.remove":
        // Someone removed a file.
        if (event.file.owner != App.UID) {
            var file = App.Files.get(event.file.id);
            App.Files.remove(file);
        }
        break;
    }
};
</code></pre>

## Example of a real time event

<pre><code data-language="javascript">
{
    type: "file.new",
    file: {
        id: "4CAEFD60B8043",
        owner: "4CAEFCFB7C116",
        name: "lolcat.jpg",
        type: "image/jpeg",
        size: 625230
    }
}
</code></pre>

##

<pre><code data-language="javascript">
// request = {type: "stream", file: "4CBECEBF793B4", downloader: "4CBECEBB77B6C", seek: 0}
var stream = function(ws, request) {
    var file = App.Files.get(request.file).get('obj'); // File object
    var reader = new FileReader;
    var seek = request.seek;
    var slice = 1024 * 512; // 512 KB

    // Stream the file
    if (seek < file.size) {
        var blob = file.slice(seek, seek + slice);
        reader.readAsBinaryString(blob);
    // Stop the stream
    } else {
        var eos = tnetstrings.dump({
            type: "eos",
            downloader: request.downloader
        });
        ws.send(eos);
    }

    reader.onload = function(e) {
        var data = btoa(e.target.result);
        var chunkEvent = tnetstrings.dump({
            type : "chunk",
            payload : data,
            downloader : request.downloader
        });
        ws.send(chunkEvent);
    }
};
</code></pre>

## The uploader process

<pre><code data-language="erlang">
rpc(Fipe, <<"chunk">>, Event) ->
    Payload    = proplists:get_value(payload, Event),
    Uid        = proplists:get_value(downloader, Event),

    [{{Fipe, Uid}, Downloader}] = ets:lookup(downloaders, {Fipe, Uid}),
    Downloader ! {chunk, base64:decode(Payload)};
</code></pre>

<pre><code data-language="erlang">
rpc(Fipe, <<"eos">>, Event) ->
    Uid = proplists:get_value(downloader, Event),
    [{{Fipe, Uid}, Downloader}] = ets:lookup(downloaders, {Fipe, Uid}),
    Downloader ! {chunk, eos};
</code></pre>

## The downloader process

<pre><code data-language="erlang">
stream(Fipe, Uid, Req) ->
    receive
        {chunk, eos} ->
            ets:delete(downloaders, {Fipe, Uid}),
            {ok, Req};
        {chunk, Chunk} ->
            cowboy_http_req:chunk(Chunk, Req),
            stream(Fipe, Uid, Req)
    end.
</code></pre>

## « I lied to you » and the future.

- No HTTPS

More HTML5:

- Binary WebSockets
- XHR2
- File System API
- WebRTC

## Questions?

Code: [github.com/tOkeshu/fipes](https://github.com/tOkeshu/fipes) (GNU AGPLv3)

Try it online: [fipelines.org](http://fipelines.org)

