local command = 'cd /var/www/monkeypatch.me && /usr/bin/git pull'
r = os.execute(command)
ngx.print(tostring(r))

