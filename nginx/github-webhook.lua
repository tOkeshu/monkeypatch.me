local command = [[
/usr/bin/git \
    --git-dir=/var/www/monkeypatch.me/.git \
    --work-tree=/var/www/monkeypatch.me pull
]]
r = os.execute(command)
ngx.print(tostring(r))

