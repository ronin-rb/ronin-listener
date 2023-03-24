# ronin-exfil-http 1 "2023-03-24" Ronin Exfil "User Manuals"

## SYNOPSIS

`ronin-exfil http` [*options*]

## DESCRIPTION

Starts a HTTP server for receiving exfiltrated data.

## OPTIONS

`-H`, `--host` *IP*
  The interface to listen on. Defaults to `0.0.0.0` if not given.

`-p`, `--port` *PORT*
  The port to listen on. Defaults to `8080` if not given.

`--vhost` *HOST*
  The `Host:` header to filter requests by.

`-R`, `--root` *DIR*
  The root directory to filter requests by. Defaults to `/` if not given.

`-h`, `--help`
  Prints help information.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

ronin-exfil-dns(1)
