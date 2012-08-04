How to ignore completely Flash in Firefox?
==========================================


Some of you don't want Flash in their browser and they are right!

The simplest solution to avoid this technology is to not install
it. But, in this case, how to tell Firefox to stop to annoy us with
the "missing plugin" notifications ?

Call `about:config` to the rescue!


Desactivate the "click here to download plugin" zones.
------------------------------------------------------

When Firefox discovers a Flash component whereas there is no Flash
plugin installed, the software display the following message instead
of the missing content: "click here to download plugin".

To desactivate this message, you have to change the
`plugin.default_plugin_disabled` option to `false`.

By doing this, you will never see Flash related content anymore. For
instance web pages entirely created with Flash will appear empty for
you.

Stop the missing plugin notification
------------------------------------

When Firefox detects that a plugin is necessary to read specific
contents in the current web page, an info bar will show up to suggest
you to install it.

To stop the notification, change the
`plugins.hide_infobar_for_missing_plugin` option to `true`.

From now on, you will never be notified if a plugin is necessary to
read some unknown contents present in a web page, including non Flash
contents.

Conclusion
----------

By changing only 2 options in the `about:config` page of Mozilla
Firefox, we were able to completely ignore Flash on the web. This is
certainly the proof that Firefox is still one of the best browsers :)

