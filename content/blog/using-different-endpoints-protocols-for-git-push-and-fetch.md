Using different endpoints/protocols for git push and fetch
==========================================================

Because the [team I work with](https://github.com/mozilla/talkilla) is
quite active, I always fetch more often than I push when using
git. Then I feel like being interrupted in my workflow when git ask me
for my passphrase while I just asked to retrieve content that is
publicly available (yes, everything I do is free software).

Ideally when fetching I would like git to use the https protocol and
not bother with ssh until I need to push something. And if you already
think of that, using 2 different remotes are not good enough to
me. This may be over optimization as my operating system ask me for my
ssh credentials only once a day. But avoiding frustration has to be a
sain optimization, don't you think so ?

## The solution

Fortunately git allows you to do that. The trick is unsurprizingly
hidden in the `git remote` command.

When you create a remote you choose the default endpoint, it will be
used by the `git fetch` command:

    $ git remote add upstream https://myawesomeproject.org/path/to/repo.git

You can then specify a different endpoint for the `git push` command:

    $ git remote set-url --push upstream git@myaweomeproject.org:repo.git

This way, `git fetch` will use https and `git push` will use ssh.
You can obviously do the opposite and even obliterate the `push`
endpoint by giving it a fake one:

    $ git remote set-url --push upstream 'You were about to make a huge mistake !'
    $ git push upstream master
    fatal: 'You were about to make a huge mistake !' does not appear to be a git repository
    fatal: Could not read from remote repository.

    Please make sure you have the correct access rights
    and the repository exists.

This could be handy in the case you absolutely do not want to push
anything directly to this remote.

